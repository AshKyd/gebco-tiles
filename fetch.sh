#!/bin/bash
rm -rf data
cd data
# The server is kinda slow, this lets us use 16 connections
aria2c -x 16 https://www.bodc.ac.uk/data/open_download/gebco/gebco_2023/geotiff/
unzip *.zip
rm -rf *.zip
