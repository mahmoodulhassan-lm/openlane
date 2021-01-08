OPENLANE_DIR=$1

cd $OPENLANE_DIR/docker_build/docker/openroad_app/OpenROAD
git submodule update --init --recursive
cd ..
cp rails.patch OpenROAD/
cp pdngen_export_subst.patch OpenROAD/
cp ignore_obs_outside.patch OpenROAD/
cp setup_local.patch OpenROAD/src/OpenDB/src/swig/python
cp opendp-diamond-search.patch OpenROAD/

cd OpenROAD
git apply rails.patch
git apply pdngen_export_subst.patch
git apply ignore_obs_outside.patch
git apply opendp-diamond-search.patch
cd src/OpenDB/src/swig/python
git apply setup_local.patch

echo "Done preparing OpenROAD"
