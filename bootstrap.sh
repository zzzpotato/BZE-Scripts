#!/bin/bash

## Create Bootstrap

## Prereq (Uncomment if needed)
#sudo apt-get install zip

## Move to home dir
cd ~

## Create bootstraps history dir
if [ ! -d bootstraps ]
    then
        mkdir bootstraps
fi
cd bootstraps
if [ ! -d history ]
    then
        mkdir history
fi
cd history

## Check if bootstrap exists
if [ -f bzedge_bootstrap_$(date +%d-%m-%Y).zip ]
    then
        rm bzedge_bootstrap_$(date +%d-%m-%Y).zip
fi
cd ~

## Check if old bootstrap dir exists
if [ -d bootstrap ]
    then
        rm -rfv ./bootstrap
fi

cd ~

## Recreate bootstrap dir
mkdir bootstrap
cd bootstrap

cp -r ~/.bzedge/blocks .
cp -r ~/.bzedge/chainstate .

cd ~

## Zip
zip -r bzedge_bootstrap_$(date +%d-%m-%Y).zip bootstrap

## Copy to bootstraps dir
cp bzedge_bootstrap_$(date +%d-%m-%Y).zip ./bootstraps/history/
mv bzedge_bootstrap_$(date +%d-%m-%Y).zip ./bootstraps/bootstrap_txindex_latest.zip

## Clean up
rm -rfv ./bootstrap
