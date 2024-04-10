#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM spec */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [(!((((p_status[0]==RUNNING)||(p_status[1]==RUNNING))||(p_status[2]==RUNNING))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !((((now.p_status[0]==1)||(now.p_status[1]==1))||(now.p_status[2]==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:8 - [(!((((p_status[0]==RUNNING)||(p_status[1]==RUNNING))||(p_status[2]==RUNNING))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][8] = 1;
		if (!( !((((now.p_status[0]==1)||(now.p_status[1]==1))||(now.p_status[2]==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 6: // STATE 1 - alt.pml:39 - [p_status[0] = IDLE] (0:4:3 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.p_status[0];
		now.p_status[0] = 3;
#ifdef VAR_RANGES
		logval("p_status[0]", now.p_status[0]);
#endif
		;
		/* merge: p_status[1] = IDLE(4, 2, 4) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = now.p_status[1];
		now.p_status[1] = 3;
#ifdef VAR_RANGES
		logval("p_status[1]", now.p_status[1]);
#endif
		;
		/* merge: p_status[2] = IDLE(4, 3, 4) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[2] = now.p_status[2];
		now.p_status[2] = 3;
#ifdef VAR_RANGES
		logval("p_status[2]", now.p_status[2]);
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 7: // STATE 4 - alt.pml:43 - [(run pi(0,2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 5 - alt.pml:44 - [(run pi(1,2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(addproc(II, 1, 0, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 6 - alt.pml:45 - [(run pi(2,1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 0, 2, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - alt.pml:48 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC pi */
	case 11: // STATE 1 - alt.pml:18 - [((p_status[i]==IDLE))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.p_status[ Index(((P0 *)_this)->i, 3) ]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - alt.pml:18 - [p_status[i] = REQUESTING] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.p_status[ Index(((P0 *)_this)->i, 3) ];
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = 2;
#ifdef VAR_RANGES
		logval("p_status[pi:i]", now.p_status[ Index(((P0 *)_this)->i, 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - alt.pml:19 - [(((p_status[i]==REQUESTING)&&(available>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((now.p_status[ Index(((P0 *)_this)->i, 3) ]==2)&&(now.available>0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - alt.pml:20 - [available = (available-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.available;
		now.available = (now.available-1);
#ifdef VAR_RANGES
		logval("available", now.available);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - alt.pml:21 - [occupied = (occupied+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->occupied;
		((P0 *)_this)->occupied = (((P0 *)_this)->occupied+1);
#ifdef VAR_RANGES
		logval("pi:occupied", ((P0 *)_this)->occupied);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - alt.pml:23 - [((occupied==max))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!((((P0 *)_this)->occupied==((P0 *)_this)->max)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - alt.pml:23 - [p_status[i] = RUNNING] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = now.p_status[ Index(((P0 *)_this)->i, 3) ];
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = 1;
#ifdef VAR_RANGES
		logval("p_status[pi:i]", now.p_status[ Index(((P0 *)_this)->i, 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 8 - alt.pml:24 - [((occupied<max))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((P0 *)_this)->occupied<((P0 *)_this)->max)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 11 - alt.pml:26 - [((p_status[i]==RUNNING))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((now.p_status[ Index(((P0 *)_this)->i, 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 12 - alt.pml:28 - [((p_status[i]==RUNNING))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((now.p_status[ Index(((P0 *)_this)->i, 3) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 13 - alt.pml:29 - [occupied = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->occupied;
		((P0 *)_this)->occupied = 0;
#ifdef VAR_RANGES
		logval("pi:occupied", ((P0 *)_this)->occupied);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 14 - alt.pml:30 - [available = (available+max)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = now.available;
		now.available = (now.available+((P0 *)_this)->max);
#ifdef VAR_RANGES
		logval("available", now.available);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 15 - alt.pml:31 - [p_status[i] = IDLE] (0:0:1 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = now.p_status[ Index(((P0 *)_this)->i, 3) ];
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = 3;
#ifdef VAR_RANGES
		logval("p_status[pi:i]", now.p_status[ Index(((P0 *)_this)->i, 3) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 19 - alt.pml:33 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

