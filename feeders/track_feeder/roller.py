#! /usr/bin/python
# -*- coding: utf-8 -*-
import sys, os, math

# note about developing: execute this in shell and set automatic reload in openscad.
# while inotifywait -e close_write roller.py; do ./roller.py > roller.scad; done


# Make sure we have access to pyopenscad
superdir = os.path.dirname("../../SolidPython/")
sys.path.append( superdir)

from pyopenscad import *


use("configuration.scad")
use("track.scad")
use("../../scadlib/fasteners.scad")
 

def bearing_608():
    b = cylinder(r=11, h=7)
    b-= translate([0,0,-0.1])(cylinder(r=4,h=7.2))
    return color("DarkGray")(b)



sim = color("Bisque")(track_piece());
#sim+= translate([15,-1,14])(rotate([-45,0,0])(bearing_608()))
#sim+= translate([15,41,17])(rotate([45,0,0])(bearing_608()))


#roller = translate([10,-6,32])(rotate([-45,0,0])(cube([30,20,7])))
#roller-= translate([25,-5,18])(rotate([-45,0,0])(bolt(8,40)))
#roller+= translate([25,-6,30])(rotate([-45,0,0])(cylinder(r=13.5/2, h=4,segments    =6)))

#roller+=translate([0,20+11,53.5])(mirror([0,0,1])(roller))

#sim+=bolt(8,40); 
h=7
roller_side = cube([30,22,h]) 
roller_side-= translate([15,10,-0.1])(cylinder(r=4.2, h=h+0.2))
roller_side-= translate([15,10,3])(rotate([0,0,30])(cylinder(r=6.5+0.3, h=4.1, segments=6)))

roller_side=rotate([45,0,0])(roller_side)

roller=translate([0,25,0])(roller_side)
roller+=mirror([0,1,0])(roller_side)

roller=rotate([0,-90,0])(roller)

roller+=translate([-10,0,0])(cube([10,25,3]))
roller+=translate([-15,-5,0])(cube([10,35,3]))
roller+=translate([-25,-5,0])(cube([15,35,3]))
roller-= translate([-15,12.5,-0.1])(cylinder(r=2.8,h=4,segments=24))

#print scad_render(translate([0,-5,-15])(sim))
print scad_render(roller)


