
function  Visualizer(z,t,yout)
  global n
  uyout=yout(:,1:n);
  vyout=yout(:,n+1:2*n);
  %Creation de la grille
  figure()
  mesh(z,t,uyout);
  %% Solution u
  hold on;
  title ('Solution u');
  xlabel ('z (position)', 'Rotation', 20);
  ylabel ('t (temps)', 'Rotation', -30);
  zlabel ('v (amplitude du signal)');
  hold off;
  %% Solution v
  figure()
  mesh(z,t,vyout);
  hold on;
  title ('Solution v');
  xlabel ('z (position)', 'Rotation', 20);
  ylabel ('t (temps)', 'Rotation', -30);
  zlabel ('v (amplitude du signal)');
  hold off;

end