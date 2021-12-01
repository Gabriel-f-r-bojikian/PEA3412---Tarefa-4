function [amostra_atuacao] = detecta_amostra_atuacao(sinal_digital)
    amostra_atuacao = +Inf;
    for i=1:length(sinal_digital)
        if(sinal_digital(i) > 0)
            amostra_atuacao = i;
            break;
        endif
    endfor
endfunction