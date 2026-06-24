function kk=KupKoseleri(PStart,PBoyut)
kk=[PStart
    PStart(1)+PBoyut(1) PStart(2) PStart(3)
    PStart(1)+PBoyut(1) PStart(2)+PBoyut(2) PStart(3)
    PStart(1) PStart(2)+PBoyut(2) PStart(3)
    PStart(1) PStart(2) PStart(3)+PBoyut(3) 
    PStart(1)+PBoyut(1) PStart(2) PStart(3)+PBoyut(3) 
    PStart(1) PStart(2)+PBoyut(2) PStart(3)+PBoyut(3)    
    PStart+PBoyut];