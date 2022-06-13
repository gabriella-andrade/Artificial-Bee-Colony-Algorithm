function [x,fi,fit,free] = faseAbelhasCampeiras(x,fi,fit,free,SN,BN,D,xMax,xMin)
  
  for i=1:SN
    
    v = x(i,:);           
    
    k = randi([1 BN]);    % seleciona o valor de k aleat�riamente entre 1 e o n�mero de abelhas campeiras
    
    % o valor de k deve ser diferente do valor de i
    while(k==i) % enquanto o valor de k for igual a 1
      k = randi([1 BN]);  % seleciona o valor de k novamente
    end
    
    j = randi([1 D]);     % seleciona o valor de j aleat�riamente entre 1 e o tamanho da dimens�o do problema
    
    % produz novas solu��es v(i,j) para as abelhas campeiras
    v(j) = x(i,j) + ((rand()-0.5)*2) * (x(i,j) - x(k,j));
    
    
    if (v(j)) > xMax(j)      % se o valor do vetor v na posi��o j for maior que o limite m�ximo dos par�metros
       v(j) = xMax(j);      % v(j) recebe o valor m�ximo dos par�metros
    elseif (v(j)) < xMin(j)      % se o valor do vetor v na posi��o j for menor que o limite m�nimo dos par�metros
      v(j) = xMin(j);        % v(j) recebe o valor m�nimo dos par�metros
    end
  
  
    % avalia a nova popula��o de fontes de alimentos 
    
    fiV = cost15(v); % calcula a fun��o objetivo - Despacho Econ�mico com 15 unidades geradoras
    
    fitV = funcaoAptidao(fiV); % calcula o valor da aptid�o da solu��o    
  
    
    % aplica o processo de sele��o gananciosa entre cada uma das novas e a antigas fontes de alimentos
    if (fitV) > (fit(i))  % se o novo alimento tem um n�ctar melhor do que a fonte antiga
        x(i,:) = v;        % o novo alimento substitui o velho na mem�ria
        fi(i) = fiV;
        fit(i) = fitV;
        
        free(i) = 0;
    else
        free(i) = free(i) + 1;
    end  
  
  end

end