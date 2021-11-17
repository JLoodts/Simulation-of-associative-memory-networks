//////////////////////////////////////////////////////////////////
#ifndef GENERAL_H												//
#define GENERAL_H												//
// begin of General.h											//
//////////////////////////////////////////////////////////////////

#include <stdlib.h>		// for random generator
#include <time.h>		// for time to seed the random number generator

/**
 * Here are some general functions declared
 **/

static void initializeRandom()
{
  srand((unsigned)time( NULL ));
}

static double getRandomDouble()
{ // random between 0 and 1
	return rand() / (double)RAND_MAX;
} 


//////////////////////////////////////////////////////////////////
#endif															//
// end of General.h												//
//////////////////////////////////////////////////////////////////