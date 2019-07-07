#!/bin/bash

groups_template="groups_template.yml"
groups_new="groups_new.yml"
groups="groups.yml"

cat groups_template.yml > groups_new.yml

dnf grouplist --installed -q | sed -n '1!p' | awk '{$1=$1};1' | sed 's/^/ - @/' >>groups_new.yml

if cmp -s "$groups_new" "$groups"; then
    printf 'The file "%s" is the same as "%s"\n' "$groups_new" "$groups"
else
    printf 'The file "%s" is different from "%s"\n' "$groups_new" "$groups"
fi
