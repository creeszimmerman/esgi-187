# -*- coding: utf-8 -*-
"""
Created on Wed Jul 16 09:16:45 2025

@author: crr34
"""
# 3 inch pipe
# input parameters
#set H
rho = 1100 # dispersion density kg m^-3 
roughness = 0.025*10**-3 # pipe wall roughness m
mu = 2.4*10**-4 # dispersion viscosity
u_1 = 1.2
H_1= 3*0.0254

# first find critical tau for u = 0.4 m s^-1, H = 0.05 
Re_1 = rho*u_1*H_1/mu
f_1=0.038
epsilon_1 = H_1*3.7*(10**(1/(-2*f_1**(1/2))) -2.51/(Re_1*f_1**(1/2)))

# 4 inch pipe
# input parameters
#set H
rho = 1100 # dispersion density kg m^-3 
roughness = 0.025*10**-3 # pipe wall roughness m
mu = 2.4*10**-4 # dispersion viscosity
u_2 = 0.8
H_2= 4*0.0254

# first find critical tau for u = 0.4 m s^-1, H = 0.05 
Re_2 = rho*u_2*H_2/mu
f_2=0.0289
epsilon_2=H_2*3.7*(10**(1/(-2*f_2**(1/2))) -2.51/(Re_2*f_2**(1/2)))
