.PHONY: resources-deploy resources-destroy help

# Deploy all sample applications
resources-deploy:
	@echo "Deploying all sample applications..."
	@for dir in sample-resources/*/; do \
		if [ -f "$$dir/deploy.sh" ]; then \
			echo "Deploying $$dir..."; \
			cd "$$dir" && ./deploy.sh && cd ../..; \
		fi \
	done
	@echo "All applications deployed successfully!"

# Destroy all sample applications
resources-destroy:
	@echo "Destroying all sample applications..."
	@for dir in sample-resources/*/; do \
		if [ -f "$$dir/destroy.sh" ]; then \
			echo "Destroying $$dir..."; \
			cd "$$dir" && ./destroy.sh && cd ../..; \
		fi \
	done
	@echo "All applications destroyed successfully!"

# Show help
help:
	@echo "Available targets:"
	@echo "  resources-deploy   - Deploy all sample applications to Kubernetes cluster"
	@echo "  resources-destroy  - Remove all sample applications from Kubernetes cluster"
	@echo "  help               - Show this help message"
