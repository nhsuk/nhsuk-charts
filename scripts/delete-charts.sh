#! /bin/bash

set +e

deleted_charts=()

for chart in $(git diff HEAD~1 --name-only ./charts | cut -d / -f 2 | uniq); do
  az acr helm delete --yes "$chart"

  retval=$?
  if [[ retval -eq 0 ]]; then
    echo "$chart was deleted."
    deleted_charts+=("$chart")
  else
    echo "$chart was not deleted."
  fi
done

echo "Deleted charts:" "${deleted_charts[@]-NONE}"
