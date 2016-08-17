// Duplo-compatible marble run pieces (C) by Joachim Eibl 2013
// Licence: CC BY-NC-SA 3.0 
// Creative Commons: attribution, non commercial, share alike
// See: http://creativecommons.org/licenses/by-nc-sa/3.0/
// LEGO and DUPLO are trademarks of the Lego group.

// Version 2 (added longRampPiece and cosinusSlopedRampPiece)

// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778
include <duplo-block-lib.scad>

quality = 90; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering 
innerRadius=14*dr/16;

pr = 2*dr + 5; // plate raster

// if some pieces are missing: "Edit"->"Preferences"->"Advanced"->"Turn off rendering at: " [1000000] "elements"

// Choose either plate or individual pieces from the plates.
//smallPlate(); // simple pieces, each only once
//bigPlate();     // more straight and corner pieces


//straightPiece();
//cornerPiece();
//rampPiece();
//ramp2Piece();
//longRampPiece();
//cosinusSlopedRampPiece();
//crossingPiece();
//straightHolePiece(); 
//cornerHolePiece(); 
//rampCornerPiece(steps=quality);
//mirror([0,1,0]) rampCornerPiece(steps=quality);
//endPiece();

//bridgePiece();
//bridgeBottomPiece();


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

module bridgePiece()  // makeme
{
    difference()
    {
        duploMarbleRunBase(4,2,2, true, false);
        translate([0,dr+1, -duploHeight+2]) rotate([90,0,0])
            cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
    }
}

