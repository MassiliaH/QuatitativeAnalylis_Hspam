function c = contrast(Pscan,Pholo,CtauSCAN,CtauHOLO,CtauEQ,Vscan,Vholo,Veq,sigmascan,sigmaholo,sigmaeq)

for i = 1:length(Pholo)
    Fscan = CtauSCAN*sigmascan*Pscan^2*Vscan;
    Fholo(i)= CtauHOLO*sigmaholo*Pholo(i)^2*Vholo;
    Feq(i) = CtauEQ*sigmaeq*Pscan*Pholo(i)*Veq;
    c(i)=Feq(i)/(Fscan+Fholo(i));
end

