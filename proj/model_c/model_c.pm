mdp

module aircraft

    c : [1..5] init 1;

    [go]    c < 5 -> 0.9:(c'=c+1) + 0.1 : (c'=c);
    [turn]  c < 5 -> 0.8:(c'=c) + 0.2 : (c'=c+1);
    [go]    c = 5 -> 1:(c'=c);
    [turn]  c = 5 -> 1:(c'=c); 

endmodule

module storm

    p : [1..5] init 1;

    [go] p < 5 -> 0.7:(p'=p) + 0.3 : (p'=p+1);
    [go] p = 5 -> (p'=p);

    [turn] p < 5 -> 0.7:(p'=p) + 0.3 : (p'=p+1);
    [turn] p = 5 -> (p'=p);

endmodule