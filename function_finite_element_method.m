function [] = function_finite_element_method()

global dof mass_cr1 mass_cr2 mass_cr3 l_1 l_2 l_3 
global rho E I area modal_damping_1 modal_damping_2  
global mass_matrix mass_matrix_inverse stiffness_matrix damping_matrix 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Transformation Matrices (global to local) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TGL01 = [1 zeros(1,26) ; zeros(1,1) 1 zeros(1,25) ; zeros(1,27) ; zeros(1,27)];
TGL02 = [zeros(1,2) 1 zeros(1,24) ; zeros(1,3) 1 zeros(1,23) ; zeros(1,27) ; zeros(1,27)];
TGL03 = [zeros(1,4) 1 zeros(1,22) ; zeros(1,5) 1 zeros(1,21) ; zeros(1,27) ; zeros(1,27)];
TGL04 = [zeros(1,6) 1 zeros(1,20) ; zeros(1,7) 1 zeros(1,19) ; zeros(1,27) ; zeros(1,27)];
TGL05 = [zeros(1,8) 1 zeros(1,18) ; zeros(1,27) ; 1 zeros(1,26) ; zeros(1,1) 1 zeros(1,25)];
TGL06 = [zeros(1,8) 1 zeros(1,18) ; zeros(1,27) ; zeros(1,2) 1 zeros(1,24) ; zeros(1,3) 1 zeros(1,23)];
TGL07 = [zeros(1,8) 1 zeros(1,18) ; zeros(1,27) ; zeros(1,4) 1 zeros(1,22) ; zeros(1,5) 1 zeros(1,21)];
TGL08 = [zeros(1,8) 1 zeros(1,18) ; zeros(1,27) ; zeros(1,6) 1 zeros(1,20) ; zeros(1,7) 1 zeros(1,19)];
TGL09 = [zeros(1,9) 1 zeros(1,17) ; zeros(1,10) 1 zeros(1,16) ; zeros(1,8) 1 zeros(1,18) ; zeros(1,27)];
TGL10 = [zeros(1,11) 1 zeros(1,15) ; zeros(1,12) 1 zeros(1,14) ; zeros(1,8) 1 zeros(1,18) ; zeros(1,27)];
TGL11 = [zeros(1,13) 1 zeros(1,13) ; zeros(1,14) 1 zeros(1,12) ; zeros(1,8) 1 zeros(1,18) ; zeros(1,27)];
TGL12 = [zeros(1,15) 1 zeros(1,11) ; zeros(1,16) 1 zeros(1,10) ; zeros(1,8) 1 zeros(1,18) ; zeros(1,27)];
TGL13 = [zeros(1,17) 1 zeros(1,9) ; zeros(1,27) ; zeros(1,9) 1 zeros(1,17) ; zeros(1,10) 1 zeros(1,16)];
TGL14 = [zeros(1,17) 1 zeros(1,9) ; zeros(1,27) ; zeros(1,11) 1 zeros(1,15) ; zeros(1,12) 1 zeros(1,14)];
TGL15 = [zeros(1,17) 1 zeros(1,9) ; zeros(1,27) ; zeros(1,13) 1 zeros(1,13) ; zeros(1,14) 1 zeros(1,12)];
TGL16 = [zeros(1,17) 1 zeros(1,9) ; zeros(1,27) ; zeros(1,15) 1 zeros(1,11) ; zeros(1,16) 1 zeros(1,10)];
TGL17 = [zeros(1,18) 1 zeros(1,8) ; zeros(1,19) 1 zeros(1,7) ; zeros(1,17) 1 zeros(1,9) ; zeros(1,27)];
TGL18 = [zeros(1,20) 1 zeros(1,6) ; zeros(1,21) 1 zeros(1,5) ; zeros(1,17) 1 zeros(1,9) ; zeros(1,27)];
TGL19 = [zeros(1,22) 1 zeros(1,4) ; zeros(1,23) 1 zeros(1,3) ; zeros(1,17) 1 zeros(1,9) ; zeros(1,27)];
TGL20 = [zeros(1,24) 1 zeros(1,2) ; zeros(1,25) 1 zeros(1,1) ; zeros(1,17) 1 zeros(1,9) ; zeros(1,27)];
TGL21 = [zeros(1,26) 1 ; zeros(1,27) ; zeros(1,18) 1 zeros(1,8) ; zeros(1,19) 1 zeros(1,7)];
TGL22 = [zeros(1,26) 1 ; zeros(1,27) ; zeros(1,20) 1 zeros(1,6) ; zeros(1,21) 1 zeros(1,5)];
TGL23 = [zeros(1,26) 1 ; zeros(1,27) ; zeros(1,22) 1 zeros(1,4) ; zeros(1,23) 1 zeros(1,3)];
TGL24 = [zeros(1,26) 1 ; zeros(1,27) ; zeros(1,24) 1 zeros(1,2) ; zeros(1,25) 1 zeros(1,1)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mass Matrices of flexible elements (1, 2, 3, 4, 5, 6, 7 and 8) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_1/2;
m_el_1 = [(156/420)*rho*area*comp      (22/420)*rho*area*(comp^2)   (54/420)*rho*area*comp      (-13/420)*rho*area*(comp^2);
          (22/420)*rho*area*(comp^2)   (4/420)*rho*area*(comp^3)    (13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3) ;
          (54/420)*rho*area*comp       (13/420)*rho*area*(comp^2)   (156/420)*rho*area*comp     (-22/420)*rho*area*(comp^2);
          (-13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3)   (-22/420)*rho*area*(comp^2) (4/420)*rho*area*(comp^3)  ];
m_el_2 = m_el_1;
m_el_3 = m_el_1;
m_el_4 = m_el_1;
m_el_5 = m_el_1;
m_el_6 = m_el_1;
m_el_7 = m_el_1;
m_el_8 = m_el_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mass Matrices of flexible elements (9, 10, 11, 12, 13, 14, 15 and 16) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_2/2;
m_el_9 = [(156/420)*rho*area*comp      (22/420)*rho*area*(comp^2)   (54/420)*rho*area*comp      (-13/420)*rho*area*(comp^2);
          (22/420)*rho*area*(comp^2)   (4/420)*rho*area*(comp^3)    (13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3) ;
          (54/420)*rho*area*comp       (13/420)*rho*area*(comp^2)   (156/420)*rho*area*comp     (-22/420)*rho*area*(comp^2);
          (-13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3)   (-22/420)*rho*area*(comp^2) (4/420)*rho*area*(comp^3)  ];
m_el_10 = m_el_9;
m_el_11 = m_el_9;
m_el_12 = m_el_9;    
m_el_13 = m_el_9;
m_el_14 = m_el_9;
m_el_15 = m_el_9;
m_el_16 = m_el_9;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mass Matrices of flexible elements (17, 18, 19, 20, 21, 22, 23 and 24) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_3/2;
m_el_17 = [(156/420)*rho*area*comp      (22/420)*rho*area*(comp^2)   (54/420)*rho*area*comp      (-13/420)*rho*area*(comp^2);
           (22/420)*rho*area*(comp^2)   (4/420)*rho*area*(comp^3)    (13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3) ;
           (54/420)*rho*area*comp       (13/420)*rho*area*(comp^2)   (156/420)*rho*area*comp     (-22/420)*rho*area*(comp^2);
           (-13/420)*rho*area*(comp^2)  (-3/420)*rho*area*(comp^3)   (-22/420)*rho*area*(comp^2) (4/420)*rho*area*(comp^3)  ];
m_el_18 = m_el_17;
m_el_19 = m_el_17;
m_el_20 = m_el_17;       
m_el_21 = m_el_17;
m_el_22 = m_el_17;
m_el_23 = m_el_17;
m_el_24 = m_el_17;

%%%%%%%%%%%%%%%%%%%%%%
% Global Mass Matrix %
%%%%%%%%%%%%%%%%%%%%%%

mcr = [zeros(1,8) mass_cr1 zeros(1,8) mass_cr2 zeros(1,8) mass_cr3];
incomplete_mass_matrix = TGL01'*m_el_1*TGL01 + TGL02'*m_el_2*TGL02 + TGL03'*m_el_3*TGL03 + TGL04'*m_el_4*TGL04 + TGL05'*m_el_5*TGL05 + TGL06'*m_el_6*TGL06 + TGL07'*m_el_7*TGL07 + TGL08'*m_el_8*TGL08 + TGL09'*m_el_9*TGL09 + TGL10'*m_el_10*TGL10 + TGL11'*m_el_11*TGL11 + TGL12'*m_el_12*TGL12 + TGL13'*m_el_13*TGL13 + TGL14'*m_el_14*TGL14 + TGL15'*m_el_15*TGL15 + TGL16'*m_el_16*TGL16 + TGL17'*m_el_17*TGL17 + TGL18'*m_el_18*TGL18 + TGL19'*m_el_19*TGL19 + TGL20'*m_el_20*TGL20 + TGL21'*m_el_21*TGL21 + TGL22'*m_el_22*TGL22 + TGL23'*m_el_23*TGL23 + TGL24'*m_el_24*TGL24;
mass_matrix = incomplete_mass_matrix + diag(mcr);                     
mass_matrix_inverse = inv(mass_matrix);     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stiffnes Matrices of flexible elements (1, 2, 3, 4, 5, 6, 7 and 8) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_1/2;
k_el_1 = [12*E*I/(comp^3)   6*E*I/(comp^2)  -12*E*I/(comp^3)   6*E*I/(comp^2);
          6*E*I/(comp^2)    4*E*I/(comp)    -6*E*I/(comp^2)    2*E*I/(comp)  ;
          -12*E*I/(comp^3)  -6*E*I/(comp^2)   12*E*I/(comp^3)  -6*E*I/(comp^2);
          6*E*I/(comp^2)    2*E*I/(comp)    -6*E*I/(comp^2)    4*E*I/(comp)  ];
k_el_2 = k_el_1;
k_el_3 = k_el_1;
k_el_4 = k_el_1;
k_el_5 = k_el_1;
k_el_6 = k_el_1;
k_el_7 = k_el_1;
k_el_8 = k_el_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stiffnes Matrices of flexible elements (9, 10, 11, 12, 13, 14, 15 and 16) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_2/2;
k_el_9 = [12*E*I/(comp^3)   6*E*I/(comp^2)  -12*E*I/(comp^3)   6*E*I/(comp^2);
          6*E*I/(comp^2)    4*E*I/(comp)    -6*E*I/(comp^2)    2*E*I/(comp)  ;
          -12*E*I/(comp^3)  -6*E*I/(comp^2)   12*E*I/(comp^3)  -6*E*I/(comp^2);
          6*E*I/(comp^2)    2*E*I/(comp)    -6*E*I/(comp^2)    4*E*I/(comp)  ];
k_el_10 = k_el_9;
k_el_11 = k_el_9;
k_el_12 = k_el_9;
k_el_13 = k_el_9;
k_el_14 = k_el_9;
k_el_15 = k_el_9;
k_el_16 = k_el_9;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stiffnes Matrices of flexible elements (17, 18, 19, 20, 21, 22, 23 and 24) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

comp = l_3/2;
k_el_17 = [12*E*I/(comp^3)   6*E*I/(comp^2)  -12*E*I/(comp^3)   6*E*I/(comp^2);
          6*E*I/(comp^2)    4*E*I/(comp)    -6*E*I/(comp^2)    2*E*I/(comp)  ;
          -12*E*I/(comp^3)  -6*E*I/(comp^2)   12*E*I/(comp^3)  -6*E*I/(comp^2);
          6*E*I/(comp^2)    2*E*I/(comp)    -6*E*I/(comp^2)    4*E*I/(comp)  ];
k_el_18 = k_el_17;
k_el_19 = k_el_17;   
k_el_20 = k_el_17;
k_el_21 = k_el_17;
k_el_22 = k_el_17;
k_el_23 = k_el_17;
k_el_24 = k_el_17;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Global Stiffness Matrix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
stiffness_matrix = TGL01'*k_el_1*TGL01 + TGL02'*k_el_2*TGL02 + TGL03'*k_el_3*TGL03 + TGL04'*k_el_4*TGL04 + TGL05'*k_el_5*TGL05 + TGL06'*k_el_6*TGL06 + TGL07'*k_el_7*TGL07 + TGL08'*k_el_8*TGL08 + TGL09'*k_el_9*TGL09 + TGL10'*k_el_10*TGL10 + TGL11'*k_el_11*TGL11 + TGL12'*k_el_12*TGL12 + TGL13'*k_el_13*TGL13 + TGL14'*k_el_14*TGL14 + TGL15'*k_el_15*TGL15 + TGL16'*k_el_16*TGL16 + TGL17'*k_el_17*TGL17 + TGL18'*k_el_18*TGL18 + TGL19'*k_el_19*TGL19 + TGL20'*k_el_20*TGL20 + TGL21'*k_el_21*TGL21 + TGL22'*k_el_22*TGL22 + TGL23'*k_el_23*TGL23 + TGL24'*k_el_24*TGL24;

%%%%%%%%%%%%%%%%%%
% Damping Matrix %
%%%%%%%%%%%%%%%%%%

[eigenvectors,eigenvalues] = eig(stiffness_matrix,mass_matrix);
natural_freq = zeros(1,dof);

for i = 1:dof 
    natural_freq(i) = sqrt(eigenvalues(i,i));
end

alpha = (2*modal_damping_2 - (2*modal_damping_1*natural_freq(2)/natural_freq(1)))/((1/natural_freq(2)) - (natural_freq(2)/(natural_freq(1)^2)));
beta = (2*modal_damping_1/natural_freq(1)) - (alpha/(natural_freq(1)^2));
damping_matrix = alpha*mass_matrix + beta*stiffness_matrix;

end