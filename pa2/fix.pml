/*
name: Charles Dudley
netid: cddudley

2.1 
    deadlock possible <===> M + 3 <= N0 + N1 + N2

    more generally (and informally):
        deadlock possible <===> M + NUM_PROCS <= SUM(N_i)

2.2
    
*/
#define M  15

#define N0 15
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
    :: p_status[i] == REQUESTING && available > 0 ->
        atomic{
            available--;
            occupied++;
            if
            :: occupied == max -> p_status[i] = RUNNING;
            :: occupied < max -> ;
            fi;
        }
    // failing because one can just bounce back and forth between these two cases
    :: p_status[i] == REQUESTING && available == 0 ->
        atomic{
            available++;
            occupied--;
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

        run pi(0, N0);
        run pi(1, N1);
        run pi(2, N2);
    }

}

ltl spec { 
    []<>(
        (p_status[0] == RUNNING ||
         p_status[1] == RUNNING ||
         p_status[2] == RUNNING) 
    )
}

// ltl spec2 {
//     ![]<>(
//         available == 0 &&
//         (p_status[0] == RUNNING ||
//          p_status[1] == RUNNING ||
//          p_status[2] == RUNNING) 
//     )
// }
