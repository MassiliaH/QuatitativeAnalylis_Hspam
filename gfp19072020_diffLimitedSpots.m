close all
clear all

load Pscan_wavshifted.mat
load Pholo_wavshifted.mat
load Fholo_837nm.mat
load Feq_837nm.mat
load Fscan_837nm.mat

load Fholo_800nmm.mat
load Feq_800nm.mat
load Fscan_800nm.mat

load Feq_725nm.mat
load Fholo_725nm.mat
load Fscan_725nm.mat

load Feq_775nm.mat
load Fholo_775nm.mat
load Fscan_775nm.mat


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

Pholo_wavshifted_spot_withoutZorder = sqrt(0.75286)*Pholo_wavshifted

%% 837nm
% Fscan_837nm_th = @(x) CtauSCAN*x(1)*(Pscan_wavshifted)^2*Vscan837nm;
% FminSCAN_837nm = @(x) Fscan_837nm_th(x)-Fscan_837nm; 
% sigSCAN_837nm = Fscan_837nm/(Pscan_wavshifted^2*Vscan837nm)
% 
% xmin = 0;
% xmax = 200;
% x0 = 0;
% x = lsqnonlin(FminSCAN_837nm,x0,xmin,xmax);
% sigSCAN_837nm = x(1);

Fholo_837nm_withoutZorder = 0.75286*Fholo_837nm;


% fit scan 
[Fscan_theorique837nm,sigSCAN837nm]=FitSCAN(Pscan_wavshifted,Vscan837nm,Fscan_837nm,CtauSCAN)


% fit holo
[Fholo_theorique837nm,sigHOLO837,offset837]=FitHOLO_fitEQ(Pholo_wavshifted_spot_withoutZorder,Fholo_837nm_withoutZorder,Vholo1040nm, startIndex, endIndex,CtauHOLO)

% fit Eq
[Feq_theorique837nm,sigEQ837nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted_spot_withoutZorder,Veq837nm,Feq_837nm,CtauEQ)

%% 800nm
% fit scan
% Fscan_837nm_th = @(x) CtauSCAN*x(1)*(Pscan_wavshifted)^2*Vscan837nm;
% fit scan 
[Fscan_theorique800nm,sigSCAN800nm]=FitSCAN(Pscan_wavshifted,Vscan800nm,Fscan_800nm,CtauSCAN)

%fit holo
[Fholo_theorique800nm,sigHOLO800,offset800]=FitHOLO_fitEQ(Pholo_wavshifted,Fholo_800nm,Vholo1040nm, startIndex, endIndex,CtauHOLO)

%fit eq
[Feq_theorique800nm,sigEQ800nm]=FitEQ(startIndex,endIndex,Pscan_wavshifted,Pholo_wavshifted,Veq800nm,Feq_800nm,CtauEQ)

%%