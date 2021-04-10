function Visualizer2d(z, yout)
    global n
    vyout=yout(:,1:n);
    wyout=yout(:,n+1:2*n);
    
    %Figure(1)
    figure();
    plot(z, vyout,'b');
    hold on;
    title('Affichage de la solution u')
    xlabel('z (position)')
    ylabel('amplitude du signal')
    hold off;
    figure();
    plot(z,wyout,'r');
    hold on;
    title('Affichage de la solution v')
    xlabel('z (position)')
    ylabel('amplitude du signal')
    hold off;
end
    
    