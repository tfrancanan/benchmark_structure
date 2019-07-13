function [] = parameters_force()

global force time_force
global F9 W9 AF9 F18 W18 AF18 F27 W27 AF27
global FI9 TI9 TF9 WI9 FI18 TI18 TF18 WI18 FI27 TI27 TF27 WI27

%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Impulse) %
%%%%%%%%%%%%%%%%%%%%%%%%%

if force == 'Imp'
   
   fprintf('A impulsive force is used. \n \n');
   
%%%%%%%%%%%%%%%%%%%%%
% Impulse  (Mass 1) %
%%%%%%%%%%%%%%%%%%%%%    
        
   FI9 = 0;  % Magnitude
   TI9 = 0;  % Initial value (time_step multiple)
   TF9 = 0;  % final value (time_step multiple)
   WI9 = 0;  % Angular frequency       
   
%%%%%%%%%%%%%%%%%%%%%
% Impulse  (Mass 2) %
%%%%%%%%%%%%%%%%%%%%%     

   FI18 = 0;  % Magnitude
   TI18 = 0;  % Initial value (time_step multiple)  
   TF18 = 0;  % Final value (time_step multiple)     
   WI18 = 0;  % Angular frequency       

%%%%%%%%%%%%%%%%%%%%%
% Impulse  (Mass 3) %
%%%%%%%%%%%%%%%%%%%%%    

   FI27 = 10;    % Magnitude
   TI27 = 1;    % Initial value (time_step multiple)   
   TF27 = 1.01; % Final value (time_step multiple)
   WI27 = 2*pi/(2*(TF27-TI27));

end

%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Step) %
%%%%%%%%%%%%%%%%%%%%%%

if force == 'Ste'
    
   fprintf('A step force is used. \n \n');
   
%%%%%%%%%%%%%%%%%
% Step (Mass 1) %
%%%%%%%%%%%%%%%%%

FI9 = 0;    % Magnitude
TI9 = 0;    % Initial value (time_step multiple)   
TF9 = 0;    % Final value (time_step multiple)

%%%%%%%%%%%%%%%%%
% Step (Mass 2) %
%%%%%%%%%%%%%%%%%

FI18 = 0;    % Magnitude
TI18 = 0;    % Initial value (time_step multiple)   
TF18 = 0;    % Final value (time_step multiple)
  
%%%%%%%%%%%%%%%%%
% Step (Mass 3) %
%%%%%%%%%%%%%%%%%

FI27 = 10;   % Magnitude
TI27 = 0;    % Initial value (time_step multiple)   
TF27 = 3;    % Final value (time_step multiple)

end 

%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Ramp) %
%%%%%%%%%%%%%%%%%%%%%%

if force == 'Ram'
   
   fprintf('A ramp force is used. \n \n');
    
%%%%%%%%%%%%%%%%%
% Ramp (Mass 1) %
%%%%%%%%%%%%%%%%%

F9 = 0;  % Magnitude
TF9 = 0; % Time factor

%%%%%%%%%%%%%%%%%
% Ramp (Mass 2) %
%%%%%%%%%%%%%%%%%

F18 = 0;  % Magnitude
TF18 = 0; % Time factor
  
%%%%%%%%%%%%%%%%%
% Ramp (Mass 3) %
%%%%%%%%%%%%%%%%%

F27 = 10;  % Magnitude
TF27 = .3; % Time factor

end 

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Harmonic) %
%%%%%%%%%%%%%%%%%%%%%%%%%%

if force == 'Har'
   
   fprintf('A harmonic force is used. \n \n');
    
%%%%%%%%%%%%%%%%%%%%%
% Harmonic (Mass 1) %
%%%%%%%%%%%%%%%%%%%%%

F9 = 0;  % Magnitude
W9 = 0;  % Angular frequency       
AF9 = 0; % Phase angle 

%%%%%%%%%%%%%%%%%%%%%
% Harmonic (Mass 2) %
%%%%%%%%%%%%%%%%%%%%%

F18 = 0;  % Magnitude
W18 = 0;  % Angular frequency          
AF18 = 0; % Phase angle
  
%%%%%%%%%%%%%%%%%%%%%
% Harmonic (Mass 3) %
%%%%%%%%%%%%%%%%%%%%%

F27 = 10;  % Magnitude
W27 = 5; % Angular frequency       
AF27 = 0; % Phase angle

end 

%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Custom) %
%%%%%%%%%%%%%%%%%%%%%%%%

if force == 'Cus'
    
   fprintf('A custom force is used. \n \n');
     
%%%%%%%%%%%%%%%%%%%
% Personal (Time) %
%%%%%%%%%%%%%%%%%%%

   time_force = csvread('load_time.csv'); % Magnitude  
   time_force = transpose(time_force);

%%%%%%%%%%%%%%%%%%%%%
% Personal (Mass 1) %
%%%%%%%%%%%%%%%%%%%%%

   F9 = csvread('load_one.csv'); % Magnitude  
   F9 = transpose(F9);

%%%%%%%%%%%%%%%%%%%%%
% Personal (Mass 2) %
%%%%%%%%%%%%%%%%%%%%%

   F18 = csvread('load_two.csv'); % Magnitude
   F18 = transpose(F18);

%%%%%%%%%%%%%%%%%%%%%
% Personal (Mass 3) %
%%%%%%%%%%%%%%%%%%%%%

   F27 = csvread('load_three.csv'); % Magnitude
   F27 = transpose(F27);

end 
end

