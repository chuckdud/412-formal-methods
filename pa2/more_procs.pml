/*
deadlock possible <===> M + NUM_PROCS <= SUM(N_i)
*/
#define NUM_PROCS 5

#define M  10

#define N0 9
#define N1 3
#define N2 1
#define N3 1
#define N4 1

mtype = {IDLE, REQUESTING, RUNNING}

mtype p_status[NUM_PROCS] = IDLE;

show short available = M;

proctype pi(short i; short max)
{
    // show mtype status = IDLE; 
    short occupied = 0;

    do
    :: p_status[i] == IDLE -> p_status[i] = REQUESTING;
    :: p_status[i] == REQUESTING  && available > 0 ->
        atomic{
            available--;
            occupied++;
            if
            :: occupied == max -> p_status[i] = RUNNING;
            :: occupied < max -> ;
            fi;
        }
    :: p_status[i] == RUNNING ->
        //progress_label:;
    :: p_status[i] == RUNNING ->
        atomic{
            occupied = 0;
            available = available + max;
            p_status[i] = IDLE;
        }
    od;
}

init
{
    atomic
    {
        p_status[0] = IDLE;
        p_status[1] = IDLE;
        p_status[2] = IDLE;
        p_status[3] = IDLE;
        p_status[4] = IDLE;

        run pi(0, N0);
        run pi(1, N1);
        run pi(2, N2);
        run pi(3, N3);
        run pi(4, N4);

    }

}

ltl spec { 
    []<>(
        (p_status[0] == RUNNING ||
         p_status[1] == RUNNING ||
         p_status[2] == RUNNING ||
         p_status[3] == RUNNING ||
         p_status[4] == RUNNING) 
        ) }
