#!/bin/bash
wget -O- 'http://feeds.soundcloud.com/users/soundcloud:users:251994336/sounds.rss' | sed -e 's/<language>en<\/language>/<language>eo<\/language>/'