module bridgeBottomPiece() // makeme
{
   difference() {
      duploMarbleRunBase(4,2,2,true);
      translate([0,dr+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
}

//translate([0,0,-duploHeight*2])straightPiece();
module smallPlate()
{
   translate([pr,pr,0])            straightPiece();
   translate([pr,0,0])             cornerPiece();
   translate([0,0,duploHeight])    rampPiece();
   translate([0,pr,0])             endPiece();
}

module bigPlate()
{
   for( i=[0:1]) {
      translate([pr,pr*i,0])                       straightPiece(); 
      translate([2*pr ,pr*i,0])                    cornerPiece(); 
   }
   translate([pr,pr*2,0])                          straightPiece();
   translate([pr,pr*3,0])                          crossingPiece();
   for( i=[2:3]) { 
      translate([2*pr ,pr*i,0])                    endPiece(); 
   }
   translate([0*pr,pr*1,duploHeight])              rampPiece();
   translate([0*pr,pr*0,duploHeight])              ramp2Piece();
   for( i=[0:1]) {
      translate([-pr,pr*(i+2),duploHeight])        straightHolePiece(); 
      translate([0*pr,pr*(i+2),duploHeight])       cornerHolePiece(); 
   }

   translate([-pr,0,duploHeight])                  rampCornerPiece(steps=quality); 
   translate([-pr,pr,duploHeight]) mirror([0,1,0]) rampCornerPiece(steps=quality); 
}

module duploMarbleRunBase(width,length,height,topNibbles,bottomHoles)
{
   union() {
      duplo(width,length,height,topNibbles,bottomHoles);
      translate([0,0,3])
         cube([width*duploRaster-0.4,length*duploRaster-0.4,duploHeight*height-6],center=true);
   }
}

module straightPiece() // makeme
{
   difference() {
      duploMarbleRunBase(2,2,2,false);
      translate([0,dr+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module straightHolePiece()
{
   difference() {
      duploMarbleRunBase(2,2,4,true);
      translate([0,dr+1, 0*duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module crossingPiece() // makeme
{
   difference() {
      duploMarbleRunBase(2,2,2,false);
      translate([0,dr+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
      translate([-dr-1,0, duploHeight+2]) rotate([0,90,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
}

module endPiece() // makeme
{
   difference() {
      duploMarbleRunBase(2,2,2,false);
      union() {
         translate([0,dr+2, duploHeight+2]) rotate([90,0,0])
            cylinder( dr+2, innerRadius, innerRadius,$fn = quality*2 );
         translate([0,0, duploHeight+2]) rotate([90,0,0])
            sphere( innerRadius, $fn = quality*2 );
      }
   }
}

module cornerPiece() // makeme
{
   difference() {
      duploMarbleRunBase(2,2,2,false);
      translate([-dr,-dr,duploHeight+2])rotate_extrude(convexity = 10, $fn = quality*2)
         translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
   }
}

module cornerHolePiece()
{
   difference() {
      duploMarbleRunBase(2,2,4,true);
      translate([-dr,-dr,0*duploHeight+2])rotate_extrude(convexity = 10, $fn = quality*2)
         translate([dr, 0, 0]) circle(r = innerRadius, $fn = quality*2);
   }
}

module rampPiece() // makeme
{
   angle = 30.964; // 180 / 3.14159 * atan(duploHeight/duploRaster);
   vscale = 0.8575; // cos(angle);
   difference() {
      duploMarbleRunBase(2,2,4,false);
      
      union() {
         translate([0,dr+1, 2*duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
            cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );   
         translate([-2*dr,dr+0, 2*duploHeight+0]) rotate([90+angle,0,0])
            cube( [duploRaster*4,duploRaster*8,duploRaster*4] );   
      }
   }
}

module ramp2Piece() // makeme
{
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   difference() {
      duploMarbleRunBase(2,2,4,false);      
      union() {
         translate([0,dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,2*dr+0, 1.5*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*4] );       
      }
   }
}

module longRampPiece() // makeme
{
   angle = 16.699; // 180 / 3.14159 * atan(0.5*duploHeight/duploRaster);
   vscale = 0.9578; // cos(angle);
   difference() {
      duploMarbleRunBase(2,4,4,false);      
      union() {
         translate([0,0*dr+1, duploHeight+2]) rotate([90+angle,0,0]) scale([1,vscale,1])
                  cylinder( duploRaster*6, innerRadius, innerRadius,, center=true, $fn = quality*2 );     
         translate([-2*dr,4*dr+0, 3*duploHeight+0]) rotate([90+angle,0,0])
                  cube( [duploRaster*4,duploRaster*4,duploRaster*8] );       
      }
   }
}

module cosinusSlopedRampPiece() // makeme
{
   difference() {
      duploMarbleRunBase(2,4,4,false);
      cosinusSlopedRamp(quality);      
   }
}

module cosinusSlopedRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([0,-2*dr,duploHeight])
   for(i=[0:180/steps:180])
   {
      translate([0,+i/180*dr*4-0.01,-cos(i)*duploHeight+2]) 
      multmatrix(m = [ [1, 0, 0, 0], [0, 1, 0, 0], [0, sin(i)*0.5, 1, 0], [0, 0, 0, 1] ]) 
      union() {
         rotate([-90,0,0]) cylinder(h=4.1*dr/steps,r=innerRadius, $fn=steps);
         translate([-dr,0,-2]) cube([4*dr,4.1*dr/steps,2*dr]);
      }
   }
}

module rampCornerPiece(steps)
{
   difference() {
      duploMarbleRunBase(2,2,4,false);
      cornerRamp(steps);      
   }
}

module cornerRamp(steps) // nr of steps: e.g. coarse=10, fine=90
{
   translate([-dr,-dr,2])
   for(i=[0:90/steps:90])
   {
      rotate([0,0,i]) translate([dr,0,i/90*2*duploHeight]) {
         // Using the rotate&shearing matrix produces nicer results with less steps.
         multmatrix(m = [ [1, 0, 0, 0], [0, 0, 1, -50/steps], [0, 1, 0.4, 0], [0, 0, 0, 1] ]) 
             union() {
                cylinder(h=50/steps,r=innerRadius, $fn=steps);
                translate([-dr,-2,0]) cube([4*duploRaster,4*duploRaster,70/steps]);
             }
      }
   }
}

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
