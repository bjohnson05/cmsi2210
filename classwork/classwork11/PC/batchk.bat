echo off
REM checking batch file output operation
echo on
del testresults.txt
average 12 23 34 45 56 67                          >> testresults.txt
average 123.45 234.56 345.67 456.78 147.258        >> testresults.txt
average 10.01 20.02 30.03 40.04 50.0530.06 70.07   >> testresults.txt
