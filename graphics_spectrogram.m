function [] = graphics_spectrogram()

global Vector

%%%%%%%%%%%%%%%%%%%%%%
% Data Preprocessing %
%%%%%%%%%%%%%%%%%%%%%%

window_size = 100;
overlap = window_size - 1;
spectrogram_1 = Vector.X{9}(1:50:length(Vector.X{9}));%1024 samples
spectrogram_1 = spectrogram_1(1:end);
spectrogram_2 = Vector.X{18}(1:50:length(Vector.X{18}));%1024 samples
spectrogram_2 = spectrogram_2(1:end);
spectrogram_3 = Vector.X{27}(1:50:length(Vector.X{27}));%1024 samples
spectrogram_3 = spectrogram_3(1:end);
time_spectrogram_1 = linspace(0,5,length(spectrogram_1));
time_spectrogram_2 = linspace(0,5,length(spectrogram_2));
time_spectrogram_3 = linspace(0,5,length(spectrogram_3));
sampling_time_1 = time_spectrogram_1(2) - time_spectrogram_1(1);
sampling_time_2 = time_spectrogram_2(2) - time_spectrogram_2(1);
sampling_time_3 = time_spectrogram_3(2) - time_spectrogram_3(1);
sampling_frequency_1 = 1/sampling_time_1;
sampling_frequency_2 = 1/sampling_time_2;
sampling_frequency_3 = 1/sampling_time_3;

%%%%%%%%%%%%%%%%%%%%%%%%
% Spectrogram Analysis %
%%%%%%%%%%%%%%%%%%%%%%%%

[s_1,f_1,time_spectrogram_1,p_1] = spectrogram(spectrogram_1,window_size,overlap,100,sampling_frequency_1,'yaxis');
[s_2,f_2,time_spectrogram_2,p_2] = spectrogram(spectrogram_2,window_size,overlap,100,sampling_frequency_2,'yaxis');
[s_3,f_3,time_spectrogram_3,p_3] = spectrogram(spectrogram_3,window_size,overlap,100,sampling_frequency_3,'yaxis');
[q_1,index_1] = max(20*log10(p_1));
[q_2,index_2] = max(20*log10(p_2));
[q_3,index_3] = max(20*log10(p_3));
f_1 = transpose(f_1);
f_2 = transpose(f_2);
f_3 = transpose(f_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphics (Spectrogram) %
%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8);

subplot(3,1,1);
hold on;
surf(time_spectrogram_1,f_1,abs(s_1),'edgecolor','none','FaceColor','interp');
title('Spectrogram First Pavement');
xlabel('Time ( s )'); 
ylabel('Frequency ( Hz )');
shading interp
axis tight;
colormap;
colorbar;
view(2)
ylim([0 70]);

subplot(3,1,2);
hold on;
surf(time_spectrogram_2,f_2,abs(s_2),'edgecolor','none','FaceColor','interp');
title('Spectrogram Second Pavement');
xlabel('Time ( s )'); 
ylabel('Frequency ( Hz )');
shading interp
axis tight;
colormap;
colorbar;
view(2)
ylim([0 70]);

subplot(3,1,3);
hold on;
surf(time_spectrogram_3,f_3,abs(s_3),'edgecolor','none','FaceColor','interp');
title('Spectrogram Third Pavement');
xlabel('Time ( s )'); 
ylabel('Frequency ( Hz )');
shading interp
axis tight;
colormap;
colorbar; 
view(2)
ylim([0 70]);

end