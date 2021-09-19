#This code takes in a text file stripped of non-numerical characters
#and graphs it. This is more of a graphical representation for text files
#that are meant to be used in an Arduino LED array where 255 is LED on, and 0 is LED off.

#Thus in this code only 255 will be colored in black signifying an on sequence.

#Performance issues: More 255 means more rectangles, and that's expensive

library(animation)

#offset of rectangles in x and y
dx = 23*((16 - 1)/16)/40
dy = 23*((8 - 1)/8)/40

#FPS of video data set
fps = 30;
ani.options(interval = 1/fps);

#Notation of b is in (y,x)
b = read.table(file = "battxt.txt", strip.white = TRUE)

totalFrames = floor(dim(b)[1]/d.y);
d.y = (dim(b)[2]/4)*3; #Dimension of y - assumes the data set takes a 4:3 AR

ani.record(reset = TRUE);#Clears queue
dev.control('enable');


saveVideo({
  for (i in (1:totalFrames)) {
    yStart = (i * d.y) - (d.y - 1);#Finds next frame and starts at the top of the frame
    frame(); #Creates a new plot
    plot.window(c(1, dim(b)[2]), c(1, d.y));
    par(bg = "white");
    while(yStart <= i * d.y){ #Cuz R indexes at 1
      xStart = 1;
      while(xStart <= dim(b)[2]){
        
        if(b[yStart,xStart] != 0){#Creates a black rect at every 255 spot
          rect(xStart - dx, d.y - yStart %% (d.y + 1) - dy,xStart + dx,d.y - yStart %% (d.y + 1) + dy, col = "black")
        }#Since we start at top of frame, y position is subtracted since graphs don't start from the top.
        
        xStart = xStart + 1;
      }
      yStart = yStart + 1;
    }
    print(i);#In case you think the code is hanging.

  }
})


