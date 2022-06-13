% inicializa a popula��o de solu��es x[SN,D]
function [x,fi,fit] = inicializaPopulacao(linhas, colunas, xMax, xMin)
 
  for i=1:linhas 
    for j=1:colunas           
      x(i,j)= xMin(j) + (rand()*(xMax(j) - xMin(j))); %inicializa��o de cada solu��o candidata 
    end
    
    % Avalia a popula��o     
    fi(i) = cost15(x(i,:)); % calcula a fun��o objetivo - Despacho Econ�mico com 15 unidades geradoras
    fit(i) = funcaoAptidao(fi(i)); % calcula o valor da aptid�o da solu��o    
  
  end
  
end