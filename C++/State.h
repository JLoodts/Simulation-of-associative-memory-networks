//////////////////////////////////////////////////////////////////
#ifndef STATE_H													//
#define STATE_H													//
// begin of State.h												//
//////////////////////////////////////////////////////////////////

#include "Spin.h"


#include <math.h>
#include <list>			// for the lists in getBeginStateBEG
#include <fstream.h>	// for file handling

typedef std::list<int> INTLIST;

/**
 * This class represents the current state of the neural network
 **/

class State
{
public:  
	State(){}
	State(int newN, Spin *spin);
	State(const char* fileName, int newN, Spin *newSpin);
	~State(){}
	int		getN()						{return N;}
	double	getS(int i)					{return nr[i];}
	int		getQ()						{return spin->getQ();}
	double	get_m(State &otherState);
	double	getOverlap2(State &otherState);
	double	getActivityOverlap(State &otherState);
	double	getDistance(State &otherState);
	double	getNeuralActivity();
	void	getBeginState(double deviation, State &target);
	void	getBeginStateBEG(double m, double l, double a, State &target, State &target2);
	double	getRandomSpin() {return spin->getRandom();}
	void	setS(int i, double value)	{nr[i] = value;}
	double	getMean(int N);
	double	get2ndMoment();
	void	save(const char* fileName);
protected:
	int		skipComment(ifstream& file, char mark);
	int		N;
	double	*nr;
	Spin	*spin;
	int		max;
	int		min;
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of State.h												//
//////////////////////////////////////////////////////////////////