#include "Transfer.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Transfer /////////////////////////////////////////

double TransferStepBin::apply(double x)
{
	if(x<0) return -1; else return 1;
}

double TransferStep::apply(double x)
{
	int Q = spin->getQ();
	double beginPoint = -2*(Q-2)*b/(double)(Q-1);
	double interval = b*4/(double)(Q-1);
	int result = (int)(floor((x-beginPoint)/interval));

	if(result<0) return spin->getS(0);
	else if(result>=(Q-2)) return spin->getS(Q-1);
	else return spin->getS(result+1);
}

double TransferSigmBin::apply(double x)
{ // returns -1 or +1
  // Glauber dynamics (Hertz p27)
	if(temp==0) 
	{
		if(x<0) return -1; else return 1;
	}
	else
	{
		double beta = 1.0/temp;
		double g = 1.0/(1+exp(-2.0*beta*x));
		if(getRandomDouble()>g) return -1; else return 1;
	}
}

double TransferStepBEG::apply(double h, double teta)
{
	int a,b;
	if(h<0) a=-1; else a=1;
	if((fabs(h)+teta)<0) b=0; else b=1;
	return a*b;
}

// END code of Transfer ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////