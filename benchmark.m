%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Structural Benchmark           % 
% França, T.                     % 
% Pontifical Catholic University % 
% July 10, 2019.                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear;
close all 

%%%%%%%%%%%%%%%%%%%
% Stopwatch start %
%%%%%%%%%%%%%%%%%%%

tic;

%%%%%%%%%%%%%%%%%%%%
% Global Variables %
%%%%%%%%%%%%%%%%%%%%

global Vector Eigen force

%%%%%%%%%%%%%%%%%%%%%%
% Defining Constants %
%%%%%%%%%%%%%%%%%%%%%%

constants();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Setting Up           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Force             %
% Impulsive Force (force = Imp) %
% Step Force      (force = Ste) %
% Ramp Force      (force = Ram) % 
% Harmonic Force  (force = Har) % 
% Custom Force    (force = Cus) % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

force = 'Cus';

%%%%%%%%%%%%%%%%%%%%%%%%%
% Total Simulation Time %
%%%%%%%%%%%%%%%%%%%%%%%%%

time_total = 5;           

%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical Integrator %
%%%%%%%%%%%%%%%%%%%%%%%%

time_step = 1e-4;

%%%%%%%%%%%%%%%%%%%%
% Defining Vectors %
%%%%%%%%%%%%%%%%%%%%

Vector.T = [];
Vector.X = {};
Vector.V = {};
Eigen.val = [];
Eigen.vec = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Force (Parameters) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters_force();

%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions %
%%%%%%%%%%%%%%%%%%%%%%

parameters_initial_conditions();

%%%%%%%%%%%%%%%%%%%%%%%%%
% Finite Element Method %
%%%%%%%%%%%%%%%%%%%%%%%%%

function_finite_element_method();

%%%%%%%%%%%%%%
% Integrator %
%%%%%%%%%%%%%%

function_integrator(time_total,time_step);

%%%%%%%%%%%%%%%%%%
% Force Graphics %
%%%%%%%%%%%%%%%%%%

graphics_force(time_step,time_total);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pavement Graphics (Displacement & Velcocities) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

graphics_displacement();

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fast Fourier Transform %
%%%%%%%%%%%%%%%%%%%%%%%%%%

graphics_fourier_trasform(time_step);

%%%%%%%%%%%%%%%%%%%%%%%%
% Spectrogram Graphics %
%%%%%%%%%%%%%%%%%%%%%%%%

graphics_spectrogram();

%%%%%%%%%%%%%%%%%%%%%%
% Animation Graphics %
%%%%%%%%%%%%%%%%%%%%%%

graphics_animation(time_total);

%%%%%%%%%%%%%%%%%
% Stopwatch End %
%%%%%%%%%%%%%%%%%

time_simulation = toc;
fprintf('Simulation time: %f seconds',time_simulation);