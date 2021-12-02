function [sinal_de_atuacao] = executa_protecao_diferencial(Ilocal, Iremoto, IopMin, k, animacao = false)
    
    % Buffers para os sinais de corrente de operação e de restrição
    correnteDeOperacao = []; % Iop
    correnteDeResistencia = []; % Ires
    atuacao = []; % Sinal digital de trip do disjuntor
    
    % Será necessário iterar ponto a ponto dos sinais de corrente locais e remotos
    % para que se possam fazer as contas fasoriais entre eles.
    for i=1:length(Ilocal)
        correnteDeOperacao(i) = abs(Ilocal(i).complex - Iremoto(i).complex); % Iop = |I1 - I2|
        correnteDeResistencia(i) = (Ilocal(i).magnitude + Iremoto(i).magnitude)/2; % Ires = ( |I1| + |I2| )/2
        
        % Checa se a corrente de operação é maior do que a corrente de operação mínima e se
        % ela é maior do que a corrente de restrição multiplicada pelo fator k escolhido.
        if( correnteDeOperacao(i) > IopMin && correnteDeOperacao(i) > k*correnteDeResistencia(i) ) 
            sinal_de_atuacao(i) = 1; % Se sim, atua o trip
        else
            sinal_de_atuacao(i) = 0; % Se não, não faz nada
        endif
    endfor

    % Vamos plotar o gráfico da função de proteção que projetamos
    plota_grafico_diferencial(k, IopMin, max(correnteDeResistencia), max(correnteDeOperacao));

    % Em cima do gráfico de proteção anterior, vamos plotar os pontos
    % correspondentes de Iop x Ires
    for i=1:length(correnteDeOperacao)
        plot(correnteDeResistencia(i), correnteDeOperacao(i), 'ob');
        
        % Se animação == true, plota os pontos devagar para que
        % o usuário possa ver a animacao
        if( animacao == true)
            pause(.1);
        endif
    endfor
endfunction
