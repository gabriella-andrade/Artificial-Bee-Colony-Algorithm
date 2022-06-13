function [x,fi,fit,free] = faseAbelhasEscudeiras(x,fi,fit,free,SN,BN,D,lim,xMax,xMin)
  
  [m,i] = max(free);     
  
  if m > lim % se uma fonte de alimento estagnar
      [x(i,:),fi(i),fit(i)] = inicializaPopulacao(1, D, xMax, xMin);    % gera uma nova solução e a avalia    
        
     free(i) = 0; % posição i do vetor free é zerada      
  end
  
end
