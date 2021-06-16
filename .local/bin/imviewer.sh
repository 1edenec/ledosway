#!/bin/bash
# script to make imv to show all pictures in folder with xdg-open
imv open "$(dirname ${1})"
