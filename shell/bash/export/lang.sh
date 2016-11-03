#!/bin/bash

# Python
export PYTHONPATH="$PYTHONPATH:/usr/bin:/usr/local/bin";

# Java
# TODO Update this after installing a Java Dev Toolkit (JDK)
export JAVA_HOME="$JAVA_HOME";

if [ -n "$JAVA_HOME" ] && [ -d "$JAVA_HOME" ];
then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$JAVA_HOME/lib";
    export CLASSPATH="$CLASSPATH:$LD_LIBRARY_PATH";
fi;

# GO
export GOROOT="$GOROOT";
[ -d "$HOME/.go" ] && export GOHOME="$HOME/.go";
export GOPATH="$GOHOME:$GOROOT:$GOPATH";

# Rust
[ -d "$HOME"/.cargo ] && export CARGO_HOME="$HOME/.cargo";


# Add bin/ sub-directory to PATH
add_bin_to_path "$JAVA_HOME" "$CARGO_HOME" "$GOHOME" "$GOROOT";
