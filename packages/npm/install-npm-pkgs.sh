#!/bin/sh

. lib/compiler-pkgs.sh
. lib/linter-pkgs.sh

npm install -g $COMPILER_ALL;
npm install -g $LINT_ALL;
