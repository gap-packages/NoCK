#############################################################################
##
#W  ckforms.gi                  NoCK Package                  
##
##  Installation file for functions of the NoCK package.
##

InstallGlobalFunction( AllZeroDH, function(arg)
local G, typeG, rankG, idRealFormG, A, rankRG, dimG, dimPG, K, dimK, rankK, pi, qi, permPi, t, Pt, j, i, List1, List2, List3,List4,ListD,deg,isOK,Coeff;
    typeG:=arg[1];
    rankG:=arg[2];
    idRealFormG:=arg[3];
    G:=RealFormById(typeG,rankG,idRealFormG);
    A:=CartanSubspace(G);
    rankRG:=Dimension(A);
    dimG:=Dimension(G);
    K:=CartanDecomposition( G ).K;
    dimK:= Dimension(K);
    rankK:= Dimension(CartanSubalgebra(K));
    pi:=PCoefficients(typeG,rankG);
    if typeG="A" then
        if rankG=1 and idRealFormG=2 then
            qi:=PCoefficients("A",0);
        elif idRealFormG=2 then
            qi:=PCoefficients("A",rankG-idRealFormG+1);
            Append(qi,[1]);
        elif RemInt(rankG,2)=0 then
            if idRealFormG>2 and idRealFormG<=rankG/2+1 then 
                qi:=PCoefficients("A",idRealFormG-2);
                Append(qi,PCoefficients("A",rankG-idRealFormG+1));
                Append(qi,[1]);
            elif idRealFormG=rankG/2+2 then
                qi:=PCoefficients("B",rankG/2);
            fi;
        else 
            if idRealFormG>2 and idRealFormG<=(rankG+3)/2 then 
                qi:=PCoefficients("A",idRealFormG-2);
                Append(qi,PCoefficients("A",rankG-idRealFormG+1));
                Append(qi,[1]);
            elif idRealFormG=(rankG+5)/2 then
                qi:=PCoefficients("C",(rankG+1)/2);
            elif idRealFormG=(rankG+7)/2 then
                qi:=PCoefficients("D",(rankG+1)/2);
            fi; 
        fi;
    elif typeG="B" then
        qi:=PCoefficients("D",idRealFormG-1);
        if idRealFormG<=rankG then
            Append(qi,PCoefficients("B",rankG-idRealFormG+1));
        fi;
    elif typeG="C" then
        if RemInt(rankG,2)=0 then
            if idRealFormG>=2 and idRealFormG<=rankG/2+1 then
                qi:=PCoefficients("C",idRealFormG-1);
                Append(qi,PCoefficients("C",rankG-idRealFormG+1));
            elif idRealFormG=rankG/2+2 then
                qi:=PCoefficients("A",rankG-1);
                Append(qi,[1]);
            fi;
        else
            if idRealFormG>=2 and idRealFormG<=(rankG+1)/2 then 
                qi:=PCoefficients("C",idRealFormG-1);
                Append(qi,PCoefficients("C",rankG-idRealFormG+1));
            elif idRealFormG=(rankG+3)/2 then
                qi:=PCoefficients("A",rankG-1);
                Append(qi,[1]);
            fi;
        fi;
    elif typeG="D" then
        if rankG=4 then
            if idRealFormG=2 then
                qi:=PCoefficients("A",3);
                Append(qi,[1]);
            elif idRealFormG=3 then
                qi:=PCoefficients("D",2);
                Append(qi,PCoefficients("D",2)); 
            elif idRealFormG=4 then
                qi:=PCoefficients("B",1);
                Append(qi,PCoefficients("B",2));
            elif idRealFormG=5 then
                qi:=PCoefficients("B",3);
            fi;
        elif RemInt(rankG,2)=0 then
            if idRealFormG>=2 and idRealFormG<=rankG/2+1 then
                qi:=PCoefficients("D",idRealFormG-1);
                Append(qi,PCoefficients("D",rankG+1-idRealFormG));
            elif idRealFormG=rankG/2+2 then
                qi:=PCoefficients("A",rankG-1);
                Append(qi,[1]);
            elif idRealFormG=rankG/2+3 then
                qi:=PCoefficients("B",rankG-1);
            elif idRealFormG>=rankG/2+4 and idRealFormG<=rankG+2 then
                qi:=PCoefficients("B",idRealFormG-rankG/2-3);
                Append(qi,PCoefficients("B",3*rankG/2+2-idRealFormG));
            fi;
        else
            if idRealFormG>=2 and idRealFormG<=(rankG+1)/2 then
                qi:=PCoefficients("D",idRealFormG-1);
                Append(qi,PCoefficients("D",rankG+1-idRealFormG));
            elif idRealFormG=(rankG+3)/2 then
                qi:=PCoefficients("A",rankG-1);
                Append(qi,[1]);
            elif idRealFormG=(rankG+5)/2 then
                qi:=PCoefficients("B",rankG-1);
            elif idRealFormG>=(rankG+7)/2 and idRealFormG<=rankG+2 then
                qi:=PCoefficients("B",idRealFormG-(rankG-1)/2-3);
                Append(qi,PCoefficients("B",3*(rankG-1)/2+3-idRealFormG));
            fi;
        fi;
    elif typeG="E" then
        if rankG=6 then
            if idRealFormG=2 then
                qi:=PCoefficients("C",4);
            elif idRealFormG=3 then
                qi:=PCoefficients("A",1);
                Append(qi,PCoefficients("A",5));
            elif idRealFormG=4 then
                qi:=PCoefficients("D",5);
                Append(qi,[1]);
            elif idRealFormG=5 then
                qi:=PCoefficients("F",4);
            fi;
        elif rankG=7 then
            if idRealFormG=2 then
                qi:=PCoefficients("A",7);
            elif idRealFormG=3 then
                qi:=PCoefficients("E",6);
                Append(qi,[1]);
            elif idRealFormG=4 then
                qi:=PCoefficients("A",1);
                Append(qi,PCoefficients("D",6));
            fi;
        elif rankG=8 then
            if idRealFormG=2 then 
                qi:=PCoefficients("D",8);
            elif idRealFormG=3 then
                qi:=PCoefficients("A",1);
                Append(qi,PCoefficients("E",7));
            fi;
        fi;
    elif typeG="F" then
        if idRealFormG=2 then
            qi:=PCoefficients("A",1);
            Append(qi,PCoefficients("C",3));
        elif idRealFormG=3 then
            qi:=PCoefficients("B",4);
        fi;
    elif typeG="G" then
        qi:=PCoefficients("B",1);
        Append(qi,PCoefficients("B",1));
    fi;
    permPi:=List(SymmetricGroup(rankG), p -> Permuted(pi, p));
    t:=Indeterminate(Rationals,"t");
    List1:=List(permPi, i -> PCalculate(i,qi));
    List2:=List(List1, i -> IsPolynomial(i));
    List3:=[];
    for i in [1..Length(List1)] do
        if List2[i]=true then
            Add(List3,List1[i]);
        fi;
    od;
    deg:=DegreeOfLaurentPolynomial(List3[1]);
    ListD:=[];
    isOK:=true;
    for i in [1..deg] do
        isOK:=true;
        for j in [1..Length(List3)] do
            Coeff:=CoefficientsOfUnivariatePolynomial(List3[j]);
            if Coeff[i+1] <> 0 then
                isOK:=false;
            fi;
        od;
        if isOK=true then
            Add(ListD,i);
        fi;
    od;
    return ListD;
end);

