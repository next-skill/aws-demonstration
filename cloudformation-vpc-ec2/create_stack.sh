#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly TEMPLATE_FILE="${SCRIPT_DIR}/template.yaml"

readonly STACK_NAME="$1"

aws --region=ap-northeast-1 \
  cloudformation \
  create-stack \
  --stack-name "${STACK_NAME}" \
  --template-body "file://${TEMPLATE_FILE}" \
  --parameters ParameterKey=NamePrefix,ParameterValue="${STACK_NAME}"
