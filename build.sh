#!/bin/sh
#=================================================================
# BUILDING SCRIPT for COATJAVA PROJECT (first maven build)
# then the documentatoin is build from the sources and commited
# to the documents page
#=================================================================
# Maven Build

while getopts dm name
do
    case $name in
       d) dopt=1;; # -d option is for generating Javadoc 
       m) mopt=1;; # -s option is for compiling the code
       *) echo "Invalid arg : "; echo "\t use : build.sh -m -d" ; echo "" ;exit;
    esac
done

if [[ ! -z $mopt ]]
then
    mvn install
    cd coat-lib
    mvn package
    cp target/coat-libs-3.0-SNAPSHOT.jar $COATJAVA/lib/clas/
    cd ..
fi
#=================================================================
# Documentation build


#=================================================================
# Finishing touches
echo ""
echo "--> Done building....."
echo ""
echo " \t Usage : build.sh -d -m"
echo ""


