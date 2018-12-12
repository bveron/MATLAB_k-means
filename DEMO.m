clear all
close all
clc

%% k-means

k_clusters = 5 ;
distance_type_Euclidian = 'Euclidian' ; % 'Euclidian','Chebyshev','Manhattan'
distance_type_Chebyshev = 'Chebyshev' ; % 'Euclidian','Chebyshev','Manhattan'
distance_type_Manhattan = 'Manhattan' ; % 'Euclidian','Chebyshev','Manhattan'
initialization_type_Forgy = 'Forgy' ; % 'Forgy','random'
initialization_type_random = 'random' ; % 'Forgy','random'
dimensions = 2 ;
max_iterations = 6 ;

x = rand(dimensions,500)*1000 ; 
x = round(x) ;

if k_clusters > size(x,2)
    disp('Error: k > x') ;
end


%initialization
[m_Forgy_Euclidian,S_Forgy_Euclidian] = initialize_clusters(k_clusters,x,initialization_type_Forgy) ;
[m_Forgy_Chebyshev,S_Forgy_Chebyshev] = initialize_clusters(k_clusters,x,initialization_type_Forgy) ;
[m_Forgy_Manhattan,S_Forgy_Manhattan] = initialize_clusters(k_clusters,x,initialization_type_Forgy) ;
[m_random_Euclidian,S_random_Euclidian] = initialize_clusters(k_clusters,x,initialization_type_random) ;
[m_random_Chebyshev,S_random_Chebyshev] = initialize_clusters(k_clusters,x,initialization_type_random) ;
[m_random_Manhattan,S_random_Manhattan] = initialize_clusters(k_clusters,x,initialization_type_random) ;
iteration = 0 ;

figure ;

while iteration <= max_iterations

  %assignement step
  if ((iteration==0)&&((strncmp(initialization_type_random,'random',6))==1))==0
    S_random_Euclidian = assignement_step(k_clusters,x,m_random_Euclidian,distance_type_Euclidian)  ;
    S_random_Chebyshev = assignement_step(k_clusters,x,m_random_Chebyshev,distance_type_Chebyshev)  ;
    S_random_Manhattan = assignement_step(k_clusters,x,m_random_Manhattan,distance_type_Manhattan)  ;    
  end
  
	S_Forgy_Euclidian = assignement_step(k_clusters,x,m_Forgy_Euclidian,distance_type_Euclidian)  ;
    S_Forgy_Chebyshev = assignement_step(k_clusters,x,m_Forgy_Chebyshev,distance_type_Chebyshev)  ;
    S_Forgy_Manhattan = assignement_step(k_clusters,x,m_Forgy_Manhattan,distance_type_Manhattan)  ;
    
	%plot
	subplot(2,3,1)
	plot_clusters(k_clusters,x,S_Forgy_Euclidian,m_Forgy_Euclidian,iteration,initialization_type_Forgy,distance_type_Euclidian,max_iterations) ;
  
	subplot(2,3,2)
	plot_clusters(k_clusters,x,S_Forgy_Chebyshev,m_Forgy_Chebyshev,iteration,initialization_type_Forgy,distance_type_Chebyshev,max_iterations) ;
  
    subplot(2,3,3)
	plot_clusters(k_clusters,x,S_Forgy_Manhattan,m_Forgy_Manhattan,iteration,initialization_type_Forgy,distance_type_Manhattan,max_iterations) ;
  
    subplot(2,3,4)
	plot_clusters(k_clusters,x,S_random_Euclidian,m_random_Euclidian,iteration,initialization_type_random,distance_type_Euclidian,max_iterations) ;
  
    subplot(2,3,5)
	plot_clusters(k_clusters,x,S_random_Chebyshev,m_random_Chebyshev,iteration,initialization_type_random,distance_type_Chebyshev,max_iterations) ;
  
    subplot(2,3,6)
	plot_clusters(k_clusters,x,S_random_Manhattan,m_random_Manhattan,iteration,initialization_type_random,distance_type_Manhattan,max_iterations) ;
  
  
  
  %update step
  m_Forgy_Euclidian = update_step(k_clusters,x,S_Forgy_Euclidian) ;
  m_Forgy_Chebyshev = update_step(k_clusters,x,S_Forgy_Chebyshev) ;
  m_Forgy_Manhattan = update_step(k_clusters,x,S_Forgy_Manhattan) ;
  m_random_Euclidian = update_step(k_clusters,x,S_random_Euclidian) ;
  m_random_Chebyshev = update_step(k_clusters,x,S_random_Chebyshev) ;
  m_random_Manhattan = update_step(k_clusters,x,S_random_Manhattan) ;
  
  iteration = iteration + 1 ;
  pause(0.05)
  
end







