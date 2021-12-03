function [amostra_atuacao] = detecta_amostra_atuacao(sinal_digital)
    amostra_atuacao = +Inf;

    % Acha os pontos em que o sinal é positivo e começa um contador
    % Se forem mais de 8 amostras positivas (meio ciclo, ~ 8 ms),
    % detecta um sinal de atuação válido
    contador_amostras = 0;
    for i=1:length(sinal_digital)
        if(sinal_digital(i) > 0)
            contador_amostras += 1; % Soma se o sinal for positivo
        else
            if contador_amostras > 0
                contador_amostras -= 1; % Subtrai até o minimo de 0, caso não
            endif
        endif

        % Checa se batemos na condição de atuação válida
        if contador_amostras >= 8
            amostra_atuacao = i;
            break;
        endif
    endfor
endfunction