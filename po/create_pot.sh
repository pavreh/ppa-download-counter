#!/bin/bash

#    Copyright (C) 2018  Pavel Řehák
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Version 0.4.1

pot_name=ppa-download-counter.pot


echo '' > messages.po
# Add strings to empty messages.po
xgettext -L Shell --join-existing --files-from=POTFILES.in

msgmerge -N $pot_name messages.po > new.pot
mv new.pot $pot_name

while read line
do
    [[ "$line" =~ ^#.*$ ]] && continue
    msgmerge -N $line.po messages.po > new.po
    mv new.po $line.po
done < ./LINGUAS

rm messages.po

