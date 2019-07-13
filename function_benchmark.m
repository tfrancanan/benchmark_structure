function func = function_benchmark(time_step,time_total,phi)

global mass_matrix_inverse stiffness_matrix damping_matrix 
global time force 
global F9 W9 AF9 F18 W18 AF18 F27 W27 AF27
global FI9 TI9 TF9 WI9 FI18 TI18 TF18 WI18 FI27 TI27 TF27 WI27

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Displacement & Velocity %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = phi(1)  ; x2 = phi(2)  ; x3 = phi(3)  ; x4 = phi(4)  ; x5 = phi(5)  ; x6 = phi(6)  ; x7 = phi(7)  ; x8 = phi(8)  ; x9 = phi(9)  ; x10 = phi(10);
x11 = phi(11); x12 = phi(12); x13 = phi(13); x14 = phi(14); x15 = phi(15); x16 = phi(16); x17 = phi(17); x18 = phi(18); x19 = phi(19); x20 = phi(20);
x21 = phi(21); x22 = phi(22); x23 = phi(23); x24 = phi(24); x25 = phi(25); x26 = phi(26); x27 = phi(27);
v1 = phi(28) ; v2 = phi(29) ; v3 = phi(30) ; v4 = phi(31);  v5 = phi(32) ; v6 = phi(33) ; v7 = phi(34) ; v8 = phi(35) ; v9 = phi(36) ; v10 = phi(37);
v11 = phi(38); v12 = phi(39); v13 = phi(40); v14 = phi(41); v15 = phi(42); v16 = phi(43); v17 = phi(44); v18 = phi(45); v19 = phi(46); v20 = phi(47);
v21 = phi(48); v22 = phi(49); v23 = phi(50); v24 = phi(51); v25 = phi(52); v26 = phi(53); v27 = phi(54);
  
%%%%%%%%%%%%%%%%%%%
% Impulsive Force %
%%%%%%%%%%%%%%%%%%%

if force == 'Imp'    

   if (time >= TI9) && (time < TF9) 
      f9 = FI9*sin(WI9*time);
   else
      f9 = 0;
   end
   
   if (time >= TI18) && (time < TF18)
      f18 = FI18*sin(WI18*time); 
   else
      f18 = 0;
   end
    
   if (time >= TI27) && (time < TF27)
      f27 = FI27*sin(WI27*time);
   else
      f27 = 0;
   end
   
end

%%%%%%%%%%%%%%
% Step Force %
%%%%%%%%%%%%%%
 
if force == 'Ste'      

   if (time >= TI9) && (time < TF9) 
      f9 = FI9;
   else
      f9 = 0;
   end
   
   if (time >= TI18) && (time < TF18)
      f18 = FI18; 
   else
      f18 = 0;
   end
    
   if (time >= TI27) && (time < TF27)
      f27 = FI27;
   else
      f27 = 0;
   end
   
end

%%%%%%%%%%%%%%
% Ramp Force %
%%%%%%%%%%%%%%
 
if force == 'Ram'      

   if (time >= 0) && (time < TF9*time_total) 
      f9 = (F9/(time_total*TF9))*time;
   else
      f9 = F9;
   end
   
   if (time >= 0) && (time < TF18*time_total)
      f18 = (F18/(time_total*TF18))*time; 
   else
      f18 = F18;
   end
    
   if (time >= 0) && (time < TF27*time_total)
      f27 = (F27/(time_total*TF27))*time; 
   else
      f27 = F27;
   end

end

%%%%%%%%%%%%%%%%%%
% Harmonic Force %
%%%%%%%%%%%%%%%%%%

if force == 'Har' 
   
   f9 = F9*sin(W9*time + AF9);  
   f18 = F18*sin(W18*time + AF18);   
   f27 = F27*sin(W27*time + AF27);  

end

%%%%%%%%%%%%%%%%
% Custom Force %
%%%%%%%%%%%%%%%%

if force == 'Cus' 
    
   if  time <= time_total
   
       time_discretization = 0:time_step:time_total;
       time_counter = find((time_discretization >= time),1);
      
       f9 = F9(time_counter); 
       f18 = F18(time_counter);
       f27 = F27(time_counter);
   
   else
       
       f9 = 0;
       f18 = 0;
       f27 = 0;
   
   end   
   
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resultant External Force %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Force_external = [0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; f9 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; f18 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; f27];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vetores de posicão e de velocidade %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vector_displacement = [x1 ; x2 ; x3 ; x4 ; x5 ; x6 ; x7 ; x8 ; x9 ; x10 ; x11 ; x12 ; x13 ; x14 ; x15 ; 
             x16 ; x17 ; x18 ; x19 ; x20 ; x21 ; x22 ; x23 ; x24 ; x25 ; x26 ; x27];         

vector_velocity = [v1 ; v2 ; v3 ; v4 ; v5 ; v6 ; v7 ; v8 ; v9 ; v10 ; v11 ; v12 ; v13 ; v14 ; v15 ;
             v16 ; v17 ; v18 ; v19 ; v20 ; v21 ; v22 ; v23 ; v24 ; v25 ; v26 ; v27];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nonlinear Expression of Mass Accelerations %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vector_acceleration = mass_matrix_inverse*((-stiffness_matrix*vector_displacement) - (damping_matrix*vector_velocity) + Force_external);
a1 = vector_acceleration(1); a2 = vector_acceleration(2); a3 = vector_acceleration(3); a4 = vector_acceleration(4); a5 = vector_acceleration(5); 
a6 = vector_acceleration(6); a7 = vector_acceleration(7); a8 = vector_acceleration(8); a9 = vector_acceleration(9); a10 = vector_acceleration(10);
a11 = vector_acceleration(11); a12 = vector_acceleration(12); a13 = vector_acceleration(13); a14 = vector_acceleration(14); a15 = vector_acceleration(15);
a16 = vector_acceleration(16); a17 = vector_acceleration(17); a18 = vector_acceleration(18); a19 = vector_acceleration(19); a20 = vector_acceleration(20);
a21 = vector_acceleration(21); a22 = vector_acceleration(22); a23 = vector_acceleration(23); a24 = vector_acceleration(24); a25 = vector_acceleration(25);
a26 = vector_acceleration(26); a27 = vector_acceleration(27);

%%%%%%%%%%%%%%%%%%%%%%%%
% Recursive Expression %
%%%%%%%%%%%%%%%%%%%%%%%%

func = [v1 ; v2 ; v3 ; v4 ; v5 ; v6 ; v7 ; v8 ; v9 ; v10 ; v11 ; v12 ; v13 ; v14 ; v15 ;
        v16 ; v17 ; v18 ; v19 ; v20 ; v21 ; v22 ; v23 ; v24 ; v25 ; v26 ; v27 ;
        a1 ; a2 ; a3 ; a4 ; a5 ; a6 ; a7 ; a8 ; a9 ; a10 ; a11 ; a12 ; a13 ; a14 ; a15 ;
        a16 ; a17 ; a18 ; a19 ; a20 ; a21 ; a22 ; a23 ; a24 ; a25 ; a26 ; a27];
end