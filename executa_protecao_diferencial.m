function [sinal_de_atuacao] = executa_protecao_diferencial(Ilocal, Iremoto, IopMin, k, animacao = false)
    correnteDeOperacao = [];
    correnteDeResistencia = [];
    atuacao = [];
    for i=1:length(Ilocal)
        correnteDeOperacao(i) = abs(Ilocal(i).complex - Iremoto(i).complex);
        correnteDeResistencia(i) = (Ilocal(i).magnitude + Iremoto(i).magnitude)/2;
        if( correnteDeOperacao(i) > IopMin && correnteDeOperacao(i) > k*correnteDeResistencia(i) )
        sinal_de_atuacao(i) = 1;
        else
        sinal_de_atuacao(i) = 0;
        endif
    endfor

    plota_grafico_diferencial(k, IopMin)%, max(correnteDeResistencia), max(correnteDeOperacao));

    for i=1:length(correnteDeOperacao)
        plot(correnteDeResistencia(i), correnteDeOperacao(i), 'ob');
        
        if( animacao == true)
            pause(.1);
        endif
    endfor
endfunction
