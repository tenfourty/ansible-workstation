#!/bin/bash

# you can run this using
# wget -qO- https://raw.github.com/tenfourty/ansible-workstation/master/bootstrap.sh | bash

# exit if a command fails
set -e

echo "Installing ansible"

dnf install -y ansible

echo "Running ansible-pull to configure the workstation"

ansible-pull -U https://github.com/tenfourty/ansible-workstation.git
