#!/bin/sh
wget -O- 'http://feeds.soundcloud.com/users/soundcloud:users:251994336/sounds.rss' | sed -e 's/<language>en<\/language>/<language>eo<\/language>/; s/<link>https:\/\/quitter.se\/kp<\/link>/<link>https:\/\/kamparano.github.io<\/link>/'
