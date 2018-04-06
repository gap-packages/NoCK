#############################################################################
##
##
#W  files.gd                   Nock Package                  
##
##  Declaration file for functions of the NoCK package.
##

#############################################################################
##
#F  AllZeroDH(<t>, <r>, <id>)
##
##  return set of d=(H) that all coefficient in degree d of P(t) 
##   (as in Corollary 1 [ours article])  wanish (taking q_1,...,q_m and permutation of p_1,...p_l)
##    (arguments and convention are the same as in function 
##       RealFormById/RealFormsInformation in CoReLG package).
##
DeclareGlobalFunction( "AllZeroDH" );

#############################################################################
##
#F  PCoefficients(<t>, <r>)
##
##  return set of coefficients p_1,..., p_l (degree of these generators) form [T] that
##      2p_1-1,...,2p_l-1 are degrees generating vector space P_G (see section 4.2 in [ours article]).
##
DeclareGlobalFunction( "PCoefficients" );

#############################################################################
##
#F  PCalculate(<p_i>, <q_i>)
##
##  return rational function obtaint form right side of (1) in [ours article]
##     for p_i={p1,...p_l} and q_i={q_1,...,q_m} (we forget temporarily 
##             about other properties here).
##
DeclareGlobalFunction( "PCalculate" );

#############################################################################
##
#F  NonCompactDimension(<G>)
##
##  return noncompact dimension of G.
##
DeclareGlobalFunction( "NonCompactDimension" );

#E  files.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
