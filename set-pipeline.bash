#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "${DIR}/shared/helpers/fly-functions.bash"
export -f fly_login
export -f fly_pipeline

export FLY_TARGET=runtime

main() {
  local repo=${1:?Provide a repo e.g. shared,cf-networking-release}
    exit 1
  fi
  "$DIR/$repo/bin/set-repo-pipeline.bash"
}

main "$@"
