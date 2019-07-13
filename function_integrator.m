function [] = function_integrator(time_total,time_step)

global dof   time force TIME 
global Vector vector_phi phi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Delay (time_step multiple) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

delay = 20*time_step; 

%%%%%%%%%%%
% Counter %
%%%%%%%%%%%
     
counter = 1; 

%%%%%%%%%%%%%%
% Integrator %
%%%%%%%%%%%%%%

for TIME = 0:delay:time_total  
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integration Within Each Step %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for time = 0:time_step:(delay - time_step)
    
        time = TIME + time;
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Vectors for Later Plotting (initial time to final time) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        Vector.T(counter) = TIME ;
        
        for i = 1:dof 
            
            Vector.X{i}(counter) = vector_phi(i);
            Vector.V{i}(counter) = vector_phi(i + dof);
            
        end   
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vectors with constants (k1, k2, k3 and k4) of Runge-Kutta for Each Equation %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
        vector_k1_1_RK = function_benchmark(time_step,time_total,vector_phi);
        vector_k2_1_RK = function_benchmark(time_step,time_total,vector_phi + 0.5*vector_k1_1_RK*time_step);
        vector_k3_1_RK = function_benchmark(time_step,time_total,vector_phi + 0.5*vector_k2_1_RK*time_step);
        vector_k4_1_RK = function_benchmark(time_step,time_total,vector_phi + vector_k3_1_RK*time_step);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vector phi at Time (TIME + time_step) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        vector_phi = vector_phi + (time_step/6)*(vector_k1_1_RK + 2*vector_k2_1_RK + 2*vector_k3_1_RK + vector_k4_1_RK);
             
%%%%%%%%%%%%%%%%%%%%
% Updating Counter %
%%%%%%%%%%%%%%%%%%%%
 
        counter = counter + 1;

    end
  
end
end