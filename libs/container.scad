



module container(x, y, z, wall_thickness=1.3){
	color(red){	
		difference(){
			cube(size=[x,y,z]);
			translate([wall_thickness,wall_thickness,wall_thickness]) cube(size=[x-wall_thickness*2,y-wall_thickness*2,z]);
		}
	}

}

//container(99,99,40);
