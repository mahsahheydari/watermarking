function stdid = extracting (Y ,alpha, Nlen,PN1,PN0)
 d=1;
W= zeros(1,36); %THIS IS NEEDED BECAUSE WE NEED TO REBUILD THE STDNUM
stdid=0;
%%DECISION PART
for i=1:length(W)

    if (dot(Y(1,(i-1)*Nlen+1:i*Nlen),PN1(1,:))>=0)
        W(1,i)=1;
    else
 
    if (dot(Y(1,(i-1)*Nlen+1:i*Nlen),PN0(1,:))>0)
        W(1,i)=0;
    end
    end
end

%%CONVERT BINARY TO DECIMALS
    x=length(W)/4;
   
for j=1:x

    stdid=stdid+ 10^(j-1)*bi2de(W(1,d:d+3));
    d=d+4;
end
end