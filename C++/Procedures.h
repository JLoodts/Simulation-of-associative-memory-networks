//////////////////////////////////////////////////////////////////
#ifndef PROCEDURES_H											//
#define PROCEDURES_H											//
// begin of Procedures.h										//
//////////////////////////////////////////////////////////////////

#include <iostream.h>	// for output
#include <fstream.h>	// for ofstream

#include "General.h"
#include "Spin.h"
#include "Net.h"
#include "Pattern.h"
#include "InputFile.h"

/**
 * A set of procedures are given to perform certain tests on certain
 * network configurations
 **/

int m_t_Hopfield(const char* nameIn="data/m_t_Hopfield_in.txt", 
				 const char* nameOut="data/m_t_Hopfield_out.txt");

int m_temp_Hopfield(const char* nameIn="data/m_temp_Hopfield_in.txt", 
					const char* nameOut="data/m_temp_Hopfield_out.txt");

int m_t_QIsing(const char* nameIn="data/m_t_QIsing_in.txt", 
			   const char* nameOut="data/m_t_QIsing_out.txt");

int m_t_BEG(const char* nameIn="data/m_t_BEG_in.txt", 
			const char* nameOut="data/m_t_BEG_out.txt");

int l_m_BEG(const char* nameIn="data/l_m_BEG_in.txt", 
			const char* nameOut="data/l_m_BEG_out.txt");

int m_alfa_QIsing(const char* nameIn = "data/m_alfa_QIsing_in.txt", 
				  const char* nameOut = "data/m_alfa_QIsing_out.txt");

int m_alfa_BEG(const char* nameIn = "data/m_alfa_BEG_in.txt", 
			   const char* nameOut = "data/m_alfa_BEG_out.txt");

int graphicsQIsing(const char* nameIn="data/graphicsQIsing_in.txt", 
				   const char* patternFile="data/graphicsQIsing_pattern.txt", 
				   const char* nameOut="data/graphicsQIsing_out.txt");

int graphicsBEG(const char* nameIn="data/graphicsBEG_in.txt", 
				   const char* patternFile="data/graphicsBEG_pattern.txt", 
				   const char* nameOut="data/graphicsBEG_out.txt");

int l_m_QIsing(const char* nameIn="data/l_m_QIsing_in.txt", 
			   const char* nameOut="data/l_m_QIsing_out.txt");

void testColorsBMP(const char* fileName = "data/picBMPcolors.txt");

//////////////////////////////////////////////////////////////////
#endif															//
// end of Procedures.h											//
//////////////////////////////////////////////////////////////////
