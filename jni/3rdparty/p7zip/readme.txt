2016-02-14	修改记录
增加了以下文件：
1. P7zipWrapper.cpp,P7zipWrapper.h
主要是对接口封装了一层。

2. UTFConvertParam.h
增加了用于设置编码转换功能的接口

修改了以下文件：
1. UTFConvert.cpp
修改文件名称出现乱码的问题

2. MainAr.cpp
压缩或解压前，重置字符编码为UTF-8

