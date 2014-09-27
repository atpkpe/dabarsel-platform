#!/bin/bash

PKG_NAME=$1
BUILD_SRC="build/${2}"

if [ -d "$BUILD_SRC" ]; then
  mkdir -p ${PKG_NAME}/builds
  cp -rp $BUILD_SRC ${PKG_NAME}/builds/
fi
