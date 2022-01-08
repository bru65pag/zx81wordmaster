    REM WORD MASTER
@init:    
    LET W$ = "TABLE"
    LET L=2
    LET ROW = 2
    LET COUNT = 0

    GOTO @main


@perfectmatch:
    REM add right letter at right location to X$
    LET X$=X$+I$(Y)
    RETURN


@match:
    REM add right letter at wrong location to Y$
    LET Y$=Y$+I$(Y)
    RETURN

@won:
    PRINT "YOU WON IN " + STR$ COUNT + " TURNS";
    STOP

@turnresults:
    PRINT X$ + " / " + Y$
    RETURN

@lost:
    PRINT "YOU LOST";
    PRINT " BYE"
    STOP     

@main:
    FOR T=1 TO 6
        LET COUNT = COUNT + 1
        REM X$ CORRECT LETTERS AT CORRECT LOCATION 
        LET X$ = ""
        REM Y$ CORRECT LETTERS AT WRONG LOCATION
        LET Y$ = ""
        INPUT I$
        IF LEN I$<>5 THEN GOTO 60
        PRINT AT L*T,0;I$ + ": ";
        FOR X=1 TO LEN W$
            FOR Y=1 TO LEN W$
                IF I$(Y)=W$(X) AND Y=X THEN GOSUB @perfectmatch
                IF I$(Y)=W$(X) AND Y<>X THEN GOSUB @match
            NEXT Y
        NEXT X
        IF LEN X$ = 5 THEN GOTO @won
        GOSUB @turnresults
    NEXT T
    GOTO @lost