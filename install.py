#!/usr/bin/env python3

import os
import sys
import argparse

def readDestinations(destinationsFile):
    destinationDirectory = os.path.expandvars('$HOME')
    destinations = []
    for line in destinationsFile:
        if line[-2] == ':':
            destinationDirectory = os.path.expandvars(line[:-2])
        else:
            destinations.append((os.path.expandvars(line[:-1]), destinationDirectory))    # [:-1] to ignore '\n'
    return destinations

def linkFileToDirectory(filename, directory, verbose):
    filename = os.path.expandvars(filename)
    directory = os.path.expandvars(directory)
    if not os.path.isfile(filename):
        sys.stderr.write('First argument of linkFileToDirectory should be an existing file; \'{}\' is not a file.'.format(filename))
        sys.exit(1)
    if not os.path.isdir(directory):
        if verbose:
            print('Creating directory \'{}\'.'.format(directory))
        os.system('mkdir {}'.format(directory))
    if verbose:
        print('Linking file \'{}\' to directory \'{}\''
                .format(filename, directory))
    os.system('ln -f {} {}'.format(filename, directory))

def linkDirectoryToDirectory(srcDirectory, dstDirectory, verbose):
    srcDirectory = os.path.expandvars(srcDirectory)
    dstDirectory = os.path.expandvars(dstDirectory)
    if not os.path.isdir(srcDirectory):
        sys.stderr.write('First argument of linkDirectoryToDirectory should be an existing directory; \'{}\' is not a directory.'.format(srcDirectory))
        sys.exit(1)
    if verbose:
        print('Linking directory \'{}\' to directory \'{}\''
                .format(srcDirectory, dstDirectory))

    cwd = os.getcwd()
    os.chdir(srcDirectory)

    newDirectoryPath = os.path.join(dstDirectory, srcDirectory)
    if not os.path.isdir(newDirectoryPath):
        if verbose:
            print('Creating directory \'{}\'.'.format(newDirectoryPath))
        os.system('mkdir {}'.format(newDirectoryPath))

    for filename in os.listdir('./'):       # we already changed directory to srcDirectory
        if os.path.isfile(filename):
            linkFileToDirectory(filename, newDirectoryPath, verbose)
        elif os.path.isdir(filename):
            linkDirectoryToDirectory(filename, newDirectoryPath, verbose)
        elif verbose:
            print('Ignoring \'{}\' as it is not a file or directory.'
                    .format(filename))

    os.chdir(cwd)

def main():
    parser = argparse.ArgumentParser(description='Link config files in repo to their domains.')
    parser.add_argument('-v', '--verbose', action='store_true', help='enable verbose output')
    parser.add_argument('destinations', type=str, nargs='?', default='.destinations',
            help='file with destionations, default is \'.destinations\'')
    args = parser.parse_args()

    destinationsFilePath = os.path.expandvars(args.destinations)
    if not os.path.isfile(destinationsFilePath):
        sys.stderr.write('Destinations should be an existing file; \'{}\' is not a file.'
                .format(destinationsFilePath))
        sys.exit(1)
    with open(destinationsFilePath) as destinationsFile:
        destinations = readDestinations(destinationsFile)

    for (filename, destination) in destinations:
        if os.path.isfile(filename):
            linkFileToDirectory(filename, destination, args.verbose)
        elif os.path.isdir(filename):
            linkDirectoryToDirectory(filename, destination, args.verbose)
        elif args.verbose:
            print('Ignoring \'{}\' as it is not a file or directory.'
                    .format(filename))

if __name__ == '__main__':
    main()
