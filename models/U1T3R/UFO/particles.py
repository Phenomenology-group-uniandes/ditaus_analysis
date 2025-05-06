# ---------------------------------------------------------------------- 
# This model file was automatically created by SARAH version4.15.4
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840   
# (c) Florian Staub, Mark Goodsell, Werner Porod and Martin Gabelmann 2023 
# ---------------------------------------------------------------------- 
# File created at 15:39 on 4.4.2025  
# ---------------------------------------------------------------------- 


from __future__ import division
from object_library import all_particles,Particle
import parameters as Param


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


d4 = Particle(pdg_code =1000001,
    name = 'd4' ,
    antiname = 'd4bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md4 ,
    width = Param.Wd4 ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_4' ,
    antitexname = '{\\bar{d}}_4' )

d4bar = d4.anti()


d5 = Particle(pdg_code =1000003,
    name = 'd5' ,
    antiname = 'd5bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md5 ,
    width = Param.Wd5 ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_5' ,
    antitexname = '{\\bar{d}}_5' )

d5bar = d5.anti()


d6 = Particle(pdg_code =1000005,
    name = 'd6' ,
    antiname = 'd6bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Md6 ,
    width = Param.Wd6 ,
    line = 'swavy' ,
    charge = -1/3 ,
    texname = '{d}_6' ,
    antitexname = '{\\bar{d}}_6' )

d6bar = d6.anti()


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


u4 = Particle(pdg_code =1000002,
    name = 'u4' ,
    antiname = 'u4bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu4 ,
    width = Param.Wu4 ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_4' ,
    antitexname = '{\\bar{u}}_4' )

u4bar = u4.anti()


u5 = Particle(pdg_code =1000004,
    name = 'u5' ,
    antiname = 'u5bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu5 ,
    width = Param.Wu5 ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_5' ,
    antitexname = '{\\bar{u}}_5' )

u5bar = u5.anti()


u6 = Particle(pdg_code =1000006,
    name = 'u6' ,
    antiname = 'u6bar' ,
    spin = 2 ,
    color = 3 ,
    mass = Param.Mu6 ,
    width = Param.Wu6 ,
    line = 'swavy' ,
    charge = 2/3 ,
    texname = '{u}_6' ,
    antitexname = '{\\bar{u}}_6' )

u6bar = u6.anti()


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


e4 = Particle(pdg_code =1000011,
    name = 'e4' ,
    antiname = 'e4bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me4 ,
    width = Param.We4 ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_4' ,
    antitexname = '{\\bar{e}}_4' )

e4bar = e4.anti()


e5 = Particle(pdg_code =1000013,
    name = 'e5' ,
    antiname = 'e5bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me5 ,
    width = Param.We5 ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_5' ,
    antitexname = '{\\bar{e}}_5' )

e5bar = e5.anti()


e6 = Particle(pdg_code =1000015,
    name = 'e6' ,
    antiname = 'e6bar' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Me6 ,
    width = Param.We6 ,
    line = 'swavy' ,
    charge = -1 ,
    texname = '{e}_6' ,
    antitexname = '{\\bar{e}}_6' )

e6bar = e6.anti()


nu1 = Particle(pdg_code =12,
    name = 'nu1' ,
    antiname = 'nu1' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_1' ,
    antitexname = '{\\nu}_1' )

nu2 = Particle(pdg_code =14,
    name = 'nu2' ,
    antiname = 'nu2' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_2' ,
    antitexname = '{\\nu}_2' )

nu3 = Particle(pdg_code =16,
    name = 'nu3' ,
    antiname = 'nu3' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_3' ,
    antitexname = '{\\nu}_3' )

nu4 = Particle(pdg_code =9900012,
    name = 'nu4' ,
    antiname = 'nu4' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_4' ,
    antitexname = '{\\nu}_4' )

nu5 = Particle(pdg_code =9900014,
    name = 'nu5' ,
    antiname = 'nu5' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_5' ,
    antitexname = '{\\nu}_5' )

