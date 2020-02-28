# NHSUK (Helm) Charts

[![chart_build](https://github.com/nhsuk/nhsuk-charts/workflows/chart_build/badge.svg)](https://github.com/nhsuk/nhsuk-charts/actions?query=workflow%3Achart_build)
[![chart_push](https://github.com/nhsuk/nhsuk-charts/workflows/chart_push/badge.svg)](https://github.com/nhsuk/nhsuk-charts/actions?query=workflow%3Achart_push)

> A repository for storing and developing Helm charts used by the NHSUK program.

## Repository structure

The repository is organised into a single directory - [charts](./charts).

`charts` contains all of the charts regardless of their development state.
Other chart repositories split charts into (typically) two directories, one
for 'stable' charts and another for charts not yet deemed to be stable i.e.
still in development examples include:
* [Helm charts](https://github.com/helm/charts),
* [Bitnami charts](https://github.com/bitnami/charts)
* [AWS EKS Charts](https://github.com/aws/eks-charts)

However, for ease of use this method has not been implemented with this
repository. It may be adopted in the future as the number of charts, users and
use cases increase.

## Chart development

If a new chart is to be added or changes need to be made to an existing chart
the first step is to create a branch. Once the chart has been developed on the
branch it can be merged into master.

As can be seen in the [workflow configurations](./github/workflows) once a PR
has been created the charts contained within will be:
* linted
* installed into a [kind cluster](https://kind.sigs.k8s.io/)

In order for a PR to be eligible to be merged into master these checks must
have been successful.

Once merged into `master` the chart is again linted and installed into a kind
cluster before it is pushed to the Helm repository, an instance of an
[Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/)
located at [nhsuk.azurecr.io](https://nhsuk.azurecr.io).

## Notes

The name of the chart must be the same as the name of the directory it is
container in. If this is not the case the step to delete charts that have been
removed will not work as intended.
