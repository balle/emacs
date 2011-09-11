#!/bin/sh

epylint $1 --rcfile=~/.emacs.d/configs/pylint.rc | grep -v 'Class has no __init__ method' | grep -v '_ is not callable' | grep -v "has no 'objects' member"
