close all
clear all
clc

load Fholo_800nm_Largespots.mat
load Feq_800nm_Largespots.mat
load Fscan_800nm_Largespots.mat

load Fscan_837nm_Largespots.mat
load Fholo_837nm_Largespots.mat
load Feq_837nm_Largespots.mat

load Fscan_870nm_Largespots.mat
load Fholo_870nm_Largespots.mat
load Feq_870nm_Largespots.mat

load Fscan_775nm_Largespots.mat
load Fholo_775nm_Largespots.mat
load Feq_775nm_Largespots.mat

load Fscan_920nm_Largespots.mat
load Fholo_920nm_Largespots.mat
load Feq_920nm_Largespots.mat

load Pscan_wavshifted.mat
load Pholo_wavshifted.mat



Vscan837nm = 9.96;%5.21;
Vholo1040nm = 36;%39.53;%34.33;
Veq837nm = 29;%25.25;%24.69;
Vscan800nm = Vscan837nm;
Veq800nm = Veq837nm;


tauHOLO=200; % fs ; 
tauSCAN=100; % fs ;  
tauEQ= 300;     

CtauHOLO= 1/tauHOLO;%1; % correction coefficent  taking into accoutn pulse width differences  F prortional to 1/tau; 
CtauSCAN= 1/tauSCAN;%CtauHOLO*tauHOLO/tauSCAN; % 
CtauEQ=   1/tauEQ;%CtauHOLO*tauHOLO/tauEQ;

startIndex = 1;
endIndex = 12;

%% 837nm

%scan fit
[Fscan_theorique837nmLargeSpot,sigSCAN837nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_837nm_Largespots,CtauSCAN)
Fscan_theorique837nmLargeSpot_ext = ones(length(Pholo_wavshifted))*Fscan_837nm_Largespots;

%holo
[Fholo_theorique_837nmLargeSpot,Fholo_theorique_extended_fit837nm,sigHOLOFIT_837nm_Largespot,offset_837nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_837nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_837nm,Feq_theorique_extended_fit837nm,sigmaeq_837nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_837nm_Largespots,CtauEQ)

contrast_837nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,19,1.5,40);

%% %% 775nm

%scan fit
[Fscan_theorique775nmLargeSpot,sigSCAN775nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_775nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_775nmLargeSpot,Fholo_theorique_extended_fit775nm,sigHOLOFIT_775nm_Largespot,offset_775nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_775nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_775nm,Feq_theorique_extended_fit775nm,sigmaeq_775nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_775nm_Largespots,CtauEQ)

contrast_775nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,7,1.5,33.7);


%% 800nm

%scan fit
[Fscan_theorique800nmLargeSpot,sigSCAN800nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_800nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_800nmLargeSpot,Fholo_theorique_extended_fit800nm,sigHOLOFIT_800nm_Largespot,offset_800nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_800nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_800nm,Feq_theorique_extended_fit800nm,sigmaeq_800nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_800nm_Largespots,CtauEQ)

contrast_800nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,11,1.5,36.22);

%% 870nm

%scan fit
[Fscan_theorique870nmLargeSpot,sigSCAN870nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_870nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_870nmLargeSpot,Fholo_theorique_extended_fit870nm,sigHOLOFIT_870nm_Largespot,offset_870nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_800nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_870nm,Feq_theorique_extended_fit870nm,sigmaeq_870nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_870nm_Largespots,CtauEQ)

contrast_870nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,32.13,1.5,32.56);


%% 920nm

%scan fit
[Fscan_theorique920nmLargeSpot,sigSCAN920nm_Largespot]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_920nm_Largespots,CtauSCAN)

%holo
[Fholo_theorique_920nmLargeSpot,Fholo_theorique_extended_fit920nm,sigHOLOFIT_920nm_Largespot,offset_920nm_Largespot]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_920nm_Largespots,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%eq
[Feq_theorique_920nm,Feq_theorique_extended_fit920nm,sigmaeq_920nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq837nm,Feq_920nm_Largespots,CtauEQ)

contrast_920nm_Largespots_exp = contrast(Pscan_wavshifted,Pholo_wavshifted,CtauSCAN,CtauHOLO,CtauEQ,Vscan837nm,Vholo1040nm,Veq837nm,38.5,1.5,18.7);
%%

