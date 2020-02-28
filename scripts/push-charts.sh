#! /bin/bash

set +e

existing_charts=()
uploaded_charts=()

for chart in *.tgz; do
  chartname=$(helm show chart "$chart" | grep ^name: | cut -d ' ' -f 2)
  version=$(helm show chart "$chart" | grep ^version: | cut -d ' ' -f 2)
  az acr helm show -n nhsuk "$chartname" --version "$version"

  retval=$?
  if [[ $retval -eq 0 ]]; then
    echo "$chart already exists."
    existing_charts+=("$chart")
  else
    echo "$chart not found."
    az acr helm push -n nhsuk "$chart" --verbose
    uploaded_charts+=("$chart")
  fi
done

echo "Existing charts:" "${existing_charts[@]-NONE}"
echo "Uploaded charts:" "${uploaded_charts[@]-NONE}"
