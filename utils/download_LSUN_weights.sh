# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.

# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
# --------------------------------------------------------


mkdir ../weights
mkdir ../weights/LSUN_Bedroom

wget -P ../weights/LSUN_Bedroom/ https://www.robots.ox.ac.uk/~abrown/E2EVE/resources/E2EVE_LSUN_Bedroom_transformer.pth
wget -P ../weights/LSUN_Bedroom/ https://www.robots.ox.ac.uk/~abrown/E2EVE/resources/LSUN_VQGAN_EdiBERT.ckpt
