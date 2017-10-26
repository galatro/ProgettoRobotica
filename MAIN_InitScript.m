clc;
warning off
%StopVrepSimulation(); %pre precauzione


%%%%%%%%%%%%%%%%%%%%%%%%%%   Set Path  %%%%%%%%%%%%%%%%%%%%%%%%%%
%restoredefaultpath
 addpath('/usr/local/src/vrep/programming/remoteApiBindings/matlab/matlab');
 addpath('/usr/local/src/vrep/programming/remoteApi');
 addpath('/usr/local/src/vrep/programming/remoteApiBindings/lib/lib/64Bit');
 
 %addpath('/Applications/V-REP_PRO_EDU_V3_4_0_Mac/programming/remoteApiBindings/matlab/matlab');
 %addpath('/Applications/V-REP_PRO_EDU_V3_4_0_Mac/programming/remoteApi');
 %addpath('/Applications/V-REP_PRO_EDU_V3_4_0_Mac/programming/remoteApiBindings/lib/lib/64Bit');

 
% OGNUNO DI VOI DOVRA' METTERE IL PATH ALLA CARTELLA PROGRAMMING NELLA
% DIRECTORY DI INSTALLAZIONE DI VREP
addpath(genpath('C:\Program Files\V-REP3\V-REP_PRO_EDU\programming'));
addpath(genpath('./')); %aggiungo il path corrente al path di matlab in modo che le funzioni nelle sottodirectory possano viste dal Matlab
savepath;


%%%%%%%%%              Inizializzazione  %%%%%%%%%%%%%%%%%%%%%%%%%
InitConnectionWithSimulator();%initialize the communication with the Simulator
%MotorParametersBushelessLafert(); %load in workspace the parameters of the motors



T = 0.001; %sample time. (USARE QUESTO VALORE.)



%ESEMPIO DI MOVIMENTAZIONE DEL ROBOT
%
JOINT = [6.65 -3.15 0 0 0.25 0]; %(m , m, rad, rad, m, rad)
%COMANDO: 
SendPoseToVRep(JOINT);
