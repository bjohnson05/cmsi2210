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

#include <io.h>
#include <stdio.h>
#include <winsock2.h>
#include <stdlib.h>
#include <string.h>

#define  RECV_BUF_LEN   512

#pragma comment( lib, "ws2_32.lib" ) //Winsock Library

int main( int argc, char *argv[] ) {
    WSADATA wsa;
    SOCKET s, new_socket;
    struct sockaddr_in server, client;
    int c;
    char *message;
    char recvbuf[RECV_BUF_LEN] = "";
    int numRecvBytes = 0;

    printf( "\nInitialising Winsock..." );
    if( WSAStartup( MAKEWORD(2,2), &wsa ) != 0 ) {
        printf( "Failed. Error Code : %d", WSAGetLastError() );
        return 1;
    }

    printf( "Winsock Initialised.\n" );

    //Create a socket
    if( (s = socket(AF_INET, SOCK_STREAM, 0 )) == INVALID_SOCKET ) {
        printf( "Could not create socket : %d", WSAGetLastError() );
    }

    printf( "Socket created.\n" );

    //Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    if( argc == 2 ) {
       server.sin_port = htons( atoi( argv[1] ) );
    } else {
       printf( "\n\n   Usage: serverMulti <port#>\n" );
       printf( "   Please try again.\n\n" );
       exit( -1 );
    }

    //Bind
    if( bind(s ,(struct sockaddr *)&server, sizeof(server)) == SOCKET_ERROR ) {
        printf("Bind failed with error code : %d", WSAGetLastError());
    }
    puts("Bind done");

    //Listen to incoming connections
    listen( s, 3 );

    //Accept and incoming connection
    printf( "Waiting for incoming connections on port %d...", atoi( argv[1] ) );

    c = sizeof( struct sockaddr_in );
    new_socket = accept( s, (struct sockaddr *)&client, &c );
    if( new_socket == INVALID_SOCKET ) {
        printf( "Accept failed with error code : %d", WSAGetLastError() );
    }

    puts( "Connection accepted" );

    //Reply to client
    message = "Hello Client, I have received your connection.  I am ready for messages.\n";
    send( new_socket, message, strlen(message), 0 );
    printf( "OK, 'ready' message sent to client.  Waiting for incoming messages...\n" );
    while( 1 ) {
       numRecvBytes = recv( new_socket, recvbuf, RECV_BUF_LEN, 0 );
       recvbuf[numRecvBytes] = '\0';
       printf( "Client sent %d bytes ~ :%s:\n", numRecvBytes, recvbuf );
       printf( "OK, message received from client.\n" );
       message = "Got your message, client, thanks!\n";
       send( new_socket, message, strlen(message), 0 );
       Sleep( 1000 );
       if( strcmp( recvbuf, "STOP" ) == 0 ) {
           printf( "Client sent 'STOP' message...\n" );
           break;
       }
    }

    closesocket(s);
    WSACleanup();

    return 0;
}
