function [] = graphics_animation(time_total)

global Vector h_rigid_body b_rigid_body l_rigid_body l_1 l_2 l_3 

%%%%%%%%%%%%%
% Animation %
%%%%%%%%%%%%%

factor_motion = 15;
factor_axis = 2.0;
factor_ground = 10;

total_frames = length(Vector.T);
frame_per_time = time_total/total_frames;
frames_per_second = 24;
step_simulation = floor((frames_per_second*frame_per_time)^(-1));

%%%%%%%%%%
% Joints %
%%%%%%%%%%

joint_radius = .01;

[x_sphere,y_sphere,z_sphere] = sphere;

z1 = l_1 + .5*l_rigid_body;
z2 = l_1 + l_2 + 1.5*l_rigid_body;
z3  = l_1 + l_2 + l_3 + 2.5*l_rigid_body;

%%%%%%%%%%%%%%%%%%%%%
% Ground (Vertices) %
%%%%%%%%%%%%%%%%%%%%%

vertice_1 = [-2*h_rigid_body -2*b_rigid_body  0];
vertice_2 = [2*h_rigid_body  -2*b_rigid_body  0];
vertice_3 = [2*h_rigid_body   2*b_rigid_body  0];
vertice_4 = [-2*h_rigid_body  2*b_rigid_body  0];

for i = 1:step_simulation:length(Vector.T)

%%%%%%%%%%%%%%%%%%%%%%
% Animation Graphics %
%%%%%%%%%%%%%%%%%%%%%%    
    
figure(9);

%%%%%%%%%%%%%%%%%%%%%%%%
% Displacements Update %
%%%%%%%%%%%%%%%%%%%%%%%%

clf('reset');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Another Graphics Parameters %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hold on;
axis off;

