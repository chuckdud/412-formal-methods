#define M  3
#define N0 2
#define N1 2
#define N2 1

mtype = {IDLE, REQUESTING, RUNNING}

mtype p_status[3] = IDLE;

show short available = M;

proctype pi(short i; short max)
{
    // show mtype status = IDLE; 
    short occupied = 0;

    do
    :: p_status[i] == IDLE -> p_status[i] = REQUESTING;
    :: p_status[i] == REQUESTING  && available > 0 ->
        available--;
        occupied++;
        if
        :: occupied == max -> p_status[i] = RUNNING;
        :: occupied < max -> ;
        fi;
    :: p_status[i] == RUNNING ->
        //progress_label:;
    :: p_status[i] == RUNNING ->
        occupied = 0;
        available = available + max;
        p_status[i] = IDLE;
    od;
}

init
{
    atomic
    {
        p_status[0] = IDLE;
        p_status[1] = IDLE;
        p_status[2] = IDLE;

        run pi(0, 2);
        run pi(1, 2);
        run pi(2, 1);
    }

}

ltl spec { 
    []<>(
        (p_status[0] == RUNNING ||
         p_status[1] == RUNNING ||
         p_status[2] == RUNNING) 
        )
}