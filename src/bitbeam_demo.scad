// Demo of Biteam parts

include <bitbeam_parts.scad>;


// Projection for laser cutting
//projection(cut=true)

// Guides
for (i = [0:3]) {
  translate([i*40,0+80,0])
  guide((i+2)*3);
}

// Straight beams
for (i = [0:3]) {
  translate([i*40,0,0])
  beam_straight((i+1)*2);
}


// Brackets
for (i = [0:3]) {
  translate([i*40,-50,0])
  // angle, length, length
  bracket(i*22.5+90,i+1*2,4);
}

// Plate
for (i = [0:3]) {
  translate([i*40,-120,0])
  plate_square(i+1*2,i+1*2);
}

// Plate with two rows of holes 
for (i = [0:3]) {
  translate([i*40,-180,0])
  plate_square(i+1*2,i+1*2,1,1,0,0);
}


// Frames
for (i = [0:3]) {
  translate([i*40,-240,0])
  frame(i+1*2,i+1*2,0,1,1,0);
}



