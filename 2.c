#include<stdio.h>
int main()
{
 int i,j,f=0,r=0,s=0,size,N,A[100000];
 scanf("%d",&N);
 for(i=0;i<N;i++)
 scanf("%d",&A[i]);
 while(f<N)
 {
  if(f!=r)
  for(j=r;j<=f-1;j++)
  {
   if(A[f]==A[j])
   r=j+1;
  }
  size=f-r+1;
  s+=(size*(size+1))/2;
   f++;
 }
printf("%d",s);
return 0;
}
      
 
 
