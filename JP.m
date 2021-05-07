function Jpattern = JP ()
    global n D1 D2;
    
    %% Definition de la Jacobienne pour option Jpattern
%     Jpattern = spones([eye(n) + D2, eye(n); eye(n),  eye(n)]);
%     Jpattern = spones([(eye(n) + D1 + D2 ); eye(n)+D1], [(eye(n) + D1); D2]);
      Jpattern = sparse(spones([eye(n) + spones(D1) + spones(D2), eye(n) + spones(D1); eye(n)+spones(D1), spones(D2)]));
end
