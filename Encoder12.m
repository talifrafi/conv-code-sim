function[hasil,jumlah]=Encoder12(m)
            
                mp=m;
                    R1=zeros;
                    R2=zeros;
                    h=zeros;
                    
                    for i=1:numel(mp)
                        R3=R2;
                        R2=R1;
                        R1=mp(i);
                        [h1,h2]=Generator12(R1,R2,R3);
                        h(i,1)=h1;
                        h(i,2)=h2;
                    end
                    
%                     ha=zeros;
%                     count=1;
%                     for i=1:size(h,1)
%                         ha(1,count)=h(i,1);
%                         count=count+1;
%                         ha(1,count)=h(i,2);
%                         count=count+1;
%                     end
                    
                    jumlah=numel(mp);
                    disp(h)
                    hasil=reshape(h,1,[]) ;             
                    disp hasil;
            end