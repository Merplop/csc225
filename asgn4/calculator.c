#include <stdio.h>
#include "operations.h"

int main(void) {
   int operation;
   int operand1;
   int operand2; 
   int count = 0;
   int result;
   char cont;
   printf("Welcome to the Calculator program.\n");
   printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:shift 9:rshift");
   printf("\nNumber of operations performed: 0");
   while(1) {
	
    printf("Enter number: ");
    scanf(" %i", &operand1);
    printf("Enter second number: ");
    scanf(" %i", &operand2);
    printf("Select operation: ");
    scanf(" %i", &operation);
    switch(operation){
          case 1:
            result =  addnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 2:
            result =  subnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 3:
            result =  multnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 4:
            result =  divnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 5:
            result =  andnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 6:
            result =  ornums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 7:
            result =  xornums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 8:
            result = lshiftnums(operand1, operand2);
            printf("Result: %i", result);
            break;
          case 9:
            result = rshiftnums((unsigned int)operand1, operand2);
         printf("Result: %i", result);
          default:
         printf("Result: Invalid Operation");
    }
         count++;
         printf( "\nContinue (y/n)?: " );
         scanf(" %c", &cont);

         if (cont == 'n')
         {
          printf("\nExiting");
          return 0;
         }
    }
   return 0;
}
