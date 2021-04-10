function m=mass(n)
mg1=eye(2*n);
mg1(1,1)=0;
mg1(n,n)=0;
mg1(n+1,n+1)=0;
mg1(2*n,2*n)=0;
m=sparse(mg1);
end
