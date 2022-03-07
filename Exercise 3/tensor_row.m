function B = tensor_row(G)
% Author: ALKISTIS-AIKATERINI SIGOUROU, AM 1059661, Date: 18/02/2021

    [n,n,m]=size(G);
    
    B=zeros(n)
    for j=1:m
        
           B=B+G(:,:,j);
    end
end

