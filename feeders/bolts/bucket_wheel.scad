total_height =18;
outer_diameter = 60;
hole_dia=20;


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

