function [x,fi,fit,free] = faseAbelhasEscudeiras(x,fi,fit,free,SN,BN,D,lim,xMax,xMin)
  
  [m,i] = max(free);     
  
  if m > lim % se uma fonte de alimento estagnar
      [x(i,:),fi(i),fit(i)] = inicializaPopulacao(1, D, xMax, xMin);    % gera uma nova solu��o e a avalia    
        
     free(i) = 0; % posi��o i do vetor free � zerada      
  end
  
end
