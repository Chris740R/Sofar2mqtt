//Procedural Project Box Screws Remix
//CudaTox, 2017
//Corrected issues when thickness is changed screw columns are not located correctly.
//Corrected issue whtn thickness is greater than 2 and lip_tol is used created offset in screw posts in lid.
//Added options for lid reinforcment and lid screw stud length
//Cleaned up code buy calculating global variables to use in place of formulas.
//Ron Shenk 2019
//Revision 1
//Added variables to allow generating each element seperate or together

//Maker2741 - 8/2019
//Revision 2
//Added windows, holes options in lid
//Added external mounting flange option
//Added internal mounting hole option
//Added pad reinforcement around mounting hole option
//Converted ic stud mount to a center/offset option (same as all mounting holes, windows, etc.
//Offset of 0,0 will mount the object centered on the box.  Then offset in x and/or y to move position.


////////////////////////////////////////////////////////////////////////
//Options list - Change these:
////////////////////////////////////////////////////////////////////////

//These must be true or false:
generate_box = true;            // true generates box false skips generating the box
generate_lid = false;            // true generates lid, false skips generating the lid

generate_window_1 = true;       // true generates a square window for the display screen, false means solid lid
generate_window_2 = false;       // true generates a square window, false means solid lid
generate_window_3 = true;       // true generates a square window, false means no USB hole

generate_hole_1 = false;         // true generates a round hole, false means solid lid
generate_hole_2 = false;        // true generates a round hole, false means solid lid
generate_hole_3 = false;        // true generates a round hole, false means solid lid
generate_hole_4 = false;        // true generates a round hole, false means solid lid

generate_hole_5 = true;         // true generates a round hole on end of box for cable gland/exit, false means solid box
generate_RSrelief = true;       // true generates relief on the ic studs so that the RS converter can fit between them
//generate screen_lip = true;

use_ic_studs = true;           //true generates ic studs in box, false means flat bottom
use_internal_mount = false;      //true generates holes in the bottom of the box for screws
use_external_mount = false;      //true generates a flange with holes outside the box (on Y axis)
use_mount_pads = true;         //true generates a pad around the mount holes, false means no pad


//Box Parameters in mm
inside_width = 33;              //x direction
inside_length = 78;            //y direction
inside_height = 23.5;             //z direction
thickness = 3;                  //Wall thickness
radius =3;              		//Corner radius. Should not be larger than thickness
screw_dia = 3;                  //Diameter of the screw you intend to use
screw_loose_dia = 3.5;

//RS485 converter relief
RSrelief_x = 23;
RSrelief_y = 8;

RSrelief_offset_x = -RSrelief_x/2;
RSrelief_offset_y = -(RSrelief_y+3);

//Lid Window and Hole Dimensions in mm
window_1_x = 13;                //x direction
window_1_y = 24;                //y direction

window_2_x = 18;
window_2_y = 12;

hole_1_dia = 10;
hole_2_dia = 10;
hole_3_dia = 15;
hole_4_dia = 15;

//Box Window and Hole Dimensions in mm

hole_5_dia = 16.5; // Cable gland hole

window_3_x = 16; // USB hole
window_3_y = 10;
USBholethickness = 1.5;

//Winow and Hole Locations - (0,0) = centered on lid, otherwise offset in mm
window_1_offset_x = 0;          //x direction
window_1_offset_y = -9.5;         //y direction

window_2_offset_x = 0;
window_2_offset_y = -36;


hole_1_offset_x = 10;
hole_1_offset_y = -15;

hole_2_offset_x = -10;
hole_2_offset_y = -15;

hole_3_offset_x = 15;
hole_3_offset_y = -30;

hole_4_offset_x = -15;
hole_4_offset_y = -30;

//Window and Hole location on box - (0,0) = centered on side, otherwise offset in mm

hole_5_offset_x = 0;
hole_5_offset_y = -0.5;

window_3_offset_x = -47;
window_3_offset_y = 2;


//Additional lid parameters
extra_lid_thickness = 0;        //Extra lid thickness above thickness. 
                                //You may want to tweak this to account for large chamfer radius.
lip_tol = .5;					//this tolerence helps the lid fit
lid_stud_height = 4;			//Length of studs on lid
lid_lip_height = 0;    			//Lid locating / reinforcement lip height
lid_lip_width =0;				//Width of lid locating / reinforcement lip
screen_lip_height = 1;
screen_lip_width = 1;

