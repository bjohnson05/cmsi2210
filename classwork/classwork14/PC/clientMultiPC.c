/*
 * filename: clientPC.c
 * purpose: simple communications client demonstrator
 *
 * to compile and link on Windows:
 *    gcc clientPC.c -lws2_32 -o clientPC.exe
 * to run the program:
 *    server must be running on localhost [127.0.0.1] and port 6789
 * modified from:
 *   http://softmc.servotronix.com/wiki/Program_Examples:TCP_IP:TCPIP_Winsock_Client
 */

#ifndef UNICODE
#define UNICODE
#endif

#define WIN32_LEAN_AND_MEAN

#include <winsock2.h>
#include <Ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Link with ws2_32.lib
#pragma comment(lib, "Ws2_32.lib")

#define DEFAULT_BUFLEN 512


#define IP_ADDRESS  "127.0.0.1"
#define TELNET_PORT 6789

#pragma comment( lib, "ws2_32.lib" ) //Winsock Library

int main( int argc, char * argv[] ) {

   char ipAddress[10];
   int  portNumber;

   //----------------------
   // Declare and initialize variables.
    int iResult;
    WSADATA wsaData;

    SOCKET ConnectSocket = INVALID_SOCKET;
    struct sockaddr_in clientService;

    int recvbuflen = DEFAULT_BUFLEN;
    char sendbuf[1024];
    char recvbuf[DEFAULT_BUFLEN] = "";

   //----------------------
   // get the IP address and port number from the
   //    command line arguments
    printf( "\n\n   ClientMultiPC started....\n\n" );
    printf( "   argc value is: %d\n", argc );
    if( argc != 3 ) {
       printf( "\n   Assigning IP address and port number...\n\n" );
       strcpy( ipAddress, IP_ADDRESS );
       portNumber = TELNET_PORT;
       printf( "  using IP address %s and port number %d\n", ipAddress, portNumber );
       fflush( stdout );
       Sleep( 2000 );
       exit( -1 );
    } else {
       printf( "\n   Assigning IP address and port number...\n\n" );
       strcpy( ipAddress, argv[1] );
       portNumber = atoi( argv[2] );
       printf( "  using IP address %s and port number %d\n", ipAddress, portNumber );
    }
    fflush( stdout );

   //----------------------
   // Initialize Winsock
    iResult = WSAStartup( MAKEWORD(2,2), &wsaData );
    if( iResult != NO_ERROR ) {
        wprintf( L"WSAStartup failed with error: %d\n", iResult );
        return 1;
    }
    printf( "WSAStartup successful...\n" );

   //----------------------
   // Create a SOCKET for connecting to server
    ConnectSocket = socket( AF_INET, SOCK_STREAM, IPPROTO_TCP );
    if( ConnectSocket == INVALID_SOCKET ) {
        wprintf( L"socket failed with error: %ld\n", WSAGetLastError() );
        WSACleanup();
        return 1;
    }

   //----------------------
   // The sockaddr_in structure specifies the address family,
   // IP address, and port of the server to be connected to.
    clientService.sin_family = AF_INET;
    clientService.sin_addr.s_addr = inet_addr( ipAddress );
    clientService.sin_port = htons( portNumber );

    //----------------------
    // Connect to server.
    iResult = connect( ConnectSocket, (SOCKADDR*) &clientService, sizeof(clientService) );
    if( iResult == SOCKET_ERROR ) {
        wprintf( L"connect failed with error: %d\n", WSAGetLastError() );
        closesocket( ConnectSocket );
        WSACleanup();
        return 1;
    }

    Sleep( 1000 );

    iResult = recv( ConnectSocket, recvbuf, recvbuflen, 0 );
    if( iResult > 0 ) {
        wprintf( L"Bytes received: %d\n", iResult );
        printf( "%s\r\n", recvbuf );
    }
    else if ( iResult == 0 )
        wprintf( L"Connection closed\n" );
    else
        wprintf( L"recv failed with error: %d\n", WSAGetLastError() );

    Sleep( 1000 );

    //----------------------
    // Send an initial buffer
    sprintf( sendbuf, "hello server\n" );
    iResult = send( ConnectSocket, sendbuf, (int)strlen(sendbuf), 0 );
    if (iResult == SOCKET_ERROR) {
        wprintf( L"send failed with error: %d\n", WSAGetLastError() );
        closesocket( ConnectSocket );
        WSACleanup();
        return 1;
    }

    printf( "Bytes Sent: %d with message %s\n", iResult, sendbuf );

    Sleep( 1000 );

    //----------------------
    // Loop to send additional messages from the keyboard
    while( 1 ) {
        printf( "   Enter text to send to the server: " );
        scanf( "%s", sendbuf );
        printf( "      [sending :%s:...]\n", sendbuf );
        iResult = send( ConnectSocket, sendbuf, (int)strlen(sendbuf), 0 );
        if( iResult == SOCKET_ERROR ) {
            wprintf( L"send failed with error: %d\n", WSAGetLastError() );
            closesocket( ConnectSocket );
            WSACleanup();
            return 1;
        }
        printf( "Bytes Sent: %d with message :%s:\n", iResult, sendbuf );
        if( strcmp( sendbuf, "STOP" ) == 0 ) {
           break;
        } else {
           sendbuf[0] = '\0';
           Sleep( 1000 );
        }
    }


    // shutdown the connection since no more data will be sent
    iResult = shutdown( ConnectSocket, SD_SEND );
    if( iResult == SOCKET_ERROR ) {
        wprintf( L"shutdown failed with error: %d\n", WSAGetLastError() );
        closesocket( ConnectSocket );
        WSACleanup();
        return 1;
    }


    // close the socket
    iResult = closesocket( ConnectSocket );
    if (iResult == SOCKET_ERROR) {
        wprintf( L"close failed with error: %d\n", WSAGetLastError() );
        WSACleanup();
        return 1;
    }

    WSACleanup();
    return 0;
}
