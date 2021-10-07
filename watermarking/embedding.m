function Y = embedding (X, stdid, alpha, Nlen,PN1,PN0)
i=1;

lenid= length(stdid);
W = zeros(1,4*lenid); %THIS IS NEEDED WE NEED TO CONVERT TO BINARY

Y=X;
%CONVERSION
while(stdid ~=0)
    W(i:i+3)= de2bi(mod(stdid,10),4);
    i= i+4;
    stdid= fix(stdid/10);
end

%ADDITIVE WATERMARKING
for i=1:length(W)
    if(W(1,i)==1)
        Y(1,(i-1)*Nlen+1:i*Nlen) = alpha*PN1(1,:)+ Y(1,(i-1)*Nlen+1:i*Nlen) ;
    else
        Y(1,(i-1)*Nlen+1:i*Nlen) = alpha*PN0(1,:)+Y(1,(i-1)*Nlen+1:i*Nlen) ;
    end
end