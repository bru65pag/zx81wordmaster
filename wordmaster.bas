    REM WORD MASTER
        LET STREAK=0
@init:
    CLS    
    LET W$ = "TABLE"
    LET LINE=2
    DIM K$(26)
    FOR I=1 TO 26
        LET A=37+I
        LET K$(I)=CHR$ A
    NEXT I
    GOSUB @printalphabet

    GOTO @main

@won:
    CLS
    LET STREAK = STREAK+1
    PRINT AT 10, 10; "YOU WON";
    PRINT AT 12, 8; "STREAKS = " + STR$ STREAK
    PRINT AT 14,0; "DO YOU WANT TO PLAY AGAIN (Y/N) ?"
@nopress:
    IF INKEY$<>"" THEN GOTO @nopress
@press:
    IF INKEY$="" THEN GOTO @press
    LET A$ = INKEY$
    IF A$<>"Y" AND A$<>"N" THEN GOTO @nopress
    IF A$="Y" THEN GOTO @init
    STOP

@endofturn:
    IF X$="" THEN GOTO @lbl1
    LET LX = LEN X$
    FOR I=1 TO 5
        FOR J=1 TO LX
            IF G$(I)=X$(J) THEN PRINT AT LINE*T+1,12+I;"\''"
        NEXT J
    NEXT I
@lbl1:
    IF Y$="" THEN RETURN
    LET LY = LEN Y$
    FOR I=1 TO 5
        FOR J=1 TO LY
            IF G$(I)=Y$(J) THEN PRINT AT LINE*T+1,12+I;"\~~"
        NEXT J
    NEXT I    
    RETURN

@letterandplace:
    LET X$=X$+G$(X)
    LET FOUND=1
    RETURN

@letteronly:
    LET Y$=Y$+G$(X)
    LET FOUND=1
    RETURN

@printalphabet:
    FOR P=1 TO 26
        PRINT AT 20,P+2;K$(P)
    NEXT P
    RETURN

@cleanalphabet:
    IF LEN Z$=0 AND LEN Y$=0 THEN RETURN
    FOR C=1 TO LEN Z$
        LET L = CODE Z$(C)
        LET E = L-37
        LET K$(E)=" "
    NEXT C
    RETURN

@lost:
    PRINT "YOU LOST";
    PRINT " BYE"
    STOP     

@main:
    FOR T=1 TO 6
# X$ CORRECT LETTERS AT CORRECT LOCATION 
        LET X$ = ""
# Y$ CORRECT LETTERS AT WRONG LOCATION
        LET Y$ = ""
# Z$ INCORRECT LETTER
        LET Z$ = ""
@in:
        INPUT G$
        IF LEN G$<>5 THEN GOTO @in
        PRINT AT LINE*T,13;G$
        FOR X=1 TO 5
            LET FOUND=0
            FOR Y=1 TO 5
                IF W$(Y)=G$(X) AND Y=X THEN GOSUB @letterandplace
                IF W$(Y)=G$(X) AND Y<>X THEN GOSUB @letteronly
            NEXT Y
            IF FOUND=0 THEN LET Z$ = Z$ + G$(X)
#            PRINT AT 10+X,0;"X$= " + X$ + " Y$= " + Y$ + " Z$= " + Z$
        NEXT X
        GOSUB @endofturn
        IF LEN X$ = 5 THEN GOTO @won
        GOSUB @cleanalphabet
        GOSUB @printalphabet

    NEXT T
    GOTO @lost