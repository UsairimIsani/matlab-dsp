%EFFECTS OF SAMPLING IN DT SIGNALS

f=2;
t=0:0.005:1;
xt=sin(2*pi*f*t);
plot(t,xt);
hold on;
fs=8;
ts=1/fs;
nts=0:ts:1;
xn=sin(2*pi*f*nts);
stem(nts,xn);

