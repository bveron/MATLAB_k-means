function plot_clusters(k_clusters,x,S,m,iteration,initialization_type,distance_type,max_iterations)
  
  C = {'b','r','g','k','y'} ;
  
  figure(1) ;
  for jj = 1 : size(x,2)
    hold on ;
    plot(x(1,jj),x(2,jj),'color',C{S(jj)},'marker','+')
    %pause(0.0001);
  end
  
  if ((iteration==0)&&((strncmp(initialization_type,'random',6))==1))==0
    for kk = 1 : k_clusters
      hold on;
      plot(m(1,kk),m(2,kk),'color',C{kk},'marker','*','markersize', 15)
    end
  end
  
  title(['Distance : ',distance_type,' | Initialization: ',initialization_type,' | Iteration: ',int2str(iteration),'/',int2str(max_iterations)])
  %legend(['k1(b): ',int2str(length(find(S==1))),' | k2(r): ',int2str(length(find(S==2))),' | k3(g): ',int2str(length(find(S==3)))])
  
  
end
