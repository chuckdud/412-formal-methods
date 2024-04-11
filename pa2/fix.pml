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
#define N1 6
#define N2 1

mtype = {IDLE, REQUESTING, RUNNING}

mtype p_status[3] = IDLE;

show short available = M;

show short total_need = 0;

proctype pi(short i; short max)
{
    short occupied = 0;

    do
    :: p_status[i] == IDLE -> 
        atomic{
            if
            :: available >= (total_need + max) ->
                total_need = total_need + max;
                p_status[i] = REQUESTING;
            fi;
        }
    :: p_status[i] == REQUESTING ->
        atomic{
            if
            :: available > 0 
                available--;
                occupied++;
                if
                :: occupied == max -> p_status[i] = RUNNING;
                :: occupied < max -> ;
                fi;
            fi;
        }
   :: p_status[i] == RUNNING ->
        // progress_label:;
    :: p_status[i] == RUNNING ->
        atomic{
            occupied = 0;
            total_need = total_need - max;
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
