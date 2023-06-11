#include <stdio.h>

int main() {
	while(1) {
		int n;
		unsigned int un;
		char r;
		unsigned int c = 0;
		printf("Welcome to the CountOnes program.\n");
		printf("Please enter an integer: ");
		scanf("%i", &n);
		un = (unsigned int)n;
		while(un) {
			c+=un&1;
			un>>=1;
		}
		printf("The number of bits set in %i is: %d\n", n, c);
		printf("Continue (y/n)? ");
		scanf(" %c", &r);

		if (r == 'n') {
			printf("Exiting\n");
			return 0;
		} else {
			printf("\n");
			continue;
		}
	}
}
