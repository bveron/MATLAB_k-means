function m = update_step(k_clusters,x,S)
    
  for kk = 1 : k_clusters
    m(:,kk) = (1./sum(S==kk)) .* sum(x(:,find(S==kk)),2) ;
  end
    
end
