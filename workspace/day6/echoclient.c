 #include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>
#define MAXLINE 128


void* readthread(void* arg)
{
    pthread_detach(pthread_self());
    int sockfd = (int)arg;
    int n = 0;
    char buf[MAXLINE];
    
    while (1) 
    {
        n = read(sockfd, buf, MAXLINE);
        if (n == 0)
        {
            printf("the other side has been closed.\n");
            close(sockfd);
            exit(0);
        }
        else
            write(STDOUT_FILENO, buf, n);
    }
    return (void*)0;
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "use:%s [port]", argv[0]);
        return -1;
    }

    int port = atoi(argv[1]);
    short plen;
    struct sockaddr_in servaddr;
    int sockfd;
    char buf[MAXLINE];
    char package[MAXLINE];
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    inet_pton(AF_INET, "127.0.0.1", &servaddr.sin_addr);
    servaddr.sin_port = htons(port);
    connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr));
    pthread_t thid;
    pthread_create(&thid, NULL, readthread, (void*)sockfd);

    int plen_tmp;
    while (fgets(buf, MAXLINE, stdin) != NULL)
    {
        plen = strlen(buf) - 1;
        plen_tmp = htons(plen);
        memcpy(package, &plen_tmp, sizeof(plen));
        memcpy(package + sizeof(short), buf, plen);
        write(sockfd, package, plen + sizeof(short));
    }
        
    close(sockfd);
    return 0; 
} 