*-----------------------------------------------------------
* Title      :  Making Tea
* Written by :  Petar Peychev
* Date       :  April 2019
* Description:  Simple text adventure game.
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

INTRO   bsr     clear       ; clear screen
        bsr     cmfont      ; change font size to medium
        bsr     clime       ; change colour to lime
        
        lea     intro1,a1   ; display intro string
        bsr     flip
        
        bsr     cdfont      ; back to default font size
        
        bsr     cwhite      ; back to white
        
        bsr     newline     ; insert new lines
        bsr     newline     
        bsr     newline
        bsr     wait        ; wait for an average amount of time
        lea     intro2,a1   ; etc..
        bsr     flip
        bsr     newline
        bsr     lwait
        lea     intro3,a1
        bsr     flip
        bsr     newline
        bsr     newline
        bsr     newline
        bsr     wait
        
        bsr     cblue       ; change colour to blue
        
        lea     intro4,a1
        bsr     flip
        
        bsr     cwhite      ; back to white
        
        bsr     newline
        bsr     wenter      ; wait for the user to press Enter
        bra     dream       ; branch to the next "scene"
        
DREAM   bsr     clear

        bsr     cgray       ; quotes are in gray

        lea     dream1,a1
        bsr     flip
        bsr     newline
        bsr     wait
        bsr     clear
        lea     dream2,a1
        bsr     flip
        bsr     newline
        bsr     wait
        bsr     clear
        lea     dream3,a1
        bsr     flip
        
        bsr     cwhite      ; while narrarator speech is white
            
        bsr     newline
        bsr     wait
        bsr     clear
        lea     dream4,a1
        bsr     flip
        bsr     newline
        bsr     swait       ; wait a shorter amount of time
        bsr     clear
        lea     dream5,a1
        bsr     flip
        bsr     newline
        bsr     swait
        bsr     clear
        lea     dream6,a1
        bsr     flip
        bsr     newline
        bsr     swait
        bra     wake
        
WAKE    bsr     clear
        lea     wake1,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     wake2,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cgray

        lea     wake3,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     wake4,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     wake5,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cwhite

        lea     wake6,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     wake7,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cgray
        
        lea     wake8,a1
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        bsr     swait
        bsr     wenter
        bra     room
        
ROOM    bsr     clear
        lea     room1,a1
        bsr     flip
        bsr     newline
        bsr     wait 
        lea     room2,a1
        bsr     flip
        bsr     wait
        bsr     newline
        bsr     newline
        
        bsr     cblue
        
CHOICE1 lea     room3,a1    ; asking the user for a room choice
        bsr     flip
        bsr     newline
        lea     room4,a1
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        move.b  #1,ch1      ; set choice1 to the default of 1
        move.b  #5,d0       ; read char from keyboard
        trap    #15
        cmp.b   #$30,d1
        beq     bath        ; send the user to the appropriate chosen scene
        cmp.b   #$31,d1
        beq     kitch
        bne     err1        ; if invalid number entered, go into error subroutine

ERR1    lea     errm,a1     ; display error message
        bsr     newline
        bsr     flip
        bsr     newline
        bsr     wait
        bra     choice1     ; and back to choice loop

BATH    bsr     clear
        move.b  #0,ch1      ; set choice1 to 0
        
        bsr     cgray
        
        lea     bath1,a1
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        bsr     wait
        lea     bath2,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     bath3,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     bath4,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cgray
        
        lea     bath5,a1
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        bsr     wait
        lea     bath6,a1
        bsr     flip
        bsr     newline
        bsr     swait
        lea     bath7,a1
        bsr     flip
        bsr     newline
        bsr     swait
        lea     bath8,a1
        bsr     flip
        bsr     newline
        bsr     swait
        lea     bath9,a1
        bsr     flip
        bsr     newline
        bsr     swait
        lea     bath10,a1
        bsr     flip
        bsr     newline
        bsr     wenter
        bra     down
KITCH   bsr     clear
        cmp.b   #1,ch1      ; check if the player has gone to the bathroom
        beq     up          ; if he hasn't, force him to go
        bne     down        ; if he has, go down
