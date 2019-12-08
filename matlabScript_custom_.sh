#!/usr/bin/env bash
#for custom MATLAB install
#use run() if script, omit if function
#folder containing program must be on MATLAB path
#	(not needed for custom. can just supply path to interpreter instead?)
#put bash script in program folder
#user sets executable
#config files for user input?
#or can compile matlab file for use with non-matlab systems
INSTALLFOLDER="" #edit this
CLIINTERPRETER="$INSTALLFOLDER/bin/matlab"
$CLIINTERPRETER -nodesktop -nosplash -r "test1('Called test1'); test1Sub('Called test1Sub'); exit;"
