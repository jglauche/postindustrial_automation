

motor_shaft=10.5;
motor_bar_width=3;
motor_bar_length=18;

bushing_depth = 2.3;
bushing_dia = 26;

outer_diameter = 101;

total_height =10;

hole_dia = 18;


difference(){
	cylinder(r=outer_diameter/2, h=total_height);
	// motor stuff
	cylinder(r=motor_shaft/2,h=total_height);
	translate(v=[0,0,total_height-bushing_depth])cylinder(r=bushing_dia/2,h=bushing_depth);
	#translate(v=[0,0,7.5]) cube(size=[motor_bar_width, motor_bar_length,5], center=true);
	
	for (i = [0:5]) {
		rotate(a=60*i, v=[0,0,1]) translate(v=[35,-2.5,0]) cylinder(r=hole_dia/2, h=total_height);
		for(f=[1:20]){
			rotate(a=60*i-f*2, v=[0,0,1]) translate(v=[35+f,-2.5-f,total_height-2]) cylinder(r=hole_dia/2, h=total_height);
		}
	}	

}

