#!/usr/bin/python

# import modules used here -- sys is a very standard one
import sys
import argparse
import logging  
from urllib import parse
import requests

# --- FUNCTIONS ---

def version():
        print("""ddghub (DDGHUB) 1.0.0
MIT License 2021.
    """)

def downlaod(url:str):
    parse.urlsplit(url).path.split("/")
    owner=""
    repo=""
    branch=""

    r = requests.get('https://codeload.github.com/{}/{}/tar.gz/{}'.format(owner,repo,branch))
    print(r)
#   curl -o ${location} https://codeload.github.com/${owner}/${repo}/tar.gz/${branch} |
#     tar -xz --strip=2 ${repo}-${branch}/${path}



options = {
    "version":version,
    "download": downlaod
}



# --- Gather our code in a main() function ---


def main(args, loglevel):
    logging.basicConfig(format="%(levelname)s: %(message)s", level=loglevel)

    # TODO Replace this with your actual code.
    # print("Hello there.")
    logging.info("You passed an argument.")
    # logging.debug("Your Argument: %s" % args.argument)
    print(args.argument)
    options[args.argument]("")



# Standard boilerplate to call the main() function to begin
# the program.
if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="""Does a thing to some stuff,
                                    epilog = 'As an alternative to the commandline, 
                                    params can be placed in a file, one per line, and 
                                    specified on the commandline like '%(prog)s @params.conf'.""",
        fromfile_prefix_chars='@')
    # TODO Specify your real parameters here.
    parser.add_argument(
        "argument",
        help="pass ARG to the program",
        metavar="ARG")

    parser.add_argument(
        "-o",
        "--outdir",
        help="place the output into <file>.",
        action="store_true")

    parser.add_argument(
        "version",
        help="version",
        action="store_true")

    parser.add_argument(
        "-v",
        "--verbose",
        help="increase output verbosity",
        action="store_true")
    args = parser.parse_args()

    # Setup logging
    if args.verbose:
        loglevel = logging.DEBUG
    else:
        loglevel = logging.INFO

    main(args, loglevel)



