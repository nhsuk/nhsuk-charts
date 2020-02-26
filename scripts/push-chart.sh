#! /bin/bash

set +e

for chart in *.tgz; do
  chartname=$(helm show chart "$chart" | grep ^name: | cut -d ' ' -f 2)
  version=$(helm show chart "$chart" | grep ^version: | cut -d ' ' -f 2)
  az acr helm show -n nhsuk "$chartname" --version "$version"

  retval=$?
  if [[ $retval -eq 0 ]]; then
    echo "$chart exists, not going to push again."
  else
    echo "Error response - indicates $chart doesn't exist, will attempt to push to repo."
    az acr helm push -n nhsuk "$chart" --verbose
  fi
done
