#!/usr/bin/env bash

set -eux

export timestamp="$(date '+%Y%m%d.%-H%M.%S+%Z')"


wget https://github.com/pivotal-cf/om/releases/download/4.8.0/om-linux-4.8.0
chmod +x om-linux-4.8.0
sudo mv om-linux-4.8.0 /usr/local/bin/om

wget https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.7.2/bbr-1.7.2-linux-amd64
chmod +x bbr-1.7.2-linux-amd64
sudo mv bbr-1.7.2-linux-amd64 /usr/local/bin/bbr

#cat deployed_products.json
## install jq
sudo apt-get install jq -y



