#!/bin/bash
#
#    passage.sh
#    Copyright (C) 2021  Sourav Majumdar
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
#    along with this program, see LICENSE.  If not, see <https://www.gnu.org/licenses/>.

DIR="$(cd "$(dirname "$0")" && pwd)"
pattern="       *       *       *       *       *"

mapfile -t line_discourses< <(grep -Fn "$pattern" $DIR/discourses_epictetus.txt | cut -f1 -d:)

mapfile -t line_enchiridion< <(grep -Fn "$pattern" $DIR/enchiridion_epictetus.txt | cut -f1 -d:)

len_line_discourses=${#line_discourses[@]}

len_line_enchiridion=${#line_enchiridion[@]}

rand_discourses=$((RANDOM%len_line_discourses))

rand_enchiridion=$((RANDOM%len_line_enchiridion))

sum_len=$((len_line_discourses+len_line_enchiridion))

rand_choose=$((RANDOM%sum_len))

if [[ rand_choose -lt len_line_discourses ]]; then
	sed -n "${line_discourses[rand_discourses]},${line_discourses[$((rand_discourses+1))]}p" $DIR/discourses_epictetus.txt
	echo "--- Discourses"
else
	sed -n "${line_enchiridion[rand_enchiridion]},${line_enchiridion[$((rand_enchiridion+1))]}p" $DIR/enchiridion_epictetus.txt
	echo "--- Enchiridion"
fi
