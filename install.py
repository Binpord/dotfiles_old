#!/usr/bin/env python3

import os
import argparse

def readDestinations(destinationsFile):
    destinationDirectory = os.path.expandvars('$HOME')
    destinations = []
    for line in destinationsFile:
        if line[-2] == ':':
            destinationDirectory = os.path.expandvars(line[:-2])
        else:
            destinations.append((line[:-1], destinationDirectory))    # [:-1] to ignore '\n'
    return destinations

def linkFileToDirectory(filename, directory, verbose):
    if verbose:
        print('Linking file \'{}\' to directory \'{}\''.format(filename, directory))
    os.system('ln -f {} {}'.format(filename, directory))

def linkDirectoryToDirectory(srcDirectory, dstDirectory, verbose):
    if verbose:
        print('Linking directory \'{}\' to directory \'{}\''.format(srcDirectory, dstDirectory))

    cwd = os.getcwd()
    os.chdir(srcDirectory)

    newDirectoryPath = os.path.join(dstDirectory, srcDirectory)
    newDirectoryPath = os.path.expandvars(newDirectoryPath)
    if not os.path.isdir(newDirectoryPath):
        if verbose:
            print('Creating directory \'{}\'.'.format(newDirectoryPath))
        os.system('mkdir {}'.format(newDirectoryPath))

    for filename in os.listdir('./'):                               # we already changed directory to srcDirectory
        if os.path.isfile(filename):
            linkFileToDirectory(filename, newDirectoryPath, verbose)
        elif os.path.isdir(filename):
            linkDirectoryToDirectory(filename, newDirectoryPath, verbose)

    os.chdir(cwd)

def main():
    parser = argparse.ArgumentParser(description='Link config files in repo to their domains.')
    parser.add_argument('-v', '--verbose', action='store_true', help='enable verbose output')
    parser.add_argument('destinations', type=str, nargs='?', default='.destinations',
            help='file with destionations, default is \'.destinations\'')
    args = parser.parse_args()

    with open(args.destinations) as destinationsFile:
        destinations = readDestinations(destinationsFile)

    for (filename, destination) in destinations:
        if os.path.isfile(filename):
            linkFileToDirectory(filename, destination, args.verbose)
        elif os.path.isdir(filename):
            linkDirectoryToDirectory(filename, destination, args.verbose)

if __name__ == '__main__':
    main()