UP      bsr     clear
        lea     up1,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     up2,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cgray

        lea     up3,a1
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        bsr     wait
        lea     up4,a1
        bsr     flip
        bsr     newline
        bsr     wenter
        bsr     bath
        
DOWN    bsr     clear
        lea     down1,a1
        bsr     flip
        bsr     newline
        bsr     swait
        lea     down2,a1
        bsr     flip
        bsr     newline
        bsr     wenter
        bra     tea
        
TEA     bsr     clear
        lea     tea1,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     tea2,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     cgray
        
        lea     tea3,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        lea     tea4,a1         ; ask user for a type of tea
        bsr     flip
        
        move.b  #2,d0           ; read the tea type to memory
        lea     teatype,a1
        trap    #15
        
        lea     tea5,a1
        bsr     flip
        
        lea     teatype,a1      ; display the tea type
        bsr     flip
        
        bsr     newline
        bsr     wait
        
        bsr     cwhite
        
        lea     tea6,a1
        bsr     flip
        
        lea     teatype,a1      ; and display it again
        bsr     flip
        
        lea     tea7,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     tea11,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     tea8,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     tea9,a1
        bsr     flip
        bsr     newline
        bsr     wait
        lea     tea10,a1
        bsr     flip
        bsr     newline
        bsr     swait
        bsr     final
        
FINAL   bsr     clear
        lea     final1,a1
        bsr     flip
        bsr     newline
        bsr     wait
        
        bsr     clime
        bsr     cmfont      ; change to medium sized font
        
        lea     final2,a1   ; moral of the story
        bsr     flip
        
        bsr     cwhite
        
        bsr     newline
        bsr     wenter
        bsr     endloop
        
ENDLOOP bsr     clear       ; loop infinitely, displaying end message with different colours
        lea     endm,a1
        bsr     clime       ; change to lime colour
        
        bsr     clfont      ; change to large font
        
        bsr     newline
        bsr     flip
        bsr     newline
        bsr     sswait
        
        bsr     clear
        bsr     cblue       ; change to blue colour
        bsr     newline
        bsr     flip
        bsr     newline
        bsr     sswait
        
        bsr     clear
        bsr     corange     ; change to orange colour
        bsr     newline
        bsr     flip
        bsr     newline
        bsr     sswait
        
        bsr     endloop     ; and repeat, indefinitely

* subroutines
CLEAR   move.w  #$FF00,D1   ; clear the screen
        move.b  #11,D0  
        trap    #15
        rts

FLIP    move    #14,d0      ; display the string pointed to by A1
        trap    #15
        rts
        
CWHITE  movem.l d0/a1,-(a7) ; change font colour to white
        move.l  #white,d1
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CGRAY   movem.l d0/a1,-(a7) ; change font colour to gray
        move.l  #gray,d1
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CBLUE   movem.l d0/a1,-(a7) ; change font colour to blue
        move.l  #blue,d1
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CLIME   movem.l d0/a1,-(a7) ; change font colour to lime
        move.l  #lime,d1
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CORANGE movem.l d0/a1,-(a7) ; change font colour to orange
        move.l  #orange,d1
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CLFONT  movem.l d0/a1,-(a7) ; change to large font
        move.l  #lfont,d2
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CMFONT  movem.l d0/a1,-(a7) ; change to medium font
        move.l  #mfont,d2
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
CDFONT  movem.l d0/a1,-(a7) ; change to default font
        move.l  #dfont,d2
        move.b  #21,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts

NEWLINE movem.l d0/a1,-(a7) ; display a new line
        lea     nl,a1
        move    #14,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts

WAIT    movem.l d0/a1,-(a7) ; wait for 2.5 seconds
        move.l  #250,d1
        move    #23,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
SWAIT   movem.l d0/a1,-(a7) ; wait for 1.5 second
        move.l  #150,d1
        move    #23,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
SSWAIT   movem.l d0/a1,-(a7) ; wait for 0.5 second
        move.l  #50,d1
        move    #23,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts
        
LWAIT   movem.l d0/a1,-(a7) ; wait for 4.5 seconds
        move.l  #450,d1
        move    #23,d0
        trap    #15
        movem.l (a7)+,d0/a1
        rts

