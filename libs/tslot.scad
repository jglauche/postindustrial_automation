//(C) Nathan Zadoks 2011
//CC-BY-SA or GPLv2+, pick your poison.
module tslot(
	size=10,	//size of each side
	length=10,	//length. descriptive enough, no?
	thickness=3,	//thickness of the 'sheet'
	gap=0,		//gap, thickness of the lower part of the 'T'
	center=false,	//somewhat vague. todo.
	nut=false,	//set to true to make a fitting T-slot nut
){
	start=thickness/sqrt(2);
	if(nut){
		scale(v=[0.9,0.9,1]){
			linear_extrude(height=length)
			intersection(){
				polygon([[size/2-gap/2,0],[size/2-gap/2,thickness],[thickness+start,thickness],[size/2,size/2-2],[size-thickness-start,thickness],[size/2+gap/2,thickness],[size/2+gap/2,0]]);
				square([size,size/2-(gap+thickness)/2]);
			}
		}
	}	
	else{
		color([0.5,0.5,0.5])
		linear_extrude(height=length,center=center)
		translate([size/2,size/2])
		difference(){
			union(){
				for(d=[0:3]) rotate([0,0,d*90]) polygon(points=[
					[0,0],
					[0,start],[size/2-thickness-start,size/2-thickness],[gap/2,size/2-thickness],[gap/2,size/2],
					[size/2,size/2],[size/2,gap/2],[size/2-thickness,gap/2],[size/2-thickness,size/2-thickness-start],[start,0]
				]);
				square(gap+thickness,center=true);
			}
			circle(r=gap/2,center=true);
		}
	}
}


module tslot20(length,nut){
	tslot(size=20,gap=5.26,thickness=1.5,length=length,nut=nut);
}
module tslot30(length,nut){
	tslot(size=30,gap=8.13,thickness=2.55,length=length,nut=nut);
}
module tslot30_3060(length,nut){
	union(){
		tslot30(length,nut);
		translate([30,0,0])
		tslot30(length,nut);
	}
}


tslot20holes(100);

module tslot20holes(length,nut){
	difference(){
		tslot(size=20,gap=5.26,thickness=1.5,length=length,nut=nut);
		for(i=[0:(length/10)-2]){	
			translate(v=[10,25,10+i*10]) rotate(a=90,v=[1,0,0]) cylinder(r=2,h=30);
			translate(v=[-10,10,i*10+5]) rotate(a=90,v=[0,1,0]) cylinder(r=2,h=30);
		}
		translate(v=[-10,10,floor(length/10)*10-5]) rotate(a=90,v=[0,1,0]) cylinder(r=2,h=30);
	}
}



module nut_test(){
	union(){
		tslot20(30,true);
		translate([18,0,0]) rotate(a=180,v=[0,0,1]) tslot20(30,true);
	
	}
}

