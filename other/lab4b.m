%Time Flipping

close all;
clear all;
clc;
x=[0 0 0 0 1 1 1 1 1];
n=-4:4; %for range 4 idhar -ve me 4 +ve me upar wali x ki values
stem(n,x);
title('x(n)');
xlabel('n');
ylabel('Amplitude');
figure
y=fliplr(x);
stem(n,y);
title('x(-n)');
xlabel('n');
ylabel('Amplitude');
