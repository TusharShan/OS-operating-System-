  GNU nano 8.7.1                                                                                                   exp6.c                                                                                                             
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
int mb;
if(argc != 2)
{
printf("Usage: %s <memory_in_MB>\n", argv[0]);
return 1;
}
mb = atoi(argv[1]);

char *memory = malloc(mb * 1024 * 1024);

if (memory == NULL)
{
printf("Memory allocation failed\n");
return 1;
}
for(int i = 0; i < mb * 1024 * 1024; i += 4096)
{
memory [i] = 1;
}
printf("%d MB memory allocated.\n", mb);
printf("Program is running... Press Ctrl+C to exit.\n");

while (1)
{
sleep(1);
}
return 0;
}
