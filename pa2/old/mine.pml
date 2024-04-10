// #define NUM_PROCS 3

byte p_status[3];

show byte M = 2;

proctype pi(byte i; byte max)
{
    // show mtype p_status[i] = 0; 
    byte occupied = 0;

    do
    :: p_status[i] == 0 -> p_status[i] = 1;
    :: p_status[i] == 1 ->
        if
        :: M > 0 -> 
            M--;
            occupied++;
            if
            :: occupied == max -> p_status[i] = 2;
            :: occupied < max -> ;
            fi;
        :: M <= 0 -> ;
        fi;
    :: p_status[i] == 2 ->
        progress_label:;
    :: p_status[i] == 2 ->
        occupied = 0;
        M = M + max;
        p_status[i] = 0;
    od;
}

init
{
    atomic
    {
        p_status[0] = 0;
        p_status[1] = 0;
        p_status[2] = 0;
    }

    run pi(0, 2);
    run pi(1, 2);
    run pi(2, 1);
}

ltl spec { []<>(M > 0) }
