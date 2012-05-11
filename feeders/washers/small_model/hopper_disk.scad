include<../../../libs/nema17_motor.scad>


bushing_depth = 2.3;
bushing_dia = 26;

outer_diameter = 34;

total_height =4;

hole_dia = 8;

//motor_mount();

//rotate(a=180,v=[0,1,0]) bearing_disk();


hopper();

module hopper(){
		difference(){			
			union(){
				cylinder(r=22, h=50); 
				translate(v=[0,0,3]) cube(size=[60,20,6], center=true);
			}
			// feeder
			translate(v=[0,0,0]) cylinder(r1=(outer_diameter-5)/2, r2=(outer_diameter+10)/2, h=70); 
			// side mounting bolts
			translate(v=[25,0,0]) cylinder(r=2,h=80);
			translate(v=[-25,0,0]) cylinder(r=2,h=80);
	}	
}

module bearing_disk(){
	difference(){
		cylinder(r=outer_diameter/2, h=total_height);
		// motor stuff
		difference(){	
			cylinder(r=2.6, h=total_height);
			translate(v=[-5,1.5,0]) cube(size=[10,10,total_height]);	
		}
		for (i = [0:5]) {
			rotate(a=60*i, v=[0,0,1]) translate(v=[10,-2.5,0]) cylinder(r=hole_dia/2, h=total_height);
			for(f=[1:7]){
				rotate(a=60*i-f*2, v=[0,0,1]) translate(v=[10+f,-2.5-f,total_height-0.75]) cylinder(r=hole_dia/2, h=total_height);
			}
		}	

	}
}

bearing_dia = 22;
margin = 1.5;
bearing_height=7;

module motor_mount(){
translate(v=[0,0,-16.5]){
	difference(){
		difference(){			
			union(){
				cylinder(r=25, h=16); 
				translate(v=[0,0,(16+total_height+0.4)/2]) cube(size=[60,20,16+total_height+0.4], center=true);
			}
			// cut mouting part away
			translate(v=[0,0,16]) cylinder(r=31+1, h=16); 
			// side mounting bolts
			translate(v=[25,0,0]) cylinder(r=2,h=80);
			translate(v=[-25,0,0]) cylinder(r=2,h=80);

			// flat part for disk
			translate(v=[0,0,16-total_height-0.3]) cylinder(r=(outer_diameter+2)/2, h=total_height+0.5);

			// eject part
			translate(v=[0,37,8]) rotate(a=-30,v=[1,0,0]) cube(size=[9,50,16], center=true);
		}				

		// motor flange	
		cylinder(r=12,h=3);
			
		translate(v=[0,0,3]) cylinder(r1=12, r2=5,h=10);
		translate(v=[0,0,0]){	
			translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
			translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=motor_mounting_hole_diam/2,h=80);
		}
		// holes for screw heads
		translate(v=[0,0,6]){	
			translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=80);
			translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=80);
			translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=80);
			translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,-0.5])cylinder(r=3.5,h=80);
		}


	}
}

}
