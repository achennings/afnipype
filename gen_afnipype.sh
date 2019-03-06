#!/bin/sh

set -e

generate_docker() {
  docker run --rm kaczmarj/neurodocker:master generate docker \
    --base=debian:stretch --pkg-manager=apt \
    --install vim python \
    --user=root \
    --afni version=latest method=binaries \
    --user=neuro \
    --miniconda \
          conda_install='python=3.6 matplotlib numpy pandas scikit-learn nilearn scipy seaborn traits' \
          pip_install='nibabel nipype' \
          create_env="neuro_py36" \
          activate=true
}

generate_singularity() {
  docker run --rm kaczmarj/neurodocker:master generate singularity \
    --base=debian:stretch --pkg-manager=apt \
    --install vim python \
    --user=root \
    --afni version=latest method=binaries \
    --user=neuro \
    --miniconda \
          conda_install='python=3.6 matplotlib numpy pandas scikit-learn nilearn scipy seaborn traits' \
          pip_install='nibabel nipype' \
          create_env="neuro_py36" \
          activate=true
}

generate_singularity > Singularity
generate_docker > Dockerfile
