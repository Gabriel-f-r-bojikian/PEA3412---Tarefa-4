function plota_grafico_diferencial(k, IopMin, tamanho_eixo_x = 25, tamanho_eixo_y = 25);
  
  % Checagem para garantir um tamanho mínimo adequado de gráfico
  if tamanho_eixo_x < 25
    tamanho_eixo_x = 25;
  endif
  
  if tamanho_eixo_y < 25
    tamanho_eixo_y = 25;
  endif

  % Cria o domínio (Ires) e a imagem da função de proteção (Iop) que definem o limite
  % de operação do trip
  IresGrafico = 0:0.01:1.25*tamanho_eixo_x;
  IopGrafico = k*IresGrafico;

  % Impõe o valor mínimo de corrente de operação IopMin
  for i=1:length(IopGrafico)
    if IopGrafico(i) < IopMin
      IopGrafico(i) = IopMin;
    else
      break;
    endif
  endfor

  % Plota o gráfico com as devidas estilizações
  figure;
  plot(IresGrafico, IopGrafico, 'r');
  hold on;
  plot([0, IopMin/k], [IopMin, IopMin], '--k');
  text(1,tamanho_eixo_y-1, "Atua");
  text(tamanho_eixo_x-2, 1, "Nao Atua");
  xlim([0, 1.25*tamanho_eixo_x]);
  ylim([0, 1.25*tamanho_eixo_y]);
  xlabel("I_{res} [A]");
  ylabel("I_{op} [A]");
  yticks = 0:10:1.25*tamanho_eixo_y;
  yticks = [yticks, IopMin];
  yticks = sort(yticks);
  set(gca, 'ytick', yticks);
  hold on;
endfunction