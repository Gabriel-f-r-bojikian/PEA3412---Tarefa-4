function [seq_zero, seq_direta, seq_inversa] = calcula_componentes_simetricas(fase_A, fase_B, fase_C)
    alpha = 1*( cos( deg2rad( 120 ) ) + i*sin( deg2rad( 120 ) ) )
    T = [1 1 1; 1 alpha**2 alpha; 1 alpha alpha**2]
    
    componentes_simetricas = inv(T)*[fase_A.complex; fase_B.complex; fase_C.complex];
    % componentes_simetricas = T*[fase_A.magnitude.*(cos(fase_A.phase_rad) + i*sin(fase_A.phase_rad)); fase_B.magnitude.*(cos(fase_B.phase_rad) + i*sin(fase_B.phase_rad)); fase_C.magnitude.*(cos(fase_C.phase_rad) + i*sin(fase_C.phase_rad))];

    seq_zero = componentes_simetricas(1,:);
    seq_direta = componentes_simetricas(2,:);
    seq_inversa = componentes_simetricas(3,:);
    
    figure;
    subplot(3, 1, 1);
    plot(sqrt(2)*[abs(seq_zero)],'r');
    % title(["Seq direta - " filename]);
    title("Seq zero");

    subplot(3, 1, 2);
    plot(sqrt(2)*[abs(seq_direta)],'g');
    % title(["Fase B Local - " filename]);
    title("Seq direta");

    subplot(3, 1, 3);
    plot(sqrt(2)*[abs(seq_inversa)],'b');
    % title(["Fase C Local - " filename]);
    title("Seq inversa");
endfunction