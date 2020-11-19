function [Fscan_theorique,sigSCAN]=FitSCAN(Pscan,Vscan,Fscan,Ctauscan)

Fscan_theorique = @(x) Ctauscan*x(1)*(Pscan)^2*Vscan;
FminSCAN = @(x) Fscan_theorique(x)-Fscan; 

xmin = 0;
xmax = 200;
x0 = 0;
x = lsqnonlin(FminSCAN,x0,xmin,xmax);
sigSCAN = x(1);

figure(2)
plot(Pscan,Fscan,'o',Pscan,Fscan_theorique([sigSCAN]),'-')
sprintf('2p cross section for scan wavelength = %s', num2str(sigSCAN))



end