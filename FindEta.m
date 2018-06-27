clc
clear

y1 = 1;
y2 = 2;
r = .04;
beta = .97;
delta = .02;
c2s = 3;
sigma = 4;

rangeeta = .0001:.0001:.01;
rangec1s = 0.01:.1:4.5*2.54;

c = [];
for i = 1:length(rangeeta)
    eta = rangeeta(i);
    c1 = [];
    for j = 1:length(rangec1s)
        c1s = rangec1s(j);
        
        c1(j) = (y1*(1+r)+y2)/(delta+r+(beta*(delta+r)*(1+eta*c2s^(sigma-1))/(1+eta*c1s^(sigma-1)))^(1/sigma));
        [c1s c1(j)]
    end
    p = regress(c1',[ones(size(c1')) rangec1s']);
    c(i) = p(2,1);
end
plot(rangeeta,c)

etaest = interp1(c,rangeeta,.05)