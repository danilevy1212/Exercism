import random
from string import ascii_uppercase as uppercase
from string import digits

class Robot(object):
    def __init__(self):
        self.allnames = set()
        self.reset()

    def reset(self):
        self.name = self.change_name()

    def change_name(self):
        while True:
            newname = "".join(random.choices(uppercase,k=2)) + "".join(random.choices(digits, k=3))
            if newname not in self.allnames:
                self.allnames.add(newname)
                return newname
