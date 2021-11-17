//////////////////////////////////////////////////////////////////
#ifndef UPDATE_H												//
#define UPDATE_H												//
// begin of Update.h											//
//////////////////////////////////////////////////////////////////

#include "Transfer.h"
#include "Weight.h"
#include "State.h"

/**
 * Abstract class Update, instantiations of this class must 
 * implement the apply memberfunction
 **/

class Update
{
public:
	Update(Transfer *transfer);
	~Update(){}
	void setB(double b)	{transfer->setB(b);}
	virtual void apply(Weight &weight, State &state) = 0;
	virtual void apply(Weight &weight, Weight &weight2, State &state) = 0;
protected:
	Transfer *transfer;
private:
};

/**
 * Instantiation of the Update class
 * a synchronous update is implemented; all spins are updated simultanously
 **/

class UpdateSynch: public Update
{
public:
	UpdateSynch(Transfer *transfer):Update(transfer) {}
	void apply(Weight &weight, State &state);
	void apply(Weight &weight, Weight &weight2, State &state);
protected:
private:
};

/**
 * Instantiation of the Update class
 * an asynchronous update is implemented; spins are updated one by one
 * in a random order
 **/

class UpdateAsynch: public Update
{
public:
	UpdateAsynch(Transfer *transfer):Update(transfer) {}
	void apply(Weight &weight, State &state);
	void apply(Weight &weight, Weight &weight2, State &state);
protected:
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Update.h												//
//////////////////////////////////////////////////////////////////