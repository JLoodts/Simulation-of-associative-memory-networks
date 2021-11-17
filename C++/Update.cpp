#include "Update.h"

////////////////////////////////////////////////////////////////////
// BEGIN code for Update ///////////////////////////////////////////

Update::Update(Transfer *newTransfer)
{
	transfer = newTransfer;
}

void UpdateSynch::apply(Weight &weight, State &state)
{
	int i,j;
	int N = state.getN();
	for(i=0; i<N; ++i)
	{
		double sum = 0;
		for(j=0; j<N; ++j)
		{
			sum += weight.getW(i,j) * state.getS(j);
		}
		state.setS(i,transfer->apply(sum));
	}
}

void UpdateSynch::apply(Weight &weight, Weight &weight2, State &state)
{
	int i,j;
	int N = state.getN();
	for(i=0; i<N; ++i)
	{
		double h = 0, teta = 0;
		for(j=0; j<state.getN(); ++j)
		{
			h += weight.getW(i,j) * state.getS(j);
			teta += weight2.getW(i,j) * state.getS(j) * state.getS(j);
		}
		state.setS(i,transfer->apply(h,teta));
	}
}

void UpdateAsynch::apply(Weight &weight, State &state)
{
	int i,j;
	i = (int)(rand()%state.getN());
	double sum = 0;
	for(j=0; j<state.getN(); ++j)
	{
		sum += weight.getW(i,j) * state.getS(j);
	}
	state.setS(i,transfer->apply(sum));
}

void UpdateAsynch::apply(Weight &weight, Weight &weight2, State &state)
{
	int i,j;
	i = (int)(rand()%state.getN());
	double h = 0, teta = 0;
	for(j=0; j<state.getN(); ++j)
	{
		h += weight.getW(i,j) * state.getS(j);
		teta += weight2.getW(i,j) * state.getS(j) * state.getS(j);
	}
	state.setS(i,transfer->apply(h,teta));
}

// END code of Update //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////