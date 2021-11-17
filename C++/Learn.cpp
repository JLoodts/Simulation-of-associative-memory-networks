#include "Learn.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Learn ////////////////////////////////////////////

void LearnFC::apply(Pattern &pattern, Weight &weight)
{ 
	int P = pattern.getP();
	int i,j,p;
	double sum, newWeight;
	for(i=0; i<pattern.getN(); ++i)
	{
		for(j=0; j<=i; ++j)
		{
			sum = 0;
			for(p=0; p<P; ++p)
			{
				sum += pattern.getS(p,i) * pattern.getS(p,j); 
			}
			newWeight = sum / (pattern.getN()*pattern.getActivity());
			weight.setW(i,j,newWeight);
			weight.setW(j,i,newWeight);
		}
	}
	// no selfcoupling
	for(i=0; i<pattern.getN(); ++i)
	{
		weight.setW(i,i,0);
	}
}

void LearnFC::apply(Pattern &pattern, Pattern &pattern2, Weight &weight, Weight &weight2)
{ 
	int P = pattern.getP();
	int i,j,p;
	double sum, sum2, newWeight, newWeight2;
	for(i=0; i<pattern.getN(); ++i)
	{
		for(j=0; j<=i; ++j)
		{ // because the weight-matrices are symmetric
			sum = sum2 = 0;
			for(p=0; p<P; ++p)
			{
				sum += pattern.getS(p,i) * pattern.getS(p,j); 
				sum2 += pattern2.getS(p,i) * pattern2.getS(p,j);
			}
			newWeight = sum / (pattern.getN()*pattern.getActivity()*pattern.getActivity());
			weight.setW(i,j,newWeight);
			weight.setW(j,i,newWeight);
			newWeight2 = sum2 / pattern.getN();
			weight2.setW(i,j,newWeight2);
			weight2.setW(j,i,newWeight2);
		}
	}
	// no selfcoupling
	for(i=0; i<pattern.getN(); ++i)
	{
		weight.setW(i,i,0);
		weight2.setW(i,i,0);
	}
}

// END code of Learn ///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////