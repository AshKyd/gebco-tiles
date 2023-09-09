#!/bin/bash
rm -rf dist
mkdir dist
cd data
# magick montage \
#  gebco_2023_n90.0_s0.0_w-180.0_e-90.0.tif\
#  gebco_2023_n90.0_s0.0_w-90.0_e0.0.tif\
#  gebco_2023_n90.0_s0.0_w0.0_e90.0.tif\
#   gebco_2023_n90.0_s0.0_w90.0_e180.0.tif\
#  gebco_2023_n0.0_s-90.0_w-180.0_e-90.0.tif\
#  gebco_2023_n0.0_s-90.0_w-90.0_e0.0.tif\
#   gebco_2023_n0.0_s-90.0_w0.0_e90.0.tif\
#   gebco_2023_n0.0_s-90.0_w90.0_e180.0.tif\
#   -geometry +0+0 -resize 8000x8000 8k.pgm

# convert 8k.pgm -format webp -colors 255 -depth 8 -define webp:method=6 webp:sns-strength=100 webp:thread-level=1 webp:pass=10 webp:target-size=500000 ../dist/world-equirectangular.webp

# convert 8k.pgm -level 40% -resize 2000x2000 -set colorspace Gray -quality 60 -interlace JPEG -strip ../dist/world-equirectangular-2k.jpg
# convert 8k.pgm -level 40% -resize 4000x4000 -set colorspace Gray -quality 40 -interlace JPEG -strip ../dist/world-equirectangular-4k.jpg

for f in *.tif
do
    convert "$f" -level 40%,95% -quality 90 -interlace JPEG -strip "../dist/$f.jpg"
done


# square_dim="$(identify -format "%[fx:max(w,h)]x%[fx:max(w,h)]+0+0" "${input_image}")"
# square_image="${output_directory}/square.png"
# convert "${input_image}" \
#     -gravity center \
#     -background none \
#     -extent "${square_dim}" \
#     +repage \
#     "${square_image}"