#include "types.h"
#include "user.h"

#pragma GCC push_options
#pragma GCC optimize ("O0")

int main(int argc, char *argv[])
{
	int nbr_fils = 3;
	int pid[nbr_fils];
	int i = 0;	


	for (i = 0; i < nbr_fils; ++i)
	{
		pid[i] = fork();

		if(pid[i] == 0)
		{
			printf(1, "%d start\n", getpid());
			break;
		}
	}
	if(i < nbr_fils)
		for(int i = 0; i < 2<<25; ++i);

	if(i < nbr_fils)
		printf(1, "%d termine\n", getpid());
	else
	{
		for (int j = 0; j < nbr_fils; ++j)
		{
			pid[i] = wait();
		}
	}

	exit();
}

#pragma GCC pop_options
