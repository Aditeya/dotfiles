#!/bin/sh
sensors | grep "Tctl:" | tr -d '+' | awk '{print $2}'
