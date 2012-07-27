

bearing_dia = 22;
margin = 1.5;
wall_thickness = 2.5;
bearing_height=7;
count = 11;

bearing_tube();
module bearing_tube(){
	difference(){
		union(){		
			cylinder(r=(bearing_dia+margin+wall_thickness)/2,h=count*bearing_height);
			translate(v=[0,0,bearing_height*(count-2)]) cylinder(r1=(bearing_dia+margin+wall_thickness)/2, r2=(bearing_dia+margin+wall_thickness*2+0.5)/2, h=bearing_height*1);
			translate(v=[0,0,bearing_height*(count-1)]) cylinder(r=(bearing_dia+margin+wall_thickness*2+0.5)/2, h=bearing_height*1);
		}

		cylinder(r=(bearing_dia+margin)/2,h=count*bearing_height);
		translate(v=[0,0,bearing_height*(count-1)]) cylinder(r=(bearing_dia+margin+wall_thickness)/2, h=bearing_height*1);

	}
}
