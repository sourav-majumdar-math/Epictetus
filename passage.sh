#!/bin/bash
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
