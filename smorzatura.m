function [ xd, dxd ] = smorzatura( xd, dxd, t0, tf, T )
%SMORZATURA Summary of this function goes here
%   Detailed explanation goes here

x0 = xd (t0,1);
xf = xd (tf,1);
v0_x = dxd (t0,1);
vf_x = dxd(tf,1);
x_spline = spline ([0 (tf-t0)*T], [v0_x x0 xf vf_x], [0:T:(tf-t0)*T]);

%spline su y
y0 = xd (t0,2);
yf = xd (tf,2);
v0_y = dxd (t0,2);
vf_y = dxd(tf,2);
y_spline = spline ([0 (tf-t0)*T], [v0_y y0 yf vf_y], [0:T:(tf-t0)*T]);

%spline su z
% z0 = xd (t0,3);
% zf = xd (tf,3);
% v0_z = dxd (t0,3);
% vf_z = dxd(tf,3);
% z_spline = spline ([0 (tf-t0)*T], [v0_z z0 zf vf_z], [0:T:(tf-t0)*T]);

xd(t0:tf,1)=x_spline';
xd(t0:tf,2)=y_spline';
% xd(t0:tf,3)=z_spline';

x_dxd = [ v0_x ; (diff(x_spline)/T)'];
y_dxd = [ v0_y ; (diff(y_spline)/T)'];
%z_dxd = [ v0_z ; (diff(z_spline)/T)'];

dxd(t0:tf,1)=x_dxd;
dxd(t0:tf,2)=y_dxd;
%dxd(t0:tf,3)=z_dxd;

end

