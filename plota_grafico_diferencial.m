function plota_grafico_diferencial(k, IopMin, tamanho_eixo_x, tamanho_eixo_y);
  IresGrafico = 0:0.01:1.25*tamanho_eixo_x;
  IopGrafico = k*IresGrafico;

  for i=1:length(IopGrafico)
    if IopGrafico(i) < IopMin
      IopGrafico(i) = IopMin;
    else
      break;
    endif
  endfor

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
  hold on;
endfunction