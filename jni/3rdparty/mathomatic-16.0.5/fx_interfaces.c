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
	CMD_OPERATE_ITEM(SolveCompleted,"���̽����")
	CMD_OPERATE_ITEM(SolveSuccessful,"���̵Ľ��ǣ�")
	CMD_OPERATE_ITEM(SolvingForZero,"����������֮���")
	CMD_OPERATE_ITEM(SolveVariableToRHS,"�������Ƶ���ʽ�ұ��ٽⷽ��")
	CMD_OPERATE_ITEM(SimplifyingZeroSolve,"�����̻���֮���")
	CMD_OPERATE_ITEM(SolveZeroCompleted,"���ת��Ϊ0�ķ���")
	CMD_OPERATE_ITEM(LHSidenticalToRHS,"�����Ǹ����ʽ����ߺ��ұߺ��")
	CMD_OPERATE_ITEM(Unfactoring,"չ���������")
	CMD_OPERATE_ITEM(Juggling,"Juggling")
	CMD_OPERATE_ITEM(CheckingEquation,"����Ƿ��Ƕ���ʽ����")
	CMD_OPERATE_ITEM(EquationSolved,"��ʽ���������ʽ�õĽ⣬���� sign �� 1 �� -1")
	CMD_OPERATE_ITEM(InfiniteLoop,"��������ѭ���������޷���")
	CMD_OPERATE_ITEM(TakingLogarithm,"��������ȡ����")
	CMD_OPERATE_ITEM(TakingReciprocal,"��������ȡ����")

	CMD_OPERATE_ITEM(Subtracting,"��ʽ����ͬʱ��ȥ")
	CMD_OPERATE_ITEM(Adding,"��ʽ����ͬʱ����")
	CMD_OPERATE_ITEM(Multiplying,"��ʽ����ͬʱ����")
	CMD_OPERATE_ITEM(Dividing,"��ʽ����ͬʱ����")
	CMD_OPERATE_ITEM(TheResult01,"�� ֮���\n")
	CMD_OPERATE_ITEM(BracketsLeft,"��")
	CMD_OPERATE_ITEM(BracketsRight,"��")
	CMD_OPERATE_ITEM(EquationIsN_Degree,"���ǹ��ڡ�%s���Ķ���Ϊ %.*g �Ķ���ʽ����\n")
	CMD_OPERATE_ITEM(RaisingBothPower,"��������ͬʱ�˷����㣬ָ���� ")
	CMD_OPERATE_ITEM(RaisingBothPowerExp,"��������ͬʱ�� %.*g ���г˷����㲢չ����\n")
	CMD_OPERATE_ITEM(RemovingPossible,"ɾ�����ܵĽ�\n")

	CMD_OPERATE_ITEM(PossibleSolutions,"������ %ld ����\n")
	CMD_OPERATE_ITEM(Solutions,"�� %ld �����Ӧ�� ")
	CMD_OPERATE_ITEM(SimplifyResult,"����֮���")
	CMD_OPERATE_ITEM(ApplyingSolutions,"���벢����֮���\n")
	CMD_OPERATE_ITEM(EliminatingVariable,"ʹ�÷���%d�ƽ��任�Ľ����ȥδ֪�� %s ֮���\n")

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