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
use("../../libs/standard.scad")
use("../../libs/publicDomainGearV1.1.scad")
 
def container(length):
    r=cube([32,length,40])
    r+=translate([-9,0,20])(cube([50,length,2]))
    r-=translate([1.5,2.5,3])(cube([29,length-5,41]))
    return color("lime")(r)


#res = rotate([90,0,0])(container(80))

def tslot_spacer(spacing):
    r = cube([spacing+20,20,5])
    r+= cube([20,20,10])    
    r+= translate([spacing,0,0])(cube([20,20,10]))
    
    bolt_hole = translate([0,0,5.3])(cylinder(r=2.8,h=5.1))
    bolt_hole += cylinder(r=4.6,h=5.1);
    
    r-= translate([10,10,-0.1])(bolt_hole)
    r-= translate([10+spacing,10,-0.1])(bolt_hole)
        
    return r

#res=tslot_spacer(55)

def drive_bearing_holder():
    r = cube([10,30,28])
    r += translate([0,20,23])(cube([20,25,5]))
    r += translate([0,20,18])(cube([20,10,10]))
        
    # bearing and shaft clearance
    r -= translate([-0.1,15,14])(rotate([0,90,0])(cylinder(r=9.5,h=100,segments=64)))
    r -= translate([3,15,14])(rotate([0,90,0])(cylinder(r=11.2,h=20,segments=64)))
    
    # mounting hole 
    r-= translate([10,38,-0.1])(rotate([0,0,0])(cylinder(r=2.7,h=100,segments=64)))
    
    
    return r
#res = rotate([0,-90,0])(drive_bearing_holder())
#res += translate([1,0,0])(mirror([1,0,0])(rotate([0,-90,0])(drive_bearing_holder())))

def storage_shelf(length,spacing):	
    r = tslot20(length,0)
    r += translate([spacing,0,0])(tslot20(length,0))    
    r = color("blue")(r)
    r = rotate([-90,0,0])(translate([0,0,0])(r))

    r += translate([0,30,-30])(tslot_spacer(spacing))
    r += translate([0,length-20,-30])(tslot_spacer(spacing))


    g = gear(mm_per_tooth=1.0*3.14159,thickness=25,number_of_teeth=23,hole_diameter=8.4)
    g = translate([38,0,-34])(rotate([0,90,0])(g))
    r += translate([22,0,-20])(container(60))
    r += g	
    #r += translate([0,400,0])(g)	
    
    r += translate([0,-15,-48])(drive_bearing_holder())

    r += translate([15+0.3,0,-34])(rotate([0,90,0])(bearing_608()))
    r += translate([spacing-0.3,0,-34])(rotate([0,90,0])(bearing_608()))
    
    # conveyor dummy
    r+= color("silver")(translate([25,0,-21])(cube([25,430,1])))
    r+= color("silver")(translate([25,0,-21-27])(cube([25,430,1])))
    
    return r	

res = storage_shelf(400,55)

def belt_roller(height, inner_dia):
    r = cylinder(r=12,h=height,segments=64);
    r-= cylinder(r=inner_dia/2,h=height,segments=64);
    r-= translate([2,-1.5,0])(cube([height,3,height]))
    return r

def conveyor_clamp(belt_width):
    r = cube([belt_width+13, 20, 5])
    # zip tie holes
    r -= translate([5,5,-0.1])(cube([4,2,100]))
    r -= translate([5+belt_width,5,-0.1])(cube([4,2,100]))
    # clamp holes
    r -= translate([1.5+2.5,15,-0.1])(cylinder(r=1.7,h=100,segments=64))
    r -= translate([1.5+7.5+belt_width,15,-0.1])(cylinder(r=1.7,h=100,segments=64))
    # nut traps
    r -= translate([1.5+2.5,15,3])(cylinder(r=3.3,h=4,segments=6))
    r -= translate([1.5+7.5+belt_width,15,3])(cylinder(r=3.3,h=4,segments=6))
    
    # second part
    r += translate([0,22,0])(cube([belt_width+13, 10, 3 ]))
    r -= translate([1.5+2.5,27,-0.1])(cylinder(r=1.7,h=100,segments=64))
    r -= translate([1.5+7.5+belt_width,27,-0.1])(cylinder(r=1.7,h=100,segments=64))

    
    # belt
    #r+= color("silver")(translate([1.5+5,0,0])(cube([belt_width,100,1])))
    return r

    



#res = belt_roller(30, 8.6) 

#res = conveyor_clamp(25) 
 
 
print scad_render(res)
