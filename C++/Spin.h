//////////////////////////////////////////////////////////////////
#ifndef SPIN_H													//
#define SPIN_H													//
// begin of Spin.h												//
//////////////////////////////////////////////////////////////////

#include "General.h"

#include <math.h>		// for floor

/**
 * This is the most basic unit out of which the States are comprised
 * The class Spin is a virtual class
 **/

class Spin
{
public:
	Spin(){}
	~Spin(){delete[] nr;}
	double	getS(int k)	{return nr[k];}
	virtual int		getQ() = 0;
	virtual double	getRandom() = 0;
	virtual	double	format(double x) = 0;
	void	setActivity(double activity){/*only used by TerSpin*/}
	void	setMean(double mean){/*only used by TerSpin*/}
protected:
	double*	nr;
private:
};

/**
 * The class BinSpin implements the Binary Spin {-1,+1}
 * and is derived from the Spin class
 *
 * for use with Hopfield
 **/

class BinSpin: public Spin
{
public:
/**/	BinSpin();
	~BinSpin();
	int		getQ()		{return 2;}	
	double	getRandom();
	double	format(double x);
protected:
private:
};

/**
 * The class QSpin implements the Q-Ising Spin
 * and is derived from the Spin class
 **/

class QSpin: public Spin
{
public:
	QSpin(int Q);
	~QSpin();
	int		getQ()		{return Q;}	
	double	getRandom();
	double	format(double x);
protected:
	int		Q;
	double	halfInterval; // for a quicker formatting
private:
};

/**
 * The class TerSpin implements the Q-Ising Spin for Q = 3
 * and is derived from the Spin class
 * it has the additional functionality of keeping track of the
 * Activity and Mean of the pattern
 **/

class TerSpin: public Spin
{
public:
	TerSpin(double activity, double mean=0);
	~TerSpin();
	int		getQ()		{return Q;}	
	double	getRandom();
	double	format(double x);
	void	setActivity(double activity);
	void	setMean(double mean);
protected:
	int		Q;
	void	setBorder();
	double *border;
	double	activity;
	double	mean;
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Spin.h												//
//////////////////////////////////////////////////////////////////