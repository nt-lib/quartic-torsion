#!/usr/bin/env bash
ls X1_30*.m | parallel --joblog logs/verify_joblog30.txt -j ${1:-10} 'magma {} >| logs/{.}.txt'
