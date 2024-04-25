/*
name: Charles Dudley
netid: cddudley

2.1 
    deadlock possible <===> M + 3 <= N0 + N1 + N2

    more generally (and informally):
        deadlock possible <===> M + NUM_PROCS <= SUM(N_i)

2.2
        In order to fix the deadlock issue, we could strengthen the requirements
    for a process to transition from "IDLE" to "REQUESTING". In the
    current implementation, any request is free to make this transition regardless
    of the state of the system. We could restrict processes to only make this transition
    when doing so will not create a need which exceeds our memory budget. In this case we
    will never allow a process to request more resources than are currently available, so
    once REQUESTING there will always be sufficient memory for that process. We can do this
    by keeping track of an additional field 'total_need' which tracks the total resoures
    needed for all REQUESTING and RUNNING processes.

        A global field should be added called 'total_need' (initialized to 0)

        The body for the first case of the 'do' loop should enforce our restriction, blocking
    until satisfied:
            if
            :: available >= (total_need + max) ->
                total_need = total_need + max;
                p_status[i] = REQUESTING;
            fi;

        Upon a process' transition from RUNNING to IDLE (final block of 'do' loop), total_need 
    should be decremented accordingly.

*/
#define M  15

#define N0 14
#define N1 2
#define N2 1

mtype = {IDLE, REQUESTING, RUNNING}

mtype p_status[3] = IDLE;

show short available = M;

proctype pi(short i; short max)
{
    short occupied = 0;

    do
    :: p_status[i] == IDLE -> 
        p_status[i] = REQUESTING;
    :: p_status[i] == REQUESTING ->
        atomic{
            if
            :: available > 0 ->
                available--;
                occupied++;
                if
                :: occupied == max -> p_status[i] = RUNNING;
                :: occupied < max -> ;
                fi;
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
        ) }
