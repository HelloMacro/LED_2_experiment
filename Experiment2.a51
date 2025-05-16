//name:LED interfacing experiment number 2
    
   org 0000h
   clr p2.1 //clear p2.1 (low)switch
   up:jb p2.1,here //jump to here if p2.1 is (high)  
   // p2.1 is low then
   clr p3.1 //clear p3.1 (low)relay off
   clr p3.2 //clear p3.2  (low)buzzer off
   mov p1,#0ffh //set P1 to 0xFF (all bits High)led on
   acall delay //Call delay subroutine
   mov p1,#00h //set P1 to 0x00 (all bits low)led off
   acall delay //call delay subroutine
  sjmp up //jump to check P2.1 again
   // p2.1 is high then
   here:
   setb p3.1 //set P3.1 (high)relay on
   setb p3.2 //set P3.2 (high)buzzer on
   mov p1,#0aah //set P1 to 0xAA (alternating bits)led alternatly glow
   acall delay //call delay subroutine
   mov p1,#055h //set P1 to 0x55 (alternating bits)led alternatly glow
   acall delay //call delay subroutine
   sjmp up //jump to check P2.1 again
   
   delay: // delay subroutine
   mov r0,#0ffh //outer loop counter
   k: mov r1,#0ffh //middle loop counter
   i: mov r2,#014h //inner loop counter
   j: djnz r2,j //decrement R2, until reaches up to 0
   djnz r1,i //decrement R1, until reaches up to 0
   djnz r0,k //decrement R0, until reaches up to 0
   ret //return from subroutine
   end //end the progra
