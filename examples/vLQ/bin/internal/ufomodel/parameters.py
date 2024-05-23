# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Linux x86 (64-bit) (December 13, 2023)
# Date: Wed 22 May 2024 15:49:08



from object_library import all_parameters, Parameter


from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# User-defined parameters.
cabi = Parameter(name = 'cabi',
                 nature = 'external',
                 type = 'real',
                 value = 0.227736,
                 texname = '\\theta _c',
                 lhablock = 'CKMBLOCK',
                 lhacode = [ 1 ])

gU = Parameter(name = 'gU',
               nature = 'external',
               type = 'real',
               value = 3.,
               texname = 'g_U',
               lhablock = 'NPLQCOUP',
               lhacode = [ 1 ])

betaL33 = Parameter(name = 'betaL33',
                    nature = 'external',
                    type = 'real',
                    value = 1.,
                    texname = '\\beta ^L{}_{33}',
                    lhablock = 'NPLQCOUP',
                    lhacode = [ 2 ])

betaRd33 = Parameter(name = 'betaRd33',
                     nature = 'external',
                     type = 'real',
                     value = 1.,
                     texname = '\\beta ^R{}_{33}',
                     lhablock = 'NPLQCOUP',
                     lhacode = [ 3 ])

betaL23 = Parameter(name = 'betaL23',
                    nature = 'external',
                    type = 'real',
                    value = 0.,
                    texname = '\\beta ^L{}_{23}',
                    lhablock = 'NPLQCOUP',
                    lhacode = [ 4 ])

betaL32 = Parameter(name = 'betaL32',
                    nature = 'external',
                    type = 'real',
                    value = 0.,
                    texname = '\\beta ^L{}_{32}',
                    lhablock = 'NPLQCOUP',
                    lhacode = [ 5 ])

kappaU = Parameter(name = 'kappaU',
                   nature = 'external',
                   type = 'real',
                   value = 0.,
                   texname = '\\kappa _U',
                   lhablock = 'NPLQCOUP',
                   lhacode = [ 6 ])

kappaUtilde = Parameter(name = 'kappaUtilde',
                        nature = 'external',
                        type = 'real',
                        value = 0.,
                        texname = '\\tilde{\\kappa }_U',
                        lhablock = 'NPLQCOUP',
                        lhacode = [ 7 ])

aEWM1 = Parameter(name = 'aEWM1',
                  nature = 'external',
                  type = 'real',
                  value = 127.9,
                  texname = '\\text{aEWM1}',
                  lhablock = 'SMINPUTS',
                  lhacode = [ 1 ])

Gf = Parameter(name = 'Gf',
               nature = 'external',
               type = 'real',
               value = 0.0000116637,
               texname = 'G_f',
               lhablock = 'SMINPUTS',
               lhacode = [ 2 ])

aS = Parameter(name = 'aS',
               nature = 'external',
               type = 'real',
               value = 0.1184,
               texname = '\\alpha _s',
               lhablock = 'SMINPUTS',
               lhacode = [ 3 ])

ymt = Parameter(name = 'ymt',
                nature = 'external',
                type = 'real',
                value = 172,
                texname = '\\text{ymt}',
                lhablock = 'YUKAWA',
                lhacode = [ 6 ])

MZ = Parameter(name = 'MZ',
               nature = 'external',
               type = 'real',
               value = 91.1876,
               texname = '\\text{MZ}',
               lhablock = 'MASS',
               lhacode = [ 23 ])

MT = Parameter(name = 'MT',
               nature = 'external',
               type = 'real',
               value = 172,
               texname = '\\text{MT}',
               lhablock = 'MASS',
               lhacode = [ 6 ])

MH = Parameter(name = 'MH',
               nature = 'external',
               type = 'real',
               value = 125,
               texname = '\\text{MH}',
               lhablock = 'MASS',
               lhacode = [ 25 ])

MVLQ = Parameter(name = 'MVLQ',
                 nature = 'external',
                 type = 'real',
                 value = 3000,
                 texname = '\\text{MVLQ}',
                 lhablock = 'MASS',
                 lhacode = [ 9000005 ])

WZ = Parameter(name = 'WZ',
               nature = 'external',
               type = 'real',
               value = 2.4952,
               texname = '\\text{WZ}',
               lhablock = 'DECAY',
               lhacode = [ 23 ])

WW = Parameter(name = 'WW',
               nature = 'external',
               type = 'real',
               value = 2.085,
               texname = '\\text{WW}',
               lhablock = 'DECAY',
               lhacode = [ 24 ])

WT = Parameter(name = 'WT',
               nature = 'external',
               type = 'real',
               value = 1.50833649,
               texname = '\\text{WT}',
               lhablock = 'DECAY',
               lhacode = [ 6 ])

WH = Parameter(name = 'WH',
               nature = 'external',
               type = 'real',
               value = 0.00407,
               texname = '\\text{WH}',
               lhablock = 'DECAY',
               lhacode = [ 25 ])

