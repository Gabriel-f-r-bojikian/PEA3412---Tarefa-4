% ------------------------------------------------------------------------------------------- %
%   PEA 3412 - Tarefa 4
  
%   Grupo G:
%    - Gabriel Fernandes Rosa Bojikian, 9349221
%    - Maurício Kenji Sanda, 10773190
%    - Pedro César Igarashi, 10812071
%
% ------------------------------------------------------------------------------------------- %
close all;
fclose all;
clear all;
clc;

filename = 'ABC014_RED';

[ iaLocal, ibLocal, icLocal, iaRemoto, ibRemoto, icRemoto ] = adquire_sinal(filename);

[zero, direta, inversa] = calcula_componentes_simetricas(iaLocal, ibLocal, icLocal);

IopMin = 5.5; % A
k = 0.5;

% Varre o sinal de corrente da fase A e executa a proteção diferencial se necessário
sinal_digital_de_atuacao_protecao_fase_A = executa_protecao_diferencial(iaLocal, iaRemoto, IopMin, k);
title("Protecao diferencial - fase A");

  % Plota o sinal digital de proteção
  figure;
  stem(sinal_digital_de_atuacao_protecao_fase_A);
  title("Sinal digital de atuacao da protecao diferencial - fase A")

  % Detecta em qual amostra do sinal digital original da fase A ocorre o pedido de atuação da proteção
  amostra_atuacao_fase_A = detecta_amostra_atuacao(sinal_digital_de_atuacao_protecao_fase_A);
  disp(["Amostra de atuacao: ", num2str(amostra_atuacao_fase_A), " - ", num2str(amostra_atuacao_fase_A*1000/(16*60)), " ms apos inicio do sinal"]);

% Varre o sinal de corrente da fase B e executa a proteção diferencial se necessário
sinal_digital_de_atuacao_protecao_fase_B = executa_protecao_diferencial(ibLocal, ibRemoto, IopMin, k);
title("Protecao diferencial - fase B");
  
  % Plota o sinal digital de proteção
  figure;
  stem(sinal_digital_de_atuacao_protecao_fase_B);
  title("Sinal digital de atuacao da protecao diferencial - fase B")

  % Detecta em qual amostra do sinal digital original da fase B ocorre o pedido de atuação da proteção
  amostra_atuacao_fase_B = detecta_amostra_atuacao(sinal_digital_de_atuacao_protecao_fase_B);
  disp(["Amostra de atuacao: ", num2str(amostra_atuacao_fase_B), " - ", num2str(amostra_atuacao_fase_B*1000/(16*60)), " ms apos inicio do sinal"]);


% Varre o sinal de corrente da fase C e executa a proteção diferencial se necessário
sinal_digital_de_atuacao_protecao_fase_C = executa_protecao_diferencial(icLocal, icRemoto, IopMin, k);
title("Protecao diferencial - fase C");

  % Plota o sinal digital de proteção
  figure;
  stem(sinal_digital_de_atuacao_protecao_fase_C);
  title("Sinal digital de atuacao da protecao diferencial - fase C")

  % Detecta em qual amostra do sinal digital original da fase C ocorre o pedido de atuação da proteção
  amostra_atuacao_fase_C = detecta_amostra_atuacao(sinal_digital_de_atuacao_protecao_fase_C);
  disp(["Amostra de atuacao: ", num2str(amostra_atuacao_fase_C), " - ", num2str(amostra_atuacao_fase_C*1000/(16*60)), " ms apos inicio do sinal"]);
