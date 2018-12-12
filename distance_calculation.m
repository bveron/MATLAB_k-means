function dist = distance_calculation(k_clusters,x,ii,m,distance_type)
  
	switch distance_type
        case {'Euclidian'}
            dist = sum((repmat(x(:,ii),1,k_clusters)-m).^2) ; 
        case {'Manhattan'}
            dist = sum(abs((repmat(x(:,ii),1,k_clusters)-m))) ;  
        case {'Chebyshev'}
            dist = max(abs((repmat(x(:,ii),1,k_clusters)-m))) ;
	end
    
      
end
