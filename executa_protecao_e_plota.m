%{
    Função - executa_protecao_e_plota

    Argumentos:
        - iLocal: Corrente do terminal local. Pode ser de linha ou componente simétrica
        - iRemoto: Corrente do terminal remoto correspondente. Precisa ser do mesmo tipo de iLocal (linha ou componente simétrica)
        - IopMin: Corrente de operação mínima da proteção diferencial
        - k: Fator de proporcionalidade da proteção diferencial
        - tituloGrafico: Título dos gráficos que serão plotados por esta função
        - ehComponenteSimetrica: Flag para identificar se as correntes são de componentes simétricas

    O que faz esta função:
        Esta função executa a proteção diferencial no par de correntes locais e remotas fornecido,
        plota o diagrama de proteção diferencial, gera um sinal digital de atuação do trip e 
        identifica o momento de trip.
%}


function executa_protecao_e_plota(iLocal, iRemoto, IopMin, k, tituloGrafico, ehComponenteSimetrica = false)
    % Varre o sinal de corrente executa a proteção diferencial se necessário
    if(ehComponenteSimetrica)
        sinal_digital_de_atuacao_protecao = executa_protecao_diferencial_componentes_simetricas(iLocal, iRemoto, IopMin, k);
    else
        sinal_digital_de_atuacao_protecao = executa_protecao_diferencial(iLocal, iRemoto, IopMin, k);
    endif
    
    title(["Protecao diferencial - ", tituloGrafico]);

    % Plota o sinal digital de proteção
    figure;
    stem(sinal_digital_de_atuacao_protecao);
    title(["Sinal digital de atuacao da protecao diferencial - ", tituloGrafico])

    % Detecta em qual amostra do sinal digital ocorre o pedido de atuação da proteção
    amostra_atuacao = detecta_amostra_atuacao(sinal_digital_de_atuacao_protecao);
    disp([tituloGrafico, " - amostra de atuacao: ", num2str(amostra_atuacao), " - ", num2str(amostra_atuacao*1000/(16*60)), " ms apos inicio do sinal"]);
endfunction