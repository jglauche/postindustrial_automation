$fn=64;

module micro_servo(){
    
    union(){
        color("blue") cube([23,12,23]);
        translate([6,6,23]) color("blue") cylinder(r=6,h=5);
        translate([6+6,6,23]) color("blue") cylinder(r=2.8,h=5);

        // shaft
        translate([6,6,23+5]) color("white") cylinder(r=2.5,h=3.25,$fn=9);
    
        // mounting plate
        difference(){
           translate([-5,0,17.5]) color("blue") cube([32.5,12,2]);    
           translate([-2,6,17.5-0.1]) cylinder(r=1,h=2.2); 
           translate([25.5,6,17.5-0.1]) cylinder(r=1,h=2.2); 
            
        }
        
        // wires
        translate([-10,5,6]) rotate([0,90,0]) color("Yellow") cylinder(r=0.5,h=10);
        translate([-10,6,6]) rotate([0,90,0]) color("Crimson") cylinder(r=0.5,h=10);
        translate([-10,7,6]) rotate([0,90,0]) color("SaddleBrown") cylinder(r=0.5,h=10);
    
    }    

}

// note: this is very abstract 
module micro_servo_attachment_round_disk(){
    color("white") difference(){
        cylinder(r=12, h=1.7);
        translate([9,0,-0.1]) cylinder(r=0.6,h=2);    
        translate([-9,0,-0.1]) cylinder(r=0.6,h=2);    
    }
}

module micro_servo_with_round_disk(){
    union(){
        micro_servo();
        translate([6,6,31]) micro_servo_attachment_round_disk();
    }

}
micro_servo_with_round_disk();


