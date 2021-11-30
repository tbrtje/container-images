#!/bin/sh

args="$(cat "/config/args.txt" | xargs)"

targets="$(cat "/config/target.txt" | xargs)"

instaloader $args $targets
