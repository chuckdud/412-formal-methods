mdp
                
    module aircraft

        x : [0..7] init 0;  
        y : [0..7] init 0;
        heading : [0..3] init 3; // up=0, right=1, down=2, left=3
        damage : [0..2] init 0; // damage sustained by aircraft

        [go] heading = 0 & y < 7 ->
            .90: (y'=y+1) + 
            .10: (y'=y);
        [go] heading = 1 & x > 0 ->
            .90: (x'=x-1) + 
            .10: (x'=x);
        [go] heading = 2 & y > 0 ->
            .90: (y'=y-1) + 
            .10: (y'=y);
        [go] heading = 3 & x < 7 ->
            .90: (x'=x+1) + 
            .10: (x'=x);
        
        [turn_left] heading = 0 ->
            .90: (heading'=3) + 
            .10: (y'= y < 7 ? y + 1 : y);
        [turn_left] heading = 1 ->
            .90: (heading'=0) + 
            .10: (x'= x > 0 ? x - 1 : x);
        [turn_left] heading = 2 ->
            .90: (heading'=1) + 
            .10: (y'=y > 0 ? y - 1 : y);
        [turn_left] heading = 3 ->
            .90: (heading'=2) + 
            .10: (x'= x < 7 ? x + 1 : x);

        [turn_right] heading = 0 ->
            .90: (heading'=1) + 
            .10: (y'= y < 7 ? y + 1 : y);
        [turn_right] heading = 1 ->
            .90: (heading'=2) + 
            .10: (x'= x > 0 ? x - 1 : x);
        [turn_right] heading = 2 ->
            .90: (heading'=3) + 
            .10: (y'=y > 0 ? y - 1 : y);
        [turn_right] heading = 3 ->
            .90: (heading'=0) + 
            .10: (x'= x < 7 ? x + 1 : x);
        

    endmodule


    // for now, storms cannot move
    module storm70
        present70 : bool init true;

        [go] true ->
            .20: (present70'=!present70) + 
            .80: (present70'=present70);
        [turn_left] true ->
            .20: (present70'=!present70) + 
            .80: (present70'=present70);
        [turn_right] true ->
            .20: (present70'=!present70) + 
            .80: (present70'=present70);
    endmodule

    module storm60 = storm70 [present70=present60] endmodule
    
    module storm71 = storm70 [present70=present71] endmodule
    module storm61 = storm70 [present70=present61] endmodule
    module storm51 = storm70 [present70=present51] endmodule
    
    module storm62 = storm70 [present70=present62] endmodule
    module storm52 = storm70 [present70=present52] endmodule
    module storm42 = storm70 [present70=present42] endmodule
    
    module storm53 = storm70 [present70=present53] endmodule
    module storm43 = storm70 [present70=present43] endmodule
    module storm33 = storm70 [present70=present33] endmodule
    
    module storm44 = storm70 [present70=present44] endmodule
    module storm34 = storm70 [present70=present34] endmodule
    module storm24 = storm70 [present70=present24] endmodule
    
    module storm35 = storm70 [present70=present35] endmodule
    module storm25 = storm70 [present70=present25] endmodule
    module storm15 = storm70 [present70=present15] endmodule
    
    module storm26 = storm70 [present70=present26] endmodule
    module storm16 = storm70 [present70=present16] endmodule
    module storm06 = storm70 [present70=present06] endmodule
    
    module storm17 = storm70 [present70=present17] endmodule
    module storm07 = storm70 [present70=present07] endmodule


    // formula collision = (p=3 & b=7 | p=4 & b=4 | p=6 & b=6 | p=7 & b=3);
