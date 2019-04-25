from string import ascii_lowercase
from collections import OrderedDict
import re

def is_pangram(sentence):
    regex = re.compile('[^a-zA-Z]')
    return ''.join(sorted(OrderedDict.fromkeys(regex.sub('', sentence.lower())))) == ascii_lowercase