function [] = graphics_displacement()

global Vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphics (Displacement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2);

subplot(3,1,1);
plot(Vector.T,Vector.X{9}); 
xlabel('Time ( s )'); ylabel('x_{9} ( m )'); 
xlim([0 round(Vector.T(end))]);
title('Displacement of the first floor');
grid on;

subplot(3,1,2);
plot(Vector.T,Vector.X{18}); 
xlabel('Time ( s )'); ylabel('x_{18} ( m )'); 
xlim([0 round(Vector.T(end))]);
title('Displacement of the second floor');
grid on;

subplot(3,1,3);
plot(Vector.T,Vector.X{27}); 
xlabel('Time ( s )'); ylabel('x_{27} ( m )'); 
xlim([0 round(Vector.T(end))]);
title('Displacement of the third floor');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%
% Graphics (Velocity) %
%%%%%%%%%%%%%%%%%%%%%%%

if length(Vector.T) == length(Vector.V{9})
    
figure(3);

subplot(3,1,1);
plot(Vector.T,Vector.V{9}); 
xlabel('Time ( s )'); ylabel('v_{9} ( ms^-1 )'); 
xlim([0 round(Vector.T(end))]);
title('Velocity of the first floor');
grid on;

subplot(3,1,2);
plot(Vector.T,Vector.V{18}); 
xlabel('Time ( s )'); ylabel('v_{18} ( ms^-1 )'); 
xlim([0 round(Vector.T(end))]);
title('Velocity of the second floor');
grid on;

subplot(3,1,3);
plot(Vector.T,Vector.V{27}); 
xlabel('Time ( s )'); ylabel('v_{27} ( ms^-1 )'); 
xlim([0 round(Vector.T(end))]);
title('Velocity of the third floor');
grid on;

end
end

