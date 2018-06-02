library(gsw)
library(testthat)
library(oce)
library(rgdal)
library(Matrix)

data(coastlineWorld)

par(mar=c(1,1,1,1))
mapPlot(coastlineWorld, col=c('yellow','red2','violet','green3','royalblue','cyan'), 
        proj='+proj=bonne +lat_1=50 +lon_0=0',
        xlim=c(-13700000, 13700000),
        ylim=c(-15079625, 10008557))
mapGrid(longitude = c(-180, 180), latitude=c(-90, 90),col='gray50')

