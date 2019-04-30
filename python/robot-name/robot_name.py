import random
from string import ascii_uppercase as uppercase
from string import digits

class Robot(object):
    def __init__(self):
        self.reset()

    def reset(self):
        self.name = self.change_name()

    def change_name(self):
        if hasattr(self, 'name'):
            random.seed(int(self.name[-3:]))

        return "".join(random.choices(uppercase,k=2)) + "".join(random.choices(digits, k=3))
