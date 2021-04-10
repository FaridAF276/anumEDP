function [ ht ] = Impulse_sw(t, h)

    %% Définitions des variables
    global z n D1; 
    %% Separation du vecteur initiale en u et v
    u = h(1:length (z));
    v = h(length(z)+1:2*length(z));
    ux=D1*u;
    vx=D1*v;
    %% Calcul des conditions au limite (cas stage-wise)
    u(1)=1;
    v(1)=1;
    ux(n)=3-3*u(n);
    vx(n)=(exp(4)/5)*(u(n)-1);
    uxx=D1*ux;
    vxx=D1*vx;
    %% Calcul des derivées temporelles (cas 1)
    u_t= vx.*ux + (v-1).*uxx + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    %% Calcul des derivées temporelles (cas 2)
    %u_t= D1*((v-1).*ux) + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    %v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    ht=[u_t;v_t];
end