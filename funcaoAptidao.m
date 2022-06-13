% Função que calcula o valor da aptidão da solução
function [fit] = funcaoAptidao(valor)
  
   % calcula a aptidão para a fonte de alimento recebida como parametro
   if valor >= 0         % se o valor da função objetivo produzido com a solução xi for maior ou igual a zero 
      fit = 1/(1+valor);
   else               % senão
      fit = 1+abs(valor);  
   end

end