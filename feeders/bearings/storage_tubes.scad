include<../../mgs_prusa/nema_motor.scad>
include<bearing_tube.scad>

bearing_dia = 22;
margin = 1.5;
bearing_height=7;
wall_thickness = 2.5;
//translate(v=[0,0,-40]) nema();


union(){
	difference(){
		union(){
			translate(v=[0,0,2]) cube(size=[80,20,4], center=true);
		
			translate(v=[0,0,0]) cylinder(r=31, h=4); 
		}
		// side mounting bolts
		translate(v=[35,0,0]) cylinder(r=2,h=80);
		translate(v=[-35,0,0]) cylinder(r=2,h=80);
		
		for (i = [0:2]) {
			rotate(a=100*i-180, v=[0,0,1]) translate(v=[18,-2.5,0]) cylinder(r=(bearing_dia+margin)/2,h=count*bearing_height);
		}
	}
	for (i = [0:2]) {
		rotate(a=100*i-180, v=[0,0,1]) translate(v=[18,-2.5,2]) bearing_tube(); //cylinder(r=(bearing_dia+margin)/2, h=bearing_height);
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
			rotate(a=120*i-20, v=[0,0,1]) translate(v=[18,-2.5,0]) cylinder(r=(bearing_dia+margin)/2, h=bearing_height);
		}	

	}

}
