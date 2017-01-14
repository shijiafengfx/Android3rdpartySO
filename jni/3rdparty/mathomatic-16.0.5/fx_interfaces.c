#include <stdio.h>
#include <string.h>
#include "fx_interfaces.h"
#include "includes.h"

typedef struct _CmdOperateId{
	int nCmdId;
	const char * szMsg;
}CmdOperateId;

#if IS_ANDROID_PLATFORM && defined(USE_EXTERN_STRING)
#define CMD_OPERATE_ITEM(id,msg) \
{ eCmdOp##id,"mop"#id            \
},
#else
#define CMD_OPERATE_ITEM(id,msg) \
{ eCmdOp##id,msg                \
},
#endif



CmdOperateId g_CmdOperateIds[]={
	CMD_OPERATE_ITEM(SolveCompleted,"方程解好了")
	CMD_OPERATE_ITEM(SolveSuccessful,"方程的解是：")
	CMD_OPERATE_ITEM(SolvingForZero,"将方程整理之后得")
	CMD_OPERATE_ITEM(SolveVariableToRHS,"将变量移到等式右边再解方程")
	CMD_OPERATE_ITEM(SimplifyingZeroSolve,"将方程化简之后得")
	CMD_OPERATE_ITEM(SolveZeroCompleted,"完成转换为0的方程")
	CMD_OPERATE_ITEM(LHSidenticalToRHS,"方程是个恒等式，左边和右边恒等")
	CMD_OPERATE_ITEM(Unfactoring,"展开并整理得")
	CMD_OPERATE_ITEM(Juggling,"Juggling")
	CMD_OPERATE_ITEM(CheckingEquation,"查检是否是多项式方程")
	CMD_OPERATE_ITEM(EquationSolved,"上式是用求根公式得的解，其中 sign 是 1 或 -1")
	CMD_OPERATE_ITEM(InfiniteLoop,"进入无限循环，方程无法解")
	CMD_OPERATE_ITEM(TakingLogarithm,"方程两边取对数")
	CMD_OPERATE_ITEM(TakingReciprocal,"方程两边取倒数")

	CMD_OPERATE_ITEM(Subtracting,"等式两边同时减去")
	CMD_OPERATE_ITEM(Adding,"等式两边同时加上")
	CMD_OPERATE_ITEM(Multiplying,"等式两边同时乘以")
	CMD_OPERATE_ITEM(Dividing,"等式两边同时除以")
	CMD_OPERATE_ITEM(TheResult01,"】 之后得\n")
	CMD_OPERATE_ITEM(BracketsLeft,"【")
	CMD_OPERATE_ITEM(BracketsRight,"】")
	CMD_OPERATE_ITEM(EquationIsN_Degree,"这是关于【%s】的度数为 %.*g 的多项式方程\n")
	CMD_OPERATE_ITEM(RaisingBothPower,"方程两边同时乘方运算，指数是 ")
	CMD_OPERATE_ITEM(RaisingBothPowerExp,"方程两边同时以 %.*g 进行乘方运算并展开得\n")
	CMD_OPERATE_ITEM(RemovingPossible,"删除可能的解\n")

	CMD_OPERATE_ITEM(PossibleSolutions,"方程有 %ld 个解\n")
	CMD_OPERATE_ITEM(Solutions,"第 %ld 个解对应于 ")
	CMD_OPERATE_ITEM(SimplifyResult,"化简之后得")
	CMD_OPERATE_ITEM(ApplyingSolutions,"代入并化简之后得\n")
	CMD_OPERATE_ITEM(EliminatingVariable,"使用方程%d移交变换的结果消去未知数 %s 之后得\n")

	{0,NULL}
};




fpGetCmdOperateText g_fpGetCmdOperateText = NULL;
void SetGetCmdOperateText(fpGetCmdOperateText fp)
{
	g_fpGetCmdOperateText = fp;
}
void SetOutputDataToFile(FILE *fp)
{
	if (fp)
	{
		gfp = fp;
	}
	else
	{
		gfp = default_out;
	}
}
const char *GetCmdOperateText(int cmdId)
{
	int i;
	for(i = 0;g_CmdOperateIds[i].szMsg;i++)
	{
		if (cmdId == g_CmdOperateIds[i].nCmdId)
		{
			if (g_fpGetCmdOperateText)
			{
				return g_fpGetCmdOperateText(g_CmdOperateIds[i].szMsg);
			} 
			else
			{
				return g_CmdOperateIds[i].szMsg;
			}
		}
	}
	return "Cannot find string.";
}