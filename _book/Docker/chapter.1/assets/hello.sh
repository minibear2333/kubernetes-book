#!/bin/bash

# include demo-magic
. tools/demo-magic.sh -n

# Will wait max 1 seconds until user presses
PROMPT_TIMEOUT=0

TYPE_SPEED=10

# hide the evidence
clear

p 'docker pull hello-world'
wait
cat cache/pull-hello.txt
wait 

p 'docker run hello-world'
wait
cat cache/run-hello.txt