//Additional IC stud parameters 1
ic1_stud_height = 7;             //IC stud height
ic1_stud_id = 2.5;                 //Diameter of screw needed
ic1_stud_od = ic1_stud_id*2.5;    //you can set this manually to a fixed value in place of the formula
ic1_stud_multiplier = .9;       //decreases stud id when using threaded fastners so they have purchase
ic1_stud_x = 15;             //Witdth between centers of ic studs-can be 0 for only 2 studs
ic1_stud_y = 32;            //Length between centers of ic studs-can be 0 for only 2 studs
ic1_stud_offset_x = 0;           //IC stud offset x position, 0 = centered
ic1_stud_offset_y = 4;            //IC stud offset y position, 0 = centered

//Additional IC stud parameters 2
ic2_stud_height = 19;             //IC stud height
ic2_stud_id = 2.5;                 //Diameter of screw needed
ic2_stud_od = ic2_stud_id*2.5;    //you can set this manually to a fixed value in place of the formula
ic2_stud_multiplier = .9;       //decreases stud id when using threaded fastners so they have purchase
ic2_stud_x = 26.5;             //Witdth between centers of ic studs-can be 0 for only 2 studs
ic2_stud_y = 53.5;            //Length between centers of ic studs-can be 0 for only 2 studs
ic2_stud_offset_x = 0;           //IC stud offset x position, 0 = centered
ic2_stud_offset_y = 0;            //IC stud offset y position, 0 = centered


//Internal mounting hole parameters
internal_mount_x = 40;          //Width of the bolt hole pattern - can be 0 for only 2 holes
internal_mount_y = 60;          //Length of the bolt hole pattern - can be 0 for only 2 holes
internal_mount_offset_x = 0;    //Offset of the hole pattern from center of the box 0 = centered
internal_mount_offset_y = 0;    //Offset of the hole pattern from center of the box 0 = centered
internal_mount_hole_dia = 4;    //Diameter of the screw hole


//External mounting parameters
external_flange_width = 15;     //Width of the mounting flange - applied to y direction
external_mount_hole_dia = 4;     //Mounting hole diameter
external_mount_x = 30;          //Center to center distance of ext. mounting holes - can be 0 for only 2 holes
external_mount_offset_x = 0;    //Offset hole pattern from x-center of the box, 0 = centered
   //For simplicity, the external holes are automatically spaced on the Y centerline of each flange
  
  
//Reinforcement pad parameters (apply to all mounting holes)
reinforce_thickness = 3;        //Thickness of the pad
reinforce_diameter = 10;        //Diameter of the pad, typically several mm more than the hole



//Board Slot Parameters         
board_thickness = 2.1;            //Thickness of circuit board inserted in the slot.  May want to apply a slight overage for ease of insertion / removal.
x_slot_number = 0;               //Creates equally spaced slots along the x walls, 0 = no slots
y_slot_number = 0;                //Creates equally spaced slots along the y walls, 0 = no slots




//////////////////////////////////////////////////////////////////////////////////////
//Do not modify values below this line
//////////////////////////////////////////////////////////////////////////////////////

// Computation of variables used in box creation do not modify values below this line
od = screw_dia * 2.5;
outside_width = inside_width + (thickness * 2);
outside_length = inside_length + (thickness * 2);
outside_height = inside_height + (thickness * 2);
box_stud_height = inside_height - lid_stud_height;
column_offset = (od/2)+thickness;
column_radius = od/2;
lid_startpos = (outside_width*-1)-2;
lid_lengthoffset = inside_length - column_radius + thickness;
lid_widthoffset = inside_width - column_radius + thickness;
ic1_stud_real_id = ic1_stud_id * ic1_stud_multiplier;
ic2_stud_real_id = ic2_stud_id * ic2_stud_multiplier;

module box_ic1_stud(height,id,od){
    difference(){
        cylinder(d=od, h=height, $fn=100);
        cylinder(d=id * ic1_stud_multiplier, h=height, $fn=100);
    }
}

module box_ic2_stud(height,id,od){
    difference(){
        cylinder(d=od, h=height, $fn=100);
        cylinder(d=id * ic2_stud_multiplier, h=height, $fn=100);
    }
}

