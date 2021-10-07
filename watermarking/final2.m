
alpha= 0.0001;
step = (0.01-0.0001)/10;
schritt= (18000-15000)/10;
Nlen= 15000;
X =transpose(carrier(:,1));
PN1 = zeros(1,Nlen);
PN0 = zeros(1, Nlen);
PN1(1,:)=(randi([0,1],1,Nlen)-0.5)*2;
PN0(1,:)=-PN1(1,:);
YS = zeros(10,length(Y));
YSn = zeros(10,length(Y));
A= zeros(1,10);
N = zeros(1,10);

ERROR = zeros(1,10);
ERRORn = zeros(1,10);
for j=1:10
    A(j)= alpha
    YS(j,:)= embedding(X,810897038,alpha, Nlen,PN1,PN0);
    alpha = alpha +step;
    ERROR(j) = immse(YS(j,:),X);
end



 for l=1:10
     N(l)= Nlen
 PN1 = zeros(1,Nlen);
 PN0 = zeros(1, Nlen);
 PN1(1,:)=(randi([0,1],1,Nlen)-0.5)*2;
 PN0(1,:)=-PN1(1,:);
     YSn(l,:)= embedding(X,810897038,alpha, Nlen,PN1,PN0);
     Nlen = Nlen +schritt;
     ERRORn(l) = immse(YSn(l,:),X);
 end

figure(1)
subplot(1,2,1)
plot(A,ERROR)
title("alpha's")
 subplot(1,2,2)
 plot(N,ERRORn)
 title("N")