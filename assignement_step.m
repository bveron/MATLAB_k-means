function S = assignement_step(k_clusters,x,m,distance_type)

    S = zeros(1,size(x,2)) ;

 %assignement step
	for ii = 1 : size(x,2)
    
        dist = distance_calculation(k_clusters,x,ii,m,distance_type) ;
        
        if sum(dist==min(dist))>1
            dist = dist + rand(1,length(dist))*mean(dist)*1e-6 ;
            S(ii) = find(dist==min(dist)) ;
        else
            S(ii) = find(dist==min(dist)) ;
        end
	end
  
end

