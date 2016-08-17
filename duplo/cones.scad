// Duplo-compatible marble run pieces (C) by Joachim Eibl 2013
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// Version 2 (added longRampPiece and cosinusSlopedRampPiece)

// Turn, Half Ramp, Cones added by Thomas Rauscher

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
include <duplo-block-lib.scad>

quality = 10;  // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
innerRadius=14*dr/16;

pr = 2*dr + 2; // plate raster 

// if some pieces are missing: "Edit"->"Preferences"->"Advanced"->"Turn off rendering at: " [1000000] "elements"

// Choose either plate or individual pieces from the plates.
//smallPlate(); // simple pieces, each only once
//bigPlate();     // more straight and corner pieces

//straightPiece();
//translate([6*dr,3*dr,2*duploHeight])
//longStraightPiece();
//cornerPiece();
//cornerPiece();
//rampPiece();
//ramp2Piece();
//longRampPiece();
//cosinusSlopedRampPiece();
//crossingPiece();
//straightHolePiece(); 
//cornerHolePiece(); 
//rampCornerPiece(steps=quality);
//mirror([0,1,0]) halfRampCornerPiece(steps=quality);
//mirror([0,1,0]) rampCornerPiece(steps=quality);

//mirror([1,0,0]) 
//rampTurnPiece(steps=quality);


//endPiece();

module conePieceNo3()  // makeme
{
    conePiece3(3, support=1);
}

module conePieceNo4()  // makeme
{
    conePiece3(4, support=1);
}

module conePieceNo5()  // makeme
{
    conePiece3(5, support=1);
}

//:q:conePiece3(6,support=0); // can be 3, 4 or 5
//uTurnPiece();
module duploMarbleRunBase(width,length,height,topNibbles,bottomHoles)
{
   union() {
      duplo(width,length,height,topNibbles,bottomHoles);
      translate([0,0,3])
         cube([width*duploRaster-0.4,length*duploRaster-0.4,duploHeight*height-6],center=true);
   }
}


module coneShape3(oRadius,coneHeight,coneQuality) {
	stepSize=5/coneQuality;
	r=(oRadius-innerRadius-dr);
	epsilon=0.001;
	for (i = [0 : stepSize : (0.9999)]) {
		translate([0,0,i*coneHeight])
			cylinder(coneHeight*stepSize+epsilon, innerRadius+pow(i,2)*r, innerRadius+pow(i+stepSize+epsilon,2)*r,$fn = coneQuality ); // top
	}	
	for (i = [0 : stepSize : (0.9999)]) {
		translate([0,0,coneHeight+i*innerRadius])
			cylinder(innerRadius*stepSize+epsilon, r+innerRadius+innerRadius*sqrt(1-pow(1-i,2)), r+innerRadius+innerRadius*sqrt(1-pow(1-i-stepSize-epsilon,2)),$fn = coneQuality ); // top
	}	
}

module conePiece3(coneSize,support=0)
{
	coneDepth=(coneSize<=3)?1.0:1.5;
	carving=1.0;
	inletLength=(coneSize<=3)?2:3;
	tapSupport=(support==0)?-1:(coneSize==5)?10:(coneSize==4)?7:20;

	socketDistance=coneSize-1;
	coneRadius=coneSize*dr;
	coneHeight=coneDepth*duploHeight;
	coneRaise=(1.5-coneDepth)*duploHeight;

	coneQuality=2*quality;

	for (i = [0 : 90 : 270]) {
		rotate([0,0,i]) translate([socketDistance*dr,0,0.5*duploHeight]) {
      		duploMarbleRunBase(2,2,1,false);
      	}
    }
	translate([(coneSize-1)*dr,(1.5+inletLength/2)*dr,0.5*duploHeight]) // inlet brick
      	duploMarbleRunBase(2,inletLength+1,1,true);
	
	difference() 
	{

		union() {
			if (tapSupport>=0) {
				cylinder(coneHeight+innerRadius+coneRaise,coneRadius-tapSupport, coneRadius,$fn = coneQuality ); // solid 
			} else {
				cylinder(coneHeight+innerRadius+coneRaise,innerRadius+2, innerRadius+2,$fn = coneQuality ); // solid 
			}
      		translate([0,0,coneRaise])
      			coneShape3(coneRadius+duploWall,coneHeight,coneQuality*2);	
	      	translate([(coneSize-1)*dr,(1+inletLength)/2*dr,2*duploHeight-1])
				cube([2*dr-gapBetweenBricks,(1+inletLength)*dr-gapBetweenBricks,2*duploHeight+1],true); // inlet wall
			for (i = [0 : 90 : 270]) { // cube sockets
				rotate([0,0,i]) translate([socketDistance*dr,0,1.75*duploHeight-1]) {
	      			cube([2*dr-gapBetweenBricks,2*dr-gapBetweenBricks,2.5*duploHeight],true);
 		     	}
    		}
		}
// */		

      	union() {
			for (i = [0 : 90 : 270]) {
				rotate([0,0,i]) translate([socketDistance*dr,0,0.5*duploHeight]) {
      				translate([0,0,-0*duploHeight-1]) rotate([0,180,0])
      					linear_extrude(height = duploHeight, center = true, convexity = 10, scale=[carving,carving], $fn=100)
      						square([2*dr-2*gapBetweenBricks,2*dr-2*gapBetweenBricks],center = true);
      			}
      		}
      		translate([(coneSize-1)*dr,coneSize*dr,1.5*duploHeight+coneHeight+coneRaise+2]) rotate([90,0,0])
				cylinder( duploRaster*coneSize, innerRadius, innerRadius,$fn = coneQuality ); // inlet
      		translate([0,0,-0.5*duploHeight])
				cylinder(3*duploHeight, innerRadius, innerRadius,$fn = coneQuality ); // hole
      		translate([0,0,2+coneRaise])
      			coneShape3(coneRadius,coneHeight,coneQuality*2);
			if (coneSize>3) {
      			translate([(coneSize-1)*dr,2*dr,0.5*duploHeight-1]) rotate([0,180,0])
      				linear_extrude(height = duploHeight, center = true, convexity = 10, scale=[carving,carving], $fn=100)
      					square([2*dr-2*gapBetweenBricks,4*dr-2*gapBetweenBricks],center = true);
			}
      			
      				
		}
// */      
   }
}