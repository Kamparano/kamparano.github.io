# sedbdiff.sh
# Generate an xxd + sed binary patch.
# Generated files are simple sed scripts to be run against xxd hexdumps.
# To apply one of these patches, run:
#     xxd <ORIGINAL FILE> | sed -f <PATCH FILE> | xxd -r > <NEW FILE>
#
# zlib License
#
# Copyright (C) 2017 Kamparano
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.
tmp1=`mktemp`
tmp2=`mktemp`
xxd $1 > $tmp1
xxd $2 > $tmp2

diff --new-line-format='%-dns/.*/%l/;;;;;;;;;;;;;;;;//' \
--unchanged-line-format='' --old-line-format='' $tmp1 $tmp2 \
| sed -e 's/;;;;;;;;;;;;;;;;\/\//\n/g;' | sed -re 's/.{19}$/\//'

rm "$tmp1" "$tmp2"