module box_screw(id, od, height){
    difference(){
        union(){
            cylinder(d=od, h=height, $fs=0.2);
            translate([-(od/2), -(od/2), 0])
                cube([(od/2),od,height], false);
            translate([-od/2, -(od/2), 0])
                cube([od,(od/2),height], false);
        }
        cylinder(d=id, h=height, $fn=6);
    }
}

module rounded_box(x,y,z,r){
    translate([r,r,r])
    minkowski(){
        cube([x-r*2,y-r*2,z-r*2]);
        sphere(r=r, $fs=0.1);
    }
}

module main_box(){
    
    
    difference()
    {
        union(){//cube([outside_width, outside_length, outside_height]);


        difference (){    
            rotate([0,90,0])
            translate([-outside_height+thickness,0,(outside_width/2)-(window_3_x/2)-(USBholethickness/2)]) 
            cylinder(d=window_3_y*2, h=window_3_x+USBholethickness, $fn=100);
            
            //minus usb cutout cubes
                  translate([13.5,-window_3_x-USBholethickness , outside_height-10])
            cube([12, 30, 15]); 
            translate([8,-window_3_x-USBholethickness , outside_height-thickness])
            cube([window_3_y*2+USBholethickness, window_3_x*2, window_3_y*2]);
                        translate([8,-window_3_x-USBholethickness , 0])
            cube([window_3_y*2+USBholethickness, window_3_x+USBholethickness, window_3_y*4]);
            rotate([0,90,0])
            translate([-outside_height+thickness,0,(outside_width/2)-(window_3_x/2)+(USBholethickness/2)]) 
            cylinder(d=window_3_y*2-USBholethickness, h=window_3_x-USBholethickness, $fn=100);
        }
        difference(){
            //external cube
            rounded_box(outside_width, outside_length, outside_height, radius);
            translate([0,0,inside_height + thickness])
            cube([outside_width, outside_length, outside_height]);
            
            
            
            
            
            //minus internal cube
            translate([thickness,thickness , thickness])
            cube([inside_width, inside_length, inside_height + thickness]);
            
            
              if (generate_hole_5){ 
                rotate([90,0,0]) 
                translate([((outside_width/2)+hole_5_offset_x),((outside_height/2)+hole_5_offset_y),-(inside_length+10)]) 
                cylinder(h = 10, d = hole_5_dia);
                }
              if (generate_window_3){ 
                rotate([90,0,180])
                translate([((outside_width/2)+window_3_offset_x),((outside_height/2)+window_3_offset_y),0]) 
                cube([window_3_x,window_3_y,10]);
               }
           
        
        
   }
        
                      
               
            if (use_external_mount){
                   
                   if (use_mount_pads){
                       
             //external pads
            translate([((outside_width/2) + (external_mount_x/2) + external_mount_offset_x),((outside_length) + (external_flange_width/2)),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
                       
            translate([((outside_width/2) - (external_mount_x/2) + external_mount_offset_x),((outside_length) + (external_flange_width/2)),thickness])
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
            
            translate([((outside_width/2) + (external_mount_x/2) + external_mount_offset_x),(-external_flange_width/2),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
                       
            translate([((outside_width/2) - (external_mount_x/2) + external_mount_offset_x),(-external_flange_width/2),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);    
                   }
            //flange       
            corner_radius = external_flange_width / 4;
            hull(){
            translate([corner_radius, (-external_flange_width + corner_radius), 0])
            cylinder(h = thickness, r = corner_radius);
            translate([outside_width - corner_radius, (-external_flange_width + corner_radius), 0])
            cylinder(h = thickness, r = corner_radius);
            translate([outside_width - corner_radius, (outside_length + external_flange_width - corner_radius), 0])
            cylinder(h = thickness, r = corner_radius);
            translate([corner_radius, (outside_length + external_flange_width - corner_radius), 0])
            cylinder(h = thickness, r = corner_radius);
            }
        }
            if (use_internal_mount){
                    if (use_mount_pads){ 
              
            //internal pads
            translate([((outside_width/2) + (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) + (internal_mount_y/2) + internal_mount_offset_y),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
                
            translate([((outside_width/2) - (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) + (internal_mount_y/2) + internal_mount_offset_y),thickness])
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
            
            translate([((outside_width/2) + (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) - (internal_mount_y/2) + internal_mount_offset_y),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
                
            translate([((outside_width/2) - (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) - (internal_mount_y/2) + internal_mount_offset_y),thickness]) 
            cylinder(h = reinforce_thickness, d = reinforce_diameter);
        }
    }
    
   
        
    y_slot_space = (outside_length / (y_slot_number+1));
        
     for (i = [1:1:y_slot_number]){
        //left slots    
        difference(){
        translate([thickness + inside_width, (y_slot_space * i), ((inside_height - lid_stud_height) / 2)+thickness])
        cube([thickness * 2, ((thickness * 2) + board_thickness), inside_height-lid_stud_height], center = true);
        
       translate([thickness + inside_width, (y_slot_space * i), ((inside_height - lid_stud_height) / 2) + thickness])    
       cube([(thickness * 2.1), board_thickness, ((inside_height)+5)], center = true);
        }
        
        //right slots
        difference(){
        translate([thickness, (y_slot_space * i), ((inside_height - lid_stud_height) / 2)+thickness])
        cube([thickness * 2, ((thickness * 2) + board_thickness), inside_height-lid_stud_height], center = true);
        
       translate([thickness, (y_slot_space * i), ((inside_height - lid_stud_height) / 2) + thickness])    
      cube([(thickness * 2.1), board_thickness, ((inside_height)+5)], center = true);
        }
     }
    
     
    x_slot_space = ((outside_width / (x_slot_number+1)));
        
      for (i = [1:1:x_slot_number]){
        //bottom slots    
        difference(){
        translate([(x_slot_space * i), thickness, ((inside_height - lid_stud_height) / 2)+thickness])
        cube([((thickness *2) + board_thickness), thickness * 2, inside_height-lid_stud_height], center = true);
        
        translate([(x_slot_space * i), thickness, ((inside_height - lid_stud_height) / 2) + thickness])    
        cube([board_thickness, (thickness * 2.1),  ((inside_height)+5)], center = true);
        }
        
        //top slots
        difference(){
        translate([(x_slot_space * i), inside_length + thickness, ((inside_height - lid_stud_height) / 2)+thickness])
        cube([((thickness *2) + board_thickness), thickness * 2, inside_height-lid_stud_height], center = true);
        
       translate([(x_slot_space * i), inside_length + thickness, ((inside_height - lid_stud_height) / 2) + thickness])    
        cube([board_thickness, (thickness * 2.1),  ((inside_height)+5)], center = true);
        }
    }
    
    

    
}
        
            if (use_internal_mount){
            //internal holes
            translate([((outside_width/2) + (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) + (internal_mount_y/2) + internal_mount_offset_y),-5]) 
            cylinder(h = 50, d = internal_mount_hole_dia);
            
            translate([((outside_width/2) - (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) + (internal_mount_y/2) + internal_mount_offset_y),-5])
            cylinder(h = 50, d = internal_mount_hole_dia);
            
            translate([((outside_width/2) + (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) - (internal_mount_y/2) + internal_mount_offset_y),-5]) 
            cylinder(h = 50, d = internal_mount_hole_dia);

            translate([((outside_width/2) - (internal_mount_x/2) + internal_mount_offset_x),((outside_length/2) - (internal_mount_y/2) + internal_mount_offset_y),-5]) 
            cylinder(h = 50, d = internal_mount_hole_dia);
           
       }
       
            if (use_external_mount){
            //external holes
            translate([((outside_width/2) + (external_mount_x/2) + external_mount_offset_x),((outside_length) + (external_flange_width/2)),-5]) 
            cylinder(h = 50, d = external_mount_hole_dia);
                       
            translate([((outside_width/2) - (external_mount_x/2) + external_mount_offset_x),((outside_length) + (external_flange_width/2)),-5])
            cylinder(h = 50, d = external_mount_hole_dia);
            
            translate([((outside_width/2) + (external_mount_x/2) + external_mount_offset_x),(-external_flange_width/2),-5]) 
            cylinder(h = 50, d = external_mount_hole_dia);
                       
            translate([((outside_width/2) - (external_mount_x/2) + external_mount_offset_x),(-external_flange_width/2),-5]) 
            cylinder(h = 50, d = external_mount_hole_dia); 
       }
       
}
    

    od = screw_dia * 2.5;
    

    //translate(0,0,0)
	translate([column_offset,column_offset, thickness])
        box_screw(screw_dia, od, box_stud_height);

    //translate(0,0,0)
	translate([outside_width - column_offset, column_offset, thickness])
        rotate([0,0,90])
            box_screw(screw_dia, od, box_stud_height);
    difference(){
    //translate(0,0,0)
	translate([outside_width - column_offset, outside_length - column_offset, thickness])
        rotate([0,0,180])
            box_screw(screw_dia, od, box_stud_height);
               if (generate_RSrelief){ 
            rotate([90,0,180])
            translate([(-(outside_width/2)+RSrelief_offset_x),((outside_height/2)+RSrelief_offset_y),(outside_length/2)+(ic2_stud_y/2)-2.5]) 
            cube([RSrelief_x,RSrelief_y,20]);
           }
           
       }
       difference(){
    //translate(0,0,0)
	translate([column_offset, outside_length - column_offset, thickness])
        rotate([0,0,270])
            box_screw(screw_dia, od, box_stud_height);
                         if (generate_RSrelief){ 
            rotate([90,0,180])
            translate([(-(outside_width/2)+RSrelief_offset_x),((outside_height/2)+RSrelief_offset_y),(outside_length/2)+(ic2_stud_y/2)-2.5]) 
            cube([RSrelief_x,RSrelief_y,20]);
           }
           
       }
           };

           
    

    if (use_ic_studs)
    {
        
        //IC Studs 1
            translate([((outside_width/2) + (ic1_stud_x/2) + ic1_stud_offset_x),((outside_length/2) + (ic1_stud_y/2) + ic1_stud_offset_y), 0]) 
            box_ic1_stud(ic1_stud_height, ic1_stud_real_id , ic1_stud_od); 
            
            translate([((outside_width/2) - (ic1_stud_x/2) + ic1_stud_offset_x),((outside_length/2) + (ic1_stud_y/2) + ic1_stud_offset_y), 0])
            box_ic1_stud(ic1_stud_height, ic1_stud_real_id , ic1_stud_od); 
            
            translate([((outside_width/2) + (ic1_stud_x/2) + ic1_stud_offset_x),((outside_length/2) - (ic1_stud_y/2) + ic1_stud_offset_y), 0]) 
            box_ic1_stud(ic1_stud_height, ic1_stud_real_id , ic1_stud_od); 

            translate([((outside_width/2) - (ic1_stud_x/2) + ic1_stud_offset_x),((outside_length/2) - (ic1_stud_y/2) + ic1_stud_offset_y), 0]) 
            box_ic1_stud(ic1_stud_height, ic1_stud_real_id , ic1_stud_od); 
        
    //IC Studs 2
        
        difference(){
            translate([((outside_width/2) + (ic2_stud_x/2) + ic2_stud_offset_x),((outside_length/2) + (ic2_stud_y/2) + ic2_stud_offset_y), 0]) 
            box_ic2_stud(ic2_stud_height, ic2_stud_real_id , ic2_stud_od); 
            if (generate_RSrelief){ 
            rotate([90,0,180])
            translate([(-(outside_width/2)+RSrelief_offset_x),((outside_height/2)+RSrelief_offset_y),(outside_length/2)+(ic2_stud_y/2)-2.5]) 
            cube([RSrelief_x,RSrelief_y,10]);
           }
        }
            difference(){
            translate([((outside_width/2) - (ic2_stud_x/2) + ic2_stud_offset_x),((outside_length/2) + (ic2_stud_y/2) + ic2_stud_offset_y), 0])
            box_ic2_stud(ic2_stud_height, ic2_stud_real_id , ic2_stud_od); 
        if (generate_RSrelief){ 
            rotate([90,0,180])
            translate([(-(outside_width/2)+RSrelief_offset_x),((outside_height/2)+RSrelief_offset_y),(outside_length/2)+(ic2_stud_y/2)-2.5]) 
            cube([RSrelief_x,RSrelief_y,10]);
           }
        }
            
            translate([((outside_width/2) + (ic2_stud_x/2) + ic2_stud_offset_x),((outside_length/2) - (ic2_stud_y/2) + ic2_stud_offset_y), 0]) 
            box_ic2_stud(ic2_stud_height, ic2_stud_real_id , ic2_stud_od); 

            translate([((outside_width/2) - (ic2_stud_x/2) + ic2_stud_offset_x),((outside_length/2) - (ic2_stud_y/2) + ic2_stud_offset_y), 0]) 
            box_ic2_stud(ic2_stud_height, ic2_stud_real_id , ic2_stud_od); 
        
               
    }
    


module lid(){
    difference()
        {
        union()
        {   
            //Lid.
            difference(){
                rounded_box(outside_width, outside_length, thickness * 4, radius);
                //move slightly to the right to get rid of abandoned surfaces
                translate([-1,0, thickness + extra_lid_thickness]) 
                    //increased width to remove abandoned surfaces
                    cube([outside_width+2, outside_length, inside_height + thickness * 4]);  
            }
            //Lip
            lip_width = inside_width - lip_tol;
            lip_length = inside_length - lip_tol;
            translate([(outside_width - lip_width)/2,(outside_length - lip_length)/2, thickness *.99])
                difference(){
                    cube([lip_width, lip_length, lid_lip_height]);
                    translate([lid_lip_width, lid_lip_width, 0])
                        //added extra z to ensure no remaining surfaces
                        cube([lip_width-(lid_lip_width*2), lip_length-(lid_lip_width*2), lid_lip_height+1]);  
                         
            }
        
            //stud columns
            intersection(){
                union(){
                translate([column_offset, column_offset, thickness])
                    box_screw(screw_dia, od, lid_stud_height);
                translate([lid_widthoffset, column_offset, thickness])
                    rotate([0,0,90])
                        box_screw(screw_dia, od, lid_stud_height);
                translate([lid_widthoffset, lid_lengthoffset, thickness])
                    rotate([0,0,180])
                        box_screw(screw_dia, od, lid_stud_height);
                translate([column_offset, lid_lengthoffset, thickness])
                    rotate([0,0,270])
                        box_screw(screw_dia, od, lid_stud_height);
                }
                translate([thickness + (lip_tol/2), thickness + (lip_tol/2), 0])
                cube([lip_width , lip_length, 10]);
            }

        }

        //windows, Holes and Screws
        union()
        {
            translate([column_offset, column_offset, thickness])
                cylinder(h = thickness + lid_stud_height + 2, d = screw_loose_dia, center=true, $fs=0.2);
            translate([lid_widthoffset, column_offset, thickness])
                cylinder(h = thickness + lid_stud_height + 2, d = screw_loose_dia, center=true, $fs=0.2);
            translate([lid_widthoffset, lid_lengthoffset, thickness])
                cylinder(h = thickness + lid_stud_height + 2, d = screw_loose_dia, center=true, $fs=0.2);
            translate([column_offset, lid_lengthoffset, thickness])
                cylinder(h = thickness + lid_stud_height + 2, d = screw_loose_dia, center=true, $fs=0.2);
 
           if (generate_window_1){ 
            translate([(((outside_width-window_1_x)/2)+window_1_offset_x),(((outside_length-window_1_y)/2)+window_1_offset_y),-5]) 
            cube([window_1_x,window_1_y,50]);
           }
           if (generate_window_2){ 
            translate([(((outside_width-window_2_x)/2)+window_2_offset_x),(((outside_length-window_2_y)/2)+window_2_offset_y),-5]) 
            cube([window_2_x,window_2_y,50]);
           }
           
            if (generate_hole_1){ 
            translate([((outside_width/2)+hole_1_offset_x),((outside_length/2)+hole_1_offset_y),-5]) 
            cylinder(h = 50, d = hole_1_dia);
           }
           if (generate_hole_2){ 
            translate([((outside_width/2)+hole_2_offset_x),((outside_length/2)+hole_2_offset_y),-5]) 
            cylinder(h = 50, d = hole_2_dia);
           }
           if (generate_hole_3){ 
            translate([((outside_width/2)+hole_3_offset_x),((outside_length/2)+hole_3_offset_y),-5]) 
            cylinder(h = 50, d = hole_3_dia);
           }
           if (generate_hole_4){
            translate([((outside_width/2)+hole_4_offset_x),((outside_length/2)+hole_4_offset_y),-5]) 
            cylinder(h = 50, d = hole_4_dia);
           }
           
           
        }

    }
}

if (generate_box)
{
    main_box();
}
if (generate_lid) 
{    
    translate([lid_startpos,0,0])
    lid();
}    


