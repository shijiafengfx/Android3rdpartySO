// Common/UTFConvertParam.h

#ifndef __COMMON_UTFCONVERT_PARAM_H
#define __COMMON_UTFCONVERT_PARAM_H

typedef enum file_name_charset_encoding{
	IN_CHARSET_ASCII = 0,  //ASCII
	IN_CHARSET_UTF8,	 //UTF-8
	IN_CHARSET_BIG5,	//Big5
	IN_CHARSET_GBK,		//GBK
	IN_CHARSET_GB18030,	//GB18030

	//Add other here if need

	IN_CHARSET_Max
}file_name_charset_encoding;

//Convert a string to unicode.
//stringEncoding:  pString encoding.See enum file_name_charset_encoding.
//return 1 if convert OK
//return 0 if convert false
typedef int (*fp_customer_string_convert_to_unicode)(const void *pString,int stringEncoding,unsigned int *pUnicode);

//This is optional.
//You can set befor decompression
//customer_file_name_maybe_encoding: See enum file_name_charset_encoding.
extern void SetCustomerStringConvertParam(
		fp_customer_string_convert_to_unicode fp,
		int customer_file_name_maybe_encoding);
//This is call by 7z.(Internal call)
extern void SetFileNameEncodingBy7Z(int current_file_name_encoding);

#endif
