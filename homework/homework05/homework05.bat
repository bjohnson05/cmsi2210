del testresults.txt
gcc dec2bin.c -o dec2bin            >> testresults.txt
gcc dec2hex.c -o dec2hex            >> testresults.txt
gcc timesTables.c -o timesTables    >> testresults.txt
gcc holdit.c -o holdit              >> testresults.txt
gcc wordcount.c -o wordcount        >> testresults.txt
echo . >> testresults.txt
echo "running tests on dec2bin"     >> testresults.txt
dec2bin                             >> testresults.txt
dec2bin 5                           >> testresults.txt
dec2bin 123456                      >> testresults.txt
dec2bin 65535                       >> testresults.txt
dec2bin 977272832                   >> testresults.txt
dec2bin 1073746484                  >> testresults.txt
echo . >> testresults.txt
echo "running tests on dec2hex"     >> testresults.txt
dec2hex                             >> testresults.txt
dec2hex 5                           >> testresults.txt
dec2hex 123456 8                   >> testresults.txt
dec2hex 65535                       >> testresults.txt
dec2hex 977272832 8                >> testresults.txt
dec2hex 1073746484                  >> testresults.txt
dec2hex 5 16                        >> testresults.txt
dec2hex 123456 16                   >> testresults.txt
dec2hex 65535 15                    >> testresults.txt
dec2hex 977272832 16                >> testresults.txt
dec2hex 1073746484                  >> testresults.txt
echo . >> testresults.txt
echo "running tests on timesTables" >> testresults.txt
timesTables                         >> testresults.txt
timesTables 2                       >> testresults.txt
timesTables 5                       >> testresults.txt
timesTables 10                      >> testresults.txt
timesTables 12                      >> testresults.txt
timesTables 13                      >> testresults.txt
echo . >> testresults.txt
echo "running test on holdit"       >> testresults.txt
holdit                              >> testresults.txt
echo . >> testresults.txt
echo "running test on wordcount"    >> testresults.txt
wordcount                           >> testresults.txt
wordcount inputfile.txt             >> testresults.txt
