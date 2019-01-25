#!/usr/bin/env python

import os

def delete_if_exists(path):
    if os.path.exists(path):
        os.system("rm -r " + path)

folders = [x for x in os.listdir("case/") if os.path.isdir("case/" + x)]
for f in folders:
    if "processor" in f: # in the case of parallel runs.
        delete_if_exists("case/" + f)
        continue
    dotsep = f.split(".")
    isfloat = len(dotsep) > 1 and all([x.isdigit() for x in dotsep])
    esep = f.split("e-")
    issci = len(esep) > 1 and all([x.isdigit() for x in esep])
    isnum = f.isdigit() or isfloat or issci
    if isnum and float(f) != 0:
        delete_if_exists("case/" + f)

delete_if_exists("main.msh")
delete_if_exists("case/constant/polyMesh")
delete_if_exists("case/postProcessing")
