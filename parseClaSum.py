#!/usr/bin/env python2
import sys
import argparse

presetDict = {"rheeda": [1.0, 2.0, 3.0, 4.0], "ryan": [1.0, 3.0, 5.0, 7.0]}
clParser = argparse.ArgumentParser()
clGroup1 = clParser.add_mutually_exclusive_group(required=True)
clGroup1.add_argument("-p", "--preset", help="preset corresponds to hardcoded configs")
clGroup1.add_argument("-n", "--nums", help="4 numbers to add", type=float, nargs=4, metavar=("INPUT1", "INPUT2", "INPUT3", "INPUT4"))
clArgs = clParser.parse_args()
if clArgs.preset:
    if presetDict.get(clArgs.preset) == None:
        print("This preset does not exist")
        print("Presets are:")
        print(presetDict.keys())
        sys.exit(1)
    else:
        sumArray = presetDict.get(clArgs.preset)
elif clArgs.nums:
    sumArray = clArgs.nums
print(sum(sumArray))
