def is_armstrong_number(number):

    num2str = str(number)
    length = len(num2str)

    return sum(int(num2str[i])**length for i in range(length)) == number
