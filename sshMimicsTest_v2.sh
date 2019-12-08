#!/usr/bin/env bash
if [ $# -ne 2 ]; then
	echo "Usage: sshMimics pid imageStackPath"
	exit 1
fi
pid=$1
imageStackPath=$2
serverUname=""
serverIP=""
patientDir="" #edit this
scriptDir="" #edit this
#User: do not edit below
mimics_exeDir=""
pstoolsDir=""
trimaticDir=""
sourcePath="$patientDir\\Images"
meshDir="$patientDir\\Mesh"
targetPath="$meshDir\\1"
sourcePathMCS="$meshDir\\1.mcs"
projectMimics="$patientDir\\$pid.mxp"
ssh "$serverUname@$serverIP" "mkdir $sourcePath & mkdir $meshDir"
scp -rT "$imageStackPath/." "$serverUname@$serverIP:$sourcePath"
echo -e "\n\033[1;36mStarting scripts on $serverUname. Manually run: fix -> Project Mesh in 3-Matic when done\nThen: script -> run script -> export_mesh.py\033[0m\n"
ssh "$serverUname@$serverIP" "cd \"$mimics_exeDir\" & .\\Mimics.exe -run_script \"$scriptDir\\Script0.py\" \"$sourcePath\" \"$targetPath\" & cd \"$pstoolsDir\" & PsExec \\\\$serverIP -s -i \"$trimaticDir\\3-matic.exe\" -run_script $scriptDir\\Script1.py $sourcePathMCS $patientDir $pid & Psexec \\\\$serverIP -s -i \"$trimaticDir\\3-matic.exe\" -run_script $scriptDir\\Script2.py $projectMimics $pid $patientDir"
cd $imageStackPath
cd ..
mkdir "Mesh_$pid"
cd "Mesh_$pid"
scp -T "$serverUname@$serverIP:$patientDir\\$pid.inp" .
