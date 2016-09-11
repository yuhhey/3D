use <libpeter.scad>;

f=1.5; // number fatness
nh=8; // number height

findiam=10.2; // fitting inner diameter
condiam=9.2; // connector outer diameter

radcur=260.0;  // radius of curvature for bends



module start(x,y,or){
  translate(v=[x,y,0]){
   	rotate(a=or,v=[0,0,1]){
	     difference(){
	        union(){
	      		difference(){
			         //main
			         cube(size=[15.85,63.65, 6.5]);
			
			         // internal/bottom cavity
			         translate(v=[1.5,1.5,-1.5])
			         cube(size=[12.85,60.65, 6.5]);
			 
			      }
			
			      // ridge supporting roof
			      rectsupportingridge(1.5,1.5,5-1,0,12.85,60.65,1);
			
			      // internal support structure
			      difference(){
			        union(){
                     // increasing the bottom surface area:
			          cube(size=[15.85,63.65, 6.5]);

			          // vertical walls
			          translate(v=[8.45-1.25,0,0])
			          cube(size=[1.25,63.65,6.5]);
			          for (i=[0:3]){
			         	  translate(v=[0,8.45-1.25+16*i,0])
				          cube(size=[15.85,1.25,6.5]);          
			          } 
			          // rings
			          for (i=[0:3]){
				          translate(v=[8.45-1.25/2,15.85/2+i*16,0])
				          cylinder(h=6,r=findiam/2+1.25,center=True);
			          }
			         }
			        union(){
			          for (i=[0:3]){
				          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
				          cylinder(h=11,r=findiam/2,center=True);
			          }
			        }
			
			      }
			
			      // central plateau
			      translate(v=[0,(63.65-28)/2,6.5])
			      cube(size=[15.85,28,3.6],center=False);
	
	              // straigth vertical walls of rail section connector hole
	              translate(v=[0,15.85/2+2*16-5.5,])
	        	   cube(size=[8.45,11,10.1],center=False);	
	
		           // rail section connector
		         	union(){
			          translate(v=[-8.45+1.25/2,15.85/2+16,8.1])
					   cylinder(h=2,r=condiam/2,center=True);
			          translate(v=[-8.45+1.25/2,15.85/2+16,5.1])
					   cylinder(h=3,r1=2.5, r2=condiam/2,center=True);      
			          translate(v=[-8.45+1.25/2,15.85/2+16,0])
					   cylinder(h=6,r=2.5,center=True);
			          translate(v=[-8.45+1.25/2,15.85/2+16-3,6.1])
				       cube(size=[8.45,6,4],center=True);
	                  supportbeam(0,15.85/2+16-3,3.1,90,6,3);
		           }
	          }
	       
	           // rail section connector hole
	         	union(){
		          translate(v=[8.45-1.25/2,15.85/2+2*16,-1])
				   cylinder(h=22,r=findiam/2,center=True);
	              translate(v=[-0.1,15.85/2+2*16-4,-1])
				   cube(size=[8.45,8,22],center=True);	      
	           }
	       }
	   }
   }
}

module center(x,y,or){ 
   translate(v=[x,y,0]){

     rotate(a=or,v=[0,0,1]){
        union(){
      		difference(){
		         //main
		         cube(size=[2*15.85,63.65, 6.5]);
		
		         // internal/bottom cavity
		         translate(v=[1.5,1.5,-1.5])
		         cube(size=[2*15.85-3,60.65, 6.5]);
		 
		      }
		
		      // ridge supporting roof
		      rectsupportingridge(1.5,1.5,5-1,0,2*15.85-3,60.65,1);
		
		      // internal support structure
		      difference(){
		        union(){
		          // vertical walls
		          translate(v=[8.45-1.25,0,0])
		          cube(size=[1.25,63.65,6.5]);
		          translate(v=[8.45-1.25+15.85,0,0])
		          cube(size=[1.25,63.65,6.5]);
		          for (i=[0:3]){
		         	  translate(v=[0,8.45-1.25+16*i,0])
			          cube(size=[2*15.85,1.25,6.5]);          
		          } 
		          // rings
		          for (i=[0:3]){
			          translate(v=[8.45-1.25/2,15.85/2+i*16,0])
			          cylinder(h=6,r=findiam/2+1.25,center=True);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,0])
			          cylinder(h=6,r=findiam/2+1.25,center=True);		          }
		         }
		        union(){
		          for (i=[0:3]){
			          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=True);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=True);
		          }
		        }
		
		      }
		
		      // central plateau
		      translate(v=[0,(63.65-28)/2,6.5])
		      cube(size=[2*15.85,28,3.6],center=False);

          }
       
       }
   }
}

