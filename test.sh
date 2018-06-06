#!/usr/bin/env bash

sed -n "/location \/ {/ p" nginx/test.conf
