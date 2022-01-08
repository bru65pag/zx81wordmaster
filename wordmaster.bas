  1 REM 'WORD MASTER'
 10 LET W$ = "TABLE"           // W word to guess
 30 LET ROW = 2                // ROW is the top line where printing starts
 35 FOR TURN=1 TO TURN=6       // 6 turns
 40    INPUT I$                   // I guess word
 50    IF LEN I$<>5 THEN GOTO 60  // repeat until I has a length of 5
 60    PRINT AT LINE*TURN,13;I$ + " "
 70    LET C=0                    // C number of correct letters found
 80    FOR X=1 TO LEN W$
 90        FOR Y=1 TO LEN W$
100            IF I$(Y)=W$(X) AND Y=X THEN GOSUB 200  // letter at good location
110            IF I$(Y)=W$(X) AND Y<>X THEN PRINT AT LINE*TURN+1,0;I$(Y) + " MAL PLACE.";
120        NEXT Y
130    NEXT X
140    IF LETTERS = 5 THEN GOTO 230 // won
150 NEXT TURN
160 GOTO 250 // lost

// good location
200 PRINT AT LINE*TURN+1,0;I$(Y) + " BIEN PLACE. ";
210 LETTERS = LETTERS + 1
220 RETURN

// WON
230 PRINT AT 21,0;"YOU WON IN " + TURN + "TURNS";
240 GOTO 270 // end

// LOST
250 PRINT AT 21,0;"YOU LOST";

270 PRINT " BYE"
280 STOP     