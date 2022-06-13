%
% Algoritmo Artificial Bee Colony (ABC)
% Autor: Gabriella Lopes Andrade
% 
% Refer�ncia:  KARABOGA, D., BASTURK, B., �Artificial Bee Colony (ABC) Optimization Algorithm for Solving 
%              Constrained Optimization Problems�, In: Foundationsof Fuzzy Logic and Soft Computing, v. 4529,  
%              pp. 789�798, sLecture Notes in Computer Science, Springer Berlin Heidelberg, 2007.
%


clear;                    % limpa toda mem�ria

COL=20;                   % tamanho da col�nia de abelhas
SN=COL/2;                 % n�mero de fontes de alimentos
BN=SN;                    % n�mero inicial de abelhas campeiras
BC=COL-BN;                % n�mero de abelhas seguidoras
lim=100;                  % n�mero de tentativas de liberar uma fonte de alimento
free=zeros(1,SN);         % vetor para controlar a libera��o de uma fonte de alimento
D=15;                      % tamanho do espa�o do problema
MCN=10000;                 % n�mero m�ximo de ciclos        
xMax=[455 455 130 130 470 460 465 300 162 160 80 80 85 55 55];          % limite m�ximo dos par�metros
xMin=[150 150 20 20 150 135 135 60 25 25 20 20 25 15 15];          % limite m�nimo dos par�metros

format long;

saida=zeros(MCN,D+1);

tic % marca o tempo inicial

[x,fi,fit] = inicializaPopulacao(SN, D, xMax, xMin); % gera a popula��o inicial e a avalia

% salva a melhor solu��o encontrada at� agora
[m,i] = min(fi);       % retorna o melhor valor encontrado no vetor de aptid�o (fit) e sua posi��o (i)
melhorSol = m;      % a vari�vel melhorSol recebe o valor de fi na posi��o do mais apto (i)
parMelhorSol = x(i,:);  % o vetor parMelhorSol recebe os parametros que levam a melhor solu��o 

%ap�s inicializar a popula��o repetir at� o n�mero m�ximo de ciclos
for ciclo = 1:MCN
  
  % busca local na fase das abelhas campeiras  
  [x,fi,fit,free] = faseAbelhasCampeiras(x,fi,fit,free,SN,BN,D,xMax,xMin);
    
  % calcula a probabilidade de escolha das fontes de alimentos pelas abelhas seguidoras 
  p = probabilidade(fit,SN); 
  
  % busca local na fase das abelhas seguidoras dependendo da probabilidade de escolha de cada fonte
  [x,fi,fit,free] = faseAbelhasSeguidoras(p,x,fi,fit,free,SN,BN,BC,D,xMax,xMin); 
    
  % busca global na fase das abelhas escudeiras
  % buscam novas fontes de alimentos para substituir as fontes que n�o melhoraram 
  [x,fi,fit,free] = faseAbelhasEscudeiras(x,fi,fit,free,SN,BN,D,lim,xMax,xMin);  
 
  % salva a melhor solu��o encontrada at� agora
  [m,i] = min(fi);           
   
  if m < melhorSol          % se
    melhorSol = m;          % a vari�vel melhorSol recebe o valor de fi na posi��o do mais apto (i)
    parMelhorSol = x(i,:);    % o vetor parMelhorSol recebe os parametros que levam a melhor solu��o
  end
  
  saida(ciclo,1:D) = parMelhorSol;  
  saida(ciclo,D+1) =  melhorSol;
  
end

toc % marca o tempo final
%dlmwrite('saidaF6DeSchaffer.txt',saida,'delimiter',' ','precision','%.10f');