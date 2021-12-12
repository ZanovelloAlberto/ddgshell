#!/usr/bin/python

import sys
import os
import subprocess
import shutil

# --- DEFAULT VALUE ---
BUILD_ARGS="-h"

# directories
OUTDIR="build"
PYDIR="python"
SRCDIR="src"

OUT="ddgshell.sh"

MAINBASH="{}/ddgshell.sh".format(SRCDIR)
OUTPATH="{}/{}".format(OUTDIR,OUT)

# --- SETUP ---
# user side

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
    
            # os.system("echo \"{}='\" >> {}".format(name,OUTPATH))
            # os.system("cat {}/{} >> {}".format(PYDIR,filename,OUTPATH))
            # os.system("echo \"'\" >> {}".format(OUTPATH))
            continue    

    # os.system("cat {} >> {}".format(MAINBASH,OUTPATH))
    f.write(open(MAINBASH).read())

    print("done")
    f.close()


def clear():
    if os.path.exists(OUTDIR):
        shutil.rmtree(OUTDIR)



def run():

    cmd = "ls"
    process = subprocess.Popen(cmd.split('\n'), stdout=subprocess.PIPE)
    output, error = process.communicate()
    print(output.decode("utf-8").split())


def prime():
    print("prime")

options = {
    "build" : build,
    "run" : run,
}


options[sys.argv[1]]()

