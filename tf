#!/usr/bin/python3
import sys, os
if sys.stdin.isatty():
    print("Please pipe things into this program")
    sys.exit(1)

# PermissionError
filename = '/tmp/'+str(os.getpid())
exitcode = 0
try:
    tmpfile = open(filename, 'w')
    tmpfile.write(sys.stdin.read())
    tmpfile.close()
except PermissionError:
    filename = "/dev/null"
    exitcode = 2

os.environ["TF"] = filename
sys.stdout.write(filename)
sys.exit(exitcode)
