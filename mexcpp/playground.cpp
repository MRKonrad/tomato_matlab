#include "mex.h"
#include "string.h"

#include "OxCalculatorT1Molli.h"
#include "OxCalculatorResults.h"

void
mexFunction (int nlhs, mxArray *plhs[],
             int nrhs, const mxArray *prhs[])
{
    mexPrintf ("I have %d inputs and %d outputs\n", nrhs, nlhs);

    /* Check for proper number of arguments */
    if (
            nrhs != 1
            || nlhs != 0
            || !mxIsStruct(prhs[0]))
    {
        Ox::CalculatorT1Results<double> results;
        results.disp();

        Ox::CalculatorT1Molli<double> calculator;
        calculator.setNSamples(5);
        calculator.disp();

        return;
        
        mexErrMsgIdAndTxt("tomato_matlab:tomato_matlab:nargin", "tomato_matlab");
    }

    /* get input arguments */
    int nfields = mxGetNumberOfFields(prhs[0]);
    mwSize NStructElems = mxGetNumberOfElements(prhs[0]);
    mexPrintf("nfields %d NStructElems %d\n", nfields, NStructElems);

    {
        mxArray *tmp = mxGetField(prhs[0], 0, "parameter_to_map");
        char* tmp2 = mxArrayToString(tmp);
        mexPrintf("%s\n", tmp2);
    }
    {
        mxArray *tmp = mxGetField(prhs[0], 0, "output_fitparams_series_number");
        double* tmp2 = (double*)mxGetPr(tmp);
        mexPrintf("%f\n", *tmp2);
    }

    // read cell
    mxArray *tmp = mxGetField(prhs[0], 0, "files_magnitude");
    const mwSize *dims = mxGetDimensions(tmp);
    for (mwIndex jcell=0; jcell<dims[1]; jcell++) {
        char *mystring = mxArrayToString(mxGetCell(tmp, jcell));
        mexPrintf("The content at %d is %s\n", jcell, mystring);
    }

}