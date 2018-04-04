# NoCK Package

NoCK is a GAP4 package. 

REMARK: this package is written for GAP4.8 (and higher versions); the package SLA & CoReLG is required.


# Instalation

To install the package NoCK move the file `NoCK-XX.tar.gz` (or any other archive containing it) into the `pkg` directory.
Usually this will be the `pkg` subdirectory in your GAP4 installation. However, it is also possible to have a `pkg` subdirectory in a different place, see the section 'Installing GAP Packages' of the GAP4 reference manual for more information. Then simply unpack `NoCK-XX.tar.gz` and your installation is complete.
Now start GAP and type
```gap
gap> LoadPackage( "nock" );
```
to load the package. You will see the package banner.

For details on how to use the NoCK package see the package documentation in the doc subdirectory (view its HTML version or manual.pdf via a PDF viewer). You will find additional information on how to create a GAP package in the Appendix of the manual.