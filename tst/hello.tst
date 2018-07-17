#############################################################################
##
#A  hello.tst              NoCK package                
##
##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing 
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and 
##  the global random number generator, in order to be independent of the 
##  reading order of several test files. Furthermore, the assertion level 
##  is set to 2 by START_TEST and set back to the previous value in the 
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
## 
gap> START_TEST("NoCK package: testall.tst");

# Note that you may use comments in the test file
# and also separate parts of the test by empty lines

# First load the package without banner (the banner must be suppressed to 
# avoid reporting discrepancies in the case when the package is already 
# loaded)
gap> LoadPackage("nock",false);
true

# Check that the data are consistent  
gap> G:=RealFormById("E",6,2); # E6(6)
<Lie algebra of dimension 78 over SqrtField>
gap> dG:=NonCompactDimension(G);
42
gap> PCoefficients("D",5);
[ 2, 4, 6, 8, 5 ]
gap> PCalculate([4,2,3],[2,2]);   
t^9+t^5+t^4+1
gap> AllZeroDH("F",4,2); 
[ 1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 17, 18, 19, 21, 22, 23, 25, 26, 27 ]

# Testing the external binary
gap> IsBoundGlobal("AllZeroDH");
true

## Each test file should finish with the call of STOP_TEST.
## The first argument of STOP_TEST should be the name of the test file.
## The second argument is redundant and is used for backwards compatibility.
gap> STOP_TEST( "testall.tst", 10000 );

#############################################################################
##
#E