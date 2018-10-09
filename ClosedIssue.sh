#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
  else
    while IFS='' read -r branch || [[ -n "$branch" ]]; do

        if [ -d .git ]
          then
            if [ "git branch --list $branch" ]
              then
                echo "Branch name $branch already exists, delete request in progress ..."

                # Delete a Local GIT branch.
                echo "Delete a Local branch name $branch."
                git branch -D $branch

                # Delete a remote GIT branch
                echo "Delete a remote branch name $branch."
                git push origin :$branch

              else
                echo "$branch does not exist."
            fi;

          else
            echo "Please put your file in the right directory."
         fi;

    done < "$1"
fi;