figure()
subplot(5,2,1)
plot(Pholo_wavshifted,Fholo_837nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit837nm,'b-');%,Pholo(Firstind:Lastind),Fholo(x),'-');%,Pholo(Firstind:Lastind),Fholo(x),'-')
hold on 
plot(Pholo_wavshifted,Feq_837nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit837nm,'r-')
title('\lambda_{scan} = 837 nm')

subplot(5,2,3)
plot(Pholo_wavshifted,Fholo_775nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit775nm,'b-');%,Pholo(Firstind:Lastind),Fholo(x),'-');%,Pholo(Firstind:Lastind),Fholo(x),'-')
hold on 
plot(Pholo_wavshifted,Feq_775nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit775nm,'r-')
title('\lambda_{scan} = 775 nm')
subplot(5,2,5)
plot(Pholo_wavshifted,Fholo_800nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit800nm,'b-')
hold on
plot(Pholo_wavshifted,Feq_800nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit800nm,'r-')
title('\lambda_{scan} = 800 nm')

subplot(5,2,7)
plot(Pholo_wavshifted,Fholo_920nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit920nm,'b-')
hold on 
plot(Pholo_wavshifted,Feq_920nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit920nm,'r-')
title('\lambda_{scan} = 920 nm')

subplot(5,2,9)
plot(Pholo_wavshifted,Fholo_870nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit870nm,'b-')
hold on
plot(Pholo_wavshifted,Feq_870nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit870nm,'r-')
title('\lambda_{scan} = 870 nm')
%%
figure()
yyaxis left
y2 = Fholo_837nm_Largespots
plot(Pholo_wavshifted,Fholo_837nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit837nm,'b-');%,Pholo(Firstind:Lastind),Fholo(x),'-');%,Pholo(Firstind:Lastind),Fholo(x),'-')
% ylim([22 70])
ylabel('Background from holography [a.u]')
legend('Experimental','Fit')
yyaxis right
y3 = Feq_837nm_Largespots;
plot(Pholo_wavshifted,y3,'ro',Pholo_wavshifted,Feq_theorique_extended_fit837nm,'r-')
% ylim([0 6000])
ylabel('Fluorescence intensity from \lambda_{eq} [a.u]')
legend('Experimental','Fit')
% xlim([0.8 2.4])
xlabel('P_{holography} [ms]')
grid on
grid minor

figure()
plot(Pholo_wavshifted,Fholo_837nm_Largespots,'bo',Pholo_wavshifted,Fholo_theorique_extended_fit837nm,'b-')
hold on
plot(Pholo_wavshifted,Feq_837nm_Largespots,'ro',Pholo_wavshifted,Feq_theorique_extended_fit837nm,'r-')
grid on
grid minor
xlim([0 77])
xlabel('P_{holography} [mW]')
ylabel('Fluorescence intensity [a.u]')

%% contrast
figure()
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_920nm_Largespots./(Fscan_920nm_Largespots+Fholo_920nm_Largespots),'m')
hold on
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_870nm_Largespots./(Fscan_870nm_Largespots+Fholo_870nm_Largespots),'k')
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_837nm_Largespots./(Fscan_837nm_Largespots+Fholo_837nm_Largespots),'r')
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_800nm_Largespots./(Fscan_800nm_Largespots+Fholo_800nm_Largespots),'b')
plot(Pscan_wavshifted./Pholo_wavshifted,Feq_775nm_Largespots./(Fscan_775nm_Largespots+Fholo_775nm_Largespots),'g')
plot(Pscan_wavshifted./[Pholo_wavshifted'],contrast_837nm_Largespots_exp,'r--')
plot(Pscan_wavshifted./Pholo_wavshifted,contrast_800nm_Largespots_exp,'b--')
plot(Pscan_wavshifted./Pholo_wavshifted,contrast_775nm_Largespots_exp,'g--')
plot(Pscan_wavshifted./Pholo_wavshifted,contrast_870nm_Largespots_exp,'k--')
plot(Pscan_wavshifted./Pholo_wavshifted,contrast_920nm_Largespots_exp,'m--')
legend('\lambda_{scan} = 920 nm','\lambda_{scan} = 870 nm','\lambda_{scan} = 837 nm','\lambda_{scan} = 800 nm','\lambda_{scan} = 775 nm')
