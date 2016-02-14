#include "P7zipWrapper.h"

//注意：由于CPP可以重载，所以不能在包含有 main名称函数的库中直接调用 7zip库的main，
//需要将7zip库的main做一次封装，当然，如果其他库中无main名称的函数，直接调用7zip库的main也可。
int execute7zipCommand(int numArgs, const char *args[]) {
	return main(
#ifndef _WIN32
		numArgs, (const char**)args
#endif
	);
}

