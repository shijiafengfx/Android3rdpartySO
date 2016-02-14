// UTFConvert.cpp

#include "StdAfx.h"

#include "UTFConvert.h"
#include "UTFConvertParam.h"
#include "Types.h"

static const Byte kUtf8Limits[5] = { 0xC0, 0xE0, 0xF0, 0xF8, 0xFC };
static int g_current_file_name_encoding = IN_CHARSET_UTF8;
static int g_customer_file_name_maybe_encoding = IN_CHARSET_Max;
static fp_customer_string_convert_to_unicode g_fp_customer_string_convert_to_unicode = 0;

static Bool Utf8_To_Utf16(wchar_t *dest, size_t *destLen, const char *src, size_t srcLen)
{
  size_t destPos = 0, srcPos = 0;
  for (;;)
  {
    Byte c;
    int numAdds;
    if (srcPos == srcLen)
    {
      *destLen = destPos;
      return True;
    }
    c = (Byte)src[srcPos++];

    if (c < 0x80)
    {
      if (dest)
        dest[destPos] = (wchar_t)c;
      destPos++;
      continue;
    }
    if (c < 0xC0)
      break;
    for (numAdds = 1; numAdds < 5; numAdds++)
      if (c < kUtf8Limits[numAdds])
        break;
    UInt32 value = (c - kUtf8Limits[numAdds - 1]);

    do
    {
      Byte c2;
      if (srcPos == srcLen)
        break;
      c2 = (Byte)src[srcPos++];
      if (c2 < 0x80 || c2 >= 0xC0)
        break;
      value <<= 6;
      value |= (c2 - 0x80);
    }
    while (--numAdds != 0);
    
    if (value < 0x10000)
    {
      if (dest)
        dest[destPos] = (wchar_t)value;
      destPos++;
    }
    else
    {
      value -= 0x10000;
      if (value >= 0x100000)
        break;
      if (dest)
      {
        dest[destPos + 0] = (wchar_t)(0xD800 + (value >> 10));
        dest[destPos + 1] = (wchar_t)(0xDC00 + (value & 0x3FF));
      }
      destPos += 2;
    }
  }
  *destLen = destPos;
  return False;
}

