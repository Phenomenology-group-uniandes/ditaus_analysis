# ---------------------------------------------------------------------- 
# This model file was automatically created by SARAH version4.15.3
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840   
# (c) Florian Staub, Mark Goodsell, Werner Porod and Martin Gabelmann 2023 
# ---------------------------------------------------------------------- 
# File created at 14:25 on 14.6.2024  
# ---------------------------------------------------------------------- 


from __future__ import division
from object_library import all_particles,Particle
import parameters as Param


nu1 = Particle(pdg_code =12,
    name = 'nu1' ,
    antiname = 'nu1bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_1' ,
    antitexname = '{\\bar{\\nu}}_1' )

nu1bar = nu1.anti()


nu2 = Particle(pdg_code =14,
    name = 'nu2' ,
    antiname = 'nu2bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_2' ,
    antitexname = '{\\bar{\\nu}}_2' )

nu2bar = nu2.anti()


nu3 = Particle(pdg_code =16,
    name = 'nu3' ,
    antiname = 'nu3bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_3' ,
    antitexname = '{\\bar{\\nu}}_3' )

nu3bar = nu3.anti()


d1 = Particle(pdg_code =1,
    name = 'd1' ,
    antiname = 'd1bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_1' ,
    antitexname = '{\\bar{d}}_1' )

d1bar = d1.anti()


d2 = Particle(pdg_code =3,
    name = 'd2' ,
    antiname = 'd2bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_2' ,
    antitexname = '{\\bar{d}}_2' )

d2bar = d2.anti()


d3 = Particle(pdg_code =5,
    name = 'd3' ,
    antiname = 'd3bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md3 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_3' ,
    antitexname = '{\\bar{d}}_3' )

d3bar = d3.anti()


u1 = Particle(pdg_code =2,
    name = 'u1' ,
    antiname = 'u1bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_1' ,
    antitexname = '{\\bar{u}}_1' )

u1bar = u1.anti()


u2 = Particle(pdg_code =4,
    name = 'u2' ,
    antiname = 'u2bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_2' ,
    antitexname = '{\\bar{u}}_2' )

u2bar = u2.anti()


u3 = Particle(pdg_code =6,
    name = 'u3' ,
    antiname = 'u3bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu3 ,
    width = Param.Wu3 ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_3' ,
    antitexname = '{\\bar{u}}_3' )

u3bar = u3.anti()


e1 = Particle(pdg_code =11,
    name = 'e1' ,
    antiname = 'e1bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me1 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_1' ,
    antitexname = '{\\bar{e}}_1' )

e1bar = e1.anti()


e2 = Particle(pdg_code =13,
    name = 'e2' ,
    antiname = 'e2bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me2 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_2' ,
    antitexname = '{\\bar{e}}_2' )

e2bar = e2.anti()


e3 = Particle(pdg_code =15,
    name = 'e3' ,
    antiname = 'e3bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me3 ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_3' ,
    antitexname = '{\\bar{e}}_3' )

e3bar = e3.anti()


h1 = Particle(pdg_code =25,
    name = 'h1' ,
    antiname = 'h1' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mh1 ,
    width = Param.Wh1 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_1' ,
    antitexname = '{h}_1' )

h2 = Particle(pdg_code =35,
    name = 'h2' ,
    antiname = 'h2' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.Mh2 ,
    width = Param.Wh2 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{h}_2' ,
    antitexname = '{h}_2' )

Ah1 = Particle(pdg_code =999900,
    name = 'Ah1' ,
    antiname = 'Ah1' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh1 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_1' ,
    antitexname = '{A^0}_1' )

Ah2 = Particle(pdg_code =36,
    name = 'Ah2' ,
    antiname = 'Ah2' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh2 ,
    width = Param.WAh2 ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A^0}_2' ,
    antitexname = '{A^0}_2' )

Hm1 = Particle(pdg_code =999901,
    name = 'Hm1' ,
    antiname = 'Hm1c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm1 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_1' ,
    antitexname = '{H^+}_1' )

Hm1c = Hm1.anti()


Hm2 = Particle(pdg_code =-37,
    name = 'Hm2' ,
    antiname = 'Hm2c' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHm2 ,
    width = Param.WHm2 ,
    line = 'dashed' ,
    charge = -1 ,
    texname = '{H^-}_2' ,
    antitexname = '{H^+}_2' )

Hm2c = Hm2.anti()


g = Particle(pdg_code =21,
    name = 'g' ,
    antiname = 'g' ,
    spin = 3 ,
    color = 8 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'wavy' ,
    charge = 0 ,
    texname = 'g' ,
    antitexname = 'g' )

A = Particle(pdg_code =22,
    name = 'A' ,
    antiname = 'A' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'wavy' ,
    charge = 0 ,
    texname = '\\gamma' ,
    antitexname = '\\gamma' )

Z = Particle(pdg_code =23,
    name = 'Z' ,
    antiname = 'Z' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MZ ,
    width = Param.WZ ,
    line = 'wavy' ,
    charge = 0 ,
    texname = 'Z' ,
    antitexname = 'Z' )

Wm = Particle(pdg_code =-24,
    name = 'Wm' ,
    antiname = 'Wmc' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MWm ,
    width = Param.WWm ,
    line = 'wavy' ,
    charge = -1 ,
    texname = 'W^-' ,
    antitexname = 'W^+' )

Wmc = Wm.anti()


gG = Particle(pdg_code =999902,
    name = 'gG' ,
    antiname = 'gGc' ,
    spin = -1 ,
    color = 8 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^G' ,
    antitexname = '\\bar{\\eta^G}' )

gGc = gG.anti()


gA = Particle(pdg_code =999903,
    name = 'gA' ,
    antiname = 'gAc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^{\\gamma}' ,
    antitexname = '\\bar{\\eta^{\\gamma}}' )

gAc = gA.anti()


gZ = Particle(pdg_code =999904,
    name = 'gZ' ,
    antiname = 'gZc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgZ ,
    width = Param.WZ ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^Z' ,
    antitexname = '\\bar{\\eta^Z}' )

gZc = gZ.anti()


gWm = Particle(pdg_code =999905,
    name = 'gWm' ,
    antiname = 'gWmc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWm ,
    width = Param.WWm ,
    propagating = False,
    line = 'dotted' ,
    charge = -1 ,
    texname = '\\eta^-' ,
    antitexname = '\\bar{\\eta^-}' )

gWmc = gWm.anti()


gWpC = Particle(pdg_code =999906,
    name = 'gWpC' ,
    antiname = 'gWpCc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWpC ,
    width = Param.WWm ,
    propagating = False,
    line = 'dotted' ,
    charge = 1 ,
    texname = '\\eta^+' ,
    antitexname = '\\bar{\\eta^+}' )

gWpCc = gWpC.anti()


