#!/bin/bash

conda activate scistree2

/home/haz19024/miniconda3/envs/scistree2/bin/jupyter-book build .

cd ../scistree2doc
cp -r ../docs .
git add .
git commit -m "update docs"
git push origin main
