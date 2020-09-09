close all;
clear all;
clc;
x=[0 0 0 0 1 1 1 1 1];
n=-4:4; %for range 4 idhar -ve me 4 +ve me upar wali x ki values
stem(n,x);
title('x(n)');
xlabel('n');
ylabel('Amplitude');
y1=downsample(x,2);% for upsample use upsample instead of downsample
n1=-2:1:2;
figure
stem(n1,y1);
title('x(2n)');
xlabel('n');
ylabel('Amplitude');
y2=upsample(x,2);
n2=-8:1:9;
figure
stem(n2,y2);
title('x(n/2)');
xlabel('n');
ylabel('Amplitude');