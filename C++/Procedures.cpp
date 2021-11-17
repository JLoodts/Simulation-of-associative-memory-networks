#include "Procedures.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Procedures ///////////////////////////////////////

/**
 * RETURN VALUE
 *  1	: Everything went fine
 * ERRORS 
 * -1	: Could not open the output file
 **/

int m_t_Hopfield(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	double alfa	= iF.getDouble("alfa");
	double temp	= iF.getDouble("temp");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	int dimX = iF.getInt("dimX");
	double yMin = iF.getDouble("yMin");
	double yMax = iF.getDouble("yMax");
	int dimY = iF.getInt("dimY");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);
	outFile<<"alfa "<<alfa<<endl;
	outFile<<"temp "<<temp<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"yMin "<<yMin<<endl;
	outFile<<"yMax "<<yMax<<endl;
	outFile<<"dimY "<<dimY<<endl;
	outFile<<"data_begin"<<endl;

	int targetNr = 0;
	double deviation;
	double devInterval = (yMax - yMin)/(double)(dimY);
	int saveInterval = maxNrIterations/dimX;	
	
	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight;
	
	// for Hopfield we use the binary spin
	spin = new BinSpin();
	//spin = new QSpin(2);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// in order to choose the right transferfunction we need to know the temperature
	if(temp==0)
	{ // use the stepfunction if temperature is zero
		transfer = new TransferStepBin(spin);
		//transfer = new TransferStep(spin,0.5);
	}else{
	  // use the sigmoid function if temperature is nonzero
		transfer = new TransferSigmBin(temp, spin);
	}

	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}

	// this is the weight matrix for the net
	weight = new Weight(N);

	// now we can create the net from its components
	Hopfield net(weight, state, learn, update);
	
	// the patterns to be stored in the net
	Pattern pattern(N,P,spin);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();
	
	// the target state which shall be used to compute the overlap etc
	State target(N, spin);
	
	target = pattern.getSptr(targetNr);
	//cout<<endl<<"Target"<<endl;
	//target.output();

	for(deviation=yMin; deviation<yMax; deviation+=devInterval)
	{
		net.getBeginState(deviation, target);
		net.learnPattern(pattern);
		int i;
		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
			if(i%saveInterval==0)
			{
				outFile<<i<<" "<<net.get_m(target)<<" ";
			}
		}
		outFile<<endl;
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;

	return 1;
}

//int m_temp_Hopfield(const char* name, double alfa, double deviation, int N, 
//					 int maxNrIterations, int updateAsynch,
//					 double xMin, double xMax, int dimX)
int m_temp_Hopfield(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	double alfa	= iF.getDouble("alfa");
	double deviation	= iF.getDouble("deviation");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	double xMin = iF.getDouble("xMin");
	double xMax = iF.getDouble("xMax");
	int dimX = iF.getInt("dimX");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);

	double temp = 0.1;
	double tempInterval = (xMax - xMin)/(double)(dimX);
	int targetNr = 0;

	outFile<<"alfa "<<alfa<<endl;
	outFile<<"deviation "<<deviation<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"xMin "<<xMin<<endl;
	outFile<<"xMax "<<xMax<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"data_begin"<<endl;

	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight;
	
	// for Hopfield we use the binary spin
	spin = new BinSpin();
	//spin = new QSpin(2);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	transfer = new TransferSigmBin(temp, spin);

	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}

	// this is the weight matrix for the net
	weight = new Weight(N);

	// now we can create the net from its components
	Hopfield net(weight, state, learn, update);
	
	// the patterns to be stored in the net
	Pattern pattern(N,P,spin);
	
	// the target state which shall be used to compute the overlap etc
	State target(N, spin);
	
	target = pattern.getSptr(targetNr);

	net.learnPattern(pattern);

	for(temp=xMin; temp<xMax; temp+=tempInterval)
	{
		transfer->setTemp(temp);
		net.getBeginState(deviation, target);
		int i;
		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
		}
		outFile<<temp<<" "<<net.get_m(target)<<endl;
	}
	outFile<<endl;

	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;

	return 1;

}

