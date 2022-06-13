% Fun��o que calcula o valor da aptid�o da solu��o
function [fit] = funcaoAptidao(valor)
  
   % calcula a aptid�o para a fonte de alimento recebida como parametro
   if valor >= 0         % se o valor da fun��o objetivo produzido com a solu��o xi for maior ou igual a zero 
      fit = 1/(1+valor);
   else               % sen�o
      fit = 1+abs(valor);  
   end

end