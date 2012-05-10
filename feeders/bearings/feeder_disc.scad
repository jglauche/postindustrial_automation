include<../../mgs_prusa/nema_motor.scad>

bearing_dia = 22;
margin = 1.5;
bearing_height=7;

//translate(v=[0,0,-40]) nema();

//feeder_disc();


// motor mount

translate(v=[0,0,-16.5]){
	difference(){
		difference(){			
			union(){
				cylinder(r=31, h=16); 
				translate(v=[0,0,(16+bearing_height+0.5)/2]) cube(size=[80,20,16+bearing_height+0.5], center=true);
			}
			// cut mouting part away
			translate(v=[0,0,16]) cylinder(r=31+1, h=16); 
			// side mounting bolts
			translate(v=[35,0,0]) cylinder(r=2,h=80);
			translate(v=[-35,0,0]) cylinder(r=2,h=80);

			// eject part
			translate(v=[0,30,8]) rotate(a=-30,v=[1,0,0]) cube(size=[25,50,16], center=true);
		}				

		// motor flange	
		cylinder(r=12,h=3);
			
		translate(v=[0,0,3]) cylinder(r1=12, r2=5,h=13);
		translate(v=[0,0,0]){	
			translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
		}
		// holes for screw heads
		translate(v=[0,0,2]){	
			translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3,h=80);
			translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3,h=80);
			translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3,h=80);
			translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3,h=80);
		}


	}
}


module feeder_disc(){
	difference(){
		cylinder(r=31, h=bearing_height); 
		// motor shaft
		difference(){	
			cylinder(r=2.5, h=bearing_height);
			translate(v=[-5,1.5,0]) cube(size=[10,10,bearing_height]);	
		}

		for (i = [0:3]) {
			rotate(a=120*i, v=[0,0,1]) translate(v=[18,-2.5,0]) cylinder(r=(bearing_dia+margin)/2, h=bearing_height);
		}	

	}

}
