#ifndef __P7ZIP_WRAPPER_H__
#define __P7ZIP_WRAPPER_H__

#include "CPP/Common/UTFConvertParam.h"

extern int main
(
  #ifndef _WIN32
  int numArgs, const char *args[]
  #endif
);
//可选
extern int execute7zipCommand(int numArgs, const char *args[]);

#endif /* JNIWRAPPER_H_ */
