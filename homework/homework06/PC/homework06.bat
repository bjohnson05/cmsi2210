echo off
REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
REM File name: homework06.bat
REM Purpose: provide an automated evaluation script file for homework06
REM Author: Dr. Johnson
REM Date: 2023-11-28
REM Description: Contains the windows batch commands to assemble,
REM   compile, link, and test all six of the programs that comprise
REM   the homework06 assignment for CMSI 2210 CSO.
REM Execution: simply type 'homework06' on the command line
REM Output: using redirection, output goes in the file 'testresults.txt'
REM   The output is viewable as a text file using any editor program
REM   or by listing out via 'more', 'less', or 'type'.
REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo on

del testresults.txt
echo .                                                         >> testresults.txt
echo ###############################                           >> testresults.txt
echo RUNNING TESTS FOR HOMEWORK06                              >> testresults.txt
echo ###############################                           >> testresults.txt
echo .                                                         >> testresults.txt
echo COMPILING/ASSEMBLING/LINKING                              >> testresults.txt
echo ...note that no output means all successful...            >> testresults.txt
echo ----------------------------------------------            >> testresults.txt
echo .                                                         >> testresults.txt

REM [making findGCD program in nasm]
nasm -fwin32 findGCD.nasm                                      >> testresults.txt
gcc -m32 findGCD.obj -o findGCD.exe                            >> testresults.txt

REM [making gcdFinderTest program in nasm and "C"]
nasm -fwin32 findGCDfunc.nasm                                  >> testresults.txt
gcc -m32 gcdFinderTest.c findGCDfunc.obj -o gcdFinderTest.exe  >> testresults.txt

REM [making paritygen program in nasm]
nasm -fwin32 paritygen.nasm                                    >> testresults.txt
gcc -m32 paritygen.obj -o paritygen.exe                        >> testresults.txt

REM [making whichendisup program in "C"]
gcc whichendisup.c -o whichendisup.exe                         >> testresults.txt

REM [compiling makeNBO in "C"]
gcc -c makeNBOC.c                                              >> testresults.txt
gcc makeNBOtest.c makeNBOC.o -o makeNBOtest.exe                >> testresults.txt

REM [making makeNBOCtester.c program in nasm and "C"]
nasm -f win32 makeNBO.nasm                                     >> testresults.txt
gcc -m32 makeNBO.obj makeNBOC.o -o makeNBO.exe                 >> testresults.txt

REM [running tests of all programs]
echo .                                                         >> testresults.txt
echo RUNNING TESTS OF ALL PROGRAMS                             >> testresults.txt
echo -------------------------------                           >> testresults.txt
echo .                                                         >> testresults.txt
REM [running tests of 'findGCD' nasm program]
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

REM [running tests of 'gcdFinderTest' "C" program]
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

REM [running tests of 'paritygen' nasm program]
echo Running tests of 'paritygen' nasm program                 >> testresults.txt
echo check code for number value or if number is entered       >> testresults.txt
paritygen                                                      >> testresults.txt
echo .                                                         >> testresults.txt

REM [running tests of 'whichendisup' "C" program]
echo Running tests of 'whichendisup' "C" program               >> testresults.txt
whichendisup                                                   >> testresults.txt
echo .                                                         >> testresults.txt

REM [running tests of 'makeNBOtest' "C" program]
echo Running tests of 'makeNBOtest' "C" program                >> testresults.txt
makeNBOtest                                                    >> testresults.txt
makeNBOtest 2023                                               >> testresults.txt
echo .                                                         >> testresults.txt

REM [running tests of 'makeNBON' nasm program]
echo Running tests of 'makeNBON' nasm program                  >> testresults.txt
makeNBON                                                       >> testresults.txt
makeNBON 2023                                                  >> testresults.txt
echo .                                                         >> testresults.txt

