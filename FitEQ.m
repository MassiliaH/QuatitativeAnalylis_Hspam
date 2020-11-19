function [Feq_theorique,Feq_theorique_extended_fit,sigEQ]=FitEQ(startIndex,endIndex,Pscan,Pholo,Veq,Feq,Ctaueq)

Feq_theorique = @(x) x(1)*(Pholo(startIndex:endIndex)).*(Pscan)*Veq*Ctaueq;   
FminEQ =@(x) Feq_theorique(x)-(Feq(startIndex:endIndex)); 
xmin = 0;
xmax = 1000000;
x0 = 0;
x = lsqnonlin(FminEQ,x0,xmin,xmax);
sigEQ = x(1)

figure(2)
plot(Pholo,Feq,'o',Pholo(startIndex:endIndex),Feq_theorique([sigEQ]),'-')
sprintf('2p cross section for equivalent wavelength = %s', num2str(sigEQ))

Feq_theorique_extended_fit = sigEQ*Ctaueq*Pscan*Pholo*Veq;

figure()
plot(Pholo,Feq,'o',Pholo,Feq_theorique_extended_fit,'-')
sprintf('2p cross section for equivalent wavelength = %s', num2str(sigEQ))
end