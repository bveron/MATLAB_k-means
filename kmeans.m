clear all
close all
clc

%% k-means

k_clusters = 5 ;
distance_type = 'Chebyshev' ; % 'Euclidian','Chebyshev','Manhattan'
initialization_type = 'random' ; % 'Forgy','random'
dimensions = 2 ;
max_iterations = 20 ;

x = randn(dimensions,5000)*1000 ; 
x = round(x) ;

if k_clusters > size(x,2)
    disp('Error: k_clusters is too large') ;
end


%initialization
[m,S] = initialize_clusters(k_clusters,x,initialization_type) ;

SS = zeros(max_iterations+1,k_clusters) ;

for iteration = 0 : max_iterations

  %assignement step
  if ((iteration==0)&&((strncmp(initialization_type,'random',6))==1))==0
    S = assignement_step(k_clusters,x,m,distance_type)  ;
  end

  %plot
  plot_clusters(k_clusters,x,S,m,iteration,initialization_type,distance_type,max_iterations) ;
  % save clusters sizes
  for jj = 1 : k_clusters
    SS(iteration+1,jj) = sum(S==(jj)) ;
  end
  %update step
  m = update_step(k_clusters,x,S) ;
  
  pause(0.05)
  
end

figure;plot(SS)





