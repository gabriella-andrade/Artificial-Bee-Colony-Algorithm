% inicializa a população de soluções x[SN,D]
function [x,fi,fit] = inicializaPopulacao(linhas, colunas, xMax, xMin)
 
  for i=1:linhas 
    for j=1:colunas           
      x(i,j)= xMin(j) + (rand()*(xMax(j) - xMin(j))); %inicialização de cada solução candidata 
    end
    
    % Avalia a população     
    fi(i) = cost15(x(i,:)); % calcula a função objetivo - Despacho Econômico com 15 unidades geradoras
    fit(i) = funcaoAptidao(fi(i)); % calcula o valor da aptidão da solução    
  
  end
  
end