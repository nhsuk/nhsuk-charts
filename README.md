# NHSUK (Helm) Charts

![build_chart](https://github.com/nhsuk/nhsuk-charts/workflows/build_chart/badge.svg)
![push_chart](https://github.com/nhsuk/nhsuk-charts/workflows/push_chart/badge.svg)

> A repository for storing and developing Helm charts for the NHSUK program.

## Repository structure

The repository is organised into a single directory - [charts](./charts).

`charts` contains all of the charts regardless of their development state.
Other chart repositories split the charts into (typically) two directories, one
for 'stable' charts and another for charts not yet deemed to be stable i.e.
still in development e.g. [Helm charts](https://github.com/helm/charts),
[Bitnami charts](https://github.com/bitnami/charts) and
[AWS EKS Charts](https://github.com/aws/eks-charts) all use this pattern.
However, for ease of use this method has not been used for this repository. It
may be adopted in future as the number of charts increases and the number of
users and use cases expand.

## Chart development

Rather than charts beginning life within an `incubator` directory they start
within the `charts` directory. However, before a change to the repo is merged
into `master` the chart will have needed to achieve some level of quality and
stability. Currently that criteria is, broader speaking, the chart has
succeeded to be:
* linted
* installed into a [kind cluster](https://kind.sigs.k8s.io/)

Once merged into `master` the chart is again linted and installed into a kind
cluster before it is pushed to the Helm repository, an instance of an
[Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/).
