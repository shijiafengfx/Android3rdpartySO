#ifndef __FX_INTERFACES_H__
#define __FX_INTERFACES_H__
#include <stdio.h>

#ifdef __ANDROID__
#define IS_ANDROID_PLATFORM		1
#else
#define IS_ANDROID_PLATFORM		0
#endif

//�޸ĺ��������ʽ
#define MODIFY_FUNCTION_DEFINED
//ʹ���ⲿ�ַ���
#define USE_EXTERN_STRING

#ifdef __cplusplus
extern "C" {
#endif
	typedef const char * (*fpGetCmdOperateText)(const char *cmdId);
	typedef enum _ECmdOperateIds{
		eCmdOpSolveCompleted = 0,
		eCmdOpSolveSuccessful,
		eCmdOpSolvingForZero,
		eCmdOpSolveVariableToRHS,
		eCmdOpSimplifyingZeroSolve,
		eCmdOpSolveZeroCompleted,
		eCmdOpLHSidenticalToRHS,
		eCmdOpUnfactoring,
		eCmdOpJuggling,
		eCmdOpCheckingEquation,
		eCmdOpEquationSolved,
		eCmdOpInfiniteLoop,
		eCmdOpTakingLogarithm,
		eCmdOpTakingReciprocal,
		//������debug_stringʹ��

		eCmdOpSubtracting,
		eCmdOpAdding,
		eCmdOpMultiplying,
		eCmdOpDividing,
		eCmdOpTheResult01,
		eCmdOpBracketsLeft,
		eCmdOpBracketsRight,
		eCmdOpEquationIsN_Degree,
		eCmdOpRaisingBothPower,
		eCmdOpRaisingBothPowerExp,
		eCmdOpRemovingPossible,

		eCmdOpPossibleSolutions,
		eCmdOpSolutions,
		eCmdOpSimplifyResult,
		eCmdOpApplyingSolutions,
		eCmdOpEliminatingVariable,

		eCmdOpMax
	}ECmdOperateIds;

	void SetGetCmdOperateText(fpGetCmdOperateText fp);
	void SetOutputDataToFile(FILE *fp);
	const char *GetCmdOperateText(int cmdId);

#ifdef __cplusplus
}
#endif
#endif