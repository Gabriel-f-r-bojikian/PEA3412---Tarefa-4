function plota_grafico_diferencial(k, IopMin);
  IresGrafico = 0:0.01:10;
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
  text(1,max(IopGrafico)-1, "Atua");
  text(max(IresGrafico)-2, 1, "Nao Atua");
  xlabel("I_{res} [A]");
  ylabel("I_{op} [A]");
  hold on;
endfunction