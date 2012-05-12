include <shapes.scad>

motor_shaft=10.5;
motor_bar_width=2.9;
motor_bar_length=18;

bushing_depth = 2.3;
bushing_dia = 26;

outer_diameter = 101;

total_height =9.5;

hole_dia = 18;


difference(){
	cylinder(r=outer_diameter/2, h=total_height);
	// original motor mounting (did not work well)	
	//cylinder(r=motor_shaft/2,h=total_height);
	//translate(v=[0,0,7.5]) cube(size=[motor_bar_width, motor_bar_length,5], center=true);
	
	// replaced with a 10mm hex shaft
	#translate(v=[0,0,total_height/2]) hexagon(10.3,total_height);		

	translate(v=[0,0,total_height-bushing_depth])cylinder(r=bushing_dia/2,h=bushing_depth);
	
	for (i = [0:5]) {
		rotate(a=60*i, v=[0,0,1]) translate(v=[39,-2.5,0]) cylinder(r=hole_dia/2, h=total_height);
		for(f=[1:15]){
			rotate(a=60*i-f*2, v=[0,0,1]) translate(v=[39+f,-2.5-f,total_height-2]) cylinder(r=hole_dia/2, h=total_height);
		}
	}	

}

