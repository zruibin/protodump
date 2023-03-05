#!/bin/bash

./luac $1
xxd -p luac.out > $1.out
./lua build_proto.lua $1.out > $1.dump.txt
rm luac.out
rm $1.out
