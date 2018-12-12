function [m,S] = initialize_clusters(k_clusters,x,initialization_type)
  
  if strncmp(initialization_type,'Forgy',5)
    
    m = round(rand(1,k_clusters) * length(x)) ;    
   
    while length(unique(m)) ~= length(m)
      m = round(rand(1,k_clusters) * length(x)) ;
    end
    
    m = x(:,m) ;
    S = [] ;
  
  elseif strncmp(initialization_type,'random',6)
    
    minRand = 0.5 ;
    maxRand = k_clusters+0.5 ;
    
    S = round((rand(1,size(x,2)).*(maxRand-minRand))+minRand) ;
    m = [] ;
    
    
    %m = [(rand(1,k_clusters).*(max(x(1,:))-min(x(1,:))))+min(x(1,:)) ;...
    %         (rand(1,k_clusters).*(max(x(2,:))-min(x(2,:))))+min(x(2,:))] ;
  
  end

end