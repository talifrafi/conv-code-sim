function[hasil1,hasil2]=Generator12(isiRegister1,isiRegister2,isiRegister3)
                
r1=isiRegister1;
r2=isiRegister2;
r3=isiRegister3;
                
u1=r1+r3;       %Persamaan Output1
u2=r1+r2+r3;    %Persamaan Output2
                
h1=mod(u1,2);
h2=mod(u2,2);
                
hasil1=h1;      %Output1
hasil2=h2;      %Output2
end