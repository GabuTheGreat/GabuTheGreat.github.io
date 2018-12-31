#Gabriel Mutua
#ALU Assignment: AIIP Facilitator

#Get user inputs
first_num = int(input("Enter number the first number: "))
second_num = int(input("Enter number the second number: "))

#Check the absolute differrence between the two numbers
def check_diff(first_num,second_num):
    if (abs(first_num) - abs(second_num)) == 6 or (abs(second_num) - abs(first_num)) == 6:
        return True
    else:
        return False

#A function to check if a number is a prime number using simplified primality test
def isPrime(num):
    """Returns True if num is prime."""
    if (num == 1) or (num % 2 == 0) or (num % 3 == 0) :
        return False
    if (num == 2) or (num == 3) :
        return True

    check_var= 5
    set_var = 2

    while check_var * check_var <= num:
        if num % check_var == 0:
            return False

        check_var += set_var
        set_var = 6 - set_var

    return True

#Output the final result
if (isPrime(first_num) == True) and (isPrime(second_num) == True) and (check_diff(first_num,second_num) == True):
    print(first_num,second_num,': "True"')
else:
    print(first_num,second_num,': "False"')
    
