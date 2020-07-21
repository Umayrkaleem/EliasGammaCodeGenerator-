
///Each child process will generate the binary code and the Elias-Gamma code
///of the requested input file, returning the results to the client program
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <string>
#include <iostream>
#include <cstring>
#include <bitset>
#include <cmath>

using namespace std;

void binaryGenerator(int); /* function prototype */
void error(string msg)
{
    cerr << msg;
    exit(1);
}

void fireman(int)
{
    while(waitpid(-1, NULL, WNOHANG) > 0)
    {
        cout << "A child process has ended" << endl;
    }
}


int main(int argc, char *argv[])
{
    int sockfd, newsockfd, portno, clilen, pid;
    struct sockaddr_in serv_addr, cli_addr;

    if (argc < 2) {
        fprintf(stderr,"ERROR, no port provided\n");
        exit(1);
    }
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
        error("ERROR opening socket");
    bzero((char *) &serv_addr, sizeof(serv_addr));
    portno = atoi(argv[1]);
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(portno);
    if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR on binding");
    listen(sockfd,100);
    clilen = sizeof(cli_addr);
    signal(SIGCHLD, fireman);
    while (1) {
        char buffer[256];
        bzero(buffer,256);
        newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, (socklen_t*)& clilen);
        if (newsockfd < 0)
            error("ERROR on accept");
        pid = fork();
        if (pid < 0)
            error("ERROR on fork");
        if (pid == 0)  {
            binaryGenerator(newsockfd);
            close(newsockfd);
            _exit(0);
        }
        else
            close(newsockfd);
    }
    return 0;
}

void binaryGenerator (int sock)
{
    int n;
    char buffer[256];

    bzero(buffer,256);
    n = read(sock,buffer,255);
    if (n < 0) error("ERROR reading from socket");

    string message(buffer);
    string message_two = "";
    string key = "";
    string bit = "";


    int nn = stoi(buffer);
    bitset<12> x(nn);
    string holder = " ";
    bit = x.to_string<char, string::traits_type, std::string::allocator_type>();
    int sizebit = bit.length();

    int bitLength = bit.length();
    for (int i =0; i<bitLength; i++) {
        if (bit[0] == '0') {
            bit.erase(0, 1);
        }
    }
    string eliasBit = bit;

    int numberOfZeros = 0;
    numberOfZeros = floor(log2(nn));

    for(int i =0; i<numberOfZeros; i++){
        eliasBit = "0" + eliasBit;
    }
    string s = "";

    s =  ", Binary Code: " + bit + ", Elias-Gamma code: " + eliasBit;


    for(int i = 0; i < s.length(); i++)
    {
        buffer[i] = s[i];
    }

    n = write(sock, buffer, strlen(buffer));
    if (n < 0)
        error("ERROR writing to socket");
}