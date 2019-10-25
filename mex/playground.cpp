#include "mex.h"
#include "OxCalculatorT1Molli.h"

void
mexFunction (int nlhs, mxArray *plhs[],
             int nrhs, const mxArray *prhs[])
{
    mexPrintf ("Hello, World!\n");

    mexPrintf ("I have %d inputs and %d outputs\n", nrhs, nlhs);

    Ox::CalculatorT1Molli<double> calculator;
    calculator.disp();
}