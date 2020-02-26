
# Tsung Helm Chart

This is a templated deployment of [Tsung](http://tsung.erlang-projects.org/) for Distributed Load generation using Kubernetes.

## Pre Requisites:

* Requires (and tested with) helm `v2.13.0` or above.

## Chart details

This chart will do the following:

* Convert all files in `configs/` folder into a configmap
* Expand `{{ template "tsung.clients" $ }}` template in configmap to reflect number of Tsung slave replicas
* If an existing configmap is specified, it will be used instead of building one from the chart
* Create a Tsung master and Tsung slave statefulsets using config file specified in configmap.

Modify the config XML files in `configs` directory to specify target server hostname, session details and load progression information.

### Installing the chart

To install the chart with the release name `tsung-nymph` in the default namespace:

```bash
# Navigate to repository root.

helm install -n tsung-nymph ./
```

Specify parameters using `--set key=value[,key=value]` argument to `helm install`

Alternatively a YAML file that specifies the values for the parameters can be provided like this:

```bash
$ helm install --name my-release -f values.yaml ./
```

#### Creating configmap with your Tsung config files

You're probably developing your own Tsung scripts that you want to run in this distributed setup.
To get those config XMLs into this deployment you can fork the chart and put them into the `configs` folder. From there
they will be converted to a configmap and mounted for use in Tsung.

Another solution, if you don't want to fork the Chart, is to put your Tsung configs in a configmap and provide the name
as a config parameter in `values.yaml`. You can read more on the use of configmaps as volumes in pods [here](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/).


### Acknowledgements
This helm chart is a wrapper around [Running Tsung in Kubernetes](https://github.com/kubeup/tsung-in-kubernetes) setup.
