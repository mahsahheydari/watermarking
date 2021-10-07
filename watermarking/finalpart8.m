Nlen =15000;
PN1 = zeros(1,Nlen);
PN0 = zeros(1, Nlen);
PN1(1,:)=(randi([0,1],1,Nlen)-0.5)*2;
PN0(1,:)=-PN1(1,:);
Y1K = embedding(X,810897038,0.01, Nlen,PN1,PN0);

fil1=lowpass1;
noise1=filter(fil1,Y1K);
audiowrite('Y1000K.wav',noise1,Fs)

fil15=lowpass15 
noise15=filter(fil15,Y15K)
audiowrite('Y1500K.wav',noise15,Fs)

fil2=lowpass2 
noise2=filter(fil2,Y1K);
audiowrite('Y2000K.wav',noise2,Fs)

fil3=lowpass3 ;
noise3=filter(fil3,Y1K);
audiowrite('Y3000K.wav',noise3,Fs)

fil5=lowpass5 ;
noise5=filter(fil5,Y1K);
audiowrite('Y5000K.wav',noise5,Fs)

u5= extracting(noise5,0.01,Nlen,PN1,PN0)
 u3= extracting(noise3,0.01,Nlen,PN1,PN0)
 u2= extracting(noise2,0.01,Nlen,PN1,PN0)
 u15= extracting(noise15,0.01,Nlen,PN1,PN0)
 u1= extracting(noise1,0.01,Nlen,PN1,PN0)