#!/bin/bash
set -e

# Compute version from git
VERSION=$(git describe --tags 2>/dev/null || echo "0.1.0-$(git rev-parse --short HEAD)")

# Remove 'v' prefix if present
VERSION=${VERSION#v}

echo "Updating chart version to: $VERSION"

# Substitute version in Chart.yaml
sed -i "s/^version:.*/version: ${VERSION}/" vre/Chart.yaml

# Show the updated version
echo "Updated Chart.yaml version:"
grep "^version:" vre/Chart.yaml

# Add the modified file to the commit
git add vre/Chart.yaml

exit 0
