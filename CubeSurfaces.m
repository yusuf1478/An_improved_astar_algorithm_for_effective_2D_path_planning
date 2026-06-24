function kk=KupYuzeyleri(PStart,PBoyut,PYuzey)
if (PYuzey==1)
  kk=[PStart
      PStart(1)+PBoyut(1) PStart(2) PStart(3)
      PStart(1) PStart(2) PStart(3)+PBoyut(3)
      PStart(1)+PBoyut(1) PStart(2) PStart(3)+PBoyut(3)];
elseif (PYuzey==2)
  kk=[PStart(1)+PBoyut(1) PStart(2) PStart(3)
      PStart(1)+PBoyut(1) PStart(2) PStart(3)+PBoyut(3)
      PStart(1)+PBoyut(1) PStart(2)+PBoyut(2) PStart(3)
      PStart+PBoyut];
elseif (PYuzey==3)
   kk=[PStart(1) PStart(2)+PBoyut(2) PStart(3)+PBoyut(3)
      PStart(1) PStart(2)+PBoyut(2)  PStart(3)
      PStart(1)+PBoyut(1) PStart(2)+PBoyut(2) PStart(3)
      PStart+PBoyut];
elseif (PYuzey==4)
   kk=[PStart
      PStart(1) PStart(2) PStart(3)+PBoyut(3)
      PStart(1) PStart(2)+PBoyut(2) PStart(3)
      PStart(1) PStart(2)+PBoyut(2) PStart(3)+PBoyut(3)];
elseif (PYuzey==5)
   kk=[PStart
      PStart(1)+PBoyut(1) PStart(2) PStart(3)
      PStart(1) PStart(2)+PBoyut(2) PStart(3)
      PStart(1)+PBoyut(1) PStart(2)+PBoyut(2) PStart(3)];
elseif (PYuzey==6)
    kk=[PStart(1) PStart(2) PStart(3)+PBoyut(3)
      PStart(1) PStart(2)+PBoyut(2)  PStart(3)+PBoyut(3)
      PStart(1)+PBoyut(1) PStart(2) PStart(3)+PBoyut(3)
      PStart+PBoyut];
end
