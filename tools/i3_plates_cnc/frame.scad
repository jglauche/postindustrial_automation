// note: use Aluminium T-slot


include<../../libs/tslot.scad>


module wood_cut1(z=12){
    cube([450,100,z]);
}

module wood_cut2(z=12){
    cube([450+z*2,100,z]);
}
module wood_cut3(z=12){
    cube([225,225,z]);
}

module frame(h=200){
    
    translate([0,0,20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,0]) rotate([90,0,0 ]) tslot20(500);
    translate([580,520,0]) rotate([90,0,0 ]) tslot20(500);

    translate([0,0,20+h+20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,20+h+20]) rotate([0,90,0 ]) tslot20(600);
    translate([0,520,0+h+20]) rotate([90,0,0 ]) tslot20(500);
    translate([580,520,0+h+20]) rotate([90,0,0 ]) tslot20(500);
        
    translate([0,0,20]) tslot20(h);
    translate([580,0,20]) tslot20(h);
    translate([0,520,20]) tslot20(h);
    translate([580,520,20]) tslot20(h);
    translate([290,0,20]) tslot20(h);
    translate([290,520,20]) tslot20(h);
 

}
frame();

translate([50,50,0]) wood_cut2();
translate([50,200,0]) wood_cut3();


