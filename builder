#!/usr/bin/python

import sys
import os
import subprocess
import shutil
import stat

# --- DEFAULT VALUE ---
BUILD_ARGS="-h"

# directories
OUTDIR="build"
PYDIR="python"
SRCDIR="bash"

OUT="ddgshell.sh"

MAINBASH="{}/main.sh".format(SRCDIR)
OUTPATH="{}/{}".format(OUTDIR,OUT)

# funciotns

def build():
    clear()
    print("building...")
    os.mkdir(OUTDIR)
    f = open(OUTPATH, "w")
    f.write("#!/usr/bin/bash\n")

    for filename in os.listdir("python/"):
        if filename.endswith(".py"): 
            name = filename.removesuffix(".py")
            f.write("{}='".format(name))
            f.write(open(PYDIR + "/" + filename).read())
            f.write("'\n")
            continue    

    f.write(open(MAINBASH).read())
    f.close()
    os.chmod(OUTPATH,os.stat(OUTPATH).st_mode | stat.S_IEXEC)
    os.system("./{} -h".format(OUTPATH))
    print("done")


def clear():
    if os.path.exists(OUTDIR):
        shutil.rmtree(OUTDIR)



def run():
    build()
    os.s


def install():
    build()


options = {
    "build" : build,
    "run" : run,
}


options[sys.argv[1]]()

