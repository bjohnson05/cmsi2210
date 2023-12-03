## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File name: homework06.bat
## Purpose: provide an automated evaluation script file for homework06
## Author: Dr. Johnson
## Date: 2023-11-28
## Description: Contains the windows batch commands to assemble,
##   compile, link, and test all six of the programs that comprise
##   the homework06 assignment for CMSI 2210 CSO.
## Execution: simply type 'homework06' on the command line
## Output: using redirection, output goes in the file 'testresults.txt'
##   The output is viewable as a text file using any editor program
##   or by listing out via 'more', 'less', or 'type'.
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rm testresults.txt
echo .                                                         >> testresults.txt
echo ###############################                           >> testresults.txt
echo RUNNING TESTS FOR HOMEWORK06                              >> testresults.txt
echo ###############################                           >> testresults.txt
echo .                                                         >> testresults.txt
echo COMPILING/ASSEMBLING/LINKING                              >> testresults.txt
echo ...note that no output means all successful...            >> testresults.txt
echo ----------------------------------------------            >> testresults.txt
echo .                                                         >> testresults.txt

## [making findGCD program in nasm]
nasm -fwin32 findGCD.nasm                                      >> testresults.txt
gcc -m32 findGCD.obj -o findGCD.exe                            >> testresults.txt

## [making gcdFinderTest program in nasm and "C"]
nasm -fwin32 findGCDfunc.nasm                                  >> testresults.txt
gcc -m32 gcdFinderTest.c findGCDfunc.obj -o gcdFinderTest.exe  >> testresults.txt

## [making paritygen program in nasm]
nasm -fwin32 paritygen.nasm                                    >> testresults.txt
gcc -m32 paritygen.obj -o paritygen.exe                        >> testresults.txt

## [making whichendisup program in "C"]
gcc whichendisup.c -o whichendisup.exe                         >> testresults.txt

## [compiling makeNBO in "C"]
gcc -c makeNBOC.c                                              >> testresults.txt
gcc makeNBOtest.c makeNBOC.o -o makeNBOtest.exe                >> testresults.txt

## [making makeNBOCtester.c program in nasm and "C"]
nasm -fwin32 makeNBON.nasm                                     >> testresults.txt
gcc -m32 makeNBON.obj makeNBOC.o -o makeNBON.exe               >> testresults.txt

## [running tests of all programs]
echo .                                                         >> testresults.txt
echo RUNNING TESTS OF ALL PROGRAMS                             >> testresults.txt
echo -------------------------------                           >> testresults.txt
echo .                                                         >> testresults.txt
## [running tests of 'findGCD' nasm program]
echo Running tests of 'findGCD' nasm program                   >> testresults.txt
echo test of findGCD nasm program with 24 and 18               >> testresults.txt
echo result should be '6'                                      >> testresults.txt
findGCD 24 18                                                  >> testresults.txt
echo test of findGCD nasm program with 100 and 75              >> testresults.txt
echo result should be '25'                                     >> testresults.txt
findGCD 100 75                                                 >> testresults.txt
echo test of findGCD nasm program with 3113041662 and 11570925 >> testresults.txt
echo result should be '462837'                                 >> testresults.txt
findGCD 3113041662 11570925                                    >> testresults.txt
echo .                                                         >> testresults.txt

## [running tests of 'gcdFinderTest' "C" program]
echo Running tests of 'gcdFinderTest' "C" program              >> testresults.txt
echo test of gcdFinderTest "C" program with 24 and 18          >> testresults.txt
echo result should be '6'                                      >> testresults.txt
gcdFinderTest 24 18                                            >> testresults.txt
echo test of gcdFinderTest "C" program with 100 and 75         >> testresults.txt
echo result should be '25'                                     >> testresults.txt
gcdFinderTest 100 and 75                                       >> testresults.txt
echo test of gcdFinderTest "C" program with 3113041662 and 11570925 >> testresults.txt
echo result should be '462837'                                 >> testresults.txt
gcdFinderTest 3113041662 11570925                              >> testresults.txt
echo .                                                         >> testresults.txt

## [running tests of 'paritygen' nasm program]
echo Running tests of 'paritygen' nasm program                 >> testresults.txt
echo check code for number value or if number is entered       >> testresults.txt
paritygen                                                      >> testresults.txt
echo .                                                         >> testresults.txt

## [running tests of 'whichendisup' "C" program]
echo Running tests of 'whichendisup' "C" program               >> testresults.txt
whichendisup                                                   >> testresults.txt
echo .                                                         >> testresults.txt

## [running tests of 'makeNBOtest' "C" program]
echo Running tests of 'makeNBOtest' "C" program                >> testresults.txt
makeNBOtest                                                    >> testresults.txt
makeNBOtest 2023                                               >> testresults.txt
echo .                                                         >> testresults.txt

## [running tests of 'makeNBON' nasm program]
echo Running tests of 'makeNBON' nasm program                  >> testresults.txt
makeNBON                                                       >> testresults.txt
makeNBON 2023                                                  >> testresults.txt
echo .                                                         >> testresults.txt

