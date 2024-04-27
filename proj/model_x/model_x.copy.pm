mdp
    
    /**
        Two aircraft, PINK (aka P) and BLUE (aka B) are travelling along intersecting trajectories.

        Each aircraft will be capable of actons: [go, slow, turn]
            go: continue on current course at current speed (high probability of moving forward)
            slow: continue on current course at reduced speed (lower probability of moving forward)

        Speed will be represented by probability of moving to next state such that a high probability of moving ahead models higher speed

        The MDP in this case is the air traffic control system that is managing both aircrafts. Therefore the actions modeled in this system
            will be a combination of an action in each aircraft to simulate a synchronized action in each aircraft.

        Do I want them to be able to slow down? Start without and then see

        Actions (of the form "p_x_b_y" for "p takes action x and b takes action y"
            P_go_B_go
            P_go_B_slow
            P_go_B_turn
            P_slow_B_go
            P_slow_B_slow
            P_slow_B_turn
            P_turn_B_go
            P_turn_B_slow
            P_turn_B_turn
            
    */

    module PINK

        // turning aircraft

        // position of turning pircrpft
        p : [1..8] init 1;  

        [go] p != 5 & p != 8 -> 
                        .85: (p'=p+1) + 
                        .15: (p'=p)   ;

        [go] p = 8 ->
                        .85: (p'=5) +
                        .15: (p'=p) ;
        
        [go] p = 5 ->
                        1.0: (p'=p) ; 
        
        [turn] p = 3 ->
                        .90: (p'=6)   +
                        .05: (p'=p+1) +
                        .05: (p'=p+1) ;   

    endmodule


    module BLUE

        // turning aircraft

        // position of turning aircraft
        b : [1..8] init 1;

        //  actions:
        //      go   : move ahead
        //      turn : change trajectory (only possible when a = 3)

        [go] b != 5 & b != 8 -> 
                        .85: (b'=b+1) + 
                        .15: (b'=b)   ;

        [go] b = 8 ->
                        .85: (b'=5) +
                        .15: (b'=b) ;
        
        [go] b = 5 ->
                        1.0: (b'=b) ; 
        
        [turn] b = 3 ->
                        .90: (b'=6)   +
                        .05: (b'=b+1) +
                        .05: (b'=b+1) ;   

        endmodule


    module storm

    // presence of storm (0 = absent, 1 = present)
    p : [0..1] init 0;

    // actions defined here to synchronize with aircraft

    [go]   p = 0 ->  
                    0.90:(p'=p) +
                    0.10:(p'=1);
    [go]   p = 1 ->  
                    0.90:(p'=p) +
                    0.10:(p'=0);

    [turn]   p = 0 ->  
                    0.90:(p'=p) +
                    0.10:(p'=1);
    [turn]   p = 1 ->  
                    0.90:(p'=p) +
                    0.10:(p'=0);

    endmodule
