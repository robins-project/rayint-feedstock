#!/bin/sh
ln -s $PREFIX/lib/libmve.a elibs/mve/libs/mve
ln -s $PREFIX/lib/libmve_dmrecon.a elibs/mve/libs/dmrecon
ln -s $PREFIX/lib/libmve_fssr.a elibs/mve/libs/fssr
ln -s $PREFIX/lib/libmve_ogl.a elibs/mve/libs/ogl
ln -s $PREFIX/lib/libmve_sfm.a elibs/mve/libs/sfm
ln -s $PREFIX/lib/libmve_util.a elibs/mve/libs/util

mkdir build && cd build

cmake -G "Ninja"                            \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}        \
    -DCMAKE_PREFIX_PATH=${PREFIX}           \
    -DCMAKE_BUILD_TYPE=Release              \
    ..

ninja

# install
cp apps/raycast/raycast $PREFIX/bin
