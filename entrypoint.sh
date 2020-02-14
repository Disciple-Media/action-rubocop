#!/bin/sh

cd "$GITHUB_WORKSPACE"

gem install ${INPUT_GEM_INSTALL_ARGS}
rubocop --verbose-version

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

rubocop ${INPUT_RUBOCOP_FLAGS} \
  | reviewdog -f=rubocop -name="${INPUT_TOOL_NAME}" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
