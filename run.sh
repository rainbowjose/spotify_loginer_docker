#!/bin/bash
Xvfb :0 -screen 0 1024x768x16 &
DISPLAY=:0.0 spotify --username=$LOGIN --password=$PASSWORD