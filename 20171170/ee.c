#include<stdio.h>
long long int a[1000001];
int main()
{
	int t,n;
	long long int v,flag =0,i,j,sum,temp;
	scanf("%d",&t);
	while(t>0)
	{
		sum=0;
		scanf("%d %lld",&n,&v);
		for(i=0;i<n;i++)
		{
			scanf("%lld",&a[i]);

		}

		for(i=0;i<n-1;i++)
		{
			for(j=0;j<n-i-1;j++)
			{
				if(a[i]>a[i+1])
				{
					temp = a[i];
					a[i]=a[i+1];
					a[i+1]=a[i];
				}
			}
		}
	for(i=0;i<n;i++)
	printf("%lld",a[i]);
		for(i=n-1;i>-1;i++)
		{
			sum+=a[i];
			if(sum>=v)
			{
				flag=1;
				break;
			}
		}
		if(flag==1)
			printf("%lld\n",n-i);
		else printf("-1\n");
t--;
	}
	return 0;
}
