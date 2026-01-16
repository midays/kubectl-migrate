# kubectl-migrate

A kubectl plugin for migrating Kubernetes workloads and their state between clusters. This plugin integrates features from the [crane](https://github.com/migtools/crane) migration tool, provides them through the familiar kubectl migrate command interface, and aims to go beyond that.

## Development setup

Standard Go development tools are expected to be installed and the **kubectl** Kubernetes command-line tool for interacting with clusters.

### Setup local k8s environment

A k8s cluster is needed. You can use one of the following options:

- **[kind](https://kind.sigs.k8s.io/)** - Simple Docker/Podman setup (recommended)
  - Quick setup: `./hack/setup-kind.sh`
  - Supports both Docker and Podman

- **[minikube](https://minikube.sigs.k8s.io/docs/)** - Preferred for local VM setup
  - Quick setup: `./hack/setup-minikube.sh`
  - Uses KVM2 driver on Linux

Or use any other Kubernetes distribution of your choice.

### Create sample resources

Check [sample-resources README](sample-resources) for sample application resources, or deploy all to the current cluster context with the following command:

```
$ make resources-deploy
```

Similarly destroy sample workloads:

```
$ make resources-destroy
```

### Switch kubectl contexts

When testing migrations, you'll typically work with multiple clusters (source and destination). Here's how to manage your kubectl contexts:

**List all available contexts:**
```bash
$ kubectl config get-contexts
```

**Switch to a specific context:**
```bash
$ kubectl config use-context kind-kind # or minikube
```

**View current context:**
```bash
$ kubectl config current-context
```

**Execute commands against a specific context without switching:**
```bash
$ kubectl --context=kind-kind get pods
$ kubectl --context=minikube get pods
```

This is particularly useful for migration testing where you need to verify resources on both source and destination clusters.


## Code of Conduct
Refer to Konveyor's Code of Conduct [here](https://github.com/konveyor/community/blob/main/CODE_OF_CONDUCT.md).
