# Sample Resources for Container Migration

This directory contains sample Kubernetes applications for testing and developing container migration functionality with kubectl-migrate.

## Available Applications

| Application | Type | Description |
|------------|------|-------------|
| hello-world | Stateless | Apache HTTPD web server with static "Hello World" page |
| wordpress | Stateful | Multi-tier WordPress application with MySQL database and persistent storage |

## Prerequisites

- Kubernetes cluster (local or remote)
- `kubectl` configured to communicate with your cluster
- Proper permissions to create/delete resources in your cluster

## Quick Start

### Deploy All Applications

To deploy all sample applications to your Kubernetes cluster:

```bash
make resources-deploy
```

This will execute all `deploy.sh` scripts in the subdirectories.

### Validate All Applications
```
$ make resources-validate
```

This will execute all `validate.sh` scripts in the subdirectories. That typically sets up port-forwarding and runs HTTP requests on the deployed applications.

### Destroy All Applications

To remove all sample applications from your Kubernetes cluster:

```bash
make resources-destroy
```

This will execute all `destroy.sh` scripts in the subdirectories.

## Individual Application Management

Each application subdirectory contains:
- `manifest.yaml` or `*.yaml` - Kubernetes resource definitions, could use `kustomize`
- `deploy.sh` - Script to deploy the application and wait until resources are available
- `destroy.sh` - Script to remove the application
- `validate.sh` - Script to validate the application is running correctly
- `README.md` - Application-specific documentation

The `deploy.sh` scripts use `kubectl wait` to ensure deployments are ready before returning, eliminating the need for sleep commands or manual waiting.

To manage applications individually, navigate to the specific application directory and run:

```bash
cd <application-directory>
./deploy.sh    # Deploy the application
./validate.sh  # Validate the application is running correctly
./destroy.sh   # Remove the application
```

### Validation Scripts

Each application includes a `validate.sh` script that:
- Sets up port-forwarding to the application service
- Performs HTTP requests to verify the application responds correctly
- Checks for expected content in the response
- Cleans up port-forwarding automatically

## Adding New Sample Applications

When adding new sample applications to this directory:

1. Create a new subdirectory with a descriptive name
2. Include `yaml` files, `deploy.sh`, `destroy.sh`, `validate.sh`, and `README.md`
3. Make scripts executable: `chmod +x deploy.sh destroy.sh validate.sh`
4. Update the applications table in this README
5. The Makefile will automatically pick up new deploy/destroy scripts

## Usage with kubectl-migrate

These sample applications are designed to test various migration scenarios:

- Stateless applications
- Stateful applications with persistent storage
- Applications with complex networking requirements
- Multi-tier applications

Use these applications to verify migration functionality, test backup/restore operations, and validate cross-cluster migrations.
