#!/bin/bash
SRC_DIR="./src"
sed -i '' -e 's/。/./g' $SRC_DIR/*
sed -i '' -e 's/、/, /g' $SRC_DIR/*