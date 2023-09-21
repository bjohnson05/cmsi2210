/*
 * filename: serverPC.c
 * purpose: simple communications client demonstrator
 *
 * to compile and link on Windows:
 *    gcc serverPC.c -lws2_32 -o serverPC.exe
 * to run the program:
 *    either: serverPC
 *    OR      start serverPC to run in the background
 *             [opens in a new cmd window]
 */

#include<io.h>
#include<stdio.h>
#include<winsock2.h>

#pragma comment(lib,"ws2_32.lib") //Winsock Library

int main(int argc, char *argv[])
{
    WSADATA wsa;
    SOCKET s, new_socket;
    struct sockaddr_in server, client;
    int c;
    char *message;
    char recvbuf[512] = "";
    int recvbuflen = 512;

    printf("\nInitialising Winsock...");
    if (WSAStartup(MAKEWORD(2,2),&wsa) != 0)
    {
        printf("Failed. Error Code : %d",WSAGetLastError());
        return 1;
    }

    printf("Initialised.\n");

    //Create a socket
    if((s = socket(AF_INET, SOCK_STREAM, 0 )) == INVALID_SOCKET)
    {
        printf("Could not create socket : %d", WSAGetLastError());
    }

    printf("Socket created.\n");

    //Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons( 6789 );

    //Bind
    if( bind(s ,(struct sockaddr *)&server, sizeof(server)) == SOCKET_ERROR)
    {
        printf("Bind failed with error code : %d", WSAGetLastError());
    }

    puts("Bind done");

    //Listen to incoming connections
    listen(s, 3);

    //Accept and incoming connection
    puts("Waiting for incoming connections...");

    c = sizeof(struct sockaddr_in);
    new_socket = accept(s, (struct sockaddr *)&client, &c);
    if (new_socket == INVALID_SOCKET)
    {
        printf("accept failed with error code : %d", WSAGetLastError());
    }

    puts("Connection accepted");

    //Reply to client
    message = "Hello Client, I have received your connection. But I have to go now, bye\n";
    send(new_socket, message, strlen(message), 0);
    printf( "OK, message sent to client.  Waiting for a message...\n" );
    recv(new_socket, recvbuf, 512, 0);
    printf( "Client sent %s\n", recvbuf );
    printf( "OK, message received from client.  Press 'enter' to stop the server ==> " );

    getchar();

    closesocket(s);
    WSACleanup();

    return 0;
}
