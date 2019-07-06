#!/bin/bash

# you can run this using
# wget -qO- https://raw.github.com/tenfourty/ansible-workstation/master/bootstrap.sh | bash

# exit if a command fails
set -e

echo "Installing ansible and git"

dnf install -y ansible

echo "Running ansible-pull to configure the workstation"

ansible-pull -i localhost -U https://github.com/tenfourty/ansible-workstation.git
