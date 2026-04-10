#!/usr/bin/python

from appscript import *
from osax import OSAX

session = app('/Applications/iTerm').current_terminal().current_session()

result = session.text().split('\n')[-20:-1]
for index, line in enumerate(result):
    print '  ', index, line[0:100]
line = int(raw_input('Line: '))
sa = OSAX()
sa.set_the_clipboard_to(result[line])
result[line]

