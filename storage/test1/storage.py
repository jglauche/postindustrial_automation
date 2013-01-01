#! /usr/bin/python
# -*- coding: utf-8 -*-
import sys, os, math

# note about developing: execute this in shell and set automatic reload in openscad.
# while inotifywait -e close_write storage.py; do python storage.py > storage.scad; done


# Make sure we have access to pyopenscad
superdir = os.path.dirname("../../SolidPython")
sys.path.append( superdir)

from solid import *

use("../../libs/tslot.scad")



def storage_subunit(length,spacing):	
	r = tslot20(length,0)
	r += translate([spacing,0,0])(tslot20(length,0)) 
	
	return color("blue")(translate([20,0,0])(r))	


def storage_unit(x,y,length,spacing, height):
	r = cube([0,0,0])	
	for f in range(y):	
		for i in range(x):
			r += translate([i*(spacing+40),0,0])(storage_subunit(length,spacing))
			r += translate([spacing+40+i*(spacing+40),0,0])(rotate([90,0,0])(tslot20(400,0)))

	
	return r
	
#	r = rotate([90,0,0])(tslot20(400,0))
#	return color("red")(r)
	

#res = storage_subunit(400,50)
res = storage_unit(3,3,400,50,60)


 
print scad_render(res)
