rm -rf export
mkdir -p export

echo "*" > export/.gitignore

rm -rf run/*
rm -rf logs/*

touch run/.gitkeep
touch logs/.gitkeep

cp -r {bin,config,lib,logs,run} export/
