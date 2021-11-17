#include "State.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for State ////////////////////////////////////////////

State::State(int newN, Spin *newSpin)
{
	N = newN;
	spin = newSpin;
	nr = new double[N];
	int i;
	for(i=0; i<N; ++i)
	{
		nr[i] = spin->getRandom();
	}
}

int State::skipComment(ifstream& file, char mark)
{
	// This function skips the word that is proceeded with a mark-character
	// the file must be open and there should not be a space after the mark

	const int MAX_CHARS = 100; // This is the maximum characters per line.
	if (file.peek() == mark) file.ignore(MAX_CHARS, ' ');
	return 0;
}

State::State(const char* fileName, int newN, Spin *newSpin)
{
	ifstream inFile;
	inFile.open(fileName, ios::in);
	if (! inFile){cout << "Can't open input file.\n"; }
	
	const int bufferLength = 256;
	char buffer[bufferLength];
	int width, height;

	// this must be in the right order in the inputfile!
	inFile.getline(buffer, bufferLength);	// to skip the first line which contains the filename
	skipComment(inFile, '#'); inFile>> width; inFile.getline(buffer, bufferLength);
	skipComment(inFile, '#'); inFile>> height; inFile.getline(buffer, bufferLength);
	skipComment(inFile, '#'); // to skip "#matrix "
	
	long **matrix;
	max = 0;
	min = 16777215;  
	matrix = new long*[height];
	for(int y=0; y<height; ++y)
	{
		matrix[y] = new long[width];
	}
	for(y=0; y<height; ++y)
	{
		for(int x=0; x<width; ++x)
		{
			inFile>>matrix[x][y];
			if(matrix[x][y] > max) max = matrix[x][y];
			if(matrix[x][y] < min) min = matrix[x][y];
		}
		inFile.getline(buffer, bufferLength);
	}
	inFile.close();
	
	N = width*height;
	if(N != newN){cout<<"ERROR in constructing state from textfile"<<endl;}

	spin = newSpin;
	nr = new double[N];
	for(y=0; y<height; ++y)
	{
		for(int x=0; x<width; ++x)
		{
			nr[x+height*y] = spin->format((matrix[x][y]-min)/(double)(max-min));
		}
		inFile.getline(buffer, bufferLength);
	}
}

double State::get_m(State &otherState)
{ // for calculating m
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += nr[i]*otherState.getS(i);
	}
	return sum/(double)(N);
}

double State::getOverlap2(State &nuState)
{ // for calculating l
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += nr[i]*nr[i]*nuState.getS(i);
	}
	return sum/(double)(N);
}

double State::getActivityOverlap(State &otherState)
{
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += (otherState.getS(i)-nr[i])*(otherState.getS(i)-nr[i]);
	}
	return sum/(double)(N);
}

double	State::getDistance(State &otherState)
{
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += nr[i]*otherState.getS(i)*nr[i]*otherState.getS(i);
	}
	return fabs(sum/N);
}

double	State::getNeuralActivity()
{
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += nr[i]*nr[i];
	}
	return sum/(double)(N);
}

void State::getBeginState(double deviation, State &target)
{ // deviation (as a fraction 0..1) from the target pattern
	int i,j,max;
	for(j=0; j<N; ++j)
	{
		nr[j] = target.getS(j);
	}
	max = (int)(deviation*N);
	for(j=0; j<max; ++j)
	{
		i = (int)(rand()%N);
		nr[i] *= -1;
		/*double newS = spin->getRandom();
		while(newS==nr[i]) newS = spin->getRandom();
		nr[i] = newS;*/
	}
}

void State::getBeginStateBEG(double m, double l, double a, State &target, State &target2)
{ 	
	int max = this->getN();
	int j = 0, i=0;

	// first we copy the target state into the beginstate
	// so m = 1 and l = 1
	for(j=0; j<N; ++j)
	{
		nr[j] = target.getS(j);
	}
	
	double lNew = (this->getOverlap2(target2));
	double mNew = (this->get_m(target)/(double)(a));
	int nrRounds = 0;
	while(nrRounds < 5)
	{
		j=0;
		while((mNew > m)&&(lNew > l)&&(j<max))
		{ // this decreases both m and l with the same amount
			i = (int)(rand()%N);
			if(target.getS(i)!=0) nr[i]= 0;
			lNew = (this->getOverlap2(target2));
			mNew = (this->get_m(target)/(double)(a));
			j++;
		}
				
		j=0;
		while(((lNew > l)||(mNew > m))&&(j<max))
		{ 
			if(mNew > m)
			{ // this decreases only m
				i = (int)(rand()%N);
				if(target.getS(i)!=0) nr[i]= -target.getS(i);
				lNew = (this->getOverlap2(target2));
				mNew = (this->get_m(target)/(double)(a));
				j++;
			}
			if(lNew > l)
			{ // this decreases only l 
				i = (int)(rand()%N);
				if(target.getS(i)==0) nr[i]= 1;
				lNew = (this->getOverlap2(target2));
				mNew = (this->get_m(target)/(double)(a));
				j++;
			}
		}
	nrRounds++;
	}
}


double State::getMean(int N)
{
	int i;
	double sum = 0;
	for(i=0; i<N; ++i)
	{
		sum += nr[i];
	}
	return sum/(double)(N);
}

double State::get2ndMoment()
{ // to calculate the pattern activity a
	int i;
	double sum2 = 0;
	for(i=0; i<N; ++i)
	{
		sum2 += nr[i]*nr[i];
	}
	return sum2/(double)(N);
}

void State::save(const char* fileName)
{
	ofstream outFile;
	outFile.open(fileName, ios::out);
	if (! outFile){cout << "Can't open output file.\n"; }

	int width = (int)(sqrt(N));// only square images for now
	
	outFile<<"#name "<<fileName<<endl;
	outFile<<"#width "<<width<<endl;
	outFile<<"#height "<<width<<endl;
	outFile<<"#matrix ";

	for(int y=0; y<width; ++y)
	{
		for(int x=0; x<width; ++x)
		{
			outFile<<(int)(((max-min)*((nr[x+width*y]+1))/2.0)+min)<<" ";
		}
		outFile<<endl;
	}
	outFile.close();
}

// END code of State ///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////