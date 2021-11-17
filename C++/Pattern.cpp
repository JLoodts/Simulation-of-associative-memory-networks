#include "Pattern.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Pattern //////////////////////////////////////////

/**
 * An array of P states (with N spins) is created, 
 * each state is build up out of spins referred to by *spin
 * this *spin also holds the Q
 **/

Pattern::Pattern(int N, int newP, Spin *spin)
{ 
	P = newP;
	nr = new State*[P];
	int i;
	for(i=0; i<P; ++i)
	{
		nr[i] = new State(N,spin);
	}
	activity = nr[0]->get2ndMoment();
}

Pattern::Pattern(Pattern &pattern, Spin *spin)
{ // this constructor creates a pattern which holds the corresponding nu-states
  // with: nu = ((ksi)*(ksi)-a)/(a*(1-a))
  // it is used in BEG networks to train the weights of the second matrix
	int P = pattern.getP();
	int N = pattern.getN();
	int Q = pattern.getQ();
	double a = pattern.getActivity();
	double multiplier;
	if(a==1)
	{cout<<"Possible Error: devision by zero in Pattern::Pattern(Pattern &pattern)"<<endl; 
	multiplier = 1E99;} // stands for infinity
	else multiplier = 1/(a*(1-a));
	nr = new State*[P];
	int i;
	for(i=0; i<P; ++i)
	{
		nr[i] = new State(N,spin);
		int j;
		for(j=0; j<N; ++j)
		{
			nr[i]->setS(j, (pattern.getS(i,j)*pattern.getS(i,j)-a)*multiplier);
		}
	}
	activity = nr[0]->get2ndMoment();
}

/**
 * An array of P states (with N spins) is created, 
 * each state is build up out of QSpins
 * the states are retrieved out of textfiles of which
 * the partial name and path is given by halfName
 **/

Pattern::Pattern(const char*halfName, int N, int newP, Spin *spin)
{ 
	P = newP;
	nr = new State*[P];
	int i;
	char temp[33];
	const char* fileName;
	for(i=0; i<P; ++i)
	{
		// a more elegant solution should be searched such that this
		// name-creation is always the same as the one in procedures.cpp
		std::string name(halfName);
		if (i<10) name.append("0");
		if (i<100) name.append("0");
		itoa(i,temp,10);
		name.append(temp);
		name.append(".txt");
		fileName = name.c_str();

		nr[i] = new State(fileName,N,spin);
	}
	activity = nr[0]->get2ndMoment();
}

// END code of Pattern /////////////////////////////////////////////
////////////////////////////////////////////////////////////////////