//int m_t_QIsing(const char* name, int Q, double alfa, double b, int N, 
//				int maxNrIterations, int updateAsynch,
//				int dimX, double yMin, double yMax, int dimY)
int m_t_QIsing(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	int Q = iF.getInt("Q");
	double alfa	= iF.getDouble("alfa");
	double b	= iF.getDouble("b");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	int dimX = iF.getInt("dimX");
	double yMin = iF.getDouble("yMin");
	double yMax = iF.getDouble("yMax");
	int dimY = iF.getInt("dimY");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);
	outFile<<"Q "<<Q<<endl;
	outFile<<"alfa "<<alfa<<endl;
	outFile<<"b "<<b<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"yMin "<<yMin<<endl;
	outFile<<"yMax "<<yMax<<endl;
	outFile<<"dimY "<<dimY<<endl;
	outFile<<"data_begin"<<endl;

	int saveInterval = maxNrIterations/dimX;

	double deviation;
	double devInterval = (yMax - yMin)/(double)(dimY);
	int targetNr = 0;

		// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStep(spin,b);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight = new Weight(N);

	// now we can create the net from its components
	QIsing net(weight, state, learn, update);
	
	// the patterns to be stored in the net
	Pattern pattern(N,P,spin);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();
	
	// the target state which shall be used to compute the overlap etc
	State target(N, spin);
	
	target = pattern.getSptr(targetNr);
	//cout<<endl<<"Target"<<endl;
	//target.output();
	
	for(deviation=yMin; deviation<yMax; deviation+=devInterval)
	{	
		net.getBeginState(deviation, target);
		net.learnPattern(pattern);
		int i;

		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
			if(i%saveInterval==0)
			{
				outFile<<i<<" "<<net.get_m(target)<<" ";
			}
		}
		outFile<<endl;
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;

	return 1;
}

int m_t_BEG(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	double alfa	= iF.getDouble("alfa");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	int dimX = iF.getInt("dimX");
	double yMin = iF.getDouble("yMin");
	double yMax = iF.getDouble("yMax");
	int dimY = iF.getInt("dimY");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);
	outFile<<"alfa "<<alfa<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"yMin "<<yMin<<endl;
	outFile<<"yMax "<<yMax<<endl;
	outFile<<"dimY "<<dimY<<endl;
	outFile<<"data_begin"<<endl;

	int saveInterval = maxNrIterations/dimX;
	
	double deviation;
	double devInterval = (yMax - yMin)/(double)(dimY);
	
	int targetNr = 0;
	int Q = 3;
	
	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight1;
	Weight		*weight2;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStepBEG(spin);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight1 = new Weight(N);
	weight2 = new Weight(N);

	// the patterns to be stored in the net
	Pattern pattern(N,P,spin);
	Pattern *nuPattern = new Pattern(pattern);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();
	
	// the target state which shall be used to compute the overlap etc
	State target(N, spin);
	target = pattern.getSptr(targetNr);
	//cout<<endl<<"Target"<<endl;
	//target.output();

	BEG net(weight1, weight2, state, learn, update, nuPattern);
	
	for(deviation=yMin; deviation<yMax; deviation+=devInterval)
	{	
		net.getBeginState(deviation, target);
		net.learnPattern(pattern);
		int i;
		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
			if(i%saveInterval==0)
			{
				outFile<<i<<" "<<net.get_m(target)<<" ";
			}
		}
		outFile<<endl;
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight1;
	delete weight2;
	delete nuPattern;

	return 1;
}

