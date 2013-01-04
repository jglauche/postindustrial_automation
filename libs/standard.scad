// put standard stuff in this scad


module bearing_608(){
    color("silver"){
        difference(){
            cylinder(r=11, h=7); 
            translate([0,0,-0.1]) cylinder(r=4,h=7.2);
             
        }    
    
    }
}

