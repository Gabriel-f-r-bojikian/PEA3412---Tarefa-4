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

IopMin = 5; % A
k = 1;


k = 1;
correnteDeOperacaoA = [];
correnteDeResistenciaA = [];
for i=1:length(iaLocal)
    correnteDeOperacaoA(i) = abs(iaLocal(i).complex - iaRemoto(i).complex);
    correnteDeResistenciaA(i) = (iaLocal(i).magnitude + iaRemoto(i).magnitude)/2;
endfor

plota_grafico_diferencial(k, IopMin, max(correnteDeResistenciaA), max(correnteDeOperacaoA));

for i=1:length(correnteDeOperacaoA)
  plot(correnteDeResistenciaA(i), correnteDeOperacaoA(i), 'ob');
  pause(.1);
endfor

% plot(abs(correnteDeResistenciaA), abs(correnteDeOperacaoA), 'o');