int l_m_BEG(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile	iF(nameIn);
	double		alfa			= iF.getDouble	("alfa");
	int			N				= iF.getInt		("N");
	int			maxNrIterations = iF.getInt		("maxNrIterations");
	int			nrData			= iF.getInt		("nrData");
	int			updateAsynch	= iF.getInt		("updateAsynch"); 
	double		xMin			= iF.getDouble	("xMin");
	double		xMax			= iF.getDouble	("xMax");
	int			dimX			= iF.getInt		("dimX");
	double		yMin			= iF.getDouble	("yMin");
	double		yMax			= iF.getDouble	("yMax");
	int			dimY			= iF.getInt		("dimY");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);
	double m=1, l=1;
	outFile<<"alfa "<<alfa<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"nrData "<<nrData<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"xMin "<<xMin<<endl;
	outFile<<"xMax "<<xMax<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"yMin "<<yMin<<endl;
	outFile<<"yMax "<<yMax<<endl;
	outFile<<"dimY "<<dimY<<endl;
	outFile<<"data_begin"<<endl;

	int targetNr = 0;
	int Q = 3;
	double xInt;
	if(dimX > 1){ xInt = (xMax - xMin)/(double)(dimX-1); }
	else		{ xInt = 1; xMax = xMin; }
	double yInt;
	if(dimY > 1){ yInt = (yMax - yMin)/(double)(dimY-1); }
	else		{ yInt = 1; yMax = yMin; }
	int saveInterval = maxNrIterations/nrData;

	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight1;
	Weight		*weight2;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	Pattern pattern(N,P,spin);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();
	Pattern *nuPattern = new Pattern(pattern,spin);
	State target(N,spin);

	target = pattern.getSptr(targetNr);
	//cout<<endl<<"Target"<<endl;
	//target.output();
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStepBEG(spin);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight1 = new Weight(N);
	weight2 = new Weight(N);
	
	BEG net(weight1, weight2, state, learn, update, nuPattern);

	net.learnPattern(pattern);

	for(m=xMin; m<=xMax; m+=xInt)
	{
		for(l=yMin; l<=yMax; l+=yInt)
		{
			net.getBeginStateBEG(m, l, target, targetNr);
			int i;

			for(i=0; i<maxNrIterations; ++i)
			{
				net.updateState();
				if(i%saveInterval==0)
				{
					outFile<<net.get_m(target)<<" "<<net.getOverlap2(targetNr)<<" ";
				}
			}
			outFile<<endl;
		}
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight1;
	delete weight2;
	delete nuPattern;

	return 1;
}

