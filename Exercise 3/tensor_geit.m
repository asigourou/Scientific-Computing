function G = tensor_geit(A)
% Author: ALKISTIS-AIKATERINI SIGOUROU, AM 1059661, Date: 18/02/2021

    [n,n]=size(A);
    maxL = n-1;

    G(:,:,1)=A;

    for i=2:n-1

           G(:,:,i)=A^(i);
    end

end