static Bool Utf16_To_Utf8(char *dest, size_t *destLen, const wchar_t *src, size_t srcLen)
{
  size_t destPos = 0, srcPos = 0;
  for (;;)
  {
    unsigned numAdds;
    UInt32 value;
    if (srcPos == srcLen)
    {
      *destLen = destPos;
      return True;
    }
    value = src[srcPos++];
    if (value < 0x80)
    {
      if (dest)
        dest[destPos] = (char)value;
      destPos++;
      continue;
    }
    if (value >= 0xD800 && value < 0xE000)
    {
      UInt32 c2;
      if (value >= 0xDC00 || srcPos == srcLen)
        break;
      c2 = src[srcPos++];
      if (c2 < 0xDC00 || c2 >= 0xE000)
        break;
      value = (((value - 0xD800) << 10) | (c2 - 0xDC00)) + 0x10000;
    }
    for (numAdds = 1; numAdds < 5; numAdds++)
      if (value < (((UInt32)1) << (numAdds * 5 + 6)))
        break;
    if (dest)
      dest[destPos] = (char)(kUtf8Limits[numAdds - 1] + (value >> (6 * numAdds)));
    destPos++;
    do
    {
      numAdds--;
      if (dest)
        dest[destPos] = (char)(0x80 + ((value >> (6 * numAdds)) & 0x3F));
      destPos++;
    }
    while (numAdds != 0);
  }
  *destLen = destPos;
  return False;
}
//判断字符串pFrom是否可以解析为utf-8编码
static int string_is_can_analysis_as_utf8(const void *pFrom,int pFromLenOfBytes){
	unsigned char *srcStr = (unsigned char *)pFrom;
	int i;
	int nBytes=0;//UFT8可用1-6个字节编码,ASCII用一个字节
	unsigned char chr;
	char bAllAscii=1; //如果全部都是ASCII, 说明不是UTF-8
	for(i=0;i<pFromLenOfBytes;i++)
	{
		chr= *(srcStr+i);
		if( (chr&0x80) != 0 ) // 判断是否ASCII编码,如果不是,说明有可能是UTF-8,ASCII用7位编码,但用一个字节存,最高位标记为0,o0xxxxxxx
			bAllAscii= false;

		if(nBytes==0) //如果不是ASCII码,应该是多字节符,计算字节数
		{
			if(chr>=0x80)
			{
				if(chr>=0xFC&&chr<=0xFD)
					nBytes=6;
				else if(chr>=0xF8)
					nBytes=5;
				else if(chr>=0xF0)
					nBytes=4;
				else if(chr>=0xE0)
					nBytes=3;
				else if(chr>=0xC0)
					nBytes=2;
				else
				{
					return 0;
				}
				nBytes--;
			}
		}
		else //多字节符的非首字节,应为 10xxxxxx
		{
			if( (chr&0xC0) != 0x80 )
			{
				return 0;
			}
			nBytes--;
		}
	}
	if(nBytes > 0) //违返规则
	{
	  return 0;
	}
	if(bAllAscii) //如果全部都是ASCII, ASCII和UTF-8兼容
	{
	  return 1;
	}
	return 1;
}
static bool ConvertCustomerStringToUnicode(const AString &src, UString &dest){
	if(src.Length() > 0){
		unsigned int *pWData = new unsigned int[src.Length() + 1];//加一个结束符
		if(pWData)
		{
			memset(pWData,0,sizeof(unsigned int) * (src.Length() + 1));
			if(g_fp_customer_string_convert_to_unicode(src,g_customer_file_name_maybe_encoding,pWData))
			{
				int i = 0,j = 0;
				while(pWData[i]){
					i++;
				}
				dest.Empty();
				wchar_t *p = dest.GetBuffer((int)i);
				while(pWData[j]){
					p[j] = pWData[j];
					j++;
				}
				p[i] = 0;
				dest.ReleaseBuffer();
				delete []pWData;
				return true;
			}
			delete []pWData;
		}
	}
	return false;
}
void SetCustomerStringConvertParam(fp_customer_string_convert_to_unicode fp,int customer_file_name_maybe_encoding)
{
	g_fp_customer_string_convert_to_unicode = fp;
	g_customer_file_name_maybe_encoding = customer_file_name_maybe_encoding;
}
void SetFileNameEncodingBy7Z(int current_file_name_encoding)
{
	g_current_file_name_encoding = current_file_name_encoding;
}
bool ConvertUTF8ToUnicode(const AString &src, UString &dest)
{
	//因为压缩文件可能在 Window上压缩，而到手机上才解压，Window的文件名称是使用GBK编码的，手机上是使用UTF8编码的，
	//这样手机上解压出来的文件名称中，只要含有中文(实际上超过0xFF的编码都有此情况)，就会显示乱码。这是因为GBK当作UTF8来解码了。
	//基于以上的问题，在此做个简单的检测

	//首先测试是否可以使用UTF8解码,如果不可以，就试着用GBK解码
	//由于GBK编码和UTF8编码有重叠的编码，所以有些比较短的字符串可能不正确（如：本来是GBK，而认为是UTF8，如文件名：“AB一01.txt”中的中文“一”字）
	//这里能消除乱码的出现，但不能保证短名称都是正确的。
	if(g_fp_customer_string_convert_to_unicode){
		if(g_customer_file_name_maybe_encoding == g_current_file_name_encoding){//只要有一个是(GBK)，所有都会是(GBK)的
			if(ConvertCustomerStringToUnicode(src, dest)){
				return true;
			}
		}else{
			if(!string_is_can_analysis_as_utf8(src,src.Length()))
			{
				if(ConvertCustomerStringToUnicode(src, dest)){
					SetFileNameEncodingBy7Z(g_customer_file_name_maybe_encoding);//对每个压缩文件，检测一次即可
					return true;
				}
			}
		}
	}

	dest.Empty();
	size_t destLen = 0;
	Utf8_To_Utf16(NULL, &destLen, src, src.Length());
	wchar_t *p = dest.GetBuffer((int)destLen);
	Bool res = Utf8_To_Utf16(p, &destLen, src, src.Length());
	p[destLen] = 0;
	dest.ReleaseBuffer();
	return res ? true : false;
}

bool ConvertUnicodeToUTF8(const UString &src, AString &dest)
{
  dest.Empty();
  size_t destLen = 0;
  Utf16_To_Utf8(NULL, &destLen, src, src.Length());
  char *p = dest.GetBuffer((int)destLen);
  Bool res = Utf16_To_Utf8(p, &destLen, src, src.Length());
  p[destLen] = 0;
  dest.ReleaseBuffer();
  return res ? true : false;
}
