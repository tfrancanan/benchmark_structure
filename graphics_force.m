function [force_9,force_18,force_27] = graphics_force(time_step,time_total)

global time_force force F9 W9 AF9 F18 W18 AF18 F27 W27 AF27
global FI9 TI9 TF9 WI9 FI18 TI18 TF18 WI18 FI27 TI27 TF27 WI27

%%%%%%%%%%%%%%%%%%%
% Defining Forces %
%%%%%%%%%%%%%%%%%%%

time_plot = 0:time_step:time_total; 
force_9 = zeros(1,length(time_plot));
force_18 = zeros(1,length(time_plot));
force_27 = zeros(1,length(time_plot));

%%%%%%%%%%%%%%%%%%%%%
% Force (Impulsive) %
%%%%%%%%%%%%%%%%%%%%%

if force == 'Imp'   
   for time_counter = 1:length(time_plot)
        if (time_plot(time_counter) >= TI9) && (time_plot(time_counter) < TF9) 
            force_9(time_counter) = FI9*sin(WI9*time_plot(time_counter));
        else
            force_9(time_counter) = 0;
        end
        if (time_plot(time_counter) >= TI18) && (time_plot(time_counter) < TF18)
            force_18(time_counter) = FI18*sin(WI18*time_plot(time_counter)); 
        else
            force_18(time_counter) = 0;
        end
        if (time_plot(time_counter) >= TI27) && (time_plot(time_counter) < TF27)
            force_27(time_counter) = FI27*sin(WI27*time_plot(time_counter));
        else
            force_27(time_counter) = 0;
        end
    end
end

%%%%%%%%%%%%%%%%
% Force (Step) %
%%%%%%%%%%%%%%%%

if force == 'Ste' 
   for time_counter = 1:length(time_plot)
       if (time_plot(time_counter) >= TI9) && (time_plot(time_counter) < TF9) 
           force_9(time_counter) = FI9;
       else
           force_9(time_counter) = 0;
       end
       if (time_plot(time_counter) >= TI18) && (time_plot(time_counter) < TF18)
           force_18(time_counter) = FI18; 
       else
           force_18(time_counter) = 0;
       end
       if (time_plot(time_counter) >= TI27) && (time_plot(time_counter) < TF27)
           force_27(time_counter) = FI27;
       else
           force_27(time_counter) = 0;
       end
   end
end

%%%%%%%%%%%%%%%%
% Force (Ramp) %
%%%%%%%%%%%%%%%%

if force == 'Ram'   
   for time_counter = 1:length(time_plot)
        if (time_plot(time_counter) >= 0) && (time_plot(time_counter) < TF9*time_total) 
            force_9(time_counter) = (F9/(time_total*TF9))*time_plot(time_counter);
        else
            force_9(time_counter) = F9;
        end
        if (time_plot(time_counter) >= 0) && (time_plot(time_counter) < TF18*time_total)
            force_18(time_counter) = (F18/(time_total*TF18))*time_plot(time_counter);
        else
            force_18(time_counter) = F18;
        end
        if (time_plot(time_counter) >= 0) && (time_plot(time_counter) < TF27*time_total)
            force_27(time_counter) = (F27/(time_total*TF27))*time_plot(time_counter);
        else
            force_27(time_counter) = F27;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%
% Force (Harmonic) %
%%%%%%%%%%%%%%%%%%%%

if force == 'Har' 
   force_9 = F9*sin(W9*time_plot + AF9);  
   force_18 = F18*sin(W18*time_plot + AF18);   
   force_27 = F27*sin(W27*time_plot + AF27);  
end

%%%%%%%%%%%%%%%%%%
% Force (Custom) %
%%%%%%%%%%%%%%%%%%

if force == 'Cus' 
    
   time_plot = time_force;

   for i = 1:length(time_plot)
        
       if time_plot(i) <= time_force(end)

          force_9(i) = F9(i);  
          force_18(i) = F18(i);   
          force_27(i) = F27(i);

       else
           
          force_9(i) = 0;
          force_18(i) = 0;   
          force_27(i) = 0;
      
       end
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%
% Exitation (Graphics) %
%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);

subplot(3,1,1);
plot(time_plot,force_9);
xlabel('Time ( s )'); ylabel('F_{9} ( N )');
xlim([0 time_total]);
title('First floor force');
grid on;

subplot(3,1,2);
plot(time_plot,force_18);
xlabel('Time ( s )'); ylabel('F_{18} ( N )');
xlim([0 time_total]);
title('Second floor force');
grid on;

subplot(3,1,3);
plot(time_plot,force_27);
xlabel('Time ( s )'); ylabel('F_{27} ( N )');
xlim([0 time_total]);
title('Third floor force');
grid on;

end