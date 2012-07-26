include <../../libs/publicDomainGearV1.1.scad>




module track_piece(){
    x = 43;
    y = 35;
    z= 3.5;


    union(){
       cube([x,y,z]);

       
       translate([5,y/2,10]) 
       // cut the ends off the rack
       difference(){
           rotate([90,0,0]) color([0.75,0.75,0.75]) rack(mm_per_tooth=3.5*3.14159,height=10, thickness=12, number_of_teeth=4);
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

}
track_piece();
translate([-44,0,0]) track_piece();

//translate([0,17.5,32]) rotate([0,90,90]) color([1.00,0.75,0.75]) gear(mm_per_tooth=3.5*3.14159,thickness=10,number_of_teeth=12,hole_diameter=5);












