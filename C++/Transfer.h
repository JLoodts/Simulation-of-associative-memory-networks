//////////////////////////////////////////////////////////////////
#ifndef TRANSFER_H												//
#define TRANSFER_H												//
// begin of Transfer.h											//
//////////////////////////////////////////////////////////////////

#include "Spin.h"

#include <math.h>		// for exp


// exit(-101) : TransferStep::apply not implemented yet for 2 weight-matrices
// exit(-102) : TransferStep::setTemp or getTemp TransferStep has no temperature: always zero 
// exit(-103) : TransferStepBin::apply not implemented yet for 2 weight-matrices
// exit(-104) : TransferStepBin::setTemp or getTemp TransferStep has no temperature: always zero 
// exit(-105) : TransferSigmBin::apply not implemented yet for 2 weight-matrices
// exit(-106) : TransferStepBEG::apply is not intended for use with 1 local field
// exit(-107) : TransferStepBEG::setTemp or getTemp TransferStep has no temperature: always zero 

/**
 * Abstract class Transfer, instantiations of this class must 
 * implement the apply memberfunction
 **/

class Transfer
{
public:
	Transfer(Spin *newSpin)	{spin = newSpin;}
	~Transfer()				{}
	void	setB(double newB);
	virtual void	setTemp(double value)=0;
	virtual double	getTemp()=0;
	virtual double apply(double x) = 0;
	virtual	double apply(double h, double teta) = 0;
protected:
	Spin *spin;
private:
};

/**
 * Instantiation of the Transfer class
 * a stepfunction between -1 and 1 is implemented
 * for use with Q Ising spins with Q!=2; it has a parameter b
 * for Q=2 use TransferStepBin
 **/

class TransferStep: public Transfer
{
public:
	TransferStep(Spin *spin, double newB = 0.5):Transfer(spin) {b = newB;}
	void	setB(double newB)			{b = newB;}
	double	apply(double x);
	double	apply(double h, double teta){exit(-101);}
	void	setTemp(double value){exit(-102);}
	double	getTemp(){exit(-102);}
protected:
	double	b;
private:
};

/**
 * Instantiation of the Transfer class
 * for use with binary states only
 **/

class TransferStepBin: public Transfer
{
public:
	TransferStepBin(Spin *spin):		Transfer(spin) {}
	double	apply(double x);
	double	apply(double h, double teta){exit(-103);}
	void	setTemp(double value){exit(-104);}
	double	getTemp(){exit(-104);}
protected:
private:
};

/**
 * Instantiation of the Transfer class
 * a sigmoid function between -1 and 1 is implemented
 * only for use with binary states (Q != 2) not supported!
 * one must supply a temp, 
 * when temp=0 use a stepfunction
 **/

class TransferSigmBin: public Transfer
{
public:
	TransferSigmBin(double newTemp, Spin *spin):Transfer(spin) {temp = newTemp;}
	double apply(double x);
	void	setTemp(double value){temp = value;}
	double	getTemp(){return temp;}
	double	apply(double h, double teta){exit(-105);}
protected:
	double temp;
private:
};

/**
 * Instantiation of the Transfer class
 * for use with binary states only
 **/

class TransferStepBEG: public Transfer
{
public:
	TransferStepBEG(Spin *spin):			Transfer(spin) {}
	double	apply(double x)	{exit(-106);}
	// this is the only transferfunction that supports BEG (with 2 weight-matrices)
	double	apply(double h, double teta); 
	void	setTemp(double value){exit(-107);}
	double	getTemp(){exit(-107);}
protected:
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Transfer.h											//
//////////////////////////////////////////////////////////////////