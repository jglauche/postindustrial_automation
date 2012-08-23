module cam(){
    x = 43+14;
    y = 35;
    z = 3.5;
    union(){
        difference(){
            
               cube([x,y,z]);
            // cut a bit on both sides of material off 
            translate([-0.5,-0.1,-0.1]) cube([3.6+9,y+0.2,30]);
            translate([x+13.5,-0.1,-0.1]) cube([6.1,y+0.2,30]);
            
            // holes for DIN7981 2,9x6,5
            translate([0,0,1.1]){
                translate([50,y/2-10,0]) cylinder(r=5.8/2, h=5);
                translate([50,y/2+10,0]) cylinder(r=5.8/2, h=5);
                translate([34,y/2,0]) cylinder(r=5.8/2, h=5);                            
            }
            translate([50,y/2-10,0]) cylinder(r=1.5, h=5);
            translate([50,y/2+10,0]) cylinder(r=1.5, h=5);
            translate([34,y/2,0]) cylinder(r=1.5, h=5);
            
        }
        translate([12,0,z]) {
            difference(){
                cube([14,y,5.5]);
                translate([22,-3,0]) rotate([0,0,45]) cube([x/2,x/2,5.5]);
            }

        }
    }
}
cam();
