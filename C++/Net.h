//////////////////////////////////////////////////////////////////
#ifndef NET_H													//
#define NET_H													//
// begin of Net.h												//
//////////////////////////////////////////////////////////////////

#include "Pattern.h"
#include "Weight.h"
#include "State.h"
#include "Update.h"
#include "Learn.h"

/**
 * This class Net represents the neural network, which is comprised of 
 * several subclasses
 * Net is the base-class of which the different types are derived
 **/

class Net
{
public:
	Net() 
		{} // default constructor just to have one
	Net(Weight *weightPtr, State *statePtr) 
		{weight=weightPtr; state=statePtr;}
	~Net(){}
	virtual double	get_m(State &target) = 0;
	void	learnPattern(Pattern &pattern);
	void	getBeginState(double deviation, State &target);
	void	updateState();
	void	saveState(const char * fileName){state->save(fileName);}
protected:
	Weight	*weight;
	State	*state;
	Update	*update;
	Learn	*learn;
private:
};	

/**
 * The class Hopfield is derived from Net and has 
 * binary states
 **/

class Hopfield: public Net
{
public:
	Hopfield(Weight *newWeight, State *newState, Learn *newLearn, Update *newUpdate): 
		Net(newWeight, newState) 
		{learn=newLearn; update=newUpdate;}
	~Hopfield(){}
	//void setTemp(double temp){update->setTemp(temp);}
	double	getEnergy();
	double get_m(State &target); // m
protected:
private:
};	

/**
 * The class QIsing is derived from Net and has 
 * states comprised of Q spins
 **/

class QIsing: public Net
{
public:
	QIsing(Weight *newWeight, State *newState, Learn *newLearn, Update *newUpdate): 
		Net(newWeight, newState) 
		{learn=newLearn; update=newUpdate;
		 patternActivity = state->get2ndMoment();
		}
	~QIsing(){}
	double	get_m(State &target); // m
protected:
	double	patternActivity;
private:
};

class QIsingPlus: public QIsing
{
public:
	QIsingPlus(Weight *newWeight, State *newState, Learn *newLearn, Update *newUpdate, Pattern *newNuPattern): 
		QIsing(newWeight, newState, newLearn, newUpdate) 
		{nuPattern = newNuPattern; patternActivity = state->get2ndMoment();}
	~QIsingPlus(){}
	double	getOverlap2(int targetNr); // l
	void	getBeginStateBEG(double m, double l, State &target, int targetNr)
			{state->getBeginStateBEG(m,l,patternActivity,target,nuPattern->getSptr(targetNr));}
protected:
	Pattern	*nuPattern;
private:
};

/**
 * The class BEG is derived from Net and has 
 * states comprised of Q spins
 **/

class BEG: public Net
{
public:
	BEG(Weight *newWeight1, Weight *newWeight2, State *newState, Learn *newLearn, 
		Update *newUpdate, Pattern *newNuPattern): 
		Net(newWeight1, newState) 
		{weight2=newWeight2; learn=newLearn; update=newUpdate; nuPattern=newNuPattern;
		 patternActivity = state->get2ndMoment();}
	~BEG(){}
	double	get_m(State &target);			// m Retrieval overlap
	double	getOverlap2(int targetNr);			// l
	double	getActivityOverlap(State &target);	// n
	double	getDistance(State &target);			// d
	double	getNeuralActivity();				// q
	double	getMutualInformation(State &target);// I
	double	getPatternActivity(){return patternActivity;}
	double	calculatePatternActivity(){return state->get2ndMoment();}
	void	getBeginStateBEG(double m, double l, State &target, int targetNr)
				{state->getBeginStateBEG(m,l,patternActivity,target,nuPattern->getSptr(targetNr));}
	void	learnPattern(Pattern &pattern);
	void	updateState();
protected:
	Weight	*weight2;
	Pattern	*nuPattern;
	double	patternActivity;					// a
private:
};
//////////////////////////////////////////////////////////////////
#endif															//
// end of Net.h													//
//////////////////////////////////////////////////////////////////
