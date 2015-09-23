%designed and programed by RAHIM BORUMANDI 903119

% VDD=3.8 volt,VTHn=.6 volt VTHp=.7volt Kn=.0002A/V^2  Kp=.00008 A/V^2


%region PMOS triode NMOS cutoff Vout=VOH    VIN<VTHn @A state

[VIN,VOUT]=meshgrid(0:.01:.6);
ID=VIN*0;
figure;
mesh(ID);
title('@A region', 'fontweight','b');
xlabel('VIN', 'fontweight','b'), ylabel('VOUT','fontweight','b') 
zlabel('ID value', 'fontweight','b')




%region PMOS triode and NMOS saturation Vout=VIN    VTHn<VIN<VOUT+VTHp@B state

VDD=3.8;
VTHn=.6;
VTHp=-.7;
kn=.0002;
kp=.00008;
KR=kn/kp;
[VIN,VOUT]=meshgrid(.6:.0575:2.9,3.8:-.01:3.4);
ID=(kp/2)*(2*(VIN-VDD)*(VOUT-VDD)-(VOUT-VDD)^2);
figure;
mesh(ID);
title('@B region', 'fontweight','b');
xlabel('VIN', 'fontweight','b'), ylabel('VOUT','fontweight','b') 
zlabel('ID value', 'fontweight','b')

%region PMOS and NMOS both saturation Vout=VOH    VOUT+VTHp<VIN<VOUT+VTHn @C state
% 3.4352<VOUT<3.8
[VIN,VOUT]=meshgrid(.86:.1:2.16);
ID=(kp/2)*(VIN-VDD-VTHp)^2;
figure;
mesh(ID);
title('@C region', 'fontweight','b');
xlabel('VIN', 'fontweight','b'), ylabel('VOUT','fontweight','b') 
zlabel('ID value', 'fontweight','b')
%region PMOS saturate NMOS triode Vout=VOH    VOUT+VTHn<VIN<VDD+VTHp @D state

[VIN,VOUT]=meshgrid(-.4:.01:.9,1.6:-.01:.3);
ID=(kp/2)*(2*(VIN-VDD)*(VOUT-VDD)-(VOUT-VDD)^2);
figure;
mesh(ID);
title('@D region', 'fontweight','b');
xlabel('VIN', 'fontweight','b'), ylabel('VOUT','fontweight','b') 
zlabel('ID value', 'fontweight','b')
%region PMOS cutoff and  NMOS triode Vout=VOH   VIN>VDD+VTHp  @E state

[VIN,VOUT]=meshgrid(3.1:.01:4);
ID=VIN*0;
figure;
mesh(ID);
title('@E region', 'fontweight','b');
xlabel('VIN', 'fontweight','b'), ylabel('VOUT','fontweight','b') 
zlabel('ID value', 'fontweight','b')





