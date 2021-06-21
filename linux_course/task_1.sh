#!/usr/bin/env bash
ROWS=11
COLUMNS=$(( $ROWS - 1 ))
INDENT=$COLUMNS

#
#first part
#
for ((VAR = 1; VAR < $ROWS; VAR++)); do
#
#first triangle
#
	echo -n "*"
	for ((VAR1 = 1; VAR1 < $COLUMNS; VAR1++)); do
		if [ $VAR -eq 1 ]; then
			echo -n "*"
		elif [ $(( $VAR + $VAR1 + 1 )) -eq $ROWS ]; then
			echo -n "*"
		else
			echo -n " "
		fi
	done
#
#second triangle
#
	for ((VAR2 = 1; VAR2 < $INDENT; VAR2++)); do
		echo -n " "
	done
	echo -n "*"
	for ((VAR3 = 1; VAR3 < $COLUMNS; VAR3++)); do
		if [ $VAR -eq $COLUMNS ]; then
			echo -n "*"
		elif [ $VAR3 -eq $(( $VAR - 1 )) ]; then
			echo -n "*"
		else
			echo -n " "
		fi
	done
echo
done

#
#second part
#
for ((VAR = 1; VAR < $ROWS; VAR++)); do
#
#third triangle
#
	for ((VAR1 = 1; VAR1 < $COLUMNS; VAR1++)); do
		if [ $VAR -eq $(( $ROWS - 1 )) ]; then
			echo -n "*"
		elif [ $VAR1 -eq $(( $ROWS - $VAR )) ]; then
			echo -n "*"
		else
			echo -n " "
		fi
	done
	echo -n "*"
#
#fourth triangle
#
	for ((VAR2 = 1; VAR2 < $INDENT; VAR2++)); do
	echo -n " "
	done
	for ((VAR3 = 1; VAR3 < $COLUMNS; VAR3++)); do
		if [ $VAR -eq 1 ]; then
			echo -n "*"
		elif [ $VAR3 -eq $VAR ]; then
			echo -n "*"
		else
			echo -n " "
		fi
	done
echo "*"
done