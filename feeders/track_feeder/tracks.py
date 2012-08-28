#! /usr/bin/python
# -*- coding: utf-8 -*-
import sys, os, math

# Make sure we have access to pyopenscad
superdir = os.path.dirname("../../SolidPython/")
sys.path.append( superdir)

from pyopenscad import *


use("configuration.scad")
use("track.scad")
use("../../libs/publicDomainGearV1.1.scad")
mm_per_tooth = 5*3.14159;

#d = track_piece()
def rotate_origin(origin, rotation, obj):  
    def inverse(x): return -x
       
    d = translate(origin)(
        rotate(rotation)(
            translate(map(inverse,origin))(
                obj
            )
        
        )
    )
    return(d)

origin = [6,18,3]
l = 47
a = [0,-52,-104,-151,-180,-180,151,104,52,0,0]
x = 0   
y = 0  

d = cylinder(r=0) 
for i in a:
    d += translate([x,0,y])(rotate_origin(origin,[0,i,0],track_piece()))
    if i == 0:
        x+= l
    else:   
       x += math.sin(math.radians(90-i))*l    
       y += math.sin(math.radians(i*-1))*l
  
g = gear(mm_per_tooth=mm_per_tooth,thickness=10,number_of_teeth=15,hole_diameter=7)
g = translate([25,20,52])(rotate([90,0,0])(rotate([0,0,17])(g)))


print scad_render(d)
print scad_render(g)



