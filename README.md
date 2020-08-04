# EliasGammaCodeGenerator-
Two programs to implement a distributed version of the Elias-Gamma coding algorithm. https://en.wikipedia.org/wiki/Elias_gamma_coding
cd into project folder 
compile both client and server with 
g++ -o server server.cpp 
g++ -o client client.cpp
then run the server first, then client 2nd while the server is running
./server 1234
./client localhost 1234
