#!/bin/bash
#Need tasks/plans info
#Need specific resource counts

function get_integer () {
  echo $1 | grep -Eo "[0-9]+" 2>/dev/null
}

function to_ddhhmmss () {
  printf '%dd:%dh:%dm:%ds\n' $(($1/86400)) $(($1%86400/3600)) $(($1%3600/60)) $(($1%60)) 
}

function to_currency () {
  printf "%'.2f" $1
}

function to_commas () {
  printf "%'d" $1
}


echo $(get_integer "abc:123")
echo $(to_ddhhmmss 12345678)
echo $(to_currency 12345678.25)
echo $(to_commas 12345678)
