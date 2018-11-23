// Az eredeti függvény (egg) a tojást a tetejétől kezdi el megrajzolni.

egginess = 0; //[-100:100]

//tojas_alja_ureges(steps=80, height=200, curveFactor = (100 + egginess) / 100, faces=200, p=0.9);


tojas_teteje(steps=80, height=200, curveFactor = (100 + egginess) / 100, faces=200, p=0.1);

 //r1 = eggCurve(height, height * (0.78 * curveFactor), p*steps, height/steps);
 
 
 //translate([0,0,174])karima(sc=0.95);


// az sc paraméter csak a gyűrű keresztmetszetét skáláza, a gyűrű középvonalának átmérője nem változik.
module karima(sc=1){
    r_belso = eggCurve(200-7, (200-7)*0.78, 0.1*80 - (5/((200-7)/80))+1.8, (200-7)/80);
    echo(r_belso);
    rotate_extrude($fn=200){
    translate([r_belso-2-2*sc,0,0])scale(sc)polygon([[0,0],[0,2], [2,4.5], [4,2],[4,0], [0,0]]);
}

//translate([0,0,180])cylinder(r=r_belso, h = 10);
}

//egg(steps=80, height=200, curveFactor = (100 + egginess) / 100, faces=20);
//translate([0,200,0])egg(steps=80, height=200, curveFactor = (100 + 50) / 100, faces=20);

//This makes an egg
//New
//-Fixed egg floating above 0 now sits on 0 like a cylinder

module tojas_ureges(steps, height, curveFactor=1, faces=50, p){
    difference(){
        egg_partial(steps, height, curveFactor, faces,(1-p)*steps, steps);
        translate([0,0,5])#egg_partial(steps, height-7, curveFactor*1, faces, 0, steps);
    }
}

module tojas_alja_ureges(steps=50, height=300, curveFactor = 1, faces=50, p){
    translate([0,0,-4])
        difference(){
            tojas_ureges(steps, height, curveFactor, faces,p);
            translate([-height/2,-height/2,height*p]) cube([height, height,height]);
            cylinder(r=height, h=4);
            r1 = eggCurve(height, height * (0.78 * curveFactor), (1-p)*steps, height/steps);
            //translate([0,0, height*p-3]) cylinder(r1=r1-2, r2=r1, h=3);
        }
}

//P adja meg, hogy a tető hány százalék kell megrajzolni.

module tojas_teteje(steps, height, curveFactor=1, faces=50, p){
    translate([0,0,-4]){
        difference(){
            egg_partial(steps, height, curveFactor, faces, 0, steps*p-1);
            translate([-height/2,-height/2,-height/10]) cube([height, height,height]);
            translate([0,0,178])karima();
        }
        
        r1 = eggCurve(height, height * (0.78 * curveFactor), p*steps, height/steps);
        //translate([0,0, height*(1-p)-3]) #cylinder(r1=r1-2, r2=r1, h=3, $fn=min(faces, r1*6));
    }
}




//Equation for the egg curve
function eggCurve(a,b, offset, step ) = sqrt( 
                              a - b - 2 * offset * step 
                              + sqrt( 4 * b * offset * step + pow(a - b, 2) ) ) 
                              * sqrt(offset * step) / sqrt(2);

module egg(steps=60, height = 100, curveFactor = 1, faces = 45){
    egg_partial(steps, height, curveFactor, faces, 0, steps);
}

module egg_partial( steps, height, curveFactor, faces, start_step, end_step) {	
    a = height;
    b = height * (0.78 * curveFactor);  //Through keen observation I have determined that egginess should be 0.78

    echo("hajrá");

	
	step = a / steps;
	union() {
        //This resembles the construction of a UV sphere
        //A series of stacked cylinders with slanted sides
        for( i = [start_step:end_step]) {
		  //echo(i * step);
          echo(i, eggCurve(a, b, i, step));
          r1 = eggCurve(a, b, i + 1, step );
		  r2 = eggCurve(a, b, i, step );
		  translate( [0, 0, a - ( i + 1 ) * step - 0.01] )
		    cylinder(r1=r1,
                     r2=r2,
		             h = step,
		             //$fn = r1*12 );
                     $fn = min(faces, r1*6));
		}
    }
}