WENTER  move.b  #2,d0       ; wait until Enter is pressed
        trap    #15
        rts

    SIMHALT             ; halt simulator

* labels
CR      equ     $0d
LF      equ     $0a
WHITE   equ     $00FFFFFF   ; font colours
GRAY    equ     $00DDDDDD
BLUE    equ     $00FFFF00
LIME    equ     $0000FF00
ORANGE  equ     $0000A5FF
LFONT   equ     $005A0000   ; font sizes
MFONT   equ     $00110000
DFONT   equ     $000F0000

* storage
CH1     ds.b    1           ; storage for the player choice
TEATYPE ds.b    80          ; storage for tea type

* constants
NL      dc.b    $d,$a,0     ; new line NULL-terminated string

* misc strings
ERRM    dc.b    'Please select a valid choice!',0

* intro strings
INTRO1  dc.b    'Welcome to "Making Tea"!',0
INTRO2  dc.b    'A simple text adventure game about the two hardest tasks of the day:',0
INTRO3  dc.b    'Getting out of bed and making tea.',0
INTRO4  dc.b    '        - Made by Petar Peychev (N0779018)',0

* sun strings
DREAM1  dc.b    '- NO, NOT THE ZOMBIES AGAIN!!!',0
DREAM2  dc.b    '- AGHHH!!!',0
DREAM3  dc.b    '- GET AWAY FROM ME!!!',0
DREAM4  dc.b    '...',0
DREAM5  dc.b    '......',0
DREAM6  dc.b    '.........',0

* wake strings
WAKE1   dc.b    'As the stinky dead guy is about to rip into your beautiful face,',0
WAKE2   dc.b    'with a jitter, you wake up back in your own comfy bed.',0
WAKE3   dc.b    '- Phew, it was just a dream.',0
WAKE4   dc.b    '- There are no zombies in the real world.',0
WAKE5   dc.b    '- Right?',0
WAKE6   dc.b    '...',0
WAKE7   dc.b    'You check under your bed just to make sure.',0
WAKE8   dc.b    '- Right! Time to get up.',0 

* room strings
ROOM1   dc.b    'So, where to first?',0
ROOM2   dc.b    'Bathroom or kitchen?',0
ROOM3   dc.b    '0: Bathroom',0
ROOM4   dc.b    '1: Kitchen',0

* bathroom strings
BATH1   dc.b    '- I guess the tea can wait a bit.',0
BATH2   dc.b    'You go into the bathroom,',0
BATH3   dc.b    'splash your face with water to wash off the previous day and',0
BATH4   dc.b    'pause to check yourself out in the mirror for a brief moment:',0
BATH5   dc.b    '- Not bad for a Computer Science student!',0
BATH6   dc.b    'Then you uh... do your business.',0
BATH7   dc.b    '.',0
BATH8   dc.b    '..',0
BATH9   dc.b    '...',0
BATH10  dc.b    'And back to the tea!',0

* up strings
UP1     dc.b    'You start heading down the stairs,',0
UP2     dc.b    'when you feel a certain discomfort in the lower abdominal area...',0
UP3     dc.b    '- Nevermind that, something to take care of first!',0
UP4     dc.b    'You walk back up the stairs.',0

* down strings
DOWN1   dc.b    'You walk down the stairs',0
DOWN2   dc.b    'and go into the kitchen.',0

* tea strings
TEA1    dc.b    'You fill up the kettle with water and turn it on.',0
TEA2    dc.b    'From the cupboard you grab a bag of...',0
TEA3    dc.b    '- Hmm, what kind of tea do I feel like drinking today?',0
TEA4    dc.b    '>> ',0
TEA5    dc.b    '- How about ',0
TEA6    dc.b    'You grab a bag of ',0
TEA7    dc.b    ' tea from the cupboard.',0
TEA11   dc.b    'And let it brew in your favourite cup for a bit.',0
TEA8    dc.b    '...',0
TEA9    dc.b    '......',0
TEA10   dc.b    '.........',0
        
* final strings
FINAL1  dc.b    'You take a nice hot sip.',0
FINAL2  dc.b    '- What a beautiful day!',0

* the end string
ENDM    dc.b    '    THE END',0



    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