int l_m_QIsing(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile	iF(nameIn);
	double		alfa			= iF.getDouble	("alfa");
	double		b				= iF.getDouble	("b");
	int			N				= iF.getInt		("N");
	int			maxNrIterations = iF.getInt		("maxNrIterations");
	int			nrData			= iF.getInt		("nrData");
	int			updateAsynch	= iF.getInt		("updateAsynch"); 
	double		xMin			= iF.getDouble	("xMin");
	double		xMax			= iF.getDouble	("xMax");
	int			dimX			= iF.getInt		("dimX");
	double		yMin			= iF.getDouble	("yMin");
	double		yMax			= iF.getDouble	("yMax");
	int			dimY			= iF.getInt		("dimY");
				
	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	int P = (int)(alfa*N);
	double l = 1, m = 1;
	outFile<<"alfa "<<alfa<<endl;
	outFile<<"b "<<b<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"nrData "<<nrData<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"xMin "<<xMin<<endl;
	outFile<<"xMax "<<xMax<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"yMin "<<yMin<<endl;
	outFile<<"yMax "<<yMax<<endl;
	outFile<<"dimY "<<dimY<<endl;
	outFile<<"data_begin"<<endl;

	int saveInterval = maxNrIterations/nrData;
	double xInt;
	if(dimX > 1){ xInt = (xMax - xMin)/(double)(dimX-1); }
	else		{ xInt = 1; xMax = xMin; }
	double yInt;
	if(dimY > 1){ yInt = (yMax - yMin)/(double)(dimY-1); }
	else		{ yInt = 1; yMax = yMin; }
	int targetNr = 0;
	int Q = 3;

	Spin		*spin = new QSpin(Q);
	State		*state = new State(N,spin);
	Learn		*learn = new LearnFC(spin);
	Transfer	*transfer = new TransferStep(spin,b);
	Update		*update;
	if(updateAsynch)
	{
		update = new UpdateAsynch(transfer);
	}else{
		update = new UpdateSynch(transfer);
	}
	Weight		*weight = new Weight(N);
	
	Pattern		*pattern = new Pattern(N,P,spin);
	Pattern		*nuPattern = new Pattern(*pattern,spin);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();
	State target(N,spin);

	target = pattern->getSptr(targetNr);
	//cout<<endl<<"Target"<<endl;
	//target.output();

	QIsingPlus net(weight, state, learn, update, nuPattern);
	net.learnPattern(*pattern);
	// you first have to learn the pattern before you initialize the beginstate
	// since the nuPattern is calculated during learning

	for(m=xMin; m<=xMax; m+=xInt)
	{
		for(l=yMin; l<=yMax; l+=yInt)
		{
			net.getBeginStateBEG(m, l, target, targetNr);
			int i;

			for(i=0; i<maxNrIterations; ++i)
			{
				net.updateState();
				if(i%saveInterval==0)
				{
					outFile<<net.get_m(target)<<" "<<net.getOverlap2(targetNr)<<" ";
				}
			}
			outFile<<endl;
		}
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;
	delete pattern;

	return 1;
}

int m_alfa_QIsing(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	int Q = iF.getInt("Q");
	double deviation	= iF.getDouble("deviation");
	double b	= iF.getDouble("b");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	double xMin = iF.getDouble("xMin");
	double xMax = iF.getDouble("xMax");
	int dimX = iF.getInt("dimX");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	outFile<<"Q "<<Q<<endl;
	outFile<<"deviation "<<deviation<<endl;
	outFile<<"b "<<b<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"xMin "<<xMin<<endl;
	outFile<<"xMax "<<xMax<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"data_begin"<<endl;

	int saveInterval = maxNrIterations/dimX;

	double alfa;
	double alfaInterval = (xMax - xMin)/(double)(dimX);
	int targetNr = 0;

		// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStep(spin,b);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight = new Weight(N);

	// now we can create the net from its components
	QIsing net(weight, state, learn, update);
	
	// the target state which shall be used to compute the overlap etc

	//cout<<endl<<"Target"<<endl;
	//target.output();
	
	for(alfa=xMin; alfa<xMax; alfa+=alfaInterval)
	{	
		int P = (int)(alfa*N);
		if (P < 1) P = 1;
		// the patterns to be stored in the net
		Pattern pattern(N,P,spin);
		State target(N, spin);
		target = pattern.getSptr(targetNr);
		net.getBeginState(deviation, target);
		net.learnPattern(pattern);
		int i;

		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
		}
		outFile<<alfa<<" "<<net.get_m(target)<<endl;
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;

	return 1;
}

int m_alfa_BEG(const char* nameIn, const char* nameOut)
{
	initializeRandom();

	InputFile iF(nameIn);
	int Q = iF.getInt("Q");
	double deviation	= iF.getDouble("deviation");
	int N = iF.getInt("N");
	int maxNrIterations = iF.getInt("maxNrIterations");
	int updateAsynch = iF.getInt("updateAsynch"); 
	double xMin = iF.getDouble("xMin");
	double xMax = iF.getDouble("xMax");
	int dimX = iF.getInt("dimX");

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	outFile<<"Q "<<Q<<endl;
	outFile<<"deviation "<<deviation<<endl;
	outFile<<"N "<<N<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"updateAsynch "<<updateAsynch<<endl;
	outFile<<"xMin "<<xMin<<endl;
	outFile<<"xMax "<<xMax<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"data_begin"<<endl;

	double alfa;
	double alfaInterval = (xMax - xMin)/(double)(dimX);
	int targetNr = 0;

		// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight1;
	Weight		*weight2;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	// the state of the net is comprised of N spins
	state	= new State(N,spin);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStepBEG(spin);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight1 = new Weight(N);
	weight2 = new Weight(N);
	
	
	
	// the target state which shall be used to compute the overlap etc

	//cout<<endl<<"Target"<<endl;
	//target.output();
	
	for(alfa=xMin; alfa<xMax; alfa+=alfaInterval)
	{	
		int P = (int)(alfa*N);
		if (P < 1) P = 1;
		// the patterns to be stored in the net
		Pattern pattern(N,P,spin);
		Pattern nuPattern(pattern,spin);
		BEG net(weight1, weight2, state, learn, update, &nuPattern);
		State target(N, spin);
		target = pattern.getSptr(targetNr);
		net.getBeginState(deviation, target);
		net.learnPattern(pattern);
		int i;

		for(i=0; i<maxNrIterations; ++i)
		{
			net.updateState();
		}
		outFile<<alfa<<" "<<net.get_m(target)<<endl;
	}
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight1;
	delete weight2;

	return 1;
}



void getFullName(std::string & fullName, const char* halfName, int number, const char* extension = ".txt")
{
	char temp[33];
	std::string name(halfName);
	if (number<100) name.append("0");
	if (number<10) name.append("0");
	itoa(number,temp,10);
	name.append(temp);
	name.append(extension);
	fullName = name;
}
 
int graphicsQIsing(const char* nameIn, const char* patternFile, const char* nameOut)
{	
	InputFile iF(nameIn);

	int N = iF.getInt("N");
	int P = iF.getInt("P");
	int Q = iF.getInt("Q");
	double b = iF.getDouble("b");
	double deviation = iF.getDouble("deviation");
	int dimX = iF.getInt("dimX");// number of snapshots
	int targetNr = iF.getInt("targetNr");
	int maxNrIterations = iF.getInt("maxNrIterations");
	
	int dimData = 100;

	int frameNr = 0;

	double alfa = P/(double)(N);
	int saveInterval = maxNrIterations/dimX; 
	int saveIntervalData = maxNrIterations/dimData;

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	outFile<<"N "<<N<<endl;
	outFile<<"P "<<P<<endl;
	outFile<<"Q "<<Q<<endl;
	outFile<<"b "<<b<<endl;
	outFile<<"deviation "<<deviation<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"targetNr "<<targetNr<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"alfa "<<alfa<<endl;

	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight;
	
	// for Q Ising we use the Q Ising spin
	spin	= new QSpin(Q);
	
	// the state of the net is comprised of N spins
	std::string fullName;
	const char* fileName;
//	getFullName(fullName, patternFile, targetNr, ".txt");
//	fileName = fullName.c_str();
//	state	= new State(fileName,N,spin);
//**	getFullName(fullName, patternFile, targetNr, ".txt");
	getFullName(fullName, patternFile, 3, ".txt");
	fileName = fullName.c_str();
	state	= new State(fileName,N,spin);
//	state = new State(N,spin);
	getFullName(fullName, patternFile, frameNr++, "s.txt");
	fileName = fullName.c_str();
	state->save(fileName);

	// there is currently only one learning rule for Hopfield 
	// namely the fully connected Hebbian learning
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStep(spin,b);
	
	// by default we update the state asynchronously
	update	= new UpdateAsynch(transfer);
	// if the update should happen synchronously 
	// then use the following line of code by deleting the comment slashes in front of it
	//update = new UpdateSynch(transfer);
	
	// this is the weight matrix for the net
	weight = new Weight(N);

	// now we can create the net from its components
	QIsing net(weight, state, learn, update);
	
	// the target state which shall be used to compute the overlap etc
	State *target;
	getFullName(fullName, patternFile, targetNr, ".txt");
	fileName = fullName.c_str();
	target	= new State(fileName,N,spin);
//	target = new State(N,spin);

//**/// take a snapshot of the target
	getFullName(fullName, patternFile, frameNr++, "s.txt");
	fileName = fullName.c_str();
	target->save(fileName);

	{ // so the patterns are not in memory all the time

	// the patterns to be stored in the net
//	Pattern pattern(patternFile, N,P,spin);
	Pattern pattern(N,P,spin);
	pattern.setSptr(targetNr, target);
	//cout<<endl<<"Pattern"<<endl;
	//pattern.output();


	
	cout<<"Acquiring beginstate..."<<endl;
//**	net.getBeginState(deviation, *target);
				
/*// take a snapshot in the beginning
	getFullName(fullName, patternFile, frameNr++, "s.txt");
	fileName = fullName.c_str();
	net.saveState(fileName);
*/
	cout<<"Learning patterns..."<<endl;
	net.learnPattern(pattern);

	} // here the patterns are destroyed again

	cout<<"Evolving from beginstate..."<<endl;
	int i;
	
	for(i=0; i<maxNrIterations; ++i)
	{
		
		net.updateState();
		if(i%saveIntervalData==0)
		{
			cout<<".";
			cout.flush();
		
			outFile<<net.get_m(*target)<<" ";
		}
		if(i%saveInterval==0)
		{
/**/// take a snapshot
			getFullName(fullName, patternFile, frameNr++, "s.txt");
			fileName = fullName.c_str();
			net.saveState(fileName);
		}
	}

	outFile<<endl;
	cout<<endl;
	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight;

	return 1;

}


int graphicsBEG(const char* nameIn, const char* patternFile, const char* nameOut)
{
	InputFile iF(nameIn);

	int N = iF.getInt("N");
	int P = iF.getInt("P");
	double m = iF.getDouble("m");
	double l = iF.getDouble("l");
	int dimX = iF.getInt("dimX");
	int targetNr = iF.getInt("targetNr");
	int maxNrIterations = iF.getInt("maxNrIterations");

	int dimData = 100;
	int frameNr = 0;
	int Q = 3;
	bool updateAsynch = 1;
	double alfa = P/(double)(N);
	int saveInterval = maxNrIterations/dimX;
	int saveIntervalData = maxNrIterations/dimData;
	
	
	std::string fullName;
	const char* fileName;

	ofstream outFile;
	outFile.open(nameOut, ios::out);
	if (! outFile){return -1;}

	outFile<<"N "<<N<<endl;
	outFile<<"P "<<P<<endl;
	outFile<<"Q "<<Q<<endl;
	if(updateAsynch)	outFile<<"updateAsynch "<<1<<endl;
	else				outFile<<"updateAsynch "<<0<<endl;
	outFile<<"m "<<m<<endl;
	outFile<<"l "<<l<<endl;
	outFile<<"dimX "<<dimX<<endl;
	outFile<<"targetNr "<<targetNr<<endl;
	outFile<<"maxNrIterations "<<maxNrIterations<<endl;
	outFile<<"alfa "<<alfa<<endl;

	// the components of the net
	Spin		*spin;
	State		*state;
	Learn		*learn;
	Transfer	*transfer;
	Update		*update;
	Weight		*weight1;
	Weight		*weight2;

	spin	= new QSpin(Q);
	
	State *target;
	getFullName(fullName, patternFile, targetNr, ".txt");
	fileName = fullName.c_str();
	target	= new State(fileName,N,spin);
//	target	= new State(N,spin);

//**/// take a snapshot of the target
	getFullName(fullName, patternFile, frameNr++, "s.txt");
	fileName = fullName.c_str();
	target->save(fileName);

//	Pattern pattern(N,P,spin);
	Pattern pattern(patternFile, N,P,spin);
	pattern.setSptr(targetNr, target);

	Pattern *nuPattern = new Pattern(pattern, spin);

	getFullName(fullName, patternFile, targetNr, ".txt");
	fileName = fullName.c_str();
	state	= new State(fileName,N,spin);

/*	getFullName(fullName, patternFile, frameNr++, "s.txt");
	fileName = fullName.c_str();
	state->save(fileName);
*/
	learn	= new LearnFC(spin);

	// use the stepfunction because temperature is not yet implemented for Q Ising
	transfer = new TransferStepBEG(spin);
	
	if(updateAsynch)
	{
		// by default we update the state asynchronously
		update	= new UpdateAsynch(transfer);
	}else{
		// if the update should happen synchronously 
		// then use the following line of code by deleting the comment slashes in front of it
		update = new UpdateSynch(transfer);
	}
	
	// this is the weight matrix for the net
	weight1 = new Weight(N);
	weight2 = new Weight(N);
	
	BEG net(weight1, weight2, state, learn, update, nuPattern);

	cout<<"Learning patterns..."<<endl;
	net.learnPattern(pattern);
	cout<<"Acquiring beginstate..."<<endl;


	net.getBeginStateBEG(m, l, *target, targetNr);
	cout<<"Evolving from beginstate..."<<endl;
	int i;

	for(i=0; i<maxNrIterations; ++i)
	{
		net.updateState();
		if(i%saveIntervalData==0)
		{
			cout<<".";
			cout.flush();
		
			outFile<<net.get_m(*target)<<" "<<net.getOverlap2(targetNr)<<endl;
		}
		if(i%saveInterval==0)
		{
/**/// take a snapshot
			getFullName(fullName, patternFile, frameNr++, "s.txt");
			fileName = fullName.c_str();
			net.saveState(fileName);
		}
	}
	cout<<endl;

	outFile.close();
	delete spin;
	delete state;
	delete learn;
	delete transfer;
	delete update;
	delete weight1;
	delete weight2;
	delete nuPattern;

	return 1;

}


void testColorsBMP(const char* fileName)
{
	ofstream outFile;
	outFile.open(fileName, ios::out);
	if (! outFile){cout<<"Error: couldn't open file"<<endl;}
	int max = 16777215;
	int min = 0;
	int between = max - min;
	int dimX = 4;
	int nrSavings = dimX * dimX; 
	int increment = between / nrSavings;
	outFile<<"#name "<<fileName<<endl;
	outFile<<"#width "<<dimX<<endl;
	outFile<<"#height "<<dimX<<endl;
	outFile<<"#matrix ";
	int color = min;
	for(int y=0; y<dimX; y++)
	{
		for(int x=0; x<dimX; x++)
		{
			outFile<<color<<" ";
			color += increment;
		}
		outFile<<endl;
	}
}
// END code of Procedures //////////////////////////////////////////
////////////////////////////////////////////////////////////////////