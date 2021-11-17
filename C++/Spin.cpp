#include "Spin.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Spin /////////////////////////////////////////////

// exit(-100) : constructor QSpin called with Q < 2

BinSpin::BinSpin(): Spin()
{ 
	nr = new double[2];
	nr[0] = -1;
	nr[1] = +1;	
}

double BinSpin::getRandom()
{
	if((int)(rand()%2)) return 1;
	else return -1;
}

double	BinSpin::format(double x)
{
	// x is a number between 0 and 1
	if(x<0.5) return -1;
	else return 1;
}

QSpin::QSpin(int newQ): Spin()
{
	if(newQ<2) {exit(-100);}
	else
	{
		Q = newQ;
		nr = new double[Q];
		int i;
		for(i=0; i<Q; ++i)
		{
			nr[i] = (-(Q-1)+2*(i))/(double)(Q-1);
		}
		halfInterval = 1/(double)(2*(Q-1));
	}
}

double QSpin::getRandom()
{
	return (-(Q-1)+2*((int)(rand()%Q)))/(double)(Q-1);
}

double	QSpin::format(double x)
{
	// x is a number between 0 and 1
	return nr[(int)(floor((x+halfInterval)/(2*halfInterval)))];
}

void TerSpin::setBorder()
{
	border[0] = 0;
	// between these borders value -1 is generated
	border[1] = (activity - mean)/2.0;
	// between these borders value  0 is generated
	border[2] = 1 - ((activity + mean)/2.0);
	// between these borders value +1 is generated
 	border[3] = 1;
}

TerSpin::TerSpin(double activity, double mean): Spin()
{
	this->Q = 3;
	this->activity = activity;
	this->mean = mean;
	nr = new double[Q];
	border = new double[Q+1];
	int i;
	for(i=0; i<Q; ++i)
	{
		nr[i] = (-(Q-1)+2*(i))/(double)(Q-1);
	}
	setBorder();
}
TerSpin::~TerSpin()
{
	// nr[] is deleted in ~Spin()
	delete[] border;
}

double TerSpin::getRandom()
{
	return format(getRandomDouble());
}

double TerSpin::format(double x)
{ // x is an element from [0,1]
	int i = 0;
	//while((x >= border[i])&&(i < Q)){ ++i;}
	//return nr[i-1];
	if(x < border[1]) return nr[0];
	else if( x < border[2]) return nr[1];
	else return nr[2];
}

void TerSpin::setActivity(double activity)
{
	this->activity = activity;
	setBorder();
}

void TerSpin::setMean(double mean)
{
	this->mean = mean;
	setBorder();
}

// END code of Spin ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////