WVLQ = Parameter(name = 'WVLQ',
                 nature = 'external',
                 type = 'real',
                 value = 600,
                 texname = '\\text{WVLQ}',
                 lhablock = 'DECAY',
                 lhacode = [ 9000005 ])

CKM1x1 = Parameter(name = 'CKM1x1',
                   nature = 'internal',
                   type = 'complex',
                   value = 'cmath.cos(cabi)',
                   texname = '\\text{CKM1x1}')

CKM1x2 = Parameter(name = 'CKM1x2',
                   nature = 'internal',
                   type = 'complex',
                   value = 'cmath.sin(cabi)',
                   texname = '\\text{CKM1x2}')

CKM1x3 = Parameter(name = 'CKM1x3',
                   nature = 'internal',
                   type = 'complex',
                   value = '0',
                   texname = '\\text{CKM1x3}')

CKM2x1 = Parameter(name = 'CKM2x1',
                   nature = 'internal',
                   type = 'complex',
                   value = '-cmath.sin(cabi)',
                   texname = '\\text{CKM2x1}')

CKM2x2 = Parameter(name = 'CKM2x2',
                   nature = 'internal',
                   type = 'complex',
                   value = 'cmath.cos(cabi)',
                   texname = '\\text{CKM2x2}')

CKM2x3 = Parameter(name = 'CKM2x3',
                   nature = 'internal',
                   type = 'complex',
                   value = '0',
                   texname = '\\text{CKM2x3}')

CKM3x1 = Parameter(name = 'CKM3x1',
                   nature = 'internal',
                   type = 'complex',
                   value = '0',
                   texname = '\\text{CKM3x1}')

CKM3x2 = Parameter(name = 'CKM3x2',
                   nature = 'internal',
                   type = 'complex',
                   value = '0',
                   texname = '\\text{CKM3x2}')

CKM3x3 = Parameter(name = 'CKM3x3',
                   nature = 'internal',
                   type = 'complex',
                   value = '1',
                   texname = '\\text{CKM3x3}')

newCKM1x1 = Parameter(name = 'newCKM1x1',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.97431',
                      texname = '\\text{newCKM1x1}')

newCKM1x2 = Parameter(name = 'newCKM1x2',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.22514',
                      texname = '\\text{newCKM1x2}')

newCKM1x3 = Parameter(name = 'newCKM1x3',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.001341627155004562 - 0.0034589213025095506*complex(0,1)',
                      texname = '\\text{newCKM1x3}')

newCKM2x1 = Parameter(name = 'newCKM2x1',
                      nature = 'internal',
                      type = 'complex',
                      value = '-0.22503996014404648 - 0.00013393418524340847*complex(0,1)',
                      texname = '\\text{newCKM2x1}')

newCKM2x2 = Parameter(name = 'newCKM2x2',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.973529999508847 - 0.000030924173032631034*complex(0,1)',
                      texname = '\\text{newCKM2x2}')

newCKM2x3 = Parameter(name = 'newCKM2x3',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.0397',
                      texname = '\\text{newCKM2x3}')

newCKM3x1 = Parameter(name = 'newCKM3x1',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.007669956046435947 - 0.0033509214025012114*complex(0,1)',
                      texname = '\\text{newCKM3x1}')

newCKM3x2 = Parameter(name = 'newCKM3x2',
                      nature = 'internal',
                      type = 'complex',
                      value = '-0.03899232115283448 - 0.0007738805555232434*complex(0,1)',
                      texname = '\\text{newCKM3x2}')

newCKM3x3 = Parameter(name = 'newCKM3x3',
                      nature = 'internal',
                      type = 'complex',
                      value = '0.9992',
                      texname = '\\text{newCKM3x3}')

aEW = Parameter(name = 'aEW',
                nature = 'internal',
                type = 'real',
                value = '1/aEWM1',
                texname = '\\alpha _{\\text{EW}}')

betaL2x3 = Parameter(name = 'betaL2x3',
                     nature = 'internal',
                     type = 'real',
                     value = 'betaL23',
                     texname = '\\text{betaL2x3}')

betaL3x2 = Parameter(name = 'betaL3x2',
                     nature = 'internal',
                     type = 'real',
                     value = 'betaL32',
                     texname = '\\text{betaL3x2}')

betaL3x3 = Parameter(name = 'betaL3x3',
                     nature = 'internal',
                     type = 'real',
                     value = 'betaL33',
                     texname = '\\text{betaL3x3}')

betaRd3x3 = Parameter(name = 'betaRd3x3',
                      nature = 'internal',
                      type = 'real',
                      value = 'betaRd33',
                      texname = '\\text{betaRd3x3}')

G = Parameter(name = 'G',
              nature = 'internal',
              type = 'real',
              value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
              texname = 'G')

MW = Parameter(name = 'MW',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (aEW*cmath.pi*MZ**2)/(Gf*cmath.sqrt(2))))',
               texname = 'M_W')

