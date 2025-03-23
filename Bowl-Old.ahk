StepSize := 3
rightDrift := 1
rightOff := 2
downDrift := 1
downOff := 3
digistops:=0
PassiveFDC := 0.3 ; i recommend having this low
Send("{" RotUp " 4}"), Sleep(50)
one(type:=0, digi:=0) {
    nm_Walk(StepSize*size, BackKey)
    nm_Walk(StepSize*size, RightKey)
    nm_Walk(StepSize*size, FwdKey)
    if(type=1){
        Send("{" RotLeft "}"), Sleep(50)
        nm_Walk(rightDrift+rightOff, BackKey)
        nm_Walk(rightOff, FwdKey)
        DS(800, digi)
        Send("{" RotRight "}"), Sleep(50)
    }
    nm_Walk(StepSize*size*2, LeftKey)
    DS(850, digi)
    Send("{" RotLeft "}"), Sleep(50)
    nm_Walk(StepSize*size, BackKey, LeftKey)
    if (type=2){
        Send("{" RotLeft "}"), Sleep(50)
        nm_Walk(downDrift+downOff, LeftKey)
        nm_Walk(downOff, RightKey)
        Send("{" RotRight "}"), Sleep(50)
    }
    nm_Walk(StepSize*size, BackKey, RightKey)
    nm_Walk(StepSize*size*2, FwdKey, RightKey)
    Send("{" RotRight "}"), Sleep(50)
    nm_Walk(StepSize*size, LeftKey)
    DS(850, digi)
    nm_Walk(StepSize*size, BackKey)
    nm_Walk(StepSize*size*2, RightKey)
    Send("{" RotLeft "}"), Sleep(50)
    nm_Walk(StepSize*size, FwdKey, RightKey)
    ;DS(850, digi) ; duplicate
    nm_Walk(StepSize*size, FwdKey, LeftKey)
    nm_Walk(StepSize*size, BackKey, LeftKey)
    Send("{" RotRight "}"), Sleep(50)
}
two(digi:=0) {
    nm_Walk(StepSize*size+PassiveFDC, BackKey, RightKey)
    DS(850, digi)
    nm_Walk(StepSize*size, FwdKey, RightKey)
    nm_Walk(StepSize*size, FwdKey, LeftKey)
    ;if(type=1){
    ;    Send("{" RotLeft " 2}"), Sleep(50)
    ;    nm_Walk(rightDrift+rightOff, BackKey)
    ;    nm_Walk(rightOff, FwdKey)
    ;    Send("{" RotRight " 2}"), Sleep(50)
    ;}
    nm_Walk(StepSize*size*2, BackKey, LeftKey)
    Send("{" RotLeft "}"), Sleep(50)
    nm_Walk(StepSize*size+PassiveFDC, BackKey)
    ;if (type=2){
    ;    Send("{" RotLeft "}"), Sleep(50)
    ;    nm_Walk(downDrift+downOff, LeftKey)
    ;    nm_Walk(downOff, RigthKey)
    ;    Send("{" RotRight "}"), Sleep(50)
    ;}
    nm_Walk(StepSize*size, RightKey)
    ;DS(850, digi) ; duplicate
    nm_Walk(StepSize*size*2, FwdKey)
    Send("{" RotRight "}"), Sleep(50)
    nm_Walk(StepSize*size, BackKey, LeftKey)
    DS(850, digi)
    nm_Walk(StepSize*size+PassiveFDC, BackKey, RightKey)
    nm_Walk(StepSize*size*2, FwdKey, RightKey)
    Send("{" RotLeft "}"), Sleep(50)
    nm_Walk(StepSize*size, FwdKey)
    DS(850,digi)
    nm_Walk(StepSize*size, LeftKey)
    nm_Walk(StepSize*size+PassiveFDC, BackKey)
    Send("{" RotRight "}"), Sleep(50)
}
DS(ms,digi)=>(digistops&&digi)?(HyperSleep(ms),1):0
two(),one(1,1),two(),one(2,),two(),one(1),two(1),one(2)
Send("{" RotDown " 4}"), Sleep(50)
;@NoInterrupt
; made by dully176 with care
