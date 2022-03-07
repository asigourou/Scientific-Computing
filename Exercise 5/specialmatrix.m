% Author: ALKISTIS-AIKATERINI SIGOUROU, AM 1059661, Date: 23/02/2021
n=500;
A5_1=spdiags((1:n)',0,n,n);
A5_2=spdiags([linspace(1,2,n/2)';linspace(1000,1001,n/2)'],0,n,n);

xsol=ones(n,1);

b5_1=A5_1*xsol;
b5_2=A5_2*xsol;

tol=1e-6;
maxIt=0:4*n;

for i=maxIt
    [x5_1,flag5_1,relres5_1,iter5_1,resvec5_1]= pcg(A5_1,b5_1,tol,i);
    res5_1(i+1)=relres5_1;
    [x5_2,flag5_2,relres5_2,iter5_2,resvec5_2]= pcg(A5_2,b5_2,tol,i);
    res5_2(i+1)=relres5_2;
end

semilogy(maxIt,res5_1,'-*g',maxIt,res5_2,'-or')
legend('A5_1','A5_2')
caption = sprintf('A5_1 error =%f , A5_2 error =%f ', relres5_1 , relres5_2);
annotation('textbox','String',caption,'FitBoxToText','on');
xlabel('Iterations')
ylabel('Error Value')
title('Results 5_1')
xlim([0 max(iter5_1,iter5_2)+10]);

[x5_1,flag5_1,relres5_1,iter5_1,resvec5_1]= pcg(A5_1,b5_1,tol,4*n);
[x5_2,flag5_2,relres5_2,iter5_2,resvec5_2]= pcg(A5_2,b5_2,tol,4*n);
iter5_1
iter5_2

condA5_1=condest(A5_1)
condA5_2=condest(A5_2)


