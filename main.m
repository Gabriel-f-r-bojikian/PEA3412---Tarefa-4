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

filename = 'AN119_RED';

[iaLocal, ibLocal, icLocal, iaRemoto, ibRemoto, icRemoto ] = adquire_sinal(filename);

IopMin = 1; % A
k = 1;

plota_grafico_diferencial(k, IopMin);
