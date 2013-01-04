#! /usr/bin/python
# -*- coding: utf-8 -*-
import sys, os, math

# note about developing: execute this in shell and set automatic reload in openscad.
# while inotifywait -e close_write tilt_shelf_test.py; do python tilt_shelf_test.py > tilt_shelf_test.scad; done


# Make sure we have access to pyopenscad
superdir = os.path.dirname("../../SolidPython")
sys.path.append( superdir)

from solid import *

use("../../libs/tslot.scad")
    
def container(length):
    r=cube([32,length,40])
    r+=translate([-9,0,3])(cube([50,length,2]))
    r-=translate([1.5,2.5,3])(cube([29,length-5,41]))
    return color("lime")(r)

length=100;
res = cube([60,length,25])
res-= translate([5,0,5])(cube([50,length,20]))

for i in range(0,length/25):
    res-= translate([-1,12.5+25*i,17.5])(rotate([0,90,0])(cylinder(r=4.1,h=100)) )
    res+= color("silver")(translate([6,12.5+25*i,17.5])(rotate([0,90,0])(cylinder(r=11,h=7)) ))
    res+= color("silver")(translate([47,12.5+25*i,17.5])(rotate([0,90,0])(cylinder(r=11,h=7)) ))


res += translate([14,0,26])(container(60))

print scad_render(res)
#print scad_render(rotate([90,0,0])(container(60)))
