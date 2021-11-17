//////////////////////////////////////////////////////////////////
#ifndef WEIGHT_H												//
#define WEIGHT_H												//
// begin of Weight.h											//
//////////////////////////////////////////////////////////////////

#include "General.h"	// for getRandomDouble()

/**
 * This class contains the weights of a neural network
 **/

class Weight
{
public:  
	Weight(int N);
	~Weight()								{delete[] nr;}
	double	getW(int i, int j)				{return nr[i][j];}
	void	setW(int i, int j, double value){nr[i][j] = value;}
protected:
	double	**nr;
private:
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of Weight.h												//
//////////////////////////////////////////////////////////////////