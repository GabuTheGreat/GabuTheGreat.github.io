n= int(input("Enter number the first number: "))

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

print(isPrime(n))