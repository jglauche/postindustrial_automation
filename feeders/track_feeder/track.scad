include <../../libs/publicDomainGearV1.1.scad>

// mm_per_tooth = module * PI
mm_per_tooth = 5*3.14159;

$fn=16;
module track_piece(){
    x = 43;
    y = 35;
    z = 7;
    
    union(){
        difference(){
            
            union(){
               cube([x,y,z]);
               
               #translate([0,y/2-6,0]) cube([x,12,z+2.1]);
                
               // cut the ends off the rack
               translate([5,y/2,z+7]) difference(){
                   rotate([90,0,0]) color([0.75,0.75,0.75]) rack(mm_per_tooth=mm_per_tooth,height=10, thickness=12, number_of_teeth=3);
                   translate([38,-10,-7]) cube(size=[10,20,5]);
                   translate([-15,-10,-7]) cube(size=[10,20,5]);
               }
               
               // bearing slides
               difference(){
                   translate([0,0,z]) cube([x,12,10.5]);
                   translate([-1,0,z]) rotate([45,0,0]) cube([x+5,15+1,10]);     
               }
               difference(){
                   translate([0,23,z]) cube([x,12,10.5]);
                   translate([-1,24,z+11]) rotate([-45,0,0]) cube([x+5,15+1,10]);     
               }

            }

            // cut a bit on both sides of material off 
            translate([-0.5,-0.1,-0.1]) cube([3.6,y+0.2,30]);
            translate([x-4,-0.1,-0.1]) cube([6.1,y+0.2,30]);
            
            // cut for hinge
            translate([0,7,0]) cube([12,y-14,9.2]);
            // using a M3 bolt for hinge
            translate([6,y,3]) rotate([90,0,0]) cylinder(r=1.5, h=y+0.2);          
            translate([6,2,3]) rotate([90,0,0]) cylinder(r=3.7, h=2.1,$fn=6);   
            
            // make some holes to accept a piece that can be glued on the bottom
            translate([18,y/2-10,0]) cylinder(r=1.5, h=3);
            translate([18,y/2+10,0]) cylinder(r=1.5, h=3);
            translate([34,y/2,0]) cylinder(r=1.5, h=3);
            
        }
        // male hinge part
        translate([x-6,8,0]) difference(){
            cube([20,y-16,6.5]);
            translate([9+7,y,3]) rotate([90,0,0]) cylinder(r=1.5, h=y+0.2);
        }
        
    }    
}

track_piece();
//translate([-44-3,0,0]) track_piece();

// rack to test the distances
//translate([-10.7,20,23]) rotate([-90,0,0]) color([0.75,0.75,0.75]) rack(mm_per_tooth=mm_per_tooth,height=10, thickness=12, number_of_teeth=3);

// gear
//translate([0,17.5,33]) rotate([0,90,90]) color([1.00,0.75,0.75]) gear(mm_per_tooth=mm_per_tooth,thickness=10,number_of_teeth=8,hole_diameter=5);












