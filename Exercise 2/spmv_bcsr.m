function y = spmv_bcsr(y ,val, row_blk,col_idx, x)
% Author: ALKISTIS-AIKATERINI SIGOUROU, AM 1059661, Date: 22/02/2021
	[m,n]=size(val);
	nb = m;

	n=length(row_blk)-1;
	for i=1:n    
		k1=row_blk(i)*nb-1; 
		k2=row_blk(i+1)*nb-2;
		
		xtemp=[];
	  
		checker=(k2-k1+1)/nb;
		for j=1:checker 
		    xtemp=[xtemp; x(col_idx(j)*nb-1:col_idx(j)*nb-1+nb-1)]; 
		end
		col_idx=col_idx(checker+1:end);
		       
		y(i*nb-nb+1:i*nb) = y(i*nb-nb+1:i*nb)+val(:,k1:k2)*xtemp;
	end

end

