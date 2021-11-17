#include "Net.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Net //////////////////////////////////////////////

void Net::learnPattern(Pattern &pattern)
{
	learn->apply(pattern, *weight);
}

void Net::getBeginState(double deviation, State &target)
{
	state->getBeginState(deviation, target);
}

void Net::updateState()
{
	update->apply(*weight, *state);
}

double Hopfield::getEnergy()
{
	int i,j;
	int N = state->getN();
	double sum = 0;
	for(j=0; j<N; ++j)
	{
		for(i=0; i<N; ++i)
		{
			sum += weight->getW(i,j) * state->getS(j) * state->getS(i);
		}
		// i != j therefore correct the sum
		sum -= weight->getW(j,j) * state->getS(j) * state->getS(j);
	}
	return -(sum/2.0);
}

double Hopfield::get_m(State &target)
{ // m
	return state->get_m(target);
}

double QIsing::get_m(State &target)
{ // m
	return (state->get_m(target))/patternActivity;
}

double QIsingPlus::getOverlap2(int targetNr)
{ // l
	return state->getOverlap2(nuPattern->getSptr(targetNr));
}

void BEG::learnPattern(Pattern &pattern)
{
	learn->apply(pattern, *nuPattern, *weight, *weight2);
}

void BEG::updateState()
{
	update->apply(*weight, *weight2, *state);
}

double BEG::get_m(State &target)
{ // m
	return (state->get_m(target))/patternActivity;
}

double BEG::getOverlap2(int targetNr)
{ // l
	return state->getOverlap2(nuPattern->getSptr(targetNr));
}

double BEG::getActivityOverlap(State &target)
{ // n
	return (state->getActivityOverlap(target))/patternActivity;
}

double BEG::getDistance(State &target)
{ // d
	return (state->getDistance(target));
}

double BEG::getNeuralActivity()
{ // q
	return state->getNeuralActivity();
}

double	BEG::getMutualInformation(State &target)
{ // I
	double q = getNeuralActivity();
	double a = patternActivity;
	double n = getActivityOverlap(target);
	double m = get_m(target);
	double s;
	if(a!=1) s = (q-n*a)/(1-a); 
	else 
	{	cout<<"Possible Error: devision by zero in BEG::getMutualInformation"<<endl; 
		s = 1E99; // ~= +infity, however 1.2E4932 = the biggest double
	}
	double entropieOutput = -q*log(q/2.0)-(1-q)*log(1-q);
	double Sa = -((n+m)/2.0)*log((n+m)/2.0)-((n-m)/2.0)*log((n-m)/2.0)-(1-n)*log(1-n);
	double S1_a = -s*log(s/2.0)-(1-s)*log(1-s); 
	double conditionalEntropieOutput = a*Sa + (1-a)*S1_a;
	return entropieOutput - conditionalEntropieOutput;
}

// END code of Net /////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////