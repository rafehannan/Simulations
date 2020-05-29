
%% Block 1: lay out variables and parameters

var c r E G x k w Y l ke GHG t p A F; %endogenous variables

varexo z e s; %exogenous variables

parameters  alpha omega beta eta gamma psi delta mu nu tilda; % define parameters

beta = 0.999;
delta=0.22;
alpha=0.493;
eta = 0.31;
omega=0.349;
gamma=0.07;
psi= -1;
mu=0.5; 
nu=0.5;
tilda = 0.1;

%%Block 2: Lay out the model(needs same number of equations and unknowns)

model(linear);
c(+1) = c + beta - delta + r(+1);
Y + w + omega = c + l + eta;
x = delta + k ;
E = ke*gamma;
Y = p + E + t + F + alpha + omega - 1 ;
Y = A + alpha*k + omega*l + (1-alpha-omega)*E; 
r = gamma + p + E - ke;
G = t + GHG;
r + k = A + alpha + Y;
GHG = F + E;
F = psi * t;
Y = x + c + G;
t = mu*t(-1) + e;
p = nu*p(-1) + z;
A = tilda*A(-1) + s;
end;

initval;
k = 10;
l = 0.3;
ke = 6;
A =1;
E = 2.46;

end;

shocks;
%%For price shock
var z;
stderr 50;
%%For tax shock
%%var e;
%%stderr 50;
end;

resid;
steady;
check;


stoch_simul(periods=1000);
rplot F;
rplot GHG; 
