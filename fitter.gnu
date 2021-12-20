f1(x) = a1*(x-x1)+b1+(c1*c1)*exp(-(x-x1)*(x-x1)/d1/d1/2.0)

set datafile separator ","

plot [r1:r2] filename using 1:4 w l 

c1=sqrt(.02)
b1=(GPVAL_DATA_Y_MAX+GPVAL_DATA_Y_MIN)/2

plot [r1:r2] filename using 1:4, filename using 1:(f1($1)) w l

fit [r1:r2] f1(x) filename using 1:4 via x1, d1, c1, a1, b1

replot