view(-20,10);
axis([-factor_axis*2*h_rigid_body factor_axis*2*h_rigid_body -factor_axis*2*h_rigid_body factor_axis*2*h_rigid_body 0 1.5*l_1 + l_2 + l_3 + 2.5*l_rigid_body]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Pavement (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_5 = [-2*h_rigid_body + factor_motion*Vector.X{9}(i) -2*b_rigid_body  z1];
vertice_6 = [2*h_rigid_body + factor_motion*Vector.X{9}(i)  -2*b_rigid_body  z1];
vertice_7 = [2*h_rigid_body + factor_motion*Vector.X{9}(i)   2*b_rigid_body  z1];
vertice_8 = [-2*h_rigid_body + factor_motion*Vector.X{9}(i)  2*b_rigid_body  z1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Pavement (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_9  = [-2*h_rigid_body + factor_motion*Vector.X{18}(i) -2*b_rigid_body  z2];
vertice_10 = [2*h_rigid_body + factor_motion*Vector.X{18}(i)  -2*b_rigid_body  z2];
vertice_11 = [2*h_rigid_body + factor_motion*Vector.X{18}(i)   2*b_rigid_body  z2];
vertice_12 = [-2*h_rigid_body + factor_motion*Vector.X{18}(i)  2*b_rigid_body  z2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Pavement (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_13 = [-2*h_rigid_body + factor_motion*Vector.X{27}(i) -2*b_rigid_body  z3];
vertice_14 = [2*h_rigid_body + factor_motion*Vector.X{27}(i)  -2*b_rigid_body  z3];
vertice_15 = [2*h_rigid_body + factor_motion*Vector.X{27}(i)   2*b_rigid_body  z3];
vertice_16 = [-2*h_rigid_body + factor_motion*Vector.X{27}(i)  2*b_rigid_body  z3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Set of Flexible Element (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_17 = [-2*h_rigid_body + factor_motion*Vector.X{1}(i) -2*b_rigid_body  .5*z1];
vertice_18 = [2*h_rigid_body + factor_motion*Vector.X{3}(i)  -2*b_rigid_body  .5*z1];
vertice_19 = [2*h_rigid_body + factor_motion*Vector.X{5}(i)   2*b_rigid_body  .5*z1];
vertice_20 = [-2*h_rigid_body + factor_motion*Vector.X{7}(i)  2*b_rigid_body  .5*z1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second Set of Flexible Element (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_21 = [-2*h_rigid_body + factor_motion*Vector.X{10}(i) -2*b_rigid_body .5*(z1 + z2)];
vertice_22 = [2*h_rigid_body + factor_motion*Vector.X{12}(i)  -2*b_rigid_body  .5*(z1 + z2)];
vertice_23 = [2*h_rigid_body + factor_motion*Vector.X{14}(i)   2*b_rigid_body  .5*(z1 + z2)];
vertice_24 = [-2*h_rigid_body + factor_motion*Vector.X{16}(i)  2*b_rigid_body  .5*(z1 + z2)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third Set of Flexible Element (Vertices) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vertice_25 = [-2*h_rigid_body + factor_motion*Vector.X{19}(i) -2*b_rigid_body  .5*(z2 + z3)];
vertice_26 = [2*h_rigid_body + factor_motion*Vector.X{21}(i)  -2*b_rigid_body  .5*(z2 + z3)];
vertice_27 = [2*h_rigid_body + factor_motion*Vector.X{23}(i)   2*b_rigid_body  .5*(z2 + z3)];
vertice_28 = [-2*h_rigid_body + factor_motion*Vector.X{25}(i)  2*b_rigid_body  .5*(z2 + z3)];

%%%%%%%%%%
% Ground %
%%%%%%%%%%

patch(factor_ground*[vertice_1(1),vertice_2(1),vertice_3(1),vertice_4(1)],factor_ground*[vertice_1(2),vertice_2(2),vertice_3(2),vertice_4(2)],[vertice_1(3),vertice_2(3),vertice_3(3),vertice_4(3)],'g');
   
%%%%%%%%%%%%%%%%
% Rigid Bodies %
%%%%%%%%%%%%%%%%

patch([vertice_5(1),vertice_6(1),vertice_7(1),vertice_8(1)],[vertice_5(2) ,vertice_6(2) ,vertice_7(2) ,vertice_8(2)],[vertice_5(3),vertice_6(3),vertice_7(3),vertice_8(3)],'k');
patch([vertice_9(1),vertice_10(1),vertice_11(1),vertice_12(1)],[vertice_9(2) ,vertice_10(2),vertice_11(2),vertice_12(2)],[vertice_9(3),vertice_10(3) ,vertice_11(3),vertice_12(3)],'k'); 
patch([vertice_13(1),vertice_14(1),vertice_15(1),vertice_16(1)],[vertice_13(2),vertice_14(2),vertice_15(2),vertice_16(2)],[vertice_13(3),vertice_14(3),vertice_15(3),vertice_16(3)],'k'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flexible Elements (First Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

patch([vertice_1(1) vertice_17(1)],[vertice_1(2) vertice_17(2)],[vertice_1(3) vertice_17(3)],'k');
patch([vertice_2(1) vertice_18(1)],[vertice_2(2) vertice_18(2)],[vertice_2(3) vertice_18(3)],'k');
patch([vertice_3(1) vertice_19(1)],[vertice_3(2) vertice_19(2)],[vertice_3(3) vertice_19(3)],'k');
patch([vertice_4(1) vertice_20(1)],[vertice_4(2) vertice_20(2)],[vertice_4(3) vertice_20(3)],'k');
patch([vertice_17(1) vertice_5(1)],[vertice_17(2) vertice_5(2)],[vertice_17(3) vertice_5(3)],'k');
patch([vertice_18(1) vertice_6(1)],[vertice_18(2) vertice_6(2)],[vertice_18(3) vertice_6(3)],'k');
patch([vertice_19(1) vertice_7(1)],[vertice_19(2) vertice_7(2)],[vertice_19(3) vertice_7(3)],'k');
patch([vertice_20(1) vertice_8(1)],[vertice_20(2) vertice_8(2)],[vertice_20(3) vertice_8(3)],'k');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flexible Elements (Second Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
patch([vertice_5(1) vertice_21(1)],[vertice_5(2) vertice_21(2)],[vertice_5(3) vertice_21(3)],'k');
patch([vertice_6(1) vertice_22(1)],[vertice_6(2) vertice_22(2)],[vertice_6(3) vertice_22(3)],'k');
patch([vertice_7(1) vertice_23(1)],[vertice_7(2) vertice_23(2)],[vertice_7(3) vertice_23(3)],'k');
patch([vertice_8(1) vertice_24(1)],[vertice_8(2) vertice_24(2)],[vertice_8(3) vertice_24(3)],'k');
patch([vertice_21(1) vertice_9(1)],[vertice_21(2) vertice_9(2)],[vertice_21(3) vertice_9(3)],'k');
patch([vertice_22(1) vertice_10(1)],[vertice_22(2) vertice_10(2)],[vertice_22(3) vertice_10(3)],'k');
patch([vertice_23(1) vertice_11(1)],[vertice_23(2) vertice_11(2)],[vertice_23(3) vertice_11(3)],'k');
patch([vertice_24(1) vertice_12(1)],[vertice_24(2) vertice_12(2)],[vertice_24(3) vertice_12(3)],'k');
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flexible Elements (Third Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
patch([vertice_9(1) vertice_25(1)],[vertice_9(2) vertice_25(2)],[vertice_9(3) vertice_25(3)],'k');
patch([vertice_10(1) vertice_26(1)],[vertice_10(2) vertice_26(2)],[vertice_10(3) vertice_26(3)],'k');
patch([vertice_11(1) vertice_27(1)],[vertice_11(2) vertice_27(2)],[vertice_11(3) vertice_27(3)],'k');
patch([vertice_12(1) vertice_28(1)],[vertice_12(2) vertice_28(2)],[vertice_12(3) vertice_28(3)],'k');
patch([vertice_25(1) vertice_13(1)],[vertice_25(2) vertice_13(2)],[vertice_25(3) vertice_13(3)],'k');
patch([vertice_26(1) vertice_14(1)],[vertice_26(2) vertice_14(2)],[vertice_26(3) vertice_14(3)],'k');
patch([vertice_27(1) vertice_15(1)],[vertice_27(2) vertice_15(2)],[vertice_27(3) vertice_15(3)],'k');
patch([vertice_28(1) vertice_16(1)],[vertice_28(2) vertice_16(2)],[vertice_28(3) vertice_16(3)],'k');
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Joints (First Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

surf(x_sphere*joint_radius + vertice_17(1), y_sphere*joint_radius + vertice_17(2), z_sphere*joint_radius + vertice_17(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_18(1), y_sphere*joint_radius + vertice_18(2), z_sphere*joint_radius + vertice_18(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_19(1), y_sphere*joint_radius + vertice_19(2), z_sphere*joint_radius + vertice_19(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_20(1), y_sphere*joint_radius + vertice_20(2), z_sphere*joint_radius + vertice_20(3),'FaceAlpha',0.5);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Joints (Second Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

surf(x_sphere*joint_radius + vertice_21(1), y_sphere*joint_radius + vertice_21(2), z_sphere*joint_radius + vertice_21(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_22(1), y_sphere*joint_radius + vertice_22(2), z_sphere*joint_radius + vertice_22(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_23(1), y_sphere*joint_radius + vertice_23(2), z_sphere*joint_radius + vertice_23(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_24(1), y_sphere*joint_radius + vertice_24(2), z_sphere*joint_radius + vertice_24(3),'FaceAlpha',0.5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Joints (Third Pavement) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

surf(x_sphere*joint_radius + vertice_25(1), y_sphere*joint_radius + vertice_25(2), z_sphere*joint_radius + vertice_25(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_26(1), y_sphere*joint_radius + vertice_26(2), z_sphere*joint_radius + vertice_26(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_27(1), y_sphere*joint_radius + vertice_27(2), z_sphere*joint_radius + vertice_27(3),'FaceAlpha',0.5);
surf(x_sphere*joint_radius + vertice_28(1), y_sphere*joint_radius + vertice_28(2), z_sphere*joint_radius + vertice_28(3),'FaceAlpha',0.5);

end
end