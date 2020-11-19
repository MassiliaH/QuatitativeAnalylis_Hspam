function [Fholo_theorique,Fholo_theorique_extended_fit,sigHOLO,offset]=FitHOLO_fitEQ(Pholo,Fholo_experimental,Vholo, startIndex, endIndex,Ctauholo)

Fholo_theorique = @(x) Ctauholo*x(1)*(Pholo(startIndex:endIndex)).^2*Vholo+x(2);   
FminHOLO =@(x) Fholo_theorique(x)-(Fholo_experimental(startIndex:endIndex));
xmin = [0,0];
xmax = [700;100];
x0 = [0,0];
x = lsqnonlin(FminHOLO,x0,xmin,xmax);
sigHOLO = x(1)
offset = x(2)

figure(1)
plot(Pholo,Fholo_experimental,'o',Pholo(startIndex:endIndex),Fholo_theorique([sigHOLO,offset]),'-')
sprintf('2p cross section for holography = %s', num2str(sigHOLO))



Fholo_theorique_extended_fit = Ctauholo*sigHOLO*Pholo.^2*Vholo+offset;

figure()
plot(Pholo,Fholo_experimental,'o',Pholo,Fholo_theorique_extended_fit,'-')
sprintf('2p cross section for holography = %s', num2str(sigHOLO))
% figure(3)


end