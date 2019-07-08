#!/bin/bash

groups_template="groups_template.yml"
groups_new="groups_new.yml"
groups="groups.yml"

cat groups_template.yml > groups_new.yml

dnf grouplist --installed -q | sed -n '1!p' | awk '{$1=$1};1' | sed 's/^/ - "@/' | sed 's/$/"/' >>groups_new.yml

if cmp -s "$groups_new" "$groups"; then
    printf "Package Groups not updated, skipping"
    rm "$groups_new"
else
    printf "Package Groups updated, updating git repo"
    rm "$groups"
    mv "$groups_new" "$groups"
    git add "$groups"
    git commit -m "updating package groups"  
    git push origin master
fi
