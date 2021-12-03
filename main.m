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

[zeroLocal, diretaLocal, inversaLocal] = calcula_componentes_simetricas(iaLocal, ibLocal, icLocal);
[zeroRemoto, diretaRemoto, inversaRemoto] = calcula_componentes_simetricas(iaRemoto, ibRemoto, icRemoto);

plota_componentes_simetricas(zeroLocal, diretaLocal, inversaLocal, ["Local - ", filename]);
plota_componentes_simetricas(zeroRemoto, diretaRemoto, inversaRemoto, ["Remoto - ", filename]);

IopMin = 5.5; % A
k = 0.5;

% Varre o sinal de corrente da sequencia inversa e executa a proteção diferencial se necessário
executa_protecao_e_plota(zeroLocal, zeroRemoto, IopMin, k, ["Sequencia Zero - ", filename], true);

% Varre o sinal de corrente da sequencia direta e executa a proteção diferencial se necessário
executa_protecao_e_plota(diretaLocal, diretaRemoto, IopMin, k, ["Sequencia Direta - ", filename], true);

% Varre o sinal de corrente da sequencia inversa e executa a proteção diferencial se necessário
executa_protecao_e_plota(inversaLocal, inversaRemoto, IopMin, k, ["Sequencia Inversa - ", filename], true);
