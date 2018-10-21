#!/bin/bash
#renames all files in directory changing white sapces to underscore
 for f in *\ *; do mv "$f" "${f// /_}"; done