module singlerail(x,y,z,a){
   translate(v=[x,y,z]){
      rotate(a=a,v=[0,0,1]){
         union(){
            //vertical wall (bottom)
            translate(v=[0,15.5,0])
            cube(size=[2*32.40+4*15.85,1.5,7.35]);
            // horizontal beam
            translate(v=[0,15.5-12.6+1.5,5.35])
            cube(size=[2*32.40+4*15.85,12.6,2]);
            // triangular cross section wall
            translate(v=[0,2.5+16.0,7+8.85])
            scale(v=[1,2.5,9])
            rotate(a=180,v=[1,0,0])
            supportbeam(0,0,0,0,2*32.40+4*15.85,1);
            // support beams
            supportbeam(0,17,5.45,0,2*32.40+4*15.85,1.5);
            supportbeam(0+2*32.40+4*15.85,16,4.35,180,2*32.40+4*15.85,1);

		      // internal support structure
		      difference(){
		        union(){
		          // rings
		          for (i=[1,2,5,6]){
	
			          translate(v=[8+i*16.0,15.85/2,0])
			          cylinder(h=6,r=findiam/2+1.25,center=True);		          
		         }
               }
		        union(){
		          for (i=[1,2,5,6]){
			          translate(v=[8+i*16.0,15.85/2,-1])
			          cylinder(h=20,r=findiam/2,center=True);
		          }
                }
                translate(v=[-1,-1,-1])
                cube(size=[150,15.5-12.6+2.5,16]);
              }

           // grip profile
           for (i=[0:127]){
              translate(v=[i,6,7.35])
              cube(size=[0.5,12,0.5]);
           }
            
         }
      }
   }
}

module ringrails(r,startangle, endangle){
   ro=r+63.65;
   difference(){
      union(){
      	rotate_extrude($fn=200)
	      polygon(
	         points=[[0,5.35],[0,7.35],[r+16,7.35],[r+18.5,16.35],
	                  [r+18.5,7.35],[r+17,5.85],  [r+17,0],[r+15.5,0],
	                  [r+15.5,3.85], [r+14,5.35]]  );
        difference(){
	      	rotate_extrude($fn=200)
		      polygon(
		         points=[[0,7.35],[ro-18.5,7.35], [ro-17,5.85],
                        [ro-17,0], [ro-15.5,0], [ro-15.5,3.85],
                        [ro-14,5.35], [ro-4.4,5.35], [ro-4.4,7.35],
                        [ro-16,7.35], [ro-18.5,16.35], [0,16.35]]);
             cylinder($fn=200,r=r+63.65-18.5, h=40, center=true);
        }
 

      }
      // central hole
      cylinder($fn=200,r=r+4.4, h=40, center=true);
      // start angle
      rotate(a=startangle,v=[0,0,1])
      translate(v=[-radcur-100,-radcur-100,-50])
      cube(size=[radcur+100,2*radcur+200,100], center=False);
       // end angle
      rotate(a=endangle,v=[0,0,1])
      translate(v=[0,-radcur-100,-50])
      cube(size=[radcur+100,2*radcur+200,100], center=False);     
      
   }
}
           


module railsection(x,y,a){
   translate(v=[x,y,0]){
      rotate(a=a,v=[0,0,1]){
         difference(){
	         union(){
	            start(0,-63.65/2-radcur,0);
	
                rotate(a=15,v=[0,0,1])
                union(){
			        center(-15.85,-63.65/2-radcur,0);
		            number(2,-15.85+2,32-63.65/2-radcur,10.1,6,nh,f);
		            number(0,-15.85+8.5,32-63.65/2-radcur,10.1,6,nh,f);
		            number(0,-15.85+15,32-63.65/2-radcur,10.1,6,nh,f);
		            number(6,-15.85+21.5,32-63.65/2-radcur,10.1,6,nh,f);
		            number(1,-15.85+5+8,23-63.65/2-radcur,10.1,6,nh,f);
                }

	            rotate(a=30,v=[0,0,1])
	            start(0,63.65/2-radcur,180);

                ringrails(radcur-63.65/2, 0, 30);

                // grip profile on outside rail
                union(){
	                for (i=[0:144]){
	                   rotate(a=0.207*i,v=[0,0,1])
	                   translate(v=[0,-radcur-63.65/2+6,7.35])
	                   cube(size=[0.5,12,0.5],center=False);
	                }
                }
      
                // rails support structure inside
                difference(){
                   union(){
                     	for (angle=[5.5,9.5,20.5,24.5]){
	                     rotate(a=angle,v=[0,0,1])
	                     translate(v=[0,-radcur+63.65/2-15.85/2,0])
	                     difference(){
	                        cylinder(h=6,r=findiam/2+1.25,center=True);		
				             cylinder(h=22,r=findiam/2,center=True);    
	                     }  
                       }
                   } 
                   cylinder($fn=200,r=radcur-63.65/2+4.4, h=40, center=true);
                }
                // rails support structure outside
                difference(){
                   union(){
                     	for (angle=[4.5,7.5,10.5,25.5,22.5,19.5]){
	                     rotate(a=angle,v=[0,0,1])
	                     translate(v=[0,-radcur-63.65/2+15.85/2,0])
	                     difference(){
	                        cylinder(h=6,r=findiam/2+1.25,center=True);		
				             cylinder(h=22,r=findiam/2,center=True);    
	                     }  
                       }
                   } 
                   difference(){

                      cylinder($fn=200,r=2*radcur, h=40, center=true);
                      cylinder($fn=200,r=radcur+63.65/2-4.4, h=40, center=true);
                  }
                }

	
	         }
            // make object have the correct height (14 mm)
            translate(v=[-1.5*radcur,-1.5*radcur,14])
            cube(size=[3*radcur,3*radcur,50]);
         }
      }
   }
}

railsection(0,0,-60);