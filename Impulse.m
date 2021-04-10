function [ ht ] = Impulse(t, h)

    %% Définitions des variables
    global z n D1 D2 dz; 
    %% Separation du vecteur initiale en u et v
    u = h(1:length (z));
    v = h(length(z)+1:2*length(z));
    %% Calcul des CL (cas rapatriement)
%     u(1)=1;
%     v(1)=1;
%     u(n)=(3*dz + u(n-1))/(1+3*dz);
%     v(n)=(exp(4)*dz)/5 *(u(n)-1) + v(n-1);
    %% Calcul des dérivées spatiale
    %%Calcul des dérivées spatiales
    ux= D1*u;
    vx = D1*v;
    %% Calcul des conditions au limite (cas stage-wise)
    u(1)=1;
    v(1)=1;
    ux(n)=3-3*u(n);
    vx(n)=(exp(4)/5)*(u(n)-1);
    uxx=D1*ux;
    vxx=D1*vx;
    %% Calcul des derivées temporelles (cas 1)
    u_t= vx.*ux+(v-1).*uxx + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    %% Calcul des derivées temporelles (cas 2)
    %u_t= D1*((v-1).*ux) + (16*z*t-2*t-16*(v-1)).*(u-1)+ 10*z.*exp(-4*z);
    %v_t= vxx + ux + 4*u-4-2*t+z.^2-10*t.*exp(-4*z);
    %% Correction condition limite (cas matrice de masse)
    %u_t(1)=u(1)-1;
    %v_t(1)=v(1)-1;
    %u_t(n)=-3*u(n)+3-ux(n);
    %v_t(n)= (exp(4)/5) * (u(n)-1) - vx(n);
    %% Rapatriement CL
%     u_t(1)=0;
%     u_t(n)=0;
%     v_t(1)=0;
%     v_t(n)=0;
    ht = [u_t ; v_t];
end