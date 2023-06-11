#include <stdio.h>
void readstring(char str[]) {
	int i = 0;


	while(1) {
		int asciiLetter = getchar();
		if (asciiLetter == 0x0A || asciiLetter == 0x0D) {
			str[i] = 0;
			break;
		}
		str[i] = asciiLetter;

		i++;
	}
	str[i+1] = '\0';
}

/*sortstring code*/
void sortstring(char str[]) {
	int len = 0;
	int k;
	int j;
	int m;
	for(k = 0; k < 20; k++) {
		if (str[k] == 0)
		{
			break;
		}
			len++;
	}
	for(j = 32; j<=126; j++) {
		for(m = 0; m < len; m++) {
			if(str[m] == j) {
				printf("%c", str[m]);
			}	
		}
	}
}


int main() {


	char charArray[20];


	while (1) {
		printf("Enter word: ");
		readstring(charArray);
		if (charArray[0] == 0) {
			printf("\nExiting\n");
			break;
		}
printf("Original Word: %s", charArray);          /*Does printing the                                                 array print it
                                               one char at a time? */
printf("\nAlphabetized word: ");
sortstring(charArray);
printf("\n");
}
return 0;
}
