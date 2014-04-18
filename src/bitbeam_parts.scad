include <bitbeam_constants.scad>;



// rack gear. length should be divisable
// by. Otherwise gear spacing will not match
// when having more racks after each other.

//translate([-6*hs,0,0]) guide(14);

// The guide slot is length-2 long in order to strengthen ends.

module guide(length,height=4) {
  difference() {
    translate([-hs,0,0])
    plate_square(height,length,0,0,0,1);
    // The guide slot
    hull(){
      translate([0,hs,0])
      bb_holes(1);
      translate([0,(length-2)*hs,0])
      bb_holes(1);
    }
  }
}

// FRAME //

// A square frame with holes along the edges
module frame(height, width) {
  difference() {
    // A plate
    plate_square(height,width);
    // Block for punching hole in plate
    translate([hs/2, hs/2, -bh/2])
    cube([(height-2)*hs, (width-2)*hs, bh*2]);
  }
}


// PLATE //

// A plate with potential holes along the edges
module plate_square(height,width,r1=1,r2=1,r3=1,r4=1) {
  difference() {
    // The square
    minkowski() {
      cube([(height-1)*hs, (width-1)*hs, ph/2]);
      cylinder(r=bw/2, h=ph/2);
    }
    // Rows along x
    if (r1==1) {
      rotate([0,0,-90])
      bb_holes(height);
    }
    if (r2==1) {
      rotate([0,0,-90])
      translate([-hs*(width-1),0,0])
      bb_holes(height);
    }
    // Rows along y axis
    if (r3==1) {
      bb_holes(width);
    }
    if (r4==1) {
      translate([hs*(height-1),0,0])
      bb_holes(width);
    }   
  } // Diff
}  


// BRACKET //

// Two beams combined at at angle
module bracket(angle,height,width) {
  union(){
    beam_straight(height);
    rotate([0,0,angle])
    beam_straight(width);
  }
}

// STRONG BRACKET // 
// Two beams combined at at angle
module bracket_strong(angle,height,width) {

  difference() {
  hull() {
    bracket(angle,height,width);
  }
    bb_holes(height);
    rotate([0,0,angle])
    bb_holes(width);
  }

}




// A beam with rounded ends of length x holes
module beam_straight(holes) {
  difference() {
    // The beam
    hull() {
      // One end
      cylinder(r=bw/2, h=bh);

      // Other end
      translate([0,(holes-1)*hs,0])
      cylinder(r=bw/2, h=bh);
    }
    // The holes
    bb_holes(holes);
  } // diff
} // beam



// ELEMENTS //


// A row of standard holes along the y axis
module bb_holes(holes) {
  for (i = [0:holes-1]) {
    translate([0, i*hs, -bh/2])
    cylinder(r=hw/2,bh*2);
  }
}



