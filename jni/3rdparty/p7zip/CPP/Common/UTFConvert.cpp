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
//�ж��ַ���pFrom�Ƿ���Խ���Ϊutf-8����
static int string_is_can_analysis_as_utf8(const void *pFrom,int pFromLenOfBytes){
	unsigned char *srcStr = (unsigned char *)pFrom;
	int i;
	int nBytes=0;//UFT8����1-6���ֽڱ���,ASCII��һ���ֽ�
	unsigned char chr;
	char bAllAscii=1; //���ȫ������ASCII, ˵������UTF-8
	for(i=0;i<pFromLenOfBytes;i++)
	{
		chr= *(srcStr+i);
		if( (chr&0x80) != 0 ) // �ж��Ƿ�ASCII����,�������,˵���п�����UTF-8,ASCII��7λ����,����һ���ֽڴ�,���λ���Ϊ0,o0xxxxxxx
			bAllAscii= false;

		if(nBytes==0) //�������ASCII��,Ӧ���Ƕ��ֽڷ�,�����ֽ���
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
		else //���ֽڷ��ķ����ֽ�,ӦΪ 10xxxxxx
		{
			if( (chr&0xC0) != 0x80 )
			{
				return 0;
			}
			nBytes--;
		}
	}
	if(nBytes > 0) //Υ������
	{
	  return 0;
	}
	if(bAllAscii) //���ȫ������ASCII, ASCII��UTF-8����
	{
	  return 1;
	}
	return 1;
}
static bool ConvertCustomerStringToUnicode(const AString &src, UString &dest){
	if(src.Length() > 0){
		unsigned int *pWData = new unsigned int[src.Length() + 1];//��һ��������
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
	//��Ϊѹ���ļ������� Window��ѹ���������ֻ��ϲŽ�ѹ��Window���ļ�������ʹ��GBK����ģ��ֻ�����ʹ��UTF8����ģ�
	//�����ֻ��Ͻ�ѹ�������ļ������У�ֻҪ��������(ʵ���ϳ���0xFF�ı��붼�д����)���ͻ���ʾ���롣������ΪGBK����UTF8�������ˡ�
	//�������ϵ����⣬�ڴ������򵥵ļ��

	//���Ȳ����Ƿ����ʹ��UTF8����,��������ԣ���������GBK����
	//����GBK�����UTF8�������ص��ı��룬������Щ�Ƚ϶̵��ַ������ܲ���ȷ���磺������GBK������Ϊ��UTF8�����ļ�������ABһ01.txt���е����ġ�һ���֣�
	//��������������ĳ��֣������ܱ�֤�����ƶ�����ȷ�ġ�
	if(g_fp_customer_string_convert_to_unicode){
		if(g_customer_file_name_maybe_encoding == g_current_file_name_encoding){//ֻҪ��һ����(GBK)�����ж�����(GBK)��
			if(ConvertCustomerStringToUnicode(src, dest)){
				return true;
			}
		}else{
			if(!string_is_can_analysis_as_utf8(src,src.Length()))
			{
				if(ConvertCustomerStringToUnicode(src, dest)){
					SetFileNameEncodingBy7Z(g_customer_file_name_maybe_encoding);//��ÿ��ѹ���ļ������һ�μ���
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
