Nlen= 15000;
[carrier, Fs] = audioread('host.wav');
alpha= 0.01;
PN1 = zeros(1,Nlen);
PN0 = zeros(1, Nlen);
PN1(1,:)=(randi([0,1],1,Nlen)-0.5)*2;
PN0(1,:)=-PN1(1,:);
X = transpose(carrier(:,1));

Y = embedding(X,810897038,alpha, Nlen,PN1,PN0);

stdid= extracting(Y,alpha,Nlen,PN1,PN0)
audiowrite('embed.wav',Y,Fs)