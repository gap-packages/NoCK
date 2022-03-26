##
## This script creates the documentation. To run it needs GAPDoc and
## AutoDoc packages, and also pdflatex.  To use it, run it like this
## from within the package directory like so:
##
##   gap makedoc.g
##

if fail = LoadPackage("AutoDoc", "2018.02.14") then
    Error("AutoDoc version 2018.02.14 or newer is required.");
fi;

AutoDoc(rec( gapdoc := rec( main := "NoCK.xml" ),
             scaffold := rec( MainPage := false )));
