#include <unistd.h>
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string>
#include <algorithm>
#include <pthread.h>
#include <vector>
#include <fstream>

using namespace std;

void error(string msg)
{
    cerr << msg;
    exit(1);
}

struct node{
    node* next;
    string x; // will store char type
    int y ; // will store binary
};
struct charrr
{
    char* hostname;
    int portno;
    string message;
    char key;
    string code;
    void sendValue(char* h, int p, string m){
        hostname = h;
        portno = p;
        message = m;

    }
};

class LL{
private:
    node* head;
public:
    LL(){
        head = NULL;
    }
    void ReceiveLetter(string letter);
    void bubbleSORT();
    void swap(node* a, node* b);
    void add2freq(char letter);
    string Gimme();
    void print();

};
void LL::ReceiveLetter(string letter)
{
    string tempHolder = letter;
    node* temp = new node;
    temp->x = tempHolder;
    temp->next = NULL;
    if (head == NULL){
        head = temp;
        return;
    }
    else
    {
        node* curr = head;
        while (curr->next != NULL)
        {
            if (curr->x == temp->x){
                return;
            }
            else{
                curr = curr->next;
            }
        }
        if (curr->x == temp->x){
            return;
        }
        else{
            curr->next = temp;
        }
    }
}
string LL::Gimme(){
    if (head == NULL) { return NULL; }

    string Prioritykey = "";
    node* curr = head;
    while (curr != NULL)
    {
        Prioritykey += curr->x;
        curr = curr->next;
    }
    return Prioritykey;
}

void *pthread_funct( void* char_ptr)
{
    int sockfd, portno, n = 0;
    struct charrr* charrrr_ptr = (struct charrr*)char_ptr;

    struct sockaddr_in serv_addr;
    struct hostent *server;
    char buffer[256];
    bzero(buffer, 256);

    portno = charrrr_ptr->portno;    //atoi(argv[2]);
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
        error("ERROR opening socket");
    server = gethostbyname(charrrr_ptr->hostname);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);
    serv_addr.sin_port = htons(portno);
    if (connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr)) < 0)
        error("ERROR connecting ");
    bzero(buffer,256);
    for(int i = 0; i < charrrr_ptr->message.length(); i++)
    {
        buffer[i] = charrrr_ptr->message[i];
    }
    n = write(sockfd,buffer,strlen(buffer));
    if (n < 0)
        error("ERROR writing to socket");
    bzero(buffer,256);
    n = read(sockfd,buffer,255);

    if (n < 0) {
        cout << " buffer: " << buffer << endl;
        error("ERROR reading from socket ");
    }
    charrrr_ptr->code = buffer;
    close(sockfd);
    return NULL;
}

int main(int argc, char *argv[])
{
    string word ="";
    bool firstTimeAround = true;
    vector<string> valueString;
    int firstInput =0;

    if (firstTimeAround) {
        getline(cin, word);
        firstInput = stoi(word);
        firstTimeAround = false;
    }

    for (int i = 0; i < firstInput; i++) {
        getline(cin, word);
        valueString.push_back(word);
    }

    LL o;
    int count = 0;
    //cout << "firstInput : " << firstInput << endl;

    for (int i = 0; i < valueString.size(); i++) {
        o.ReceiveLetter(valueString[i]);
    }

    struct charrr* CCC = new charrr[firstInput];
    pthread_t threadid[firstInput];
    for(int i = 0; i<firstInput;i++)
    {
        CCC[i].sendValue(argv[1],atoi(argv[2]),valueString[i]);
        if(pthread_create((&threadid[i]), NULL, pthread_funct, &CCC[i])){
            error("Error: creating pthread");
            return 1;
        }
    }
    for(int i = 0; i<firstInput;i++){
        pthread_join(threadid[i],NULL);
    }

    for(int i = 0; i<firstInput; i++){
        cout << "Value: " << CCC[i].message << CCC[i].code << endl;
    }
    return 0;
}