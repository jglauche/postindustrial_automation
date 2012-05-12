include<../../libs/nema17_motor.scad>

total_height =18;
outer_diameter = 60;
hole_dia=20;


//nema();
rotate(a=-90,v=[1,0,0]) motor_mount();
//translate(v=[0,0,35]) wheel();




module motor_mount(){
	translate(v=[0,0,23]){
		difference(){
			difference(){			
				union(){
					//cylinder(r=26, h=9);
					translate(v=[0,0,4.5]) cube(size=[42,42,9], center=true);	 
					translate(v=[0,30,5+(total_height+6)/2]) cube(size=[42,20,10+total_height+6], center=true);
				}
				// cut the shape of the disk with a little margin
				translate(v=[0,0,11]) cylinder(r=(outer_diameter+1.5)/2, h=total_height+2);
				// cutout to allow overflows (may put a spring loaded hindg in the future)
				translate(v=[12,20,11+(total_height+1)/2]) cube(size=[21,20,total_height-3], center=true);
				// main feed hole
				translate(v=[0,30,11+(total_height+1)/2]) cube(size=[21,20,total_height-3], center=true);
				
	

			}				

			// motor flange	
			cylinder(r=12,h=10);
			
		//	translate(v=[0,0,3]) cylinder(r1=12, r2=12,h=10);
			translate(v=[0,0,0]){	
				translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=15);
				translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=15);
				translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=15);
				translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=15);
			}
			// holes for screw heads
			translate(v=[0,0,6]){	
				translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=15);
				translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=15);
				translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=15);
				translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=15);
			}


		}
	}
}


module wheel(){

	difference(){
	
		cylinder(r=outer_diameter/2, h=total_height);
	
		// motor stuff
		difference(){	
			cylinder(r=2.5, h=total_height);
			translate(v=[-5,1.5,0]) cube(size=[10,10,total_height]);	
		}
		for (i = [0:3]) {
			rotate(a=90*i, v=[0,0,1]) translate(v=[24,-2.5,1]) cylinder(r=hole_dia/2, h=total_height-2);

		}	

	}
	
}


