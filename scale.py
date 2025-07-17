# -*- coding: utf-8 -*-
"""
Created on Wed Jul 16 09:16:45 2025

@author: crr34
"""
import numpy as np
import matplotlib.pyplot as plt

# change plot appearance
plt.rcParams.update({
    'font.family': 'Times New Roman',
    'font.size': 16,
    'mathtext.fontset': 'stix',         # <-- Makes math look like Times
    'mathtext.default': 'regular',
    'axes.labelsize': 16,
    'axes.labelweight': 'bold',  # <--- Make axis labels bold
    'xtick.labelsize': 16,
    'ytick.labelsize': 16
})

# input parameters
rho = 1100 # dispersion density kg m^-3 
roughness = 0.0007590720169243545 # pipe wall roughness m
mu = 2.4*10**-4 # dispersion viscosity
u_1 = 0.4 # m/s
H_1= 0.0508 # m

# first find critical tau for u = 0.4 m s^-1, H = 0.05 08
Re_1 = rho*u_1*H_1/mu

# make plot for different H
H = np.linspace(0.05,1, num=50) # m

# critical shear rate -> critical wall shear stress
f=  0.04412787486958 # https://www.ajdesigner.com/php_colebrook/colebrook_equation.php
tau = (1/8)*f*rho*u_1**2

# solve for u, by rearranging these equations:
# (1) tau_w = (1/8)*f*rho*u**2
# (2) Colebrook equation
u = ((8*tau/rho)**(1/2))*-2*np.log10(2.51*mu/(rho*H*(8*tau/rho)**(1/2)) + roughness/(3.7*H))

# plot ucrit against pipe diameter
plt.plot(H,u)
plt.xlabel(r'$\boldsymbol{H}$/m')
plt.ylabel(r'$\boldsymbol{u}_{\mathrm{\mathbf{crit}}}$/m/s')
plt.plot(H_1, u_1,'x',color='red')
plt.savefig('u.png', dpi=600,bbox_inches='tight')
plt.show()
plt.close()

# plot Qcrit against pipe diameter
Q = u*np.pi*H**2/4
plt.plot(H,Q)
plt.xlabel(r'$\boldsymbol{H}$/m')
plt.ylabel(r'$\boldsymbol{Q}_{\mathrm{\mathbf{crit}}}$/m$^{3}$/s')
plt.plot(H_1, u_1*np.pi*H_1**2/4,'x',color='red')
plt.savefig('Q.png', dpi=600,bbox_inches='tight')
plt.show()
plt.close()

# check Reynolds number and plot against pipe diameter
Re = rho*u*H/mu
plt.plot(H,Re)
plt.xlabel(r'$\boldsymbol{H}$/m')
plt.ylabel(r'Re')
plt.ticklabel_format(axis='y', style='sci', scilimits=(5,5))
plt.plot(H_1, Re_1,'x',color='red')
plt.savefig('Re.png', dpi=600,bbox_inches='tight')
plt.show()
plt.close()