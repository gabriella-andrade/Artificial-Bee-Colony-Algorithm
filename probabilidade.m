% Fun��o que calcula a probabilidade que cada abelha observadora escolher� uma fonte de alimento
function [p] = probabilidade(fit,SN)
  
  for i=1:SN  
    p(i) = fit(i) / sum(fit); 
  end

end
