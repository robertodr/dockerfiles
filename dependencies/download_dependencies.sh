#!/usr/bin/env bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail

cd $HOME/Downloads

echo "-- Downloading PGI 17.4"
if [[ -f $HOME/Downloads/pgilinux.tar.gz ]]; then
  echo "-- PGI 17.4 FOUND in cache"
else
  echo "-- PGI 17.4 NOT FOUND in cache"
  curl -LO $PGI_URL
  mv pgilinux-2017-174-x86_64.tar.gz pgilinux.tar.gz
fi
echo "-- Done with PGI 17.4"

echo "-- Downloading MKL"
if [[ -f $HOME/Downloads/mkl.tar.gz ]]; then
  echo "-- MKL FOUND in cache"
else
  echo "-- MKL NOT FOUND in cache"
  curl -LO $MKL_URL
  mv l_mkl_2017.4.239.tgz mkl.tar.gz
fi
echo "-- Done with MKL"

echo "-- Downloading Intel"
if [[ -f $HOME/Downloads/parallel_studio.tar.gz ]]; then
  echo "-- Intel FOUND in cache"
else
  echo "-- Intel NOT FOUND in cache"
  curl -LO $INTEL_URL
  mv parallel_studio_xe_2018_update2_professional_edition.tgz parallel_studio.tar.gz
fi
echo "-- Done with Intel"

HDF5_VERSION="1.10.1"
echo "-- Downloading HDF5 $HDF5_VERSION"
HDF5_URL="https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VERSION%.*}/hdf5-$HDF5_VERSION/src/hdf5-$HDF5_VERSION.tar.bz2"
if [[ -f $HOME/Downloads/hdf5-$HDF5_VERSION.tar.bz2 ]]; then
  echo "-- HDF5 $HDF5_VERSION FOUND in cache"
else
  echo "-- HDF5 $HDF5_VERSION NOT FOUND in cache"
  curl -LO $HDF5_URL
fi
echo "-- Done with HDF5 $HDF5_VERSION"

cd $TRAVIS_BUILD_DIR
