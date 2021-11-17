//////////////////////////////////////////////////////////////////
#ifndef INPUTFILE_H												//
#define INPUTFILE_H												//
// begin of InputFile.h											//
//////////////////////////////////////////////////////////////////

// The debugger can't handle symbols more than 255 characters long.
// STL often creates symbols longer than that.
// When symbols are longer than 255 characters, the warning is disabled.
#pragma warning(disable:4786)

#include <algorithm>// for Find

#include <string>	// for string
#include <vector>	// for vector
#include <fstream>	// for inlezen file

struct Scope
{
	std::string *begin;
	std::string *end;
};

typedef std::vector<std::string> STRINGVECTOR;

class InputFile
{
public:  
	InputFile(const char* fileName);
	void setScope(std::string str);
//	void get(std::string str);
	// getInt returns -1 if the variable with name str could not be found
	int		getInt(std::string str);
	double	getDouble(std::string str);
	long	getLong(std::string str);
	int		getInt();
	double	getDouble();
	long	getLong();
	std::string				*location;		
private:
	Scope					scope;
	STRINGVECTOR			text;
	STRINGVECTOR::iterator	textIt;
};

//////////////////////////////////////////////////////////////////
#endif															//
// end of InputFile.h											//
//////////////////////////////////////////////////////////////////
