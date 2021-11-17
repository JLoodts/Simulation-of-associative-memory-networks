//////////////////////////////////////////////////////////////////
#ifndef LEARN_H													//
#define LEARN_H													//
// begin of Learn.h												//
//////////////////////////////////////////////////////////////////

#include "Pattern.h"
#include "Weight.h"

/**
 * Abstract class Learn, instantiations of this class must 
 * implement the apply memberfunction
 **/

class Learn
{
public:
	Learn(){}
	Learn(Spin *newSpin) {spin = newSpin;}
	~Learn(){}
	virtual void apply(Pattern &pattern, Weight &weight) = 0;
	virtual void apply(Pattern &pattern, Pattern &pattern2, Weight &weight, Weight &weight2) = 0;
protected:
	Spin *spin;
private:
};

/**
 * Instantiation of the Learn class
 * LearnFC implements Hebbian learning in Fully Connected systems
 **/

class LearnFC: public Learn
{
public:
	LearnFC():					Learn() {}
	LearnFC(Spin *spin):		Learn(spin) {}
	void apply(Pattern &pattern, Weight &weight);
	void apply(Pattern &pattern, Pattern &pattern2, Weight &weight, Weight &weight2);
protected:
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Learn.h												//
//////////////////////////////////////////////////////////////////