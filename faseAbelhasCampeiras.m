function [x,fi,fit,free] = faseAbelhasCampeiras(x,fi,fit,free,SN,BN,D,xMax,xMin)
  
  for i=1:SN
    
    v = x(i,:);           
    
    k = randi([1 BN]);    % seleciona o valor de k aleatóriamente entre 1 e o número de abelhas campeiras
    
    % o valor de k deve ser diferente do valor de i
    while(k==i) % enquanto o valor de k for igual a 1
      k = randi([1 BN]);  % seleciona o valor de k novamente
    end
    
    j = randi([1 D]);     % seleciona o valor de j aleatóriamente entre 1 e o tamanho da dimensão do problema
    
    % produz novas soluções v(i,j) para as abelhas campeiras
    v(j) = x(i,j) + ((rand()-0.5)*2) * (x(i,j) - x(k,j));
    
    
    if (v(j)) > xMax(j)      % se o valor do vetor v na posição j for maior que o limite máximo dos parâmetros
       v(j) = xMax(j);      % v(j) recebe o valor máximo dos parâmetros
    elseif (v(j)) < xMin(j)      % se o valor do vetor v na posição j for menor que o limite mínimo dos parâmetros
      v(j) = xMin(j);        % v(j) recebe o valor mínimo dos parâmetros
    end
  
  
    % avalia a nova população de fontes de alimentos 
    
    fiV = cost15(v); % calcula a função objetivo - Despacho Econômico com 15 unidades geradoras
    
    fitV = funcaoAptidao(fiV); % calcula o valor da aptidão da solução    
  
    
    % aplica o processo de seleção gananciosa entre cada uma das novas e a antigas fontes de alimentos
    if (fitV) > (fit(i))  % se o novo alimento tem um néctar melhor do que a fonte antiga
        x(i,:) = v;        % o novo alimento substitui o velho na memória
        fi(i) = fiV;
        fit(i) = fitV;
        
        free(i) = 0;
    else
        free(i) = free(i) + 1;
    end  
  
  end

end