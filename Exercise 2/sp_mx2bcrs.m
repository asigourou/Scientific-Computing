function [val,col_idx,row_blk] = sp_mx2bcrs(A,nb)
% Author: ALKISTIS-AIKATERINI SIGOUROU, AM 1059661, Date: 22/02/2021

[n,n]=size(A);
	if size(A)~=[n,n], error('wrong dimensions!'), end

	val=[];


	col_idx=[];

	row_blk=[];

	col_idx_checker = (1:n/nb);
	count=0;

	for i=1:nb:n 
	    k=0;
	    flag=1;
	    for j=1:nb:n
		k=k+1;    
		block=A(i:i+nb-1,j:j+nb-1);
		if sum(nnz(block))~=0             
		    val=[val block]; 
		    
		    col_idx=[col_idx col_idx_checker(k)];            
		    
		    count=count+1;
		    if flag==1
		        row_blk=[row_blk count];
		    end
		    flag = 0;
		end
	    end
	end
	row_blk=[row_blk count+1];




end
