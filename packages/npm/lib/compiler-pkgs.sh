#!/bin/sh

MINIFY_JS="uglify-js";
MINIFY_CSS="cssnano-cli";
MINIFY_HTML="html-minifier";
MINIFY_ALL="$MINIFY_JS $MINIFY_CSS $MINIFY_HTML";

# Put them all together
COMPILE_SASS="node-sass";
COMPILE_ALL="$COMPILE_SASS $MINIFY_ALL";
