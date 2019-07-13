%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal - Frequency domain signal                           %
% signal - Time domain signal                                %
% sampling_frequency - Sampling frequency                    %                             
% T - Period time                                            %               
% signal_frequency - Signal frequency                        %  
% fftn - Fast fourier transform normalized                   %
% cutting_frequency - Necessary frequency for data fitting   %
% FFT - Fast fourier tranform                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function graphics_fourier_trasform(time_step)

global Vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preprocessing (Fast Fourier Transform) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sampling_frequency = time_step^(-1);

signal_1 = Vector.X{9};

N_1 = length(signal_1);
n_1 = 0:1:(N_1 - 1);
T_1 = N_1/sampling_frequency;
signal_frequency_1 = n_1/T_1;
Signal_1 = fftn(signal_1)/N_1;
cutting_frequency_1 = ceil(N_1/2);
Signal_1 = Signal_1(1:cutting_frequency_1);

signal_2 = Vector.X{18};
N_2 = length(signal_2);
n_2 = 0:1:(N_2 - 1);
T_2 = N_2/sampling_frequency;
signal_frequency_2 = n_2/T_2;
Signal_2 = fftn(signal_2)/N_2;
cutting_frequency_2 = ceil(N_2/2);
Signal_2 = Signal_2(1:cutting_frequency_2);

signal_3 = Vector.X{27};
N_3 = length(signal_3);
n_3 = 0:1:(N_3 - 1);
T_3 = N_3/sampling_frequency;
signal_frequency_3 = n_3/T_3;
Signal_3 = fftn(signal_3)/N_3;
cutting_frequency_3 = ceil(N_3/2);
Signal_3 = Signal_3(1:cutting_frequency_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphics (Fast Fourier Transform) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4);

subplot(3,1,1);
plot(signal_frequency_1(1:cutting_frequency_1),abs(Signal_1));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,2);
plot(signal_frequency_2(1:cutting_frequency_2),abs(Signal_2));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,3);
plot(signal_frequency_3(1:cutting_frequency_3),abs(Signal_3));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

figure(5);

subplot(3,1,1);
semilogx(20*log10(signal_frequency_1(1:cutting_frequency_1)),abs(Signal_1));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,2);
semilogx(20*log10(signal_frequency_2(1:cutting_frequency_2)),abs(Signal_2));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,3);
semilogx(20*log10(signal_frequency_3(1:cutting_frequency_3)),abs(Signal_3));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

figure(6);

subplot(3,1,1);
semilogy(signal_frequency_1(1:cutting_frequency_1),20*log10(abs(Signal_1)));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,2);
semilogy(signal_frequency_2(1:cutting_frequency_2),20*log10(abs(Signal_2)));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,3);
semilogy(signal_frequency_3(1:cutting_frequency_3),20*log10(abs(Signal_3)));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

figure(7);

subplot(3,1,1);
loglog(signal_frequency_1(1:cutting_frequency_1),abs(Signal_1));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,2);
loglog(signal_frequency_2(1:cutting_frequency_2),abs(Signal_2));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

subplot(3,1,3);
loglog(signal_frequency_3(1:cutting_frequency_3),abs(Signal_3));
xlabel('Frequency [Hz]');
ylabel('Magnitude [m]');
title('Frequency Spectrum');
grid on;

end