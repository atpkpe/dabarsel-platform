#!/bin/bash

DIR_PKG=$1
DIR_ADDITIONAL_CONTENT=$2
PATH_TO_BUILD=$3
ENVIRONMENT=$4
INCLUDE_ADDITIONALS=$5
DIR_TMP="tmp"
DIR_BUILDS="${DIR_TMP}/builds"
UIDGID_DEPLOY="8001:8001"
UIDGID_APACHE="48:48"

BUILD_TARGET=${DIR_BUILDS}/$(basename $PATH_TO_BUILD)
BUILD_NUMBER=$(echo $PATH_TO_BUILD | sed 's/[^0-9]\+\([0-9]\+\)$/\1/')
TAR_BALL="atp.${ENVIRONMENT}.${BUILD_NUMBER}.tar.gz"

mkdir $DIR_PKG
mkdir $DIR_TMP

if [ -d "$PATH_TO_BUILD" ]; then
  mkdir -p ${DIR_BUILDS}/ && cp -rp $PATH_TO_BUILD ${DIR_BUILDS}/
  if [ -f "${BUILD_TARGET}/settings/${ENVIRONMENT}.settings.php" ] && pushd "${BUILD_TARGET}/htdocs/sites/default"; then
    ln -s ../../../settings/${ENVIRONMENT}.settings.php settings.php
    popd
  fi
  if [ -d "${DIR_BUILDS}" ]; then
    pushd ${DIR_TMP} && sudo chown -R 8001:8001 builds && tar -czf builds.tar.gz builds
    popd
    mv ${DIR_TMP}/builds.tar.gz $DIR_PKG/
#    sudo rm -rf $DIR_TMP
  fi
fi

if [ "$INCLUDE_ADDITIONALS" == "true" ] && [ -d "$DIR_ADDITIONAL_CONTENT/assets" ]; then
  rsync -avz $DIR_ADDITIONAL_CONTENT/assets/ ${DIR_TMP}/assets/ &&
  pushd ${DIR_TMP} &&
  sudo chown $UIDGID_DEPLOY assets &&
  sudo chown -R $UIDGID_APACHE assets/files &&
  tar -czf assets.tar.gz assets
  popd
  mv ${DIR_TMP}/assets.tar.gz $DIR_PKG/
 # sudo rm -rf $DIR_TMP
fi

SQL_FILE=$(find $DIR_ADDITIONAL_CONTENT -type f \( -name "*.sql" \) )
if [ "$INCLUDE_ADDITIONALS" == "true" ] && [ -f ${SQL_FILE} ]; then
  cp $SQL_FILE ${DIR_TMP}/ &&
  pushd ${DIR_TMP} &&
  sudo chown $UIDGID_DEPLOY *.sql &&
  tar -czf db.sql.tar.gz *.sql
  popd
  mv ${DIR_TMP}/db.sql.tar.gz $DIR_PKG/
 # sudo rm -rf $DIR_TMP
fi

sudo chown $UIDGID_DEPLOY $DIR_PKG && tar -czf $TAR_BALL $DIR_PKG
sudo chown -R jenkins:jenkins $DIR_PKG $DIR_TMP && find . -not -name "$TAR_BALL" -exec rm -rf {} \;

