#!/bin/bash

read -p 'Version: ' version

[ -d "./fabric-loader" ] && rm -rf fabric-loader

git clone https://github.com/FabricMC/fabric-loader

cd fabric-loader && git pull

git am ../patches/*.patch

sed -i "s/0.0.1/${version}/" gradle.properties

./gradlew build

mkdir -p ../maven/nl/vloedje/vloedje-fabric/$version

mv build/libs/vloedje-fabric-$version.jar ../maven/nl/vloedje/vloedje-fabric/$version/

echo Build version $version successful!
