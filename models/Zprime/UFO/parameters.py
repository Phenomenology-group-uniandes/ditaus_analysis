# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Linux x86 (64-bit) (December 13, 2023)
# Date: Wed 22 May 2024 16:01:15



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

gZp = Parameter(name = 'gZp',
                nature = 'external',
                type = 'real',
                value = 3.,
                texname = 'g_{\\text{Zp}}',
                lhablock = 'NPZPCOUP',
                lhacode = [ 1 ])

zetaq33 = Parameter(name = 'zetaq33',
                    nature = 'external',
                    type = 'real',
                    value = 1.,
                    texname = '\\zeta ^q{}_{33}',
                    lhablock = 'NPZPCOUP',
                    lhacode = [ 2 ])

zetal33 = Parameter(name = 'zetal33',
                    nature = 'external',
                    type = 'real',
                    value = 1.,
                    texname = '\\zeta ^l{}_{33}',
                    lhablock = 'NPZPCOUP',
                    lhacode = [ 3 ])

zetaRu33 = Parameter(name = 'zetaRu33',
                     nature = 'external',
                     type = 'real',
                     value = 1.,
                     texname = '\\zeta ^{\\text{Ru}}{}_{33}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 4 ])

zetaRd33 = Parameter(name = 'zetaRd33',
                     nature = 'external',
                     type = 'real',
                     value = 1.,
                     texname = '\\zeta ^{\\text{Rd}}{}_{33}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 5 ])

zetaRe33 = Parameter(name = 'zetaRe33',
                     nature = 'external',
                     type = 'real',
                     value = 1.,
                     texname = '\\zeta ^{\\text{Re}}{}_{33}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 6 ])

zetaqll = Parameter(name = 'zetaqll',
                    nature = 'external',
                    type = 'real',
                    value = 0.,
                    texname = '\\zeta ^q{}_{\\text{ll}}',
                    lhablock = 'NPZPCOUP',
                    lhacode = [ 7 ])

zetal22 = Parameter(name = 'zetal22',
                    nature = 'external',
                    type = 'real',
                    value = 0.,
                    texname = '\\zeta ^l{}_{22}',
                    lhablock = 'NPZPCOUP',
                    lhacode = [ 8 ])

zetal23 = Parameter(name = 'zetal23',
                    nature = 'external',
                    type = 'real',
                    value = 0.,
                    texname = '\\zeta ^l{}_{23}',
                    lhablock = 'NPZPCOUP',
                    lhacode = [ 9 ])

zetaRull = Parameter(name = 'zetaRull',
                     nature = 'external',
                     type = 'real',
                     value = 0.,
                     texname = '\\zeta ^{\\text{Ru}}{}_{\\text{ll}}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 10 ])

zetaRdll = Parameter(name = 'zetaRdll',
                     nature = 'external',
                     type = 'real',
                     value = 0.,
                     texname = '\\zeta ^{\\text{Rd}}{}_{\\text{ll}}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 11 ])

zetaRe22 = Parameter(name = 'zetaRe22',
                     nature = 'external',
                     type = 'real',
                     value = 0.,
                     texname = '\\zeta ^{\\text{Re}}{}_{22}',
                     lhablock = 'NPZPCOUP',
                     lhacode = [ 12 ])

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

MZp = Parameter(name = 'MZp',
                nature = 'external',
                type = 'real',
                value = 3000,
                texname = '\\text{MZp}',
                lhablock = 'MASS',
                lhacode = [ 43 ])

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

WZp = Parameter(name = 'WZp',
                nature = 'external',
                type = 'real',
                value = 600,
                texname = '\\text{WZp}',
                lhablock = 'DECAY',
                lhacode = [ 43 ])

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

aEW = Parameter(name = 'aEW',
                nature = 'internal',
                type = 'real',
                value = '1/aEWM1',
                texname = '\\alpha _{\\text{EW}}')

G = Parameter(name = 'G',
              nature = 'internal',
              type = 'real',
              value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
              texname = 'G')

zetal2x2 = Parameter(name = 'zetal2x2',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetal22',
                     texname = '\\text{zetal2x2}')

zetal2x3 = Parameter(name = 'zetal2x3',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetal23',
                     texname = '\\text{zetal2x3}')

zetal3x2 = Parameter(name = 'zetal3x2',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetal23',
                     texname = '\\text{zetal3x2}')

zetal3x3 = Parameter(name = 'zetal3x3',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetal33',
                     texname = '\\text{zetal3x3}')

zetaq1x1 = Parameter(name = 'zetaq1x1',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetaqll',
                     texname = '\\text{zetaq1x1}')

zetaq2x2 = Parameter(name = 'zetaq2x2',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetaqll',
                     texname = '\\text{zetaq2x2}')

zetaq3x3 = Parameter(name = 'zetaq3x3',
                     nature = 'internal',
                     type = 'real',
                     value = 'zetaq33',
                     texname = '\\text{zetaq3x3}')

zetaRd1x1 = Parameter(name = 'zetaRd1x1',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRdll',
                      texname = '\\text{zetaRd1x1}')

zetaRd2x2 = Parameter(name = 'zetaRd2x2',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRdll',
                      texname = '\\text{zetaRd2x2}')

zetaRd3x3 = Parameter(name = 'zetaRd3x3',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRd33',
                      texname = '\\text{zetaRd3x3}')

zetaRe2x2 = Parameter(name = 'zetaRe2x2',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRe22',
                      texname = '\\text{zetaRe2x2}')

zetaRe3x3 = Parameter(name = 'zetaRe3x3',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRe33',
                      texname = '\\text{zetaRe3x3}')

zetaRu1x1 = Parameter(name = 'zetaRu1x1',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRull',
                      texname = '\\text{zetaRu1x1}')

zetaRu2x2 = Parameter(name = 'zetaRu2x2',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRull',
                      texname = '\\text{zetaRu2x2}')

zetaRu3x3 = Parameter(name = 'zetaRu3x3',
                      nature = 'internal',
                      type = 'real',
                      value = 'zetaRu33',
                      texname = '\\text{zetaRu3x3}')

MW = Parameter(name = 'MW',
               nature = 'internal',
               type = 'real',
               value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (aEW*cmath.pi*MZ**2)/(Gf*cmath.sqrt(2))))',
               texname = 'M_W')

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

I5a1 = Parameter(name = 'I5a1',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I5a1}')

I5a2 = Parameter(name = 'I5a2',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I5a2}')

I5a3 = Parameter(name = 'I5a3',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I5a3}')

I6a1 = Parameter(name = 'I6a1',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I6a1}')

I6a2 = Parameter(name = 'I6a2',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I6a2}')

I6a3 = Parameter(name = 'I6a3',
                 nature = 'internal',
                 type = 'complex',
                 value = '1',
                 texname = '\\text{I6a3}')

I7ax = Parameter(name = 'I7ax',
                 nature = 'internal',
                 type = 'complex',
                 value = 'zetaq1x1 + zetaq2x2 + zetaq3x3',
                 texname = '\\text{I7ax}')

