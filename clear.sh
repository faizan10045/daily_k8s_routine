#!/bin/bash

# Remove any string between the first occurence of '===' and '---'
sed -i '/===/,/---/ { // { x; s/$/./; x; }; x; /.../! { x; d; }; x; }' ~/routine/health.txt
