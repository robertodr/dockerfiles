#!/usr/bin/env bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail

echo "-- Downloading PGI 17.4"
if [[ -f $HOME/Downloads/pgilinux/install_components/linux86-64.examples.tar.gz ]]; then
  echo "-- PGI 17.4 FOUND in cache"
else
  echo "-- PGI 17.4 NOT FOUND in cache"
  cd $HOME/Downloads
  mkdir -p pgilinux
  curl -L $PGI_URL | tar -xz -C pgilinux
  cd $TRAVIS_BUILD_DIR
fi
echo "-- Done with PGI 17.4"

echo "-- Downloading MKL"
if [[ -f $HOME/Downloads/mkl/ipsxe_support_mkl.txt ]]; then
  echo "-- MKL FOUND in cache"
else
  echo "-- MKL NOT FOUND in cache"
  cd $HOME/Downloads
  mkdir -p mkl
  curl -L $MKL_URL | tar -xz -C mkl --strip-components=1
  cd $TRAVIS_BUILD_DIR
fi
echo "-- Done with MKL"

echo "-- Downloading Intel"
if [[ -f $HOME/Downloads/parallel_studio/ipsxe_support_prof.txt ]]; then
  echo "-- Intel FOUND in cache"
else
  echo "-- Intel NOT FOUND in cache"
  cd $HOME/Downloads
  mkdir -p parallel_studio
  curl -L $INTEL_URL | tar -xz -C parallel_studio --strip-components=1
  cd $TRAVIS_BUILD_DIR
fi
echo "-- Done with Intel"

HDF5_VERSION="1.10.1"
echo "-- Downloading HDF5 $HDF5_VERSION"
HDF5_URL="https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VERSION%.*}/hdf5-$HDF5_VERSION/src/hdf5-$HDF5_VERSION.tar.bz2"
if [[ -f $HOME/Downloads/hdf5-1.10.1/COPYING_LBNL_HDF5 ]]; then
  echo "-- HDF5 $HDF5_VERSION FOUND in cache"
else
  echo "-- HDF5 $HDF5_VERSION NOT FOUND in cache"
  cd $HOME/Downloads
  mkdir -p hdf5-1.10.1
  curl -L $HDF5_URL | tar -xj -C hdf5-1.10.1 --strip-components=1
  cd $TRAVIS_BUILD_DIR
fi
echo "-- Done with HDF5 $HDF5_VERSION"