###############################################################################
InstallGlobalFunction( PCoefficients, function(arg)
local typeG, rankG, pi, i;
    typeG:=arg[1];
    rankG:=arg[2];
    if typeG = "A" then
        pi:=[0];
        for i in [1..rankG] do
            pi[i]:= i+1;    
        od;
        if rankG=0 then
            pi:=[1];
        fi;
        return pi;
    elif typeG = "B" then
        pi:=[0];
        for i in [1..rankG] do
            pi[i]:= 2*i;    
        od;
        return pi;
    elif typeG = "C" then
        pi:=[0];
        for i in [1..rankG] do
            pi[i]:= 2*i;    
        od;
        return pi;
    elif typeG = "D" then
        pi:=[0];
        for i in [1..rankG-1] do
            pi[i]:= 2*i;    
        od;
        pi[rankG]:=rankG;
        return pi;
    elif typeG = "E" then
        if rankG=6 then
            return [2, 5, 6, 8, 9, 12];
        elif rankG=7 then
            return [2, 6, 8, 10, 12, 14, 18];
        elif rankG=8 then
            return [2, 8, 12, 14, 18, 20, 24, 30];
        fi;
    elif typeG = "F" and rankG=4 then
            return [2, 6, 8, 12];
    elif typeG = "G" and rankG=2 then
            return [2, 6];
    fi;
end);

###############################################################################
InstallGlobalFunction( PCalculate, function(arg)
local pi,qi, Pt , t, i, j;
    t:=Indeterminate(Rationals,"t");
    Pt:=1;
    pi:=arg[1];
    qi:=arg[2];
    for j in [Length(qi)+1..Length(pi)] do
        Pt:=Pt*(1+t^(2*pi[j]-1));
    od;
    for i in [1..Length(qi)] do
        Pt:=Pt*(1-t^(2*pi[i]))/(1-t^(2*qi[i]));
    od;
    return Pt;
end);

###############################################################################
InstallGlobalFunction( NonCompactDimension, function(arg)
local G, dimG, K, dimK, dG;
    G:=arg[1];
    dimG:=Dimension(G);
    K:=CartanDecomposition( G ).K;
    dimK:= Dimension(K);
    dG:=dimG-dimK;
    return dG;
end);

#E  ckforms.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
