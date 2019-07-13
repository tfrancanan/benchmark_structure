function [] = constants()

global dof h_rigid_body b_rigid_body l_rigid_body mass_cr1 mass_cr2 mass_cr3 
global E h b l_1 l_2 l_3 rho I k_1 k_2 k_3 area modal_damping_1 modal_damping_2  


%%%%%%%%%%%%%%%%%%%%%
% Degrees of Fredom %
%%%%%%%%%%%%%%%%%%%%%

dof = 27; 

%%%%%%%%%%%%%%%%%%%%%%%%%
% Rigid Body Dimensions %
%%%%%%%%%%%%%%%%%%%%%%%%%

h_rigid_body = .200;
b_rigid_body = .150;
l_rigid_body = .020;

%%%%%%%%
% Mass %
%%%%%%%%

mass_cr1 = .500; %Describe
mass_cr2 = .500;
mass_cr3 = .500;

%%%%%%%%%%
% Spring %
%%%%%%%%%%

E = 77e+09;
h = .001;
b = .025;
l_1 = .150;
l_2 = .150;
l_3 = .150;
rho = 7860;

%%%%%%%%%%%%%%%%%%%%%
% Moment of Inertia %
%%%%%%%%%%%%%%%%%%%%%

I = b*(h^3)/12;

%%%%%%%%%%%%%%%%%%%%%%%%
% Equivalent Stiffness %
%%%%%%%%%%%%%%%%%%%%%%%%

k_1 = 4*(12*E*I/(l_1^3));
k_2 = 4*(12*E*I/(l_2^3));
k_3 = 4*(12*E*I/(l_3^3));   

%%%%%%%%%%%%%%%%%%%%%%
% Cross Section Area %
%%%%%%%%%%%%%%%%%%%%%%

area = h*b;

%%%%%%%%%%%%%%%%%%%%%%%%
% Modal Damping Factor %
%%%%%%%%%%%%%%%%%%%%%%%%

modal_damping_1 = .007;
modal_damping_2 = .007;  

end