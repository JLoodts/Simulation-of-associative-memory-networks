//////////////////////////////////////////////////////////////////
#ifndef PATTERN_H												//
#define PATTERN_H												//
// begin of Pattern.h											//
//////////////////////////////////////////////////////////////////

#include "State.h"

/**
 * This class represents the patterns that have to be learnt by 
 * the neural network
 **/

class Pattern
{
public:
	Pattern(int newN, int newP, Spin *spin);
	Pattern(Pattern &pattern, Spin *spin);
	Pattern(const char *halfName, int N, int newP, Spin *spin);
	~Pattern(){}
	State	getSptr(int target)	{return *nr[target];}
	void	setSptr(int target, State* state) {nr[target] = state;}
	int		getP()				{return P;}
	int		getN()				{return nr[0]->getN();}
	int		getQ()				{return nr[0]->getQ();}
	double	getS(int p, int i)	{return nr[p]->getS(i);}
	double	getActivity()		{return activity;}
protected:
	State	**nr;
	int		P;
	double	activity;
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Pattern.h												//
//////////////////////////////////////////////////////////////////
