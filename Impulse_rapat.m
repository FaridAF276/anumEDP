function [ ht ] = Impulse_rapat(t, h)

    %% Définitions des variables
    global z n D1 D2 dz; 
    %% Separation du vecteur initiale en u et v
    u = h(1:length (z));
    v = h(length(z)+1:2*length(z));
    %% Calcul des CL (cas rapatriement)
    u(1)=1;
    v(1)=1;
    u(n)=(3*dz + u(n-1))/(1+3*dz);
    v(n)=(exp(4)*dz)/5 *(u(n)-1) + v(n-1);
    %% Calcul des dérivées spatiales
    %%Calcul des dérivées spatiales
    ux= D1*u;
    vx = D1*v;
    uxx=D2*u;
    vxx=D2*u;
    %% Calcul des derivées temporelles (cas 1)
    %u_t= vx.*ux+(v-1).*uxx + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    %v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    %% Calcul des derivées temporelles (cas 2)
    u_t= D1*((v-1).*ux) + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    %% Rapatriement CL
    u_t(1)=0;
    u_t(n)=0;
    v_t(1)=0;
    v_t(n)=0;
    ht = [u_t ; v_t];
end