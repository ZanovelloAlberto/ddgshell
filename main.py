#!/usr/bin/python3

# import modules used here -- sys is a very standard one
import argparse
import logging
import os
from urllib import parse
from urllib.request import urlopen

# --- FUNCTIONS ---

def version():
    print("""ddghub (DDGHUB) 1.0.0
MIT License 2021.""")


def downlaod(args: argparse.Namespace):

    print(args)
    if (args.link == None):
        return "pass github link as args"
    
    arr = parse.urlsplit(args.link).path.split("/", maxsplit=5)

    if (len(arr) < 2):
        return "invalid link"

    print(arr)
    owner = arr[1]
    repo = arr[2]
    branch = arr[4]
    repoPath = arr[5] 
    outdir = args.outdir

    if os.path.exists(outdir) == False:
        os.mkdir(outdir)

    os.system("""curl https://codeload.github.com/{}/{}/tar.gz/{} | \
        tar -xz -C {} --strip=2 {}-{}/{} """.format(owner, repo, branch, outdir, repo, branch, repoPath))
    return "done"

options = {
    "version": version,
    "download": downlaod
}

# --- Gather our code in a main() function ---


def main(args: argparse.Namespace, loglevel):
    logging.basicConfig(format="%(levelname)s: %(message)s", level=loglevel)

    logging.info("You passed an argument.")
    if(args.version):
        version()
    elif(args.link != ""):
        print(downlaod(args))
    else:
        print("no link found")


# the program.
if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="""Does a thing to some stuff,
                                    epilog = 'As an alternative to the commandline, 
                                    params can be placed in a file, one per line, and 
                                    specified on the commandline like '%(prog)s @params.conf'.""",
        fromfile_prefix_chars='@')

    parser.add_argument(
        "link",
        help="the github link of the repo/directory.",
        metavar="ARG")

    parser.add_argument(
        "-o",
        "--outdir",
        help="place the output into <file>.",
        metavar="ARG")

    parser.add_argument(
        "--version",
        help="show version",
        metavar="store_true")

    parser.add_argument(
        "-v",
        "--verbose",
        help="increase output verbosity",
        action="store_true")
    
    Dict = {}
    Dict["-o"] = "./"
    parser.set_defaults(outdir="./")
    args = parser.parse_args()

    # Setup logging
    if args.verbose:
        loglevel = logging.DEBUG
    else:
        loglevel = logging.INFO

    main(args, loglevel)
