	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM spec */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 6: // STATE 3
		;
		now.p_status[2] = trpt->bup.ovals[2];
		now.p_status[1] = trpt->bup.ovals[1];
		now.p_status[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 7: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC pi */
;
		;
		
	case 12: // STATE 2
		;
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 4
		;
		now.available = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 5
		;
		((P0 *)_this)->occupied = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 7
		;
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 21: // STATE 13
		;
		((P0 *)_this)->occupied = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 14
		;
		now.available = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 15
		;
		now.p_status[ Index(((P0 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;
	}

