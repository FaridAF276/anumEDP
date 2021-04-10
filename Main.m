close all
clear all
clc
%% Declaration des variables
global z n D1 D2 dz;


%% Definition des parametres
tmax= 2000;
pas= 1;
z0 = 0;
zL = 10;
n =51;
%% Creation de la grille spatio temporelle
dz = (zL - z0)/(n - 1);
z = z0:dz:zL; 
z = z';
t= 0:pas:tmax;
t = t';
%% Approximation de la derivee premiere
%D1 = two_point_upwind_D1(z,1);
D1 = three_point_centered_D1(z);
%D1 = three_point_upwind_D1(z,1);
%D1 = five_point_centered_D1(z);
%D1 = five_point_biased_upwind_D1(z,1);
%D1 = four_point_upwind_D1(z,1);
%D1 = four_point_biased_upwind_D1(z, 1);
%% Approximation de la derivee seconde
D2 = three_point_centered_D2(z);
%D2 = five_point_centered_D2(z);
%D2 = seven_point_centered_D2(z);
%D2 = nine_point_centered_D2(z);

%% Conditions initiales (vecteur initial)
u0 = ones (length(z),1);
v0 = ones (length(z),1);
h0 = [u0;v0];

%% Initiation de Ode

%options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on','jpattern', sparse (spones([eye(n) + spones(D2), eye(n); eye(n),  eye(n)])));
options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on', 'Mass', mass(n));
%options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on');

%% Lancement du chronometre
tic

%% Appel de Ode (Ode45 ici)
[tout, yout] = ode15s(@Impulse_mass1,t,h0,options); %15s/23s/23t
%[tout, yout] = ode15s(@Impulse_sw,t,h0);
%[tout, yout] = ode15s(@Impulse_rapat,t,h0);
%% Arret et lecture du chronometre
tcpu=toc;
tcpu
uyout=yout(:,1:n);
vyout=yout(:,n+1:2*n);
%% Rapatriement CL (cas rapatriement)
% u(n)=(3*dz + u(n-1))/(1+3*dz);
% v(n)=(exp(4)*dz)/5 *(u(n)-1) + v(n-1);
% for i=1:length(tout)
%     yout(i:1)= 1;
%     yout(i:n)=(3*dz + uyout(n-1))/(1+3*dz);
%     yout(i:n+1)= 1;
%     yout(i,2*n)=(exp(4)*dz)/5 *(uyout(n)-1) + vyout(n-1);
% end

%% Visualisation graphique
%Visualizer2d(z,yout);
Visualizer(z,tout,yout);
