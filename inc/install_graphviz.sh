#!/bin/bash
# TODO; I still need to install it!!!!
# File: inc/install_grahphviz.sh
# Info: Install Graphviz, GD, Imagemagick, Graphicsmagick and other stuff to make graphics with.
# TODO: This module should be part of the math suite with Octave and TeXLive
# TODO: 

# When do we want to use Imagemagick?
#   ImageMagick is ideal for interactive tasks
#   ImageMagick has a Node.js package but it's about 5 years old.
#   See https://www.npmjs.com/package/imagemagick
#     npm install imagemagick
#   See also https://www.imagemagick.org/script/index.php
#   See also https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
# When do we want to use Graphicsmagick?
#   GraphicsMagick is ideal for scripts and server-side stuff.
#   GraphicsMagick has a Node.js package.
#   See https://www.npmjs.com/package/gm 
#     npm install gm

# Despite the schism between IM and GM, GM requires IM. So install both at the same time!

install_magick(){
  sudo apt-get install imagemagick graphicsmagick 
}

# Ghostscript interprets for the PostScript language and for PDF
# ghostscript -> gs
# gv is a PostScript and PDF viewer for X
install_ghostscript(){
  sudo apt-get install ghostscript ghostscript-x gsfonts gsfonts-x11 gsfonts-other libgs-dev libgs9 libgs9-common gv
}

# wiregraph - wireshark plugin extension for graphiviz

install_graphviz(){
  sudo apt-get install graphviz fonts-liberation libcdt5 libcgraph6 libgvc6 libgvpr2 libpathplan4
}
