  GNU nano 8.7.1                                                                                                   exp7a.c                                                                                                            
#include<stdio.h>
int main(){

        long long counter=0;
while(1){
        counter++;
        if(counter % 100000000==0){
                printf("CPU task running: %lld\n",counter);
        }
}
return 0;
}
