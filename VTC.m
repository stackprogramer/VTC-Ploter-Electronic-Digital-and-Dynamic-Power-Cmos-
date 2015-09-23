
%desined and programed by RAHIM BORUMANDI 903119
%matlab voltage transformer characteristics
%we get data parameter hrer
VDD=input('enter value VDD\n');
VTHn=input('enter value VTHn\n');
VTHp=input('enter value vTHp\n');
kn=input('enter value kn\n');
kp=input('enter value kp\n');
%we initialize VOH ,VOl
VOH=VDD;
VOL=0;
syms Vout;
KR=kn/kp;
%in regeion one we claculate VIL
Vout_regionone=solve(1/2*kp*(2*(((2*Vout+VTHp-VDD+KR*VTHn)/(1+KR))-VDD-VTHp)*(Vout-VDD)-(Vout-VDD)^2)-1/2*kn*(((2*Vout+VTHp-VDD+KR*VTHn)/(1+KR))-VTHn)^2);
if(Vout_regionone(1)>Vout_regionone(2))
Vout_regionone=Vout_regionone(1);
else
Vout_regionone=Vout_regionone(2);
end
VIL=(2*Vout_regionone+VTHp-VDD+KR*VTHn)/(1+KR);
disp('VOUT in VIL\n');
disp(Vout_regionone);
%in region two we calculate VIH
Vout_regiontwo=solve(1/2*kn*(2*(((VDD+VTHp+KR*(2*Vout+VTHn))/(1+KR))-VTHn)*Vout-Vout^2)-1/2*kp*(((VDD+VTHp+KR*(2*Vout+VTHn))/(1+KR))-VDD-VTHp)^2);
if(Vout_regiontwo(1)>Vout_regiontwo(2))
Vout_regiontwo=Vout_regiontwo(1);
else
Vout_regiontwo=Vout_regiontwo(2);
end
VIH=(VDD+VTHp+KR*(2*Vout_regiontwo+VTHn))/(1+KR);
disp('VOUT in VIH\n');
disp(Vout_regiontwo);
%Here we calculate NML ,NMH,VM(inversion)
NMH=VOH-VIH;
NML=VIL-VOL;
Vinversion=(VTHn+(1/KR)^.5*(VDD+VTHp))/(1+(1/KR)^.5);
%Display data and plot VTC
disp('VOH:');
disp(VOH);
disp('VOL:');
disp(VOL);
disp('VIH:');
disp(VIH);
disp('VIL:');
disp(VIL);
disp('VInv:');
disp(Vinversion);
disp('NML:');
disp(NML);
disp('NMH:');
disp(NMH);
if(NML>NMH)
disp('NM:');
disp(NML);
else 
endisp('NM:');
disp(NMH);
end
Vinput=[0,VIL,Vinversion,VIH,VIH+4];
Voutput=[VDD,VOH,Vinversion,VOL,0];
plot(Vinput,Voutput);

