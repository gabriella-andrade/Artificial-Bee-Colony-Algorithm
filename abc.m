%
% Algoritmo Artificial Bee Colony (ABC)
% Autor: Gabriella Lopes Andrade
% 
% Referência:  KARABOGA, D., BASTURK, B., “Artificial Bee Colony (ABC) Optimization Algorithm for Solving 
%              Constrained Optimization Problems”, In: Foundationsof Fuzzy Logic and Soft Computing, v. 4529,  
%              pp. 789–798, sLecture Notes in Computer Science, Springer Berlin Heidelberg, 2007.
%


clear;                    % limpa toda memória

COL=20;                   % tamanho da colônia de abelhas
SN=COL/2;                 % número de fontes de alimentos
BN=SN;                    % número inicial de abelhas campeiras
BC=COL-BN;                % número de abelhas seguidoras
lim=100;                  % número de tentativas de liberar uma fonte de alimento
free=zeros(1,SN);         % vetor para controlar a liberação de uma fonte de alimento
D=15;                      % tamanho do espaço do problema
MCN=10000;                 % número máximo de ciclos        
xMax=[455 455 130 130 470 460 465 300 162 160 80 80 85 55 55];          % limite máximo dos parâmetros
xMin=[150 150 20 20 150 135 135 60 25 25 20 20 25 15 15];          % limite mínimo dos parâmetros

format long;

saida=zeros(MCN,D+1);

tic % marca o tempo inicial

[x,fi,fit] = inicializaPopulacao(SN, D, xMax, xMin); % gera a população inicial e a avalia

% salva a melhor solução encontrada até agora
[m,i] = min(fi);       % retorna o melhor valor encontrado no vetor de aptidão (fit) e sua posição (i)
melhorSol = m;      % a variável melhorSol recebe o valor de fi na posição do mais apto (i)
parMelhorSol = x(i,:);  % o vetor parMelhorSol recebe os parametros que levam a melhor solução 

%após inicializar a população repetir até o número máximo de ciclos
for ciclo = 1:MCN
  
  % busca local na fase das abelhas campeiras  
  [x,fi,fit,free] = faseAbelhasCampeiras(x,fi,fit,free,SN,BN,D,xMax,xMin);
    
  % calcula a probabilidade de escolha das fontes de alimentos pelas abelhas seguidoras 
  p = probabilidade(fit,SN); 
  
  % busca local na fase das abelhas seguidoras dependendo da probabilidade de escolha de cada fonte
  [x,fi,fit,free] = faseAbelhasSeguidoras(p,x,fi,fit,free,SN,BN,BC,D,xMax,xMin); 
    
  % busca global na fase das abelhas escudeiras
  % buscam novas fontes de alimentos para substituir as fontes que não melhoraram 
  [x,fi,fit,free] = faseAbelhasEscudeiras(x,fi,fit,free,SN,BN,D,lim,xMax,xMin);  
 
  % salva a melhor solução encontrada até agora
  [m,i] = min(fi);           
   
  if m < melhorSol          % se
    melhorSol = m;          % a variável melhorSol recebe o valor de fi na posição do mais apto (i)
    parMelhorSol = x(i,:);    % o vetor parMelhorSol recebe os parametros que levam a melhor solução
  end
  
  saida(ciclo,1:D) = parMelhorSol;  
  saida(ciclo,D+1) =  melhorSol;
  
end

toc % marca o tempo final
%dlmwrite('saidaF6DeSchaffer.txt',saida,'delimiter',' ','precision','%.10f');