nu6 = Particle(pdg_code =9900016,
    name = 'nu6' ,
    antiname = 'nu6' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.ZERO ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_6' ,
    antitexname = '{\\nu}_6' )

nu7 = Particle(pdg_code =1000012,
    name = 'nu7' ,
    antiname = 'nu7' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu7 ,
    width = Param.Wnu7 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_7' ,
    antitexname = '{\\nu}_7' )

nu8 = Particle(pdg_code =1000014,
    name = 'nu8' ,
    antiname = 'nu8' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu8 ,
    width = Param.Wnu8 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_8' ,
    antitexname = '{\\nu}_8' )

nu9 = Particle(pdg_code =1000016,
    name = 'nu9' ,
    antiname = 'nu9' ,
    spin = 2 ,
    color = 1 ,
    mass = Param.Mnu9 ,
    width = Param.Wnu9 ,
    line = 'swavy' ,
    charge = 0 ,
    texname = '{\\nu}_9' ,
    antitexname = '{\\nu}_9' )

Hp = Particle(pdg_code =999900,
    name = 'Hp' ,
    antiname = 'Hpc' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MHp ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 1 ,
    texname = 'H^+' ,
    antitexname = 'H^-' )

Hpc = Hp.anti()


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

Ah1 = Particle(pdg_code =999901,
    name = 'Ah1' ,
    antiname = 'Ah1' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh1 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A_h}_1' ,
    antitexname = '{A_h}_1' )

Ah2 = Particle(pdg_code =999902,
    name = 'Ah2' ,
    antiname = 'Ah2' ,
    spin = 1 ,
    color = 1 ,
    mass = Param.MAh2 ,
    width = Param.ZERO,
    goldstone = True ,
    line = 'dashed' ,
    charge = 0 ,
    texname = '{A_h}_2' ,
    antitexname = '{A_h}_2' )

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

Zp = Particle(pdg_code =31,
    name = 'Zp' ,
    antiname = 'Zp' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MZp ,
    width = Param.WZp ,
    line = 'wavy' ,
    charge = 0 ,
    texname = '{Z^{\\prime}}' ,
    antitexname = '{Z^{\\prime}}' )

Wp = Particle(pdg_code =24,
    name = 'Wp' ,
    antiname = 'Wpc' ,
    spin = 3 ,
    color = 1 ,
    mass = Param.MWp ,
    width = Param.WWp ,
    line = 'wavy' ,
    charge = 1 ,
    texname = 'W^+' ,
    antitexname = 'W^-' )

Wpc = Wp.anti()


gG = Particle(pdg_code =999903,
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


gA = Particle(pdg_code =999904,
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


gZ = Particle(pdg_code =999905,
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


gZp = Particle(pdg_code =999906,
    name = 'gZp' ,
    antiname = 'gZpc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.ZERO ,
    width = Param.WZp ,
    propagating = False,
    line = 'dotted' ,
    charge = 0 ,
    texname = '\\eta^{Z^{\\prime}}' ,
    antitexname = '\\bar{\\eta^{Z^{\\prime}}}' )

gZpc = gZp.anti()


gWp = Particle(pdg_code =999907,
    name = 'gWp' ,
    antiname = 'gWpc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWp ,
    width = Param.WWp ,
    propagating = False,
    line = 'dotted' ,
    charge = 1 ,
    texname = '\\eta^+' ,
    antitexname = '\\bar{\\eta^+}' )

gWpc = gWp.anti()


gWC = Particle(pdg_code =999908,
    name = 'gWC' ,
    antiname = 'gWCc' ,
    spin = -1 ,
    color = 1 ,
    mass = Param.MgWC ,
    width = Param.WWp ,
    propagating = False,
    line = 'dotted' ,
    charge = -1 ,
    texname = '\\eta^-' ,
    antitexname = '\\bar{\\eta^-}' )

gWCc = gWC.anti()


