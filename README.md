# LED Array Renderer
This R code uses the text file generated from https://github.com/joema-net-projects/ledvideoconverter
and renders a video of it.

Let's just say that this is my R practice for the time being. I'm going back to Matlab after this.

# Off by one error
I found this issue a few hours later and fixed it, but it provided a pretty cool comparison.
So here's that: https://youtu.be/w7NvJQGbPNI

# Fun Parameter Changes
Changing both dx and dy to a value closer to 0.5 results in gridlines

# Included files:
* battxt.txt - Generated video data from https://github.com/joema-net-projects/ledvideoconverter 
    * Generated using Bad Apple and resized to 48 x 32 
    * It's inside the zip file with the same name
* animation.mp4 - Rendered video via R

# Sample Frame:
![ba1](https://raw.githubusercontent.com/joema-net-projects/r-ledarrayrender/main/ba1.PNG)
