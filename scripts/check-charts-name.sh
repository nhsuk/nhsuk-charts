#! /bin/bash

set +e

failed=0

for chart in charts/*; do
  dir_name=$(basename "$chart")
  chart_name=$(helm show chart "$chart" | grep ^name: | cut -d : -f 2 | tr -d ' ')

  if [[ $dir_name != $chart_name ]]; then
    echo "Chart '$chart_name' is incorrectly contained in '$dir_name' - FIX."
    failed=1
  else
    echo "Chart '$chart_name' is correctly contained in '$dir_name'."
  fi
done

if [[ $failed -eq 1 ]]; then
  echo "Charts have been named incorrectly, they must be fixed for the step to pass."
  exit 1
fi
