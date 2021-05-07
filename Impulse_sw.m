function ut= Impulse_sw(t,h)
global z n D1
u=h(1:n);
v=h(n+1:2*n);
u(1)=1;
v(1)=1;
ux=D1*u;
vx=D1*v;
%% CL 1
%     ux(n)=3-3*u(n);
%     vx(n)=(exp(4)/5) * (u(n)-1);
%% CL2
    ux(n)=0;
    vx(n)=0;
%% Dérivée seconde en cascade (stage-wise)
vxx=D1*vx;
uxx=D1*ux;
%% Ecriture de equation temporelle (cas 1)
    u_t= D1*((v-1).*ux) + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
%% Calcul des derivées temporelles (cas 1)
%     u_t= vx.*ux+(v-1).*uxx + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
%     v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
ut=[u_t; v_t];
end
