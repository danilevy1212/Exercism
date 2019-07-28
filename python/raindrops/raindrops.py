def convert(number):
    isMod     = lambda y : number % y == 0
    rainWords = [(3,"Pling"),(5,"Plang"),(7,"Plong")]

    return "".join([word for num, word in rainWords if isMod(num)]) or str(number)

