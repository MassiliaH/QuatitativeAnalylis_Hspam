close all
clear all
clc

load Fscan_837nm_Largespots.mat
load Fholo_837nm_Largespots.mat
load Feq_837nm_Largespots.mat

load Fholo_800nm_Largespots.mat
load Feq_800nm_Largespots.mat
load Fscan_800nm_Largespots.mat


load Pscan_wavshifted.mat
load Pholo_wavshifted.mat



Vscan837nm = 5.21;
Vholo1040nm = 34.33;
Veq837nm = 24.69;
Vscan800nm = Vscan837nm;
Veq800nm = Veq837nm;

tauHOLO=200; % fs ; 
tauSCAN=100; % fs ;  
tauEQ= 300;     

CtauHOLO= 1/tauHOLO;%1; % correction coefficent  taking into accoutn pulse width differences  F prortional to 1/tau; 
CtauSCAN= 1/tauSCAN;%CtauHOLO*tauHOLO/tauSCAN; % 
CtauEQ=   1/tauEQ;%CtauHOLO*tauHOLO/tauEQ;

startIndex = 1;
endIndex = 10;

%% 837nm

%scan fit
[Fscan_theorique837nmLargeSpot,sigSCAN837nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_837nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_837nmLargeSpot,sigHOLOFIT_837nm_Largespot,offset_837nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_837nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_837nm,sigmaeq_837nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_837nm_Largespots,CtauEQ)

contrast_837nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,sigSCAN837nm_Largespot,sigHOLOFIT_837nm_Largespot,sigmaeq_837nm);

%% 800nm

%scan fit
[Fscan_theorique800nmLargeSpot,sigSCAN800nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_800nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_800nmLargeSpot,sigHOLOFIT_800nm_Largespot,offset_800nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_800nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_800nm,sigmaeq_800nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_800nm_Largespots,CtauEQ)

contrast_800nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,sigSCAN800nm_Largespot,sigHOLOFIT_800nm_Largespot,sigmaeq_800nm);



%% contrast
figure()
plot(Pscan_wavshifted./[Pholo_wavshifted'],contrast_837nm_Largespots_exp,'r--')
hold on
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_837nm_Largespots./(Fscan_837nm_Largespots+Fholo_837nm_Largespots),'r')
plot(Pscan_wavshifted./Pholo_wavshifted,contrast_800nm_Largespots_exp,'b--')
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_800nm_Largespots./(Fscan_800nm_Largespots+Fholo_800nm_Largespots),'b')
legend('Theoretical','Experimental')
