include<../../libs/nema17_motor.scad>

total_height =18;
outer_diameter = 60;
hole_dia=10;


//nema();
rotate(a=90,v=[0,1,0]) 
motor_mount();
//translate(v=[0,0,35]) wheel();




module motor_mount(){
	translate(v=[0,0,23]){
		union(){
			difference(){
				difference(){			
					union(){
						//cylinder(r=26, h=9);
						translate(v=[-5,5,4.5]) cube(size=[42+30,42+10,9], center=true);	 
						translate(v=[-5,35+20,5+(total_height+6)/2]) cube(size=[42+30,20+40,10+total_height+6], center=true);
					}
					// cut the shape of the disk with a little margin
					translate(v=[0,0,11]) cylinder(r=(outer_diameter+1.5)/2, h=total_height+2);
					// main feed hole
					translate(v=[-50,50,11+(total_height+1)/2])  cube(size=[70,60,total_height-3], center=true);
					//translate(v=[-10,28,11+(total_height+1)/2]) rotate(a=-60,v=[0,0,1]) cube(size=[70,40,total_height-3], center=true);
					translate(v=[-10,28,11+(total_height+1)/2]) rotate(a=15,v=[0,0,1]) translate(v=[-15,10,0]) cube(size=[70,140,total_height-3], center=true);
				
					#translate(v=[-40,85,0+(total_height+1)/2]) rotate(a=-15,v=[0,10,0]) cube(size=[70,120,8], center=true);
				
	

				}				

				// motor flange	
				cylinder(r=12,h=10);
				translate(v=[-25,-10,0]) cube(size=[20,20,10]);			

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
			translate(v=[-41,80,0]) cube(size=[70,5,16+total_height]);
		}
	}
}


module wheel(){

	difference(){
	
		cylinder(r=outer_diameter/2, h=total_height);
	
		// motor stuff
		difference(){	
			cylinder(r=2.7, h=total_height);
			translate(v=[-5,1.5,0]) cube(size=[10,10,total_height]);	
		}
		for (i = [0:3]) {
			rotate(a=90*i, v=[0,0,1]) translate(v=[29,-2.5,1]) cylinder(r=hole_dia/2, h=total_height-2);
			// holes to reach the motor bolts
			rotate(a=45+90*i, v=[0,0,1]) translate(v=[22,-2.5,0]) cylinder(r=4, h=total_height);
			
		}	

	}
	
}


