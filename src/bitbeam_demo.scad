// Demo of Biteam parts

//Parts are defined in this file
include <bitbeam_parts.scad>;

// Use ths projection for laser cutting
//projection(cut=true)

//Spacing between parts along the x axis
sx = 60; 



// GUIDE //
// An axle can be guided by this type of element
translate([sx*0,0,0])
  guide(10);


// BEAM //
translate([sx*1,0,0])
  beam_straight(10);


// BRACKET //
translate([sx*2,0,0])
  bracket(90,10,5);


// BRACKET STRONG //
// A sronger vesion of the bracket
translate([sx*3,0,0])
  bracket_strong(90,10,5);


// PLATE //
// Default is holes along all edges
translate([sx*4,0,0])
  plate_square(5,10);


// PLATE // 
// Uing the optional parameters to only
// have holes along two edges
translate([sx*5,0,0])
  plate_square(5,10,1,1,0,0);


// FRAME //
// A frame with holes along the edges 
translate([sx*6,0,0])
  frame(5,10);




