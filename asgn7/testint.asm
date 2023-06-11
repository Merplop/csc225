.global main
main:
jal initInt
li a0, '*'
while:
jal printChar
b while