betaL1x3 = Parameter(name = 'betaL1x3',
                     nature = 'internal',
                     type = 'complex',
                     value = '(betaL23*complexconjugate(newCKM3x1))/complexconjugate(newCKM3x2)',
                     texname = '\\text{betaL1x3}')

ee = Parameter(name = 'ee',
               nature = 'internal',
               type = 'real',
               value = '2*cmath.sqrt(aEW)*cmath.sqrt(cmath.pi)',
               texname = 'e')

sw2 = Parameter(name = 'sw2',
                nature = 'internal',
                type = 'real',
                value = '1 - MW**2/MZ**2',
                texname = '\\text{sw2}')

cw = Parameter(name = 'cw',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(1 - sw2)',
               texname = 'c_w')

sw = Parameter(name = 'sw',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(sw2)',
               texname = 's_w')

g1 = Parameter(name = 'g1',
               nature = 'internal',
               type = 'real',
               value = 'ee/cw',
               texname = 'g_1')

gw = Parameter(name = 'gw',
               nature = 'internal',
               type = 'real',
               value = 'ee/sw',
               texname = 'g_w')

vev = Parameter(name = 'vev',
                nature = 'internal',
                type = 'real',
                value = '(2*MW*sw)/ee',
                texname = '\\text{vev}')

lam = Parameter(name = 'lam',
                nature = 'internal',
                type = 'real',
                value = 'MH**2/(2.*vev**2)',
                texname = '\\text{lam}')

yt = Parameter(name = 'yt',
               nature = 'internal',
               type = 'real',
               value = '(ymt*cmath.sqrt(2))/vev',
               texname = '\\text{yt}')

muH = Parameter(name = 'muH',
                nature = 'internal',
                type = 'real',
                value = 'cmath.sqrt(lam*vev**2)',
                texname = '\\mu')

I2a13 = Parameter(name = 'I2a13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yt*complexconjugate(CKM3x1)',
                  texname = '\\text{I2a13}')

I2a23 = Parameter(name = 'I2a23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yt*complexconjugate(CKM3x2)',
                  texname = '\\text{I2a23}')

I2a33 = Parameter(name = 'I2a33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'yt*complexconjugate(CKM3x3)',
                  texname = '\\text{I2a33}')

I3a31 = Parameter(name = 'I3a31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKM3x1*yt',
                  texname = '\\text{I3a31}')

I3a32 = Parameter(name = 'I3a32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKM3x2*yt',
                  texname = '\\text{I3a32}')

I3a33 = Parameter(name = 'I3a33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'CKM3x3*yt',
                  texname = '\\text{I3a33}')

I5a21 = Parameter(name = 'I5a21',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*complexconjugate(newCKM1x3)',
                  texname = '\\text{I5a21}')

I5a22 = Parameter(name = 'I5a22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*complexconjugate(newCKM2x3)',
                  texname = '\\text{I5a22}')

I5a23 = Parameter(name = 'I5a23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*complexconjugate(newCKM3x3)',
                  texname = '\\text{I5a23}')

I5a31 = Parameter(name = 'I5a31',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*complexconjugate(newCKM1x1) + betaL2x3*complexconjugate(newCKM1x2) + betaL3x3*complexconjugate(newCKM1x3)',
                  texname = '\\text{I5a31}')

I5a32 = Parameter(name = 'I5a32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*complexconjugate(newCKM2x1) + betaL2x3*complexconjugate(newCKM2x2) + betaL3x3*complexconjugate(newCKM2x3)',
                  texname = '\\text{I5a32}')

I5a33 = Parameter(name = 'I5a33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*complexconjugate(newCKM3x1) + betaL2x3*complexconjugate(newCKM3x2) + betaL3x3*complexconjugate(newCKM3x3)',
                  texname = '\\text{I5a33}')

I6a12 = Parameter(name = 'I6a12',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*newCKM1x3',
                  texname = '\\text{I6a12}')

I6a13 = Parameter(name = 'I6a13',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*newCKM1x1 + betaL2x3*newCKM1x2 + betaL3x3*newCKM1x3',
                  texname = '\\text{I6a13}')

I6a22 = Parameter(name = 'I6a22',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*newCKM2x3',
                  texname = '\\text{I6a22}')

I6a23 = Parameter(name = 'I6a23',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*newCKM2x1 + betaL2x3*newCKM2x2 + betaL3x3*newCKM2x3',
                  texname = '\\text{I6a23}')

I6a32 = Parameter(name = 'I6a32',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL3x2*newCKM3x3',
                  texname = '\\text{I6a32}')

I6a33 = Parameter(name = 'I6a33',
                  nature = 'internal',
                  type = 'complex',
                  value = 'betaL1x3*newCKM3x1 + betaL2x3*newCKM3x2 + betaL3x3*newCKM3x3',
                  texname = '\\text{I6a33}')

