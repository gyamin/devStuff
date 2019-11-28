#!/bin/bash

# ===============================================
# gitリポジトリのlocal設定に、emailを一括設定するスクリプト
# ===============================================

email=5550621+gyamin@users.noreply.github.com
repos=~/Develop/outRepos

dirs=$(ls ${repos})

for dir in ${dirs[@]}; do
    target="${repos}/${dir}"
    cd ${target}
    git config --local user.email ${email}
    if [ $? != 0 ]; then
        echo "failed to set email at ${target}" 
    fi
done
