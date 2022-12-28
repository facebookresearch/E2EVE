# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.

# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
# --------------------------------------------------------


mkdir ../E2EVE_meta/
mkdir ../E2EVE_output/
mkdir ../E2EVE_output/logs/

wget -P ../E2EVE_meta/ https://www.robots.ox.ac.uk/~abrown/E2EVE/resources/FFHQ_meta.zip
wget -P ../E2EVE_meta/ https://www.robots.ox.ac.uk/~abrown/E2EVE/resources/LSUN_meta.zip

unzip ../E2EVE_meta/FFHQ_meta.zip -d ../E2EVE_meta/
unzip ../E2EVE_meta/LSUN_meta.zip -d ../E2EVE_meta/
mv ../E2EVE_meta/FFHQ_meta/vgg.pth ../E2EVE_meta/
mv ../E2EVE_meta/FFHQ_meta/pt_inception-2015-12-05-6726825d.pth ../E2EVE_meta/

rm ../E2EVE_meta/FFHQ_meta.zip
