#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1F252A/g' \
         -e 's/rgb(100%,100%,100%)/#97D59B/g' \
    -e 's/rgb(50%,0%,0%)/#1F252A/g' \
     -e 's/rgb(0%,50%,0%)/#97D59B/g' \
 -e 's/rgb(0%,50.196078%,0%)/#97D59B/g' \
     -e 's/rgb(50%,0%,50%)/#384149/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#384149/g' \
     -e 's/rgb(0%,0%,50%)/#97D59B/g' \
	"$@"