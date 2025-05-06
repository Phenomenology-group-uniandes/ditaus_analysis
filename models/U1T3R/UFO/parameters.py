# ----------------------------------------------------------------------
# This model file was automatically created by SARAH version4.15.4
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840
# (c) Florian Staub, Mark Goodsell, Werner Porod and Martin Gabelmann 2023
# ----------------------------------------------------------------------
# File created at 15:39 on 4.4.2025
# ----------------------------------------------------------------------

from object_library import all_parameters,Parameter

from function_library import complexconjugate,re,im,csc,sec,acsc,asec
ZERO = Parameter(name='ZERO',
    nature='internal',
    type='real',
    value='0.0',
    texname='0')

Md1 = Parameter(name = 'Md1',
    nature = 'external',
    type = 'real',
    value = 0.0035,
    texname = 'M_{{d}_1}',
    lhablock = 'MASS',
    lhacode = [1])

Md2 = Parameter(name = 'Md2',
    nature = 'external',
    type = 'real',
    value = 0.104,
    texname = 'M_{{d}_2}',
    lhablock = 'MASS',
    lhacode = [3])

Md3 = Parameter(name = 'Md3',
    nature = 'external',
    type = 'real',
    value = 4.2,
    texname = 'M_{{d}_3}',
    lhablock = 'MASS',
    lhacode = [5])

Md4 = Parameter(name = 'Md4',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{d}_4}',
    lhablock = 'MASS',
    lhacode = [1000001])

Wd4 = Parameter(name = 'Wd4',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{d}_4}',
    lhablock = 'DECAY',
    lhacode = [1000001])

Md5 = Parameter(name = 'Md5',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{d}_5}',
    lhablock = 'MASS',
    lhacode = [1000003])

Wd5 = Parameter(name = 'Wd5',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{d}_5}',
    lhablock = 'DECAY',
    lhacode = [1000003])

Md6 = Parameter(name = 'Md6',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{d}_6}',
    lhablock = 'MASS',
    lhacode = [1000005])

Wd6 = Parameter(name = 'Wd6',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{d}_6}',
    lhablock = 'DECAY',
    lhacode = [1000005])

Mu1 = Parameter(name = 'Mu1',
    nature = 'external',
    type = 'real',
    value = 0.0015,
    texname = 'M_{{u}_1}',
    lhablock = 'MASS',
    lhacode = [2])

Mu2 = Parameter(name = 'Mu2',
    nature = 'external',
    type = 'real',
    value = 1.27,
    texname = 'M_{{u}_2}',
    lhablock = 'MASS',
    lhacode = [4])

Mu3 = Parameter(name = 'Mu3',
    nature = 'external',
    type = 'real',
    value = 171.2,
    texname = 'M_{{u}_3}',
    lhablock = 'MASS',
    lhacode = [6])

Wu3 = Parameter(name = 'Wu3',
    nature = 'external',
    type = 'real',
    value = 1.51,
    texname = '\\Gamma_{{u}_3}',
    lhablock = 'DECAY',
    lhacode = [6])

Mu4 = Parameter(name = 'Mu4',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{u}_4}',
    lhablock = 'MASS',
    lhacode = [1000002])

Wu4 = Parameter(name = 'Wu4',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{u}_4}',
    lhablock = 'DECAY',
    lhacode = [1000002])

Mu5 = Parameter(name = 'Mu5',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{u}_5}',
    lhablock = 'MASS',
    lhacode = [1000004])

Wu5 = Parameter(name = 'Wu5',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{u}_5}',
    lhablock = 'DECAY',
    lhacode = [1000004])

Mu6 = Parameter(name = 'Mu6',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{u}_6}',
    lhablock = 'MASS',
    lhacode = [1000006])

Wu6 = Parameter(name = 'Wu6',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{u}_6}',
    lhablock = 'DECAY',
    lhacode = [1000006])

Me1 = Parameter(name = 'Me1',
    nature = 'external',
    type = 'real',
    value = 0.000511,
    texname = 'M_{{e}_1}',
    lhablock = 'MASS',
    lhacode = [11])

Me2 = Parameter(name = 'Me2',
    nature = 'external',
    type = 'real',
    value = 0.105,
    texname = 'M_{{e}_2}',
    lhablock = 'MASS',
    lhacode = [13])

Me3 = Parameter(name = 'Me3',
    nature = 'external',
    type = 'real',
    value = 1.776,
    texname = 'M_{{e}_3}',
    lhablock = 'MASS',
    lhacode = [15])

Me4 = Parameter(name = 'Me4',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{e}_4}',
    lhablock = 'MASS',
    lhacode = [1000011])

We4 = Parameter(name = 'We4',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{e}_4}',
    lhablock = 'DECAY',
    lhacode = [1000011])

Me5 = Parameter(name = 'Me5',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{e}_5}',
    lhablock = 'MASS',
    lhacode = [1000013])

We5 = Parameter(name = 'We5',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{e}_5}',
    lhablock = 'DECAY',
    lhacode = [1000013])

Me6 = Parameter(name = 'Me6',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{e}_6}',
    lhablock = 'MASS',
    lhacode = [1000015])

We6 = Parameter(name = 'We6',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{e}_6}',
    lhablock = 'DECAY',
    lhacode = [1000015])

Mnu7 = Parameter(name = 'Mnu7',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{\\nu}_7}',
    lhablock = 'MASS',
    lhacode = [1000012])

Wnu7 = Parameter(name = 'Wnu7',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{\\nu}_7}',
    lhablock = 'DECAY',
    lhacode = [1000012])

Mnu8 = Parameter(name = 'Mnu8',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{\\nu}_8}',
    lhablock = 'MASS',
    lhacode = [1000014])

Wnu8 = Parameter(name = 'Wnu8',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{\\nu}_8}',
    lhablock = 'DECAY',
    lhacode = [1000014])

Mnu9 = Parameter(name = 'Mnu9',
    nature = 'external',
    type = 'real',
    value = 1000,
    texname = 'M_{{\\nu}_9}',
    lhablock = 'MASS',
    lhacode = [1000016])

Wnu9 = Parameter(name = 'Wnu9',
    nature = 'external',
    type = 'real',
    value = 50,
    texname = '\\Gamma_{{\\nu}_9}',
    lhablock = 'DECAY',
    lhacode = [1000016])

Mh1 = Parameter(name = 'Mh1',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_1}',
    lhablock = 'MASS',
    lhacode = [25])

Wh1 = Parameter(name = 'Wh1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_1}',
    lhablock = 'DECAY',
    lhacode = [25])

Mh2 = Parameter(name = 'Mh2',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_2}',
    lhablock = 'MASS',
    lhacode = [35])

Wh2 = Parameter(name = 'Wh2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_2}',
    lhablock = 'DECAY',
    lhacode = [35])

MZ = Parameter(name = 'MZ',
    nature = 'external',
    type = 'real',
    value = 91.1876,
    texname = 'M_{Z}',
    lhablock = 'MASS',
    lhacode = [23])

WZ = Parameter(name = 'WZ',
    nature = 'external',
    type = 'real',
    value = 2.4952,
    texname = '\\Gamma_{Z}',
    lhablock = 'DECAY',
    lhacode = [23])

MZp = Parameter(name = 'MZp',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{Z^{\\prime}}}',
    lhablock = 'MASS',
    lhacode = [31])

WZp = Parameter(name = 'WZp',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{Z^{\\prime}}}',
    lhablock = 'DECAY',
    lhacode = [31])

WWp = Parameter(name = 'WWp',
    nature = 'external',
    type = 'real',
    value = 2.141,
    texname = '\\Gamma_{W^+}',
    lhablock = 'DECAY',
    lhacode = [24])

gX = Parameter(name='gX',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = 'g_X',
    lhablock = 'GAUGE',
    lhacode = [4] )

g1X = Parameter(name='g1X',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = 'g_{1X}',
    lhablock = 'GAUGE',
    lhacode = [6] )

gX1 = Parameter(name='gX1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = 'g_{X1}',
    lhablock = 'GAUGE',
    lhacode = [5] )

rYvL11 = Parameter(name='rYvL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL11}',
    lhablock = 'YVL',
    lhacode = [1, 1] )

iYvL11 = Parameter(name='iYvL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL11}',
    lhablock = 'IMYVL',
    lhacode = [1, 1] )

rYvL12 = Parameter(name='rYvL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL12}',
    lhablock = 'YVL',
    lhacode = [1, 2] )

iYvL12 = Parameter(name='iYvL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL12}',
    lhablock = 'IMYVL',
    lhacode = [1, 2] )

rYvL13 = Parameter(name='rYvL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL13}',
    lhablock = 'YVL',
    lhacode = [1, 3] )

iYvL13 = Parameter(name='iYvL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL13}',
    lhablock = 'IMYVL',
    lhacode = [1, 3] )

rYvL21 = Parameter(name='rYvL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL21}',
    lhablock = 'YVL',
    lhacode = [2, 1] )

iYvL21 = Parameter(name='iYvL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL21}',
    lhablock = 'IMYVL',
    lhacode = [2, 1] )

rYvL22 = Parameter(name='rYvL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL22}',
    lhablock = 'YVL',
    lhacode = [2, 2] )

iYvL22 = Parameter(name='iYvL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL22}',
    lhablock = 'IMYVL',
    lhacode = [2, 2] )

rYvL23 = Parameter(name='rYvL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL23}',
    lhablock = 'YVL',
    lhacode = [2, 3] )

iYvL23 = Parameter(name='iYvL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL23}',
    lhablock = 'IMYVL',
    lhacode = [2, 3] )

rYvL31 = Parameter(name='rYvL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL31}',
    lhablock = 'YVL',
    lhacode = [3, 1] )

iYvL31 = Parameter(name='iYvL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL31}',
    lhablock = 'IMYVL',
    lhacode = [3, 1] )

rYvL32 = Parameter(name='rYvL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL32}',
    lhablock = 'YVL',
    lhacode = [3, 2] )

iYvL32 = Parameter(name='iYvL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL32}',
    lhablock = 'IMYVL',
    lhacode = [3, 2] )

rYvL33 = Parameter(name='rYvL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL33}',
    lhablock = 'YVL',
    lhacode = [3, 3] )

iYvL33 = Parameter(name='iYvL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvL33}',
    lhablock = 'IMYVL',
    lhacode = [3, 3] )

rYuL11 = Parameter(name='rYuL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL11}',
    lhablock = 'YUL',
    lhacode = [1, 1] )

iYuL11 = Parameter(name='iYuL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL11}',
    lhablock = 'IMYUL',
    lhacode = [1, 1] )

rYuL12 = Parameter(name='rYuL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL12}',
    lhablock = 'YUL',
    lhacode = [1, 2] )

iYuL12 = Parameter(name='iYuL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL12}',
    lhablock = 'IMYUL',
    lhacode = [1, 2] )

rYuL13 = Parameter(name='rYuL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL13}',
    lhablock = 'YUL',
    lhacode = [1, 3] )

iYuL13 = Parameter(name='iYuL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL13}',
    lhablock = 'IMYUL',
    lhacode = [1, 3] )

rYuL21 = Parameter(name='rYuL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL21}',
    lhablock = 'YUL',
    lhacode = [2, 1] )

iYuL21 = Parameter(name='iYuL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL21}',
    lhablock = 'IMYUL',
    lhacode = [2, 1] )

rYuL22 = Parameter(name='rYuL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL22}',
    lhablock = 'YUL',
    lhacode = [2, 2] )

iYuL22 = Parameter(name='iYuL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL22}',
    lhablock = 'IMYUL',
    lhacode = [2, 2] )

rYuL23 = Parameter(name='rYuL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL23}',
    lhablock = 'YUL',
    lhacode = [2, 3] )

iYuL23 = Parameter(name='iYuL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL23}',
    lhablock = 'IMYUL',
    lhacode = [2, 3] )

rYuL31 = Parameter(name='rYuL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL31}',
    lhablock = 'YUL',
    lhacode = [3, 1] )

iYuL31 = Parameter(name='iYuL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL31}',
    lhablock = 'IMYUL',
    lhacode = [3, 1] )

rYuL32 = Parameter(name='rYuL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL32}',
    lhablock = 'YUL',
    lhacode = [3, 2] )

iYuL32 = Parameter(name='iYuL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL32}',
    lhablock = 'IMYUL',
    lhacode = [3, 2] )

rYuL33 = Parameter(name='rYuL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL33}',
    lhablock = 'YUL',
    lhacode = [3, 3] )

iYuL33 = Parameter(name='iYuL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuL33}',
    lhablock = 'IMYUL',
    lhacode = [3, 3] )

rYvR11 = Parameter(name='rYvR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR11}',
    lhablock = 'YVR',
    lhacode = [1, 1] )

iYvR11 = Parameter(name='iYvR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR11}',
    lhablock = 'IMYVR',
    lhacode = [1, 1] )

rYvR12 = Parameter(name='rYvR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR12}',
    lhablock = 'YVR',
    lhacode = [1, 2] )

iYvR12 = Parameter(name='iYvR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR12}',
    lhablock = 'IMYVR',
    lhacode = [1, 2] )

rYvR13 = Parameter(name='rYvR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR13}',
    lhablock = 'YVR',
    lhacode = [1, 3] )

iYvR13 = Parameter(name='iYvR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR13}',
    lhablock = 'IMYVR',
    lhacode = [1, 3] )

rYvR21 = Parameter(name='rYvR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR21}',
    lhablock = 'YVR',
    lhacode = [2, 1] )

iYvR21 = Parameter(name='iYvR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR21}',
    lhablock = 'IMYVR',
    lhacode = [2, 1] )

rYvR22 = Parameter(name='rYvR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR22}',
    lhablock = 'YVR',
    lhacode = [2, 2] )

iYvR22 = Parameter(name='iYvR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR22}',
    lhablock = 'IMYVR',
    lhacode = [2, 2] )

rYvR23 = Parameter(name='rYvR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR23}',
    lhablock = 'YVR',
    lhacode = [2, 3] )

iYvR23 = Parameter(name='iYvR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR23}',
    lhablock = 'IMYVR',
    lhacode = [2, 3] )

rYvR31 = Parameter(name='rYvR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR31}',
    lhablock = 'YVR',
    lhacode = [3, 1] )

iYvR31 = Parameter(name='iYvR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR31}',
    lhablock = 'IMYVR',
    lhacode = [3, 1] )

rYvR32 = Parameter(name='rYvR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR32}',
    lhablock = 'YVR',
    lhacode = [3, 2] )

iYvR32 = Parameter(name='iYvR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR32}',
    lhablock = 'IMYVR',
    lhacode = [3, 2] )

rYvR33 = Parameter(name='rYvR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR33}',
    lhablock = 'YVR',
    lhacode = [3, 3] )

iYvR33 = Parameter(name='iYvR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YvR33}',
    lhablock = 'IMYVR',
    lhacode = [3, 3] )

rYuR11 = Parameter(name='rYuR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR11}',
    lhablock = 'YUR',
    lhacode = [1, 1] )

iYuR11 = Parameter(name='iYuR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR11}',
    lhablock = 'IMYUR',
    lhacode = [1, 1] )

rYuR12 = Parameter(name='rYuR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR12}',
    lhablock = 'YUR',
    lhacode = [1, 2] )

iYuR12 = Parameter(name='iYuR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR12}',
    lhablock = 'IMYUR',
    lhacode = [1, 2] )

rYuR13 = Parameter(name='rYuR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR13}',
    lhablock = 'YUR',
    lhacode = [1, 3] )

iYuR13 = Parameter(name='iYuR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR13}',
    lhablock = 'IMYUR',
    lhacode = [1, 3] )

rYuR21 = Parameter(name='rYuR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR21}',
    lhablock = 'YUR',
    lhacode = [2, 1] )

iYuR21 = Parameter(name='iYuR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR21}',
    lhablock = 'IMYUR',
    lhacode = [2, 1] )

rYuR22 = Parameter(name='rYuR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR22}',
    lhablock = 'YUR',
    lhacode = [2, 2] )

iYuR22 = Parameter(name='iYuR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR22}',
    lhablock = 'IMYUR',
    lhacode = [2, 2] )

rYuR23 = Parameter(name='rYuR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR23}',
    lhablock = 'YUR',
    lhacode = [2, 3] )

iYuR23 = Parameter(name='iYuR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR23}',
    lhablock = 'IMYUR',
    lhacode = [2, 3] )

rYuR31 = Parameter(name='rYuR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR31}',
    lhablock = 'YUR',
    lhacode = [3, 1] )

iYuR31 = Parameter(name='iYuR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR31}',
    lhablock = 'IMYUR',
    lhacode = [3, 1] )

rYuR32 = Parameter(name='rYuR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR32}',
    lhablock = 'YUR',
    lhacode = [3, 2] )

iYuR32 = Parameter(name='iYuR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR32}',
    lhablock = 'IMYUR',
    lhacode = [3, 2] )

rYuR33 = Parameter(name='rYuR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR33}',
    lhablock = 'YUR',
    lhacode = [3, 3] )

iYuR33 = Parameter(name='iYuR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YuR33}',
    lhablock = 'IMYUR',
    lhacode = [3, 3] )

rYdL11 = Parameter(name='rYdL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL11}',
    lhablock = 'YDL',
    lhacode = [1, 1] )

iYdL11 = Parameter(name='iYdL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL11}',
    lhablock = 'IMYDL',
    lhacode = [1, 1] )

rYdL12 = Parameter(name='rYdL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL12}',
    lhablock = 'YDL',
    lhacode = [1, 2] )

iYdL12 = Parameter(name='iYdL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL12}',
    lhablock = 'IMYDL',
    lhacode = [1, 2] )

rYdL13 = Parameter(name='rYdL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL13}',
    lhablock = 'YDL',
    lhacode = [1, 3] )

iYdL13 = Parameter(name='iYdL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL13}',
    lhablock = 'IMYDL',
    lhacode = [1, 3] )

rYdL21 = Parameter(name='rYdL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL21}',
    lhablock = 'YDL',
    lhacode = [2, 1] )

iYdL21 = Parameter(name='iYdL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL21}',
    lhablock = 'IMYDL',
    lhacode = [2, 1] )

rYdL22 = Parameter(name='rYdL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL22}',
    lhablock = 'YDL',
    lhacode = [2, 2] )

iYdL22 = Parameter(name='iYdL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL22}',
    lhablock = 'IMYDL',
    lhacode = [2, 2] )

rYdL23 = Parameter(name='rYdL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL23}',
    lhablock = 'YDL',
    lhacode = [2, 3] )

iYdL23 = Parameter(name='iYdL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL23}',
    lhablock = 'IMYDL',
    lhacode = [2, 3] )

rYdL31 = Parameter(name='rYdL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL31}',
    lhablock = 'YDL',
    lhacode = [3, 1] )

iYdL31 = Parameter(name='iYdL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL31}',
    lhablock = 'IMYDL',
    lhacode = [3, 1] )

rYdL32 = Parameter(name='rYdL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL32}',
    lhablock = 'YDL',
    lhacode = [3, 2] )

iYdL32 = Parameter(name='iYdL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL32}',
    lhablock = 'IMYDL',
    lhacode = [3, 2] )

rYdL33 = Parameter(name='rYdL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL33}',
    lhablock = 'YDL',
    lhacode = [3, 3] )

iYdL33 = Parameter(name='iYdL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdL33}',
    lhablock = 'IMYDL',
    lhacode = [3, 3] )

rYeL11 = Parameter(name='rYeL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL11}',
    lhablock = 'YEL',
    lhacode = [1, 1] )

iYeL11 = Parameter(name='iYeL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL11}',
    lhablock = 'IMYEL',
    lhacode = [1, 1] )

rYeL12 = Parameter(name='rYeL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL12}',
    lhablock = 'YEL',
    lhacode = [1, 2] )

iYeL12 = Parameter(name='iYeL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL12}',
    lhablock = 'IMYEL',
    lhacode = [1, 2] )

rYeL13 = Parameter(name='rYeL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL13}',
    lhablock = 'YEL',
    lhacode = [1, 3] )

iYeL13 = Parameter(name='iYeL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL13}',
    lhablock = 'IMYEL',
    lhacode = [1, 3] )

rYeL21 = Parameter(name='rYeL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL21}',
    lhablock = 'YEL',
    lhacode = [2, 1] )

iYeL21 = Parameter(name='iYeL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL21}',
    lhablock = 'IMYEL',
    lhacode = [2, 1] )

rYeL22 = Parameter(name='rYeL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL22}',
    lhablock = 'YEL',
    lhacode = [2, 2] )

iYeL22 = Parameter(name='iYeL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL22}',
    lhablock = 'IMYEL',
    lhacode = [2, 2] )

rYeL23 = Parameter(name='rYeL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL23}',
    lhablock = 'YEL',
    lhacode = [2, 3] )

iYeL23 = Parameter(name='iYeL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL23}',
    lhablock = 'IMYEL',
    lhacode = [2, 3] )

rYeL31 = Parameter(name='rYeL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL31}',
    lhablock = 'YEL',
    lhacode = [3, 1] )

iYeL31 = Parameter(name='iYeL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL31}',
    lhablock = 'IMYEL',
    lhacode = [3, 1] )

rYeL32 = Parameter(name='rYeL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL32}',
    lhablock = 'YEL',
    lhacode = [3, 2] )

iYeL32 = Parameter(name='iYeL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL32}',
    lhablock = 'IMYEL',
    lhacode = [3, 2] )

rYeL33 = Parameter(name='rYeL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL33}',
    lhablock = 'YEL',
    lhacode = [3, 3] )

iYeL33 = Parameter(name='iYeL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeL33}',
    lhablock = 'IMYEL',
    lhacode = [3, 3] )

rYdR11 = Parameter(name='rYdR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR11}',
    lhablock = 'YDR',
    lhacode = [1, 1] )

iYdR11 = Parameter(name='iYdR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR11}',
    lhablock = 'IMYDR',
    lhacode = [1, 1] )

rYdR12 = Parameter(name='rYdR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR12}',
    lhablock = 'YDR',
    lhacode = [1, 2] )

iYdR12 = Parameter(name='iYdR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR12}',
    lhablock = 'IMYDR',
    lhacode = [1, 2] )

rYdR13 = Parameter(name='rYdR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR13}',
    lhablock = 'YDR',
    lhacode = [1, 3] )

iYdR13 = Parameter(name='iYdR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR13}',
    lhablock = 'IMYDR',
    lhacode = [1, 3] )

rYdR21 = Parameter(name='rYdR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR21}',
    lhablock = 'YDR',
    lhacode = [2, 1] )

iYdR21 = Parameter(name='iYdR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR21}',
    lhablock = 'IMYDR',
    lhacode = [2, 1] )

rYdR22 = Parameter(name='rYdR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR22}',
    lhablock = 'YDR',
    lhacode = [2, 2] )

iYdR22 = Parameter(name='iYdR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR22}',
    lhablock = 'IMYDR',
    lhacode = [2, 2] )

rYdR23 = Parameter(name='rYdR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR23}',
    lhablock = 'YDR',
    lhacode = [2, 3] )

iYdR23 = Parameter(name='iYdR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR23}',
    lhablock = 'IMYDR',
    lhacode = [2, 3] )

rYdR31 = Parameter(name='rYdR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR31}',
    lhablock = 'YDR',
    lhacode = [3, 1] )

iYdR31 = Parameter(name='iYdR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR31}',
    lhablock = 'IMYDR',
    lhacode = [3, 1] )

rYdR32 = Parameter(name='rYdR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR32}',
    lhablock = 'YDR',
    lhacode = [3, 2] )

iYdR32 = Parameter(name='iYdR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR32}',
    lhablock = 'IMYDR',
    lhacode = [3, 2] )

rYdR33 = Parameter(name='rYdR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR33}',
    lhablock = 'YDR',
    lhacode = [3, 3] )

iYdR33 = Parameter(name='iYdR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YdR33}',
    lhablock = 'IMYDR',
    lhacode = [3, 3] )

rYeR11 = Parameter(name='rYeR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR11}',
    lhablock = 'YER',
    lhacode = [1, 1] )

iYeR11 = Parameter(name='iYeR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR11}',
    lhablock = 'IMYER',
    lhacode = [1, 1] )

rYeR12 = Parameter(name='rYeR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR12}',
    lhablock = 'YER',
    lhacode = [1, 2] )

iYeR12 = Parameter(name='iYeR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR12}',
    lhablock = 'IMYER',
    lhacode = [1, 2] )

rYeR13 = Parameter(name='rYeR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR13}',
    lhablock = 'YER',
    lhacode = [1, 3] )

iYeR13 = Parameter(name='iYeR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR13}',
    lhablock = 'IMYER',
    lhacode = [1, 3] )

rYeR21 = Parameter(name='rYeR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR21}',
    lhablock = 'YER',
    lhacode = [2, 1] )

iYeR21 = Parameter(name='iYeR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR21}',
    lhablock = 'IMYER',
    lhacode = [2, 1] )

rYeR22 = Parameter(name='rYeR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR22}',
    lhablock = 'YER',
    lhacode = [2, 2] )

iYeR22 = Parameter(name='iYeR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR22}',
    lhablock = 'IMYER',
    lhacode = [2, 2] )

rYeR23 = Parameter(name='rYeR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR23}',
    lhablock = 'YER',
    lhacode = [2, 3] )

iYeR23 = Parameter(name='iYeR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR23}',
    lhablock = 'IMYER',
    lhacode = [2, 3] )

rYeR31 = Parameter(name='rYeR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR31}',
    lhablock = 'YER',
    lhacode = [3, 1] )

iYeR31 = Parameter(name='iYeR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR31}',
    lhablock = 'IMYER',
    lhacode = [3, 1] )

rYeR32 = Parameter(name='rYeR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR32}',
    lhablock = 'YER',
    lhacode = [3, 2] )

iYeR32 = Parameter(name='iYeR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR32}',
    lhablock = 'IMYER',
    lhacode = [3, 2] )

rYeR33 = Parameter(name='rYeR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR33}',
    lhablock = 'YER',
    lhacode = [3, 3] )

iYeR33 = Parameter(name='iYeR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YeR33}',
    lhablock = 'IMYER',
    lhacode = [3, 3] )

LamH = Parameter(name='LamH',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\lambda_{H}',
    lhablock = 'SCALARS',
    lhacode = [1] )

LamPhiH = Parameter(name='LamPhiH',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\lambda_{\\Phi H}',
    lhablock = 'SCALARS',
    lhacode = [3] )

LamPhi = Parameter(name='LamPhi',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\lambda_{\\Phi}',
    lhablock = 'SCALARS',
    lhacode = [2] )

vPhi = Parameter(name='vPhi',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = 'v_{\\phi}',
    lhablock = 'NONE',
    lhacode = [1] )

ZA11 = Parameter(name='ZA11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZA11}',
    lhablock = 'NONE',
    lhacode = [1, 1] )

ZA12 = Parameter(name='ZA12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZA12}',
    lhablock = 'NONE',
    lhacode = [1, 2] )

ZA21 = Parameter(name='ZA21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZA21}',
    lhablock = 'NONE',
    lhacode = [2, 1] )

ZA22 = Parameter(name='ZA22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZA22}',
    lhablock = 'NONE',
    lhacode = [2, 2] )

rZDL11 = Parameter(name='rZDL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL11}',
    lhablock = 'UDLMIX',
    lhacode = [1, 1] )

iZDL11 = Parameter(name='iZDL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL11}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 1] )

rZDL12 = Parameter(name='rZDL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL12}',
    lhablock = 'UDLMIX',
    lhacode = [1, 2] )

iZDL12 = Parameter(name='iZDL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL12}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 2] )

rZDL13 = Parameter(name='rZDL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL13}',
    lhablock = 'UDLMIX',
    lhacode = [1, 3] )

iZDL13 = Parameter(name='iZDL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL13}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 3] )

rZDL14 = Parameter(name='rZDL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL14}',
    lhablock = 'UDLMIX',
    lhacode = [1, 4] )

iZDL14 = Parameter(name='iZDL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL14}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 4] )

rZDL15 = Parameter(name='rZDL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL15}',
    lhablock = 'UDLMIX',
    lhacode = [1, 5] )

iZDL15 = Parameter(name='iZDL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL15}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 5] )

rZDL16 = Parameter(name='rZDL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL16}',
    lhablock = 'UDLMIX',
    lhacode = [1, 6] )

iZDL16 = Parameter(name='iZDL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL16}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 6] )

rZDL21 = Parameter(name='rZDL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL21}',
    lhablock = 'UDLMIX',
    lhacode = [2, 1] )

iZDL21 = Parameter(name='iZDL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL21}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 1] )

rZDL22 = Parameter(name='rZDL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL22}',
    lhablock = 'UDLMIX',
    lhacode = [2, 2] )

iZDL22 = Parameter(name='iZDL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL22}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 2] )

rZDL23 = Parameter(name='rZDL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL23}',
    lhablock = 'UDLMIX',
    lhacode = [2, 3] )

iZDL23 = Parameter(name='iZDL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL23}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 3] )

rZDL24 = Parameter(name='rZDL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL24}',
    lhablock = 'UDLMIX',
    lhacode = [2, 4] )

iZDL24 = Parameter(name='iZDL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL24}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 4] )

rZDL25 = Parameter(name='rZDL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL25}',
    lhablock = 'UDLMIX',
    lhacode = [2, 5] )

iZDL25 = Parameter(name='iZDL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL25}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 5] )

rZDL26 = Parameter(name='rZDL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL26}',
    lhablock = 'UDLMIX',
    lhacode = [2, 6] )

iZDL26 = Parameter(name='iZDL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL26}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 6] )

rZDL31 = Parameter(name='rZDL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL31}',
    lhablock = 'UDLMIX',
    lhacode = [3, 1] )

iZDL31 = Parameter(name='iZDL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL31}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 1] )

rZDL32 = Parameter(name='rZDL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL32}',
    lhablock = 'UDLMIX',
    lhacode = [3, 2] )

iZDL32 = Parameter(name='iZDL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL32}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 2] )

rZDL33 = Parameter(name='rZDL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL33}',
    lhablock = 'UDLMIX',
    lhacode = [3, 3] )

iZDL33 = Parameter(name='iZDL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL33}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 3] )

rZDL34 = Parameter(name='rZDL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL34}',
    lhablock = 'UDLMIX',
    lhacode = [3, 4] )

iZDL34 = Parameter(name='iZDL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL34}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 4] )

rZDL35 = Parameter(name='rZDL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL35}',
    lhablock = 'UDLMIX',
    lhacode = [3, 5] )

iZDL35 = Parameter(name='iZDL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL35}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 5] )

rZDL36 = Parameter(name='rZDL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL36}',
    lhablock = 'UDLMIX',
    lhacode = [3, 6] )

iZDL36 = Parameter(name='iZDL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL36}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 6] )

rZDL41 = Parameter(name='rZDL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL41}',
    lhablock = 'UDLMIX',
    lhacode = [4, 1] )

iZDL41 = Parameter(name='iZDL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL41}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 1] )

rZDL42 = Parameter(name='rZDL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL42}',
    lhablock = 'UDLMIX',
    lhacode = [4, 2] )

iZDL42 = Parameter(name='iZDL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL42}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 2] )

rZDL43 = Parameter(name='rZDL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL43}',
    lhablock = 'UDLMIX',
    lhacode = [4, 3] )

iZDL43 = Parameter(name='iZDL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL43}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 3] )

rZDL44 = Parameter(name='rZDL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL44}',
    lhablock = 'UDLMIX',
    lhacode = [4, 4] )

iZDL44 = Parameter(name='iZDL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL44}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 4] )

rZDL45 = Parameter(name='rZDL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL45}',
    lhablock = 'UDLMIX',
    lhacode = [4, 5] )

iZDL45 = Parameter(name='iZDL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL45}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 5] )

rZDL46 = Parameter(name='rZDL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL46}',
    lhablock = 'UDLMIX',
    lhacode = [4, 6] )

iZDL46 = Parameter(name='iZDL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL46}',
    lhablock = 'IMUDLMIX',
    lhacode = [4, 6] )

rZDL51 = Parameter(name='rZDL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL51}',
    lhablock = 'UDLMIX',
    lhacode = [5, 1] )

iZDL51 = Parameter(name='iZDL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL51}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 1] )

rZDL52 = Parameter(name='rZDL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL52}',
    lhablock = 'UDLMIX',
    lhacode = [5, 2] )

iZDL52 = Parameter(name='iZDL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL52}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 2] )

rZDL53 = Parameter(name='rZDL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL53}',
    lhablock = 'UDLMIX',
    lhacode = [5, 3] )

iZDL53 = Parameter(name='iZDL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL53}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 3] )

rZDL54 = Parameter(name='rZDL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL54}',
    lhablock = 'UDLMIX',
    lhacode = [5, 4] )

iZDL54 = Parameter(name='iZDL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL54}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 4] )

rZDL55 = Parameter(name='rZDL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL55}',
    lhablock = 'UDLMIX',
    lhacode = [5, 5] )

iZDL55 = Parameter(name='iZDL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL55}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 5] )

rZDL56 = Parameter(name='rZDL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL56}',
    lhablock = 'UDLMIX',
    lhacode = [5, 6] )

iZDL56 = Parameter(name='iZDL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL56}',
    lhablock = 'IMUDLMIX',
    lhacode = [5, 6] )

rZDL61 = Parameter(name='rZDL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL61}',
    lhablock = 'UDLMIX',
    lhacode = [6, 1] )

iZDL61 = Parameter(name='iZDL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL61}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 1] )

rZDL62 = Parameter(name='rZDL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL62}',
    lhablock = 'UDLMIX',
    lhacode = [6, 2] )

iZDL62 = Parameter(name='iZDL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL62}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 2] )

rZDL63 = Parameter(name='rZDL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL63}',
    lhablock = 'UDLMIX',
    lhacode = [6, 3] )

iZDL63 = Parameter(name='iZDL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL63}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 3] )

rZDL64 = Parameter(name='rZDL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL64}',
    lhablock = 'UDLMIX',
    lhacode = [6, 4] )

iZDL64 = Parameter(name='iZDL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL64}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 4] )

rZDL65 = Parameter(name='rZDL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL65}',
    lhablock = 'UDLMIX',
    lhacode = [6, 5] )

iZDL65 = Parameter(name='iZDL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL65}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 5] )

rZDL66 = Parameter(name='rZDL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL66}',
    lhablock = 'UDLMIX',
    lhacode = [6, 6] )

iZDL66 = Parameter(name='iZDL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL66}',
    lhablock = 'IMUDLMIX',
    lhacode = [6, 6] )

rZDR11 = Parameter(name='rZDR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR11}',
    lhablock = 'UDRMIX',
    lhacode = [1, 1] )

iZDR11 = Parameter(name='iZDR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR11}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 1] )

rZDR12 = Parameter(name='rZDR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR12}',
    lhablock = 'UDRMIX',
    lhacode = [1, 2] )

iZDR12 = Parameter(name='iZDR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR12}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 2] )

rZDR13 = Parameter(name='rZDR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR13}',
    lhablock = 'UDRMIX',
    lhacode = [1, 3] )

iZDR13 = Parameter(name='iZDR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR13}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 3] )

rZDR14 = Parameter(name='rZDR14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR14}',
    lhablock = 'UDRMIX',
    lhacode = [1, 4] )

iZDR14 = Parameter(name='iZDR14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR14}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 4] )

rZDR15 = Parameter(name='rZDR15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR15}',
    lhablock = 'UDRMIX',
    lhacode = [1, 5] )

iZDR15 = Parameter(name='iZDR15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR15}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 5] )

rZDR16 = Parameter(name='rZDR16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR16}',
    lhablock = 'UDRMIX',
    lhacode = [1, 6] )

iZDR16 = Parameter(name='iZDR16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR16}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 6] )

rZDR21 = Parameter(name='rZDR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR21}',
    lhablock = 'UDRMIX',
    lhacode = [2, 1] )

iZDR21 = Parameter(name='iZDR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR21}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 1] )

rZDR22 = Parameter(name='rZDR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR22}',
    lhablock = 'UDRMIX',
    lhacode = [2, 2] )

iZDR22 = Parameter(name='iZDR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR22}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 2] )

rZDR23 = Parameter(name='rZDR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR23}',
    lhablock = 'UDRMIX',
    lhacode = [2, 3] )

iZDR23 = Parameter(name='iZDR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR23}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 3] )

rZDR24 = Parameter(name='rZDR24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR24}',
    lhablock = 'UDRMIX',
    lhacode = [2, 4] )

iZDR24 = Parameter(name='iZDR24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR24}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 4] )

rZDR25 = Parameter(name='rZDR25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR25}',
    lhablock = 'UDRMIX',
    lhacode = [2, 5] )

iZDR25 = Parameter(name='iZDR25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR25}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 5] )

rZDR26 = Parameter(name='rZDR26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR26}',
    lhablock = 'UDRMIX',
    lhacode = [2, 6] )

iZDR26 = Parameter(name='iZDR26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR26}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 6] )

rZDR31 = Parameter(name='rZDR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR31}',
    lhablock = 'UDRMIX',
    lhacode = [3, 1] )

iZDR31 = Parameter(name='iZDR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR31}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 1] )

rZDR32 = Parameter(name='rZDR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR32}',
    lhablock = 'UDRMIX',
    lhacode = [3, 2] )

iZDR32 = Parameter(name='iZDR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR32}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 2] )

rZDR33 = Parameter(name='rZDR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR33}',
    lhablock = 'UDRMIX',
    lhacode = [3, 3] )

iZDR33 = Parameter(name='iZDR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR33}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 3] )

rZDR34 = Parameter(name='rZDR34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR34}',
    lhablock = 'UDRMIX',
    lhacode = [3, 4] )

iZDR34 = Parameter(name='iZDR34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR34}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 4] )

rZDR35 = Parameter(name='rZDR35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR35}',
    lhablock = 'UDRMIX',
    lhacode = [3, 5] )

iZDR35 = Parameter(name='iZDR35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR35}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 5] )

rZDR36 = Parameter(name='rZDR36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR36}',
    lhablock = 'UDRMIX',
    lhacode = [3, 6] )

iZDR36 = Parameter(name='iZDR36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR36}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 6] )

rZDR41 = Parameter(name='rZDR41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR41}',
    lhablock = 'UDRMIX',
    lhacode = [4, 1] )

iZDR41 = Parameter(name='iZDR41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR41}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 1] )

rZDR42 = Parameter(name='rZDR42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR42}',
    lhablock = 'UDRMIX',
    lhacode = [4, 2] )

iZDR42 = Parameter(name='iZDR42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR42}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 2] )

rZDR43 = Parameter(name='rZDR43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR43}',
    lhablock = 'UDRMIX',
    lhacode = [4, 3] )

iZDR43 = Parameter(name='iZDR43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR43}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 3] )

rZDR44 = Parameter(name='rZDR44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR44}',
    lhablock = 'UDRMIX',
    lhacode = [4, 4] )

iZDR44 = Parameter(name='iZDR44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR44}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 4] )

rZDR45 = Parameter(name='rZDR45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR45}',
    lhablock = 'UDRMIX',
    lhacode = [4, 5] )

iZDR45 = Parameter(name='iZDR45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR45}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 5] )

rZDR46 = Parameter(name='rZDR46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR46}',
    lhablock = 'UDRMIX',
    lhacode = [4, 6] )

iZDR46 = Parameter(name='iZDR46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR46}',
    lhablock = 'IMUDRMIX',
    lhacode = [4, 6] )

rZDR51 = Parameter(name='rZDR51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR51}',
    lhablock = 'UDRMIX',
    lhacode = [5, 1] )

iZDR51 = Parameter(name='iZDR51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR51}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 1] )

rZDR52 = Parameter(name='rZDR52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR52}',
    lhablock = 'UDRMIX',
    lhacode = [5, 2] )

iZDR52 = Parameter(name='iZDR52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR52}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 2] )

rZDR53 = Parameter(name='rZDR53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR53}',
    lhablock = 'UDRMIX',
    lhacode = [5, 3] )

iZDR53 = Parameter(name='iZDR53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR53}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 3] )

rZDR54 = Parameter(name='rZDR54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR54}',
    lhablock = 'UDRMIX',
    lhacode = [5, 4] )

iZDR54 = Parameter(name='iZDR54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR54}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 4] )

rZDR55 = Parameter(name='rZDR55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR55}',
    lhablock = 'UDRMIX',
    lhacode = [5, 5] )

iZDR55 = Parameter(name='iZDR55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR55}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 5] )

rZDR56 = Parameter(name='rZDR56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR56}',
    lhablock = 'UDRMIX',
    lhacode = [5, 6] )

iZDR56 = Parameter(name='iZDR56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR56}',
    lhablock = 'IMUDRMIX',
    lhacode = [5, 6] )

rZDR61 = Parameter(name='rZDR61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR61}',
    lhablock = 'UDRMIX',
    lhacode = [6, 1] )

iZDR61 = Parameter(name='iZDR61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR61}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 1] )

rZDR62 = Parameter(name='rZDR62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR62}',
    lhablock = 'UDRMIX',
    lhacode = [6, 2] )

iZDR62 = Parameter(name='iZDR62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR62}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 2] )

rZDR63 = Parameter(name='rZDR63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR63}',
    lhablock = 'UDRMIX',
    lhacode = [6, 3] )

iZDR63 = Parameter(name='iZDR63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR63}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 3] )

rZDR64 = Parameter(name='rZDR64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR64}',
    lhablock = 'UDRMIX',
    lhacode = [6, 4] )

iZDR64 = Parameter(name='iZDR64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR64}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 4] )

rZDR65 = Parameter(name='rZDR65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR65}',
    lhablock = 'UDRMIX',
    lhacode = [6, 5] )

iZDR65 = Parameter(name='iZDR65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR65}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 5] )

rZDR66 = Parameter(name='rZDR66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR66}',
    lhablock = 'UDRMIX',
    lhacode = [6, 6] )

iZDR66 = Parameter(name='iZDR66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR66}',
    lhablock = 'IMUDRMIX',
    lhacode = [6, 6] )

rZUL11 = Parameter(name='rZUL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL11}',
    lhablock = 'UULMIX',
    lhacode = [1, 1] )

iZUL11 = Parameter(name='iZUL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL11}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 1] )

rZUL12 = Parameter(name='rZUL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL12}',
    lhablock = 'UULMIX',
    lhacode = [1, 2] )

iZUL12 = Parameter(name='iZUL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL12}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 2] )

rZUL13 = Parameter(name='rZUL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL13}',
    lhablock = 'UULMIX',
    lhacode = [1, 3] )

iZUL13 = Parameter(name='iZUL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL13}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 3] )

rZUL14 = Parameter(name='rZUL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL14}',
    lhablock = 'UULMIX',
    lhacode = [1, 4] )

iZUL14 = Parameter(name='iZUL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL14}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 4] )

rZUL15 = Parameter(name='rZUL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL15}',
    lhablock = 'UULMIX',
    lhacode = [1, 5] )

iZUL15 = Parameter(name='iZUL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL15}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 5] )

rZUL16 = Parameter(name='rZUL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL16}',
    lhablock = 'UULMIX',
    lhacode = [1, 6] )

iZUL16 = Parameter(name='iZUL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL16}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 6] )

rZUL21 = Parameter(name='rZUL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL21}',
    lhablock = 'UULMIX',
    lhacode = [2, 1] )

iZUL21 = Parameter(name='iZUL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL21}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 1] )

rZUL22 = Parameter(name='rZUL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL22}',
    lhablock = 'UULMIX',
    lhacode = [2, 2] )

iZUL22 = Parameter(name='iZUL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL22}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 2] )

rZUL23 = Parameter(name='rZUL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL23}',
    lhablock = 'UULMIX',
    lhacode = [2, 3] )

iZUL23 = Parameter(name='iZUL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL23}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 3] )

rZUL24 = Parameter(name='rZUL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL24}',
    lhablock = 'UULMIX',
    lhacode = [2, 4] )

iZUL24 = Parameter(name='iZUL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL24}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 4] )

rZUL25 = Parameter(name='rZUL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL25}',
    lhablock = 'UULMIX',
    lhacode = [2, 5] )

iZUL25 = Parameter(name='iZUL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL25}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 5] )

rZUL26 = Parameter(name='rZUL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL26}',
    lhablock = 'UULMIX',
    lhacode = [2, 6] )

iZUL26 = Parameter(name='iZUL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL26}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 6] )

rZUL31 = Parameter(name='rZUL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL31}',
    lhablock = 'UULMIX',
    lhacode = [3, 1] )

iZUL31 = Parameter(name='iZUL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL31}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 1] )

rZUL32 = Parameter(name='rZUL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL32}',
    lhablock = 'UULMIX',
    lhacode = [3, 2] )

iZUL32 = Parameter(name='iZUL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL32}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 2] )

rZUL33 = Parameter(name='rZUL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL33}',
    lhablock = 'UULMIX',
    lhacode = [3, 3] )

iZUL33 = Parameter(name='iZUL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL33}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 3] )

rZUL34 = Parameter(name='rZUL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL34}',
    lhablock = 'UULMIX',
    lhacode = [3, 4] )

iZUL34 = Parameter(name='iZUL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL34}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 4] )

rZUL35 = Parameter(name='rZUL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL35}',
    lhablock = 'UULMIX',
    lhacode = [3, 5] )

iZUL35 = Parameter(name='iZUL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL35}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 5] )

rZUL36 = Parameter(name='rZUL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL36}',
    lhablock = 'UULMIX',
    lhacode = [3, 6] )

iZUL36 = Parameter(name='iZUL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL36}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 6] )

rZUL41 = Parameter(name='rZUL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL41}',
    lhablock = 'UULMIX',
    lhacode = [4, 1] )

iZUL41 = Parameter(name='iZUL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL41}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 1] )

rZUL42 = Parameter(name='rZUL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL42}',
    lhablock = 'UULMIX',
    lhacode = [4, 2] )

iZUL42 = Parameter(name='iZUL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL42}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 2] )

rZUL43 = Parameter(name='rZUL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL43}',
    lhablock = 'UULMIX',
    lhacode = [4, 3] )

iZUL43 = Parameter(name='iZUL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL43}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 3] )

rZUL44 = Parameter(name='rZUL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL44}',
    lhablock = 'UULMIX',
    lhacode = [4, 4] )

iZUL44 = Parameter(name='iZUL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL44}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 4] )

rZUL45 = Parameter(name='rZUL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL45}',
    lhablock = 'UULMIX',
    lhacode = [4, 5] )

iZUL45 = Parameter(name='iZUL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL45}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 5] )

rZUL46 = Parameter(name='rZUL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL46}',
    lhablock = 'UULMIX',
    lhacode = [4, 6] )

iZUL46 = Parameter(name='iZUL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL46}',
    lhablock = 'IMUULMIX',
    lhacode = [4, 6] )

rZUL51 = Parameter(name='rZUL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL51}',
    lhablock = 'UULMIX',
    lhacode = [5, 1] )

iZUL51 = Parameter(name='iZUL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL51}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 1] )

rZUL52 = Parameter(name='rZUL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL52}',
    lhablock = 'UULMIX',
    lhacode = [5, 2] )

iZUL52 = Parameter(name='iZUL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL52}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 2] )

rZUL53 = Parameter(name='rZUL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL53}',
    lhablock = 'UULMIX',
    lhacode = [5, 3] )

iZUL53 = Parameter(name='iZUL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL53}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 3] )

rZUL54 = Parameter(name='rZUL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL54}',
    lhablock = 'UULMIX',
    lhacode = [5, 4] )

iZUL54 = Parameter(name='iZUL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL54}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 4] )

rZUL55 = Parameter(name='rZUL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL55}',
    lhablock = 'UULMIX',
    lhacode = [5, 5] )

iZUL55 = Parameter(name='iZUL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL55}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 5] )

rZUL56 = Parameter(name='rZUL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL56}',
    lhablock = 'UULMIX',
    lhacode = [5, 6] )

iZUL56 = Parameter(name='iZUL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL56}',
    lhablock = 'IMUULMIX',
    lhacode = [5, 6] )

rZUL61 = Parameter(name='rZUL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL61}',
    lhablock = 'UULMIX',
    lhacode = [6, 1] )

iZUL61 = Parameter(name='iZUL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL61}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 1] )

rZUL62 = Parameter(name='rZUL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL62}',
    lhablock = 'UULMIX',
    lhacode = [6, 2] )

iZUL62 = Parameter(name='iZUL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL62}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 2] )

rZUL63 = Parameter(name='rZUL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL63}',
    lhablock = 'UULMIX',
    lhacode = [6, 3] )

iZUL63 = Parameter(name='iZUL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL63}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 3] )

rZUL64 = Parameter(name='rZUL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL64}',
    lhablock = 'UULMIX',
    lhacode = [6, 4] )

iZUL64 = Parameter(name='iZUL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL64}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 4] )

rZUL65 = Parameter(name='rZUL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL65}',
    lhablock = 'UULMIX',
    lhacode = [6, 5] )

iZUL65 = Parameter(name='iZUL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL65}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 5] )

rZUL66 = Parameter(name='rZUL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL66}',
    lhablock = 'UULMIX',
    lhacode = [6, 6] )

iZUL66 = Parameter(name='iZUL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL66}',
    lhablock = 'IMUULMIX',
    lhacode = [6, 6] )

rZUR11 = Parameter(name='rZUR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR11}',
    lhablock = 'UURMIX',
    lhacode = [1, 1] )

iZUR11 = Parameter(name='iZUR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR11}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 1] )

rZUR12 = Parameter(name='rZUR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR12}',
    lhablock = 'UURMIX',
    lhacode = [1, 2] )

iZUR12 = Parameter(name='iZUR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR12}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 2] )

rZUR13 = Parameter(name='rZUR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR13}',
    lhablock = 'UURMIX',
    lhacode = [1, 3] )

iZUR13 = Parameter(name='iZUR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR13}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 3] )

rZUR14 = Parameter(name='rZUR14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR14}',
    lhablock = 'UURMIX',
    lhacode = [1, 4] )

iZUR14 = Parameter(name='iZUR14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR14}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 4] )

rZUR15 = Parameter(name='rZUR15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR15}',
    lhablock = 'UURMIX',
    lhacode = [1, 5] )

iZUR15 = Parameter(name='iZUR15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR15}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 5] )

rZUR16 = Parameter(name='rZUR16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR16}',
    lhablock = 'UURMIX',
    lhacode = [1, 6] )

iZUR16 = Parameter(name='iZUR16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR16}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 6] )

rZUR21 = Parameter(name='rZUR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR21}',
    lhablock = 'UURMIX',
    lhacode = [2, 1] )

iZUR21 = Parameter(name='iZUR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR21}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 1] )

rZUR22 = Parameter(name='rZUR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR22}',
    lhablock = 'UURMIX',
    lhacode = [2, 2] )

iZUR22 = Parameter(name='iZUR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR22}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 2] )

rZUR23 = Parameter(name='rZUR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR23}',
    lhablock = 'UURMIX',
    lhacode = [2, 3] )

iZUR23 = Parameter(name='iZUR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR23}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 3] )

rZUR24 = Parameter(name='rZUR24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR24}',
    lhablock = 'UURMIX',
    lhacode = [2, 4] )

iZUR24 = Parameter(name='iZUR24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR24}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 4] )

rZUR25 = Parameter(name='rZUR25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR25}',
    lhablock = 'UURMIX',
    lhacode = [2, 5] )

iZUR25 = Parameter(name='iZUR25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR25}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 5] )

rZUR26 = Parameter(name='rZUR26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR26}',
    lhablock = 'UURMIX',
    lhacode = [2, 6] )

iZUR26 = Parameter(name='iZUR26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR26}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 6] )

rZUR31 = Parameter(name='rZUR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR31}',
    lhablock = 'UURMIX',
    lhacode = [3, 1] )

iZUR31 = Parameter(name='iZUR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR31}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 1] )

rZUR32 = Parameter(name='rZUR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR32}',
    lhablock = 'UURMIX',
    lhacode = [3, 2] )

iZUR32 = Parameter(name='iZUR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR32}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 2] )

rZUR33 = Parameter(name='rZUR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR33}',
    lhablock = 'UURMIX',
    lhacode = [3, 3] )

iZUR33 = Parameter(name='iZUR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR33}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 3] )

rZUR34 = Parameter(name='rZUR34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR34}',
    lhablock = 'UURMIX',
    lhacode = [3, 4] )

iZUR34 = Parameter(name='iZUR34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR34}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 4] )

rZUR35 = Parameter(name='rZUR35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR35}',
    lhablock = 'UURMIX',
    lhacode = [3, 5] )

iZUR35 = Parameter(name='iZUR35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR35}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 5] )

rZUR36 = Parameter(name='rZUR36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR36}',
    lhablock = 'UURMIX',
    lhacode = [3, 6] )

iZUR36 = Parameter(name='iZUR36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR36}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 6] )

rZUR41 = Parameter(name='rZUR41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR41}',
    lhablock = 'UURMIX',
    lhacode = [4, 1] )

iZUR41 = Parameter(name='iZUR41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR41}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 1] )

rZUR42 = Parameter(name='rZUR42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR42}',
    lhablock = 'UURMIX',
    lhacode = [4, 2] )

iZUR42 = Parameter(name='iZUR42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR42}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 2] )

rZUR43 = Parameter(name='rZUR43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR43}',
    lhablock = 'UURMIX',
    lhacode = [4, 3] )

iZUR43 = Parameter(name='iZUR43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR43}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 3] )

rZUR44 = Parameter(name='rZUR44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR44}',
    lhablock = 'UURMIX',
    lhacode = [4, 4] )

iZUR44 = Parameter(name='iZUR44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR44}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 4] )

rZUR45 = Parameter(name='rZUR45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR45}',
    lhablock = 'UURMIX',
    lhacode = [4, 5] )

iZUR45 = Parameter(name='iZUR45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR45}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 5] )

rZUR46 = Parameter(name='rZUR46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR46}',
    lhablock = 'UURMIX',
    lhacode = [4, 6] )

iZUR46 = Parameter(name='iZUR46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR46}',
    lhablock = 'IMUURMIX',
    lhacode = [4, 6] )

rZUR51 = Parameter(name='rZUR51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR51}',
    lhablock = 'UURMIX',
    lhacode = [5, 1] )

iZUR51 = Parameter(name='iZUR51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR51}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 1] )

rZUR52 = Parameter(name='rZUR52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR52}',
    lhablock = 'UURMIX',
    lhacode = [5, 2] )

iZUR52 = Parameter(name='iZUR52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR52}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 2] )

rZUR53 = Parameter(name='rZUR53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR53}',
    lhablock = 'UURMIX',
    lhacode = [5, 3] )

iZUR53 = Parameter(name='iZUR53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR53}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 3] )

rZUR54 = Parameter(name='rZUR54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR54}',
    lhablock = 'UURMIX',
    lhacode = [5, 4] )

iZUR54 = Parameter(name='iZUR54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR54}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 4] )

rZUR55 = Parameter(name='rZUR55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR55}',
    lhablock = 'UURMIX',
    lhacode = [5, 5] )

iZUR55 = Parameter(name='iZUR55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR55}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 5] )

rZUR56 = Parameter(name='rZUR56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR56}',
    lhablock = 'UURMIX',
    lhacode = [5, 6] )

iZUR56 = Parameter(name='iZUR56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR56}',
    lhablock = 'IMUURMIX',
    lhacode = [5, 6] )

rZUR61 = Parameter(name='rZUR61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR61}',
    lhablock = 'UURMIX',
    lhacode = [6, 1] )

iZUR61 = Parameter(name='iZUR61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR61}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 1] )

rZUR62 = Parameter(name='rZUR62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR62}',
    lhablock = 'UURMIX',
    lhacode = [6, 2] )

iZUR62 = Parameter(name='iZUR62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR62}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 2] )

rZUR63 = Parameter(name='rZUR63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR63}',
    lhablock = 'UURMIX',
    lhacode = [6, 3] )

iZUR63 = Parameter(name='iZUR63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR63}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 3] )

rZUR64 = Parameter(name='rZUR64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR64}',
    lhablock = 'UURMIX',
    lhacode = [6, 4] )

iZUR64 = Parameter(name='iZUR64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR64}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 4] )

rZUR65 = Parameter(name='rZUR65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR65}',
    lhablock = 'UURMIX',
    lhacode = [6, 5] )

iZUR65 = Parameter(name='iZUR65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR65}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 5] )

rZUR66 = Parameter(name='rZUR66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR66}',
    lhablock = 'UURMIX',
    lhacode = [6, 6] )

iZUR66 = Parameter(name='iZUR66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR66}',
    lhablock = 'IMUURMIX',
    lhacode = [6, 6] )

rZEL11 = Parameter(name='rZEL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL11}',
    lhablock = 'UELMIX',
    lhacode = [1, 1] )

iZEL11 = Parameter(name='iZEL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL11}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 1] )

rZEL12 = Parameter(name='rZEL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL12}',
    lhablock = 'UELMIX',
    lhacode = [1, 2] )

iZEL12 = Parameter(name='iZEL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL12}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 2] )

rZEL13 = Parameter(name='rZEL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL13}',
    lhablock = 'UELMIX',
    lhacode = [1, 3] )

iZEL13 = Parameter(name='iZEL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL13}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 3] )

rZEL14 = Parameter(name='rZEL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL14}',
    lhablock = 'UELMIX',
    lhacode = [1, 4] )

iZEL14 = Parameter(name='iZEL14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL14}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 4] )

rZEL15 = Parameter(name='rZEL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL15}',
    lhablock = 'UELMIX',
    lhacode = [1, 5] )

iZEL15 = Parameter(name='iZEL15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL15}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 5] )

rZEL16 = Parameter(name='rZEL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL16}',
    lhablock = 'UELMIX',
    lhacode = [1, 6] )

iZEL16 = Parameter(name='iZEL16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL16}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 6] )

rZEL21 = Parameter(name='rZEL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL21}',
    lhablock = 'UELMIX',
    lhacode = [2, 1] )

iZEL21 = Parameter(name='iZEL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL21}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 1] )

rZEL22 = Parameter(name='rZEL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL22}',
    lhablock = 'UELMIX',
    lhacode = [2, 2] )

iZEL22 = Parameter(name='iZEL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL22}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 2] )

rZEL23 = Parameter(name='rZEL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL23}',
    lhablock = 'UELMIX',
    lhacode = [2, 3] )

iZEL23 = Parameter(name='iZEL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL23}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 3] )

rZEL24 = Parameter(name='rZEL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL24}',
    lhablock = 'UELMIX',
    lhacode = [2, 4] )

iZEL24 = Parameter(name='iZEL24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL24}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 4] )

rZEL25 = Parameter(name='rZEL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL25}',
    lhablock = 'UELMIX',
    lhacode = [2, 5] )

iZEL25 = Parameter(name='iZEL25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL25}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 5] )

rZEL26 = Parameter(name='rZEL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL26}',
    lhablock = 'UELMIX',
    lhacode = [2, 6] )

iZEL26 = Parameter(name='iZEL26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL26}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 6] )

rZEL31 = Parameter(name='rZEL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL31}',
    lhablock = 'UELMIX',
    lhacode = [3, 1] )

iZEL31 = Parameter(name='iZEL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL31}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 1] )

rZEL32 = Parameter(name='rZEL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL32}',
    lhablock = 'UELMIX',
    lhacode = [3, 2] )

iZEL32 = Parameter(name='iZEL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL32}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 2] )

rZEL33 = Parameter(name='rZEL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL33}',
    lhablock = 'UELMIX',
    lhacode = [3, 3] )

iZEL33 = Parameter(name='iZEL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL33}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 3] )

rZEL34 = Parameter(name='rZEL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL34}',
    lhablock = 'UELMIX',
    lhacode = [3, 4] )

iZEL34 = Parameter(name='iZEL34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL34}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 4] )

rZEL35 = Parameter(name='rZEL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL35}',
    lhablock = 'UELMIX',
    lhacode = [3, 5] )

iZEL35 = Parameter(name='iZEL35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL35}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 5] )

rZEL36 = Parameter(name='rZEL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL36}',
    lhablock = 'UELMIX',
    lhacode = [3, 6] )

iZEL36 = Parameter(name='iZEL36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL36}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 6] )

rZEL41 = Parameter(name='rZEL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL41}',
    lhablock = 'UELMIX',
    lhacode = [4, 1] )

iZEL41 = Parameter(name='iZEL41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL41}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 1] )

rZEL42 = Parameter(name='rZEL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL42}',
    lhablock = 'UELMIX',
    lhacode = [4, 2] )

iZEL42 = Parameter(name='iZEL42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL42}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 2] )

rZEL43 = Parameter(name='rZEL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL43}',
    lhablock = 'UELMIX',
    lhacode = [4, 3] )

iZEL43 = Parameter(name='iZEL43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL43}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 3] )

rZEL44 = Parameter(name='rZEL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL44}',
    lhablock = 'UELMIX',
    lhacode = [4, 4] )

iZEL44 = Parameter(name='iZEL44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL44}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 4] )

rZEL45 = Parameter(name='rZEL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL45}',
    lhablock = 'UELMIX',
    lhacode = [4, 5] )

iZEL45 = Parameter(name='iZEL45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL45}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 5] )

rZEL46 = Parameter(name='rZEL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL46}',
    lhablock = 'UELMIX',
    lhacode = [4, 6] )

iZEL46 = Parameter(name='iZEL46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL46}',
    lhablock = 'IMUELMIX',
    lhacode = [4, 6] )

rZEL51 = Parameter(name='rZEL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL51}',
    lhablock = 'UELMIX',
    lhacode = [5, 1] )

iZEL51 = Parameter(name='iZEL51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL51}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 1] )

rZEL52 = Parameter(name='rZEL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL52}',
    lhablock = 'UELMIX',
    lhacode = [5, 2] )

iZEL52 = Parameter(name='iZEL52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL52}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 2] )

rZEL53 = Parameter(name='rZEL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL53}',
    lhablock = 'UELMIX',
    lhacode = [5, 3] )

iZEL53 = Parameter(name='iZEL53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL53}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 3] )

rZEL54 = Parameter(name='rZEL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL54}',
    lhablock = 'UELMIX',
    lhacode = [5, 4] )

iZEL54 = Parameter(name='iZEL54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL54}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 4] )

rZEL55 = Parameter(name='rZEL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL55}',
    lhablock = 'UELMIX',
    lhacode = [5, 5] )

iZEL55 = Parameter(name='iZEL55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL55}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 5] )

rZEL56 = Parameter(name='rZEL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL56}',
    lhablock = 'UELMIX',
    lhacode = [5, 6] )

iZEL56 = Parameter(name='iZEL56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL56}',
    lhablock = 'IMUELMIX',
    lhacode = [5, 6] )

rZEL61 = Parameter(name='rZEL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL61}',
    lhablock = 'UELMIX',
    lhacode = [6, 1] )

iZEL61 = Parameter(name='iZEL61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL61}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 1] )

rZEL62 = Parameter(name='rZEL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL62}',
    lhablock = 'UELMIX',
    lhacode = [6, 2] )

iZEL62 = Parameter(name='iZEL62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL62}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 2] )

rZEL63 = Parameter(name='rZEL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL63}',
    lhablock = 'UELMIX',
    lhacode = [6, 3] )

iZEL63 = Parameter(name='iZEL63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL63}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 3] )

rZEL64 = Parameter(name='rZEL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL64}',
    lhablock = 'UELMIX',
    lhacode = [6, 4] )

iZEL64 = Parameter(name='iZEL64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL64}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 4] )

rZEL65 = Parameter(name='rZEL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL65}',
    lhablock = 'UELMIX',
    lhacode = [6, 5] )

iZEL65 = Parameter(name='iZEL65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL65}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 5] )

rZEL66 = Parameter(name='rZEL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL66}',
    lhablock = 'UELMIX',
    lhacode = [6, 6] )

iZEL66 = Parameter(name='iZEL66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL66}',
    lhablock = 'IMUELMIX',
    lhacode = [6, 6] )

rZER11 = Parameter(name='rZER11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER11}',
    lhablock = 'UERMIX',
    lhacode = [1, 1] )

iZER11 = Parameter(name='iZER11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER11}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 1] )

rZER12 = Parameter(name='rZER12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER12}',
    lhablock = 'UERMIX',
    lhacode = [1, 2] )

iZER12 = Parameter(name='iZER12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER12}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 2] )

rZER13 = Parameter(name='rZER13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER13}',
    lhablock = 'UERMIX',
    lhacode = [1, 3] )

iZER13 = Parameter(name='iZER13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER13}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 3] )

rZER14 = Parameter(name='rZER14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER14}',
    lhablock = 'UERMIX',
    lhacode = [1, 4] )

iZER14 = Parameter(name='iZER14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER14}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 4] )

rZER15 = Parameter(name='rZER15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER15}',
    lhablock = 'UERMIX',
    lhacode = [1, 5] )

iZER15 = Parameter(name='iZER15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER15}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 5] )

rZER16 = Parameter(name='rZER16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER16}',
    lhablock = 'UERMIX',
    lhacode = [1, 6] )

iZER16 = Parameter(name='iZER16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER16}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 6] )

rZER21 = Parameter(name='rZER21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER21}',
    lhablock = 'UERMIX',
    lhacode = [2, 1] )

iZER21 = Parameter(name='iZER21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER21}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 1] )

rZER22 = Parameter(name='rZER22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER22}',
    lhablock = 'UERMIX',
    lhacode = [2, 2] )

iZER22 = Parameter(name='iZER22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER22}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 2] )

rZER23 = Parameter(name='rZER23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER23}',
    lhablock = 'UERMIX',
    lhacode = [2, 3] )

iZER23 = Parameter(name='iZER23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER23}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 3] )

rZER24 = Parameter(name='rZER24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER24}',
    lhablock = 'UERMIX',
    lhacode = [2, 4] )

iZER24 = Parameter(name='iZER24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER24}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 4] )

rZER25 = Parameter(name='rZER25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER25}',
    lhablock = 'UERMIX',
    lhacode = [2, 5] )

iZER25 = Parameter(name='iZER25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER25}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 5] )

rZER26 = Parameter(name='rZER26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER26}',
    lhablock = 'UERMIX',
    lhacode = [2, 6] )

iZER26 = Parameter(name='iZER26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER26}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 6] )

rZER31 = Parameter(name='rZER31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER31}',
    lhablock = 'UERMIX',
    lhacode = [3, 1] )

iZER31 = Parameter(name='iZER31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER31}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 1] )

rZER32 = Parameter(name='rZER32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER32}',
    lhablock = 'UERMIX',
    lhacode = [3, 2] )

iZER32 = Parameter(name='iZER32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER32}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 2] )

rZER33 = Parameter(name='rZER33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER33}',
    lhablock = 'UERMIX',
    lhacode = [3, 3] )

iZER33 = Parameter(name='iZER33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER33}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 3] )

rZER34 = Parameter(name='rZER34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER34}',
    lhablock = 'UERMIX',
    lhacode = [3, 4] )

iZER34 = Parameter(name='iZER34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER34}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 4] )

rZER35 = Parameter(name='rZER35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER35}',
    lhablock = 'UERMIX',
    lhacode = [3, 5] )

iZER35 = Parameter(name='iZER35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER35}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 5] )

rZER36 = Parameter(name='rZER36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER36}',
    lhablock = 'UERMIX',
    lhacode = [3, 6] )

iZER36 = Parameter(name='iZER36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER36}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 6] )

rZER41 = Parameter(name='rZER41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER41}',
    lhablock = 'UERMIX',
    lhacode = [4, 1] )

iZER41 = Parameter(name='iZER41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER41}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 1] )

rZER42 = Parameter(name='rZER42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER42}',
    lhablock = 'UERMIX',
    lhacode = [4, 2] )

iZER42 = Parameter(name='iZER42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER42}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 2] )

rZER43 = Parameter(name='rZER43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER43}',
    lhablock = 'UERMIX',
    lhacode = [4, 3] )

iZER43 = Parameter(name='iZER43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER43}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 3] )

rZER44 = Parameter(name='rZER44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER44}',
    lhablock = 'UERMIX',
    lhacode = [4, 4] )

iZER44 = Parameter(name='iZER44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER44}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 4] )

rZER45 = Parameter(name='rZER45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER45}',
    lhablock = 'UERMIX',
    lhacode = [4, 5] )

iZER45 = Parameter(name='iZER45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER45}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 5] )

rZER46 = Parameter(name='rZER46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER46}',
    lhablock = 'UERMIX',
    lhacode = [4, 6] )

iZER46 = Parameter(name='iZER46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER46}',
    lhablock = 'IMUERMIX',
    lhacode = [4, 6] )

rZER51 = Parameter(name='rZER51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER51}',
    lhablock = 'UERMIX',
    lhacode = [5, 1] )

iZER51 = Parameter(name='iZER51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER51}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 1] )

rZER52 = Parameter(name='rZER52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER52}',
    lhablock = 'UERMIX',
    lhacode = [5, 2] )

iZER52 = Parameter(name='iZER52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER52}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 2] )

rZER53 = Parameter(name='rZER53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER53}',
    lhablock = 'UERMIX',
    lhacode = [5, 3] )

iZER53 = Parameter(name='iZER53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER53}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 3] )

rZER54 = Parameter(name='rZER54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER54}',
    lhablock = 'UERMIX',
    lhacode = [5, 4] )

iZER54 = Parameter(name='iZER54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER54}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 4] )

rZER55 = Parameter(name='rZER55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER55}',
    lhablock = 'UERMIX',
    lhacode = [5, 5] )

iZER55 = Parameter(name='iZER55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER55}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 5] )

rZER56 = Parameter(name='rZER56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER56}',
    lhablock = 'UERMIX',
    lhacode = [5, 6] )

iZER56 = Parameter(name='iZER56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER56}',
    lhablock = 'IMUERMIX',
    lhacode = [5, 6] )

rZER61 = Parameter(name='rZER61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER61}',
    lhablock = 'UERMIX',
    lhacode = [6, 1] )

iZER61 = Parameter(name='iZER61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER61}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 1] )

rZER62 = Parameter(name='rZER62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER62}',
    lhablock = 'UERMIX',
    lhacode = [6, 2] )

iZER62 = Parameter(name='iZER62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER62}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 2] )

rZER63 = Parameter(name='rZER63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER63}',
    lhablock = 'UERMIX',
    lhacode = [6, 3] )

iZER63 = Parameter(name='iZER63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER63}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 3] )

rZER64 = Parameter(name='rZER64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER64}',
    lhablock = 'UERMIX',
    lhacode = [6, 4] )

iZER64 = Parameter(name='iZER64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER64}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 4] )

rZER65 = Parameter(name='rZER65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER65}',
    lhablock = 'UERMIX',
    lhacode = [6, 5] )

iZER65 = Parameter(name='iZER65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER65}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 5] )

rZER66 = Parameter(name='rZER66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER66}',
    lhablock = 'UERMIX',
    lhacode = [6, 6] )

iZER66 = Parameter(name='iZER66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER66}',
    lhablock = 'IMUERMIX',
    lhacode = [6, 6] )

rUV11 = Parameter(name='rUV11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV11}',
    lhablock = 'UVMIX',
    lhacode = [1, 1] )

iUV11 = Parameter(name='iUV11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV11}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 1] )

rUV12 = Parameter(name='rUV12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV12}',
    lhablock = 'UVMIX',
    lhacode = [1, 2] )

iUV12 = Parameter(name='iUV12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV12}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 2] )

rUV13 = Parameter(name='rUV13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV13}',
    lhablock = 'UVMIX',
    lhacode = [1, 3] )

iUV13 = Parameter(name='iUV13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV13}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 3] )

rUV14 = Parameter(name='rUV14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV14}',
    lhablock = 'UVMIX',
    lhacode = [1, 4] )

iUV14 = Parameter(name='iUV14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV14}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 4] )

rUV15 = Parameter(name='rUV15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV15}',
    lhablock = 'UVMIX',
    lhacode = [1, 5] )

iUV15 = Parameter(name='iUV15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV15}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 5] )

rUV16 = Parameter(name='rUV16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV16}',
    lhablock = 'UVMIX',
    lhacode = [1, 6] )

iUV16 = Parameter(name='iUV16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV16}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 6] )

rUV17 = Parameter(name='rUV17',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV17}',
    lhablock = 'UVMIX',
    lhacode = [1, 7] )

iUV17 = Parameter(name='iUV17',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV17}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 7] )

rUV18 = Parameter(name='rUV18',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV18}',
    lhablock = 'UVMIX',
    lhacode = [1, 8] )

iUV18 = Parameter(name='iUV18',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV18}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 8] )

rUV19 = Parameter(name='rUV19',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV19}',
    lhablock = 'UVMIX',
    lhacode = [1, 9] )

iUV19 = Parameter(name='iUV19',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV19}',
    lhablock = 'IMUVMIX',
    lhacode = [1, 9] )

rUV21 = Parameter(name='rUV21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV21}',
    lhablock = 'UVMIX',
    lhacode = [2, 1] )

iUV21 = Parameter(name='iUV21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV21}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 1] )

rUV22 = Parameter(name='rUV22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV22}',
    lhablock = 'UVMIX',
    lhacode = [2, 2] )

iUV22 = Parameter(name='iUV22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV22}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 2] )

rUV23 = Parameter(name='rUV23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV23}',
    lhablock = 'UVMIX',
    lhacode = [2, 3] )

iUV23 = Parameter(name='iUV23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV23}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 3] )

rUV24 = Parameter(name='rUV24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV24}',
    lhablock = 'UVMIX',
    lhacode = [2, 4] )

iUV24 = Parameter(name='iUV24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV24}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 4] )

rUV25 = Parameter(name='rUV25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV25}',
    lhablock = 'UVMIX',
    lhacode = [2, 5] )

iUV25 = Parameter(name='iUV25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV25}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 5] )

rUV26 = Parameter(name='rUV26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV26}',
    lhablock = 'UVMIX',
    lhacode = [2, 6] )

iUV26 = Parameter(name='iUV26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV26}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 6] )

rUV27 = Parameter(name='rUV27',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV27}',
    lhablock = 'UVMIX',
    lhacode = [2, 7] )

iUV27 = Parameter(name='iUV27',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV27}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 7] )

rUV28 = Parameter(name='rUV28',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV28}',
    lhablock = 'UVMIX',
    lhacode = [2, 8] )

iUV28 = Parameter(name='iUV28',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV28}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 8] )

rUV29 = Parameter(name='rUV29',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV29}',
    lhablock = 'UVMIX',
    lhacode = [2, 9] )

iUV29 = Parameter(name='iUV29',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV29}',
    lhablock = 'IMUVMIX',
    lhacode = [2, 9] )

rUV31 = Parameter(name='rUV31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV31}',
    lhablock = 'UVMIX',
    lhacode = [3, 1] )

iUV31 = Parameter(name='iUV31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV31}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 1] )

rUV32 = Parameter(name='rUV32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV32}',
    lhablock = 'UVMIX',
    lhacode = [3, 2] )

iUV32 = Parameter(name='iUV32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV32}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 2] )

rUV33 = Parameter(name='rUV33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV33}',
    lhablock = 'UVMIX',
    lhacode = [3, 3] )

iUV33 = Parameter(name='iUV33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV33}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 3] )

rUV34 = Parameter(name='rUV34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV34}',
    lhablock = 'UVMIX',
    lhacode = [3, 4] )

iUV34 = Parameter(name='iUV34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV34}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 4] )

rUV35 = Parameter(name='rUV35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV35}',
    lhablock = 'UVMIX',
    lhacode = [3, 5] )

iUV35 = Parameter(name='iUV35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV35}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 5] )

rUV36 = Parameter(name='rUV36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV36}',
    lhablock = 'UVMIX',
    lhacode = [3, 6] )

iUV36 = Parameter(name='iUV36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV36}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 6] )

rUV37 = Parameter(name='rUV37',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV37}',
    lhablock = 'UVMIX',
    lhacode = [3, 7] )

iUV37 = Parameter(name='iUV37',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV37}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 7] )

rUV38 = Parameter(name='rUV38',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV38}',
    lhablock = 'UVMIX',
    lhacode = [3, 8] )

iUV38 = Parameter(name='iUV38',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV38}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 8] )

rUV39 = Parameter(name='rUV39',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV39}',
    lhablock = 'UVMIX',
    lhacode = [3, 9] )

iUV39 = Parameter(name='iUV39',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV39}',
    lhablock = 'IMUVMIX',
    lhacode = [3, 9] )

rUV41 = Parameter(name='rUV41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV41}',
    lhablock = 'UVMIX',
    lhacode = [4, 1] )

iUV41 = Parameter(name='iUV41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV41}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 1] )

rUV42 = Parameter(name='rUV42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV42}',
    lhablock = 'UVMIX',
    lhacode = [4, 2] )

iUV42 = Parameter(name='iUV42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV42}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 2] )

rUV43 = Parameter(name='rUV43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV43}',
    lhablock = 'UVMIX',
    lhacode = [4, 3] )

iUV43 = Parameter(name='iUV43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV43}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 3] )

rUV44 = Parameter(name='rUV44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV44}',
    lhablock = 'UVMIX',
    lhacode = [4, 4] )

iUV44 = Parameter(name='iUV44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV44}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 4] )

rUV45 = Parameter(name='rUV45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV45}',
    lhablock = 'UVMIX',
    lhacode = [4, 5] )

iUV45 = Parameter(name='iUV45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV45}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 5] )

rUV46 = Parameter(name='rUV46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV46}',
    lhablock = 'UVMIX',
    lhacode = [4, 6] )

iUV46 = Parameter(name='iUV46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV46}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 6] )

rUV47 = Parameter(name='rUV47',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV47}',
    lhablock = 'UVMIX',
    lhacode = [4, 7] )

iUV47 = Parameter(name='iUV47',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV47}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 7] )

rUV48 = Parameter(name='rUV48',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV48}',
    lhablock = 'UVMIX',
    lhacode = [4, 8] )

iUV48 = Parameter(name='iUV48',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV48}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 8] )

rUV49 = Parameter(name='rUV49',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV49}',
    lhablock = 'UVMIX',
    lhacode = [4, 9] )

iUV49 = Parameter(name='iUV49',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV49}',
    lhablock = 'IMUVMIX',
    lhacode = [4, 9] )

rUV51 = Parameter(name='rUV51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV51}',
    lhablock = 'UVMIX',
    lhacode = [5, 1] )

iUV51 = Parameter(name='iUV51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV51}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 1] )

rUV52 = Parameter(name='rUV52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV52}',
    lhablock = 'UVMIX',
    lhacode = [5, 2] )

iUV52 = Parameter(name='iUV52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV52}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 2] )

rUV53 = Parameter(name='rUV53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV53}',
    lhablock = 'UVMIX',
    lhacode = [5, 3] )

iUV53 = Parameter(name='iUV53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV53}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 3] )

rUV54 = Parameter(name='rUV54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV54}',
    lhablock = 'UVMIX',
    lhacode = [5, 4] )

iUV54 = Parameter(name='iUV54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV54}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 4] )

rUV55 = Parameter(name='rUV55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV55}',
    lhablock = 'UVMIX',
    lhacode = [5, 5] )

iUV55 = Parameter(name='iUV55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV55}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 5] )

rUV56 = Parameter(name='rUV56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV56}',
    lhablock = 'UVMIX',
    lhacode = [5, 6] )

iUV56 = Parameter(name='iUV56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV56}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 6] )

rUV57 = Parameter(name='rUV57',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV57}',
    lhablock = 'UVMIX',
    lhacode = [5, 7] )

iUV57 = Parameter(name='iUV57',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV57}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 7] )

rUV58 = Parameter(name='rUV58',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV58}',
    lhablock = 'UVMIX',
    lhacode = [5, 8] )

iUV58 = Parameter(name='iUV58',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV58}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 8] )

rUV59 = Parameter(name='rUV59',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV59}',
    lhablock = 'UVMIX',
    lhacode = [5, 9] )

iUV59 = Parameter(name='iUV59',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV59}',
    lhablock = 'IMUVMIX',
    lhacode = [5, 9] )

rUV61 = Parameter(name='rUV61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV61}',
    lhablock = 'UVMIX',
    lhacode = [6, 1] )

iUV61 = Parameter(name='iUV61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV61}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 1] )

rUV62 = Parameter(name='rUV62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV62}',
    lhablock = 'UVMIX',
    lhacode = [6, 2] )

iUV62 = Parameter(name='iUV62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV62}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 2] )

rUV63 = Parameter(name='rUV63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV63}',
    lhablock = 'UVMIX',
    lhacode = [6, 3] )

iUV63 = Parameter(name='iUV63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV63}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 3] )

rUV64 = Parameter(name='rUV64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV64}',
    lhablock = 'UVMIX',
    lhacode = [6, 4] )

iUV64 = Parameter(name='iUV64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV64}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 4] )

rUV65 = Parameter(name='rUV65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV65}',
    lhablock = 'UVMIX',
    lhacode = [6, 5] )

iUV65 = Parameter(name='iUV65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV65}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 5] )

rUV66 = Parameter(name='rUV66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV66}',
    lhablock = 'UVMIX',
    lhacode = [6, 6] )

iUV66 = Parameter(name='iUV66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV66}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 6] )

rUV67 = Parameter(name='rUV67',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV67}',
    lhablock = 'UVMIX',
    lhacode = [6, 7] )

iUV67 = Parameter(name='iUV67',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV67}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 7] )

rUV68 = Parameter(name='rUV68',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV68}',
    lhablock = 'UVMIX',
    lhacode = [6, 8] )

iUV68 = Parameter(name='iUV68',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV68}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 8] )

rUV69 = Parameter(name='rUV69',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV69}',
    lhablock = 'UVMIX',
    lhacode = [6, 9] )

iUV69 = Parameter(name='iUV69',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV69}',
    lhablock = 'IMUVMIX',
    lhacode = [6, 9] )

rUV71 = Parameter(name='rUV71',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV71}',
    lhablock = 'UVMIX',
    lhacode = [7, 1] )

iUV71 = Parameter(name='iUV71',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV71}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 1] )

rUV72 = Parameter(name='rUV72',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV72}',
    lhablock = 'UVMIX',
    lhacode = [7, 2] )

iUV72 = Parameter(name='iUV72',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV72}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 2] )

rUV73 = Parameter(name='rUV73',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV73}',
    lhablock = 'UVMIX',
    lhacode = [7, 3] )

iUV73 = Parameter(name='iUV73',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV73}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 3] )

rUV74 = Parameter(name='rUV74',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV74}',
    lhablock = 'UVMIX',
    lhacode = [7, 4] )

iUV74 = Parameter(name='iUV74',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV74}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 4] )

rUV75 = Parameter(name='rUV75',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV75}',
    lhablock = 'UVMIX',
    lhacode = [7, 5] )

iUV75 = Parameter(name='iUV75',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV75}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 5] )

rUV76 = Parameter(name='rUV76',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV76}',
    lhablock = 'UVMIX',
    lhacode = [7, 6] )

iUV76 = Parameter(name='iUV76',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV76}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 6] )

rUV77 = Parameter(name='rUV77',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV77}',
    lhablock = 'UVMIX',
    lhacode = [7, 7] )

iUV77 = Parameter(name='iUV77',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV77}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 7] )

rUV78 = Parameter(name='rUV78',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV78}',
    lhablock = 'UVMIX',
    lhacode = [7, 8] )

iUV78 = Parameter(name='iUV78',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV78}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 8] )

rUV79 = Parameter(name='rUV79',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV79}',
    lhablock = 'UVMIX',
    lhacode = [7, 9] )

iUV79 = Parameter(name='iUV79',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV79}',
    lhablock = 'IMUVMIX',
    lhacode = [7, 9] )

rUV81 = Parameter(name='rUV81',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV81}',
    lhablock = 'UVMIX',
    lhacode = [8, 1] )

iUV81 = Parameter(name='iUV81',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV81}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 1] )

rUV82 = Parameter(name='rUV82',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV82}',
    lhablock = 'UVMIX',
    lhacode = [8, 2] )

iUV82 = Parameter(name='iUV82',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV82}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 2] )

rUV83 = Parameter(name='rUV83',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV83}',
    lhablock = 'UVMIX',
    lhacode = [8, 3] )

iUV83 = Parameter(name='iUV83',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV83}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 3] )

rUV84 = Parameter(name='rUV84',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV84}',
    lhablock = 'UVMIX',
    lhacode = [8, 4] )

iUV84 = Parameter(name='iUV84',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV84}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 4] )

rUV85 = Parameter(name='rUV85',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV85}',
    lhablock = 'UVMIX',
    lhacode = [8, 5] )

iUV85 = Parameter(name='iUV85',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV85}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 5] )

rUV86 = Parameter(name='rUV86',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV86}',
    lhablock = 'UVMIX',
    lhacode = [8, 6] )

iUV86 = Parameter(name='iUV86',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV86}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 6] )

rUV87 = Parameter(name='rUV87',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV87}',
    lhablock = 'UVMIX',
    lhacode = [8, 7] )

iUV87 = Parameter(name='iUV87',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV87}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 7] )

rUV88 = Parameter(name='rUV88',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV88}',
    lhablock = 'UVMIX',
    lhacode = [8, 8] )

iUV88 = Parameter(name='iUV88',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV88}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 8] )

rUV89 = Parameter(name='rUV89',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV89}',
    lhablock = 'UVMIX',
    lhacode = [8, 9] )

iUV89 = Parameter(name='iUV89',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV89}',
    lhablock = 'IMUVMIX',
    lhacode = [8, 9] )

rUV91 = Parameter(name='rUV91',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV91}',
    lhablock = 'UVMIX',
    lhacode = [9, 1] )

iUV91 = Parameter(name='iUV91',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV91}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 1] )

rUV92 = Parameter(name='rUV92',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV92}',
    lhablock = 'UVMIX',
    lhacode = [9, 2] )

iUV92 = Parameter(name='iUV92',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV92}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 2] )

rUV93 = Parameter(name='rUV93',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV93}',
    lhablock = 'UVMIX',
    lhacode = [9, 3] )

iUV93 = Parameter(name='iUV93',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV93}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 3] )

rUV94 = Parameter(name='rUV94',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV94}',
    lhablock = 'UVMIX',
    lhacode = [9, 4] )

iUV94 = Parameter(name='iUV94',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV94}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 4] )

rUV95 = Parameter(name='rUV95',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV95}',
    lhablock = 'UVMIX',
    lhacode = [9, 5] )

iUV95 = Parameter(name='iUV95',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV95}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 5] )

rUV96 = Parameter(name='rUV96',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV96}',
    lhablock = 'UVMIX',
    lhacode = [9, 6] )

iUV96 = Parameter(name='iUV96',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV96}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 6] )

rUV97 = Parameter(name='rUV97',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV97}',
    lhablock = 'UVMIX',
    lhacode = [9, 7] )

iUV97 = Parameter(name='iUV97',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV97}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 7] )

rUV98 = Parameter(name='rUV98',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV98}',
    lhablock = 'UVMIX',
    lhacode = [9, 8] )

iUV98 = Parameter(name='iUV98',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV98}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 8] )

rUV99 = Parameter(name='rUV99',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV99}',
    lhablock = 'UVMIX',
    lhacode = [9, 9] )

iUV99 = Parameter(name='iUV99',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UV99}',
    lhablock = 'IMUVMIX',
    lhacode = [9, 9] )

alphaH = Parameter(name='alphaH',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\alpha',
    lhablock = 'SCALARS',
    lhacode = [4] )

TWp = Parameter(name='TWp',
    nature = 'external',
    type = 'real',
    value = 1.,
    texname = '\\text{TWp}',
    lhablock = 'GAUGE',
    lhacode = [7] )

aEWM1 = Parameter(name='aEWM1',
    nature = 'external',
    type = 'real',
    value = 137.035999679,
    texname = '\\text{aEWM1}',
    lhablock = 'SMINPUTS',
    lhacode = [1] )

aS = Parameter(name='aS',
    nature = 'external',
    type = 'real',
    value = 0.119,
    texname = '\\text{aS}',
    lhablock = 'SMINPUTS',
    lhacode = [3] )

Gf = Parameter(name='Gf',
    nature = 'external',
    type = 'real',
    value = 0.0000116639,
    texname = 'G_f',
    lhablock = 'SMINPUTS',
    lhacode = [2] )

YvL11 = Parameter(name='YvL11',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL11 + complex(0,1)*iYvL11',
    texname = '\\text{YvL11}' )

YvL12 = Parameter(name='YvL12',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL12 + complex(0,1)*iYvL12',
    texname = '\\text{YvL12}' )

YvL13 = Parameter(name='YvL13',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL13 + complex(0,1)*iYvL13',
    texname = '\\text{YvL13}' )

YvL21 = Parameter(name='YvL21',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL21 + complex(0,1)*iYvL21',
    texname = '\\text{YvL21}' )

YvL22 = Parameter(name='YvL22',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL22 + complex(0,1)*iYvL22',
    texname = '\\text{YvL22}' )

YvL23 = Parameter(name='YvL23',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL23 + complex(0,1)*iYvL23',
    texname = '\\text{YvL23}' )

YvL31 = Parameter(name='YvL31',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL31 + complex(0,1)*iYvL31',
    texname = '\\text{YvL31}' )

YvL32 = Parameter(name='YvL32',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL32 + complex(0,1)*iYvL32',
    texname = '\\text{YvL32}' )

YvL33 = Parameter(name='YvL33',
    nature = 'internal',
    type = 'complex',
    value = 'rYvL33 + complex(0,1)*iYvL33',
    texname = '\\text{YvL33}' )

YuL11 = Parameter(name='YuL11',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL11 + complex(0,1)*iYuL11',
    texname = '\\text{YuL11}' )

YuL12 = Parameter(name='YuL12',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL12 + complex(0,1)*iYuL12',
    texname = '\\text{YuL12}' )

YuL13 = Parameter(name='YuL13',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL13 + complex(0,1)*iYuL13',
    texname = '\\text{YuL13}' )

YuL21 = Parameter(name='YuL21',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL21 + complex(0,1)*iYuL21',
    texname = '\\text{YuL21}' )

YuL22 = Parameter(name='YuL22',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL22 + complex(0,1)*iYuL22',
    texname = '\\text{YuL22}' )

YuL23 = Parameter(name='YuL23',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL23 + complex(0,1)*iYuL23',
    texname = '\\text{YuL23}' )

YuL31 = Parameter(name='YuL31',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL31 + complex(0,1)*iYuL31',
    texname = '\\text{YuL31}' )

YuL32 = Parameter(name='YuL32',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL32 + complex(0,1)*iYuL32',
    texname = '\\text{YuL32}' )

YuL33 = Parameter(name='YuL33',
    nature = 'internal',
    type = 'complex',
    value = 'rYuL33 + complex(0,1)*iYuL33',
    texname = '\\text{YuL33}' )

YvR11 = Parameter(name='YvR11',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR11 + complex(0,1)*iYvR11',
    texname = '\\text{YvR11}' )

YvR12 = Parameter(name='YvR12',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR12 + complex(0,1)*iYvR12',
    texname = '\\text{YvR12}' )

YvR13 = Parameter(name='YvR13',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR13 + complex(0,1)*iYvR13',
    texname = '\\text{YvR13}' )

YvR21 = Parameter(name='YvR21',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR21 + complex(0,1)*iYvR21',
    texname = '\\text{YvR21}' )

YvR22 = Parameter(name='YvR22',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR22 + complex(0,1)*iYvR22',
    texname = '\\text{YvR22}' )

YvR23 = Parameter(name='YvR23',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR23 + complex(0,1)*iYvR23',
    texname = '\\text{YvR23}' )

YvR31 = Parameter(name='YvR31',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR31 + complex(0,1)*iYvR31',
    texname = '\\text{YvR31}' )

YvR32 = Parameter(name='YvR32',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR32 + complex(0,1)*iYvR32',
    texname = '\\text{YvR32}' )

YvR33 = Parameter(name='YvR33',
    nature = 'internal',
    type = 'complex',
    value = 'rYvR33 + complex(0,1)*iYvR33',
    texname = '\\text{YvR33}' )

YuR11 = Parameter(name='YuR11',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR11 + complex(0,1)*iYuR11',
    texname = '\\text{YuR11}' )

YuR12 = Parameter(name='YuR12',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR12 + complex(0,1)*iYuR12',
    texname = '\\text{YuR12}' )

YuR13 = Parameter(name='YuR13',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR13 + complex(0,1)*iYuR13',
    texname = '\\text{YuR13}' )

YuR21 = Parameter(name='YuR21',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR21 + complex(0,1)*iYuR21',
    texname = '\\text{YuR21}' )

YuR22 = Parameter(name='YuR22',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR22 + complex(0,1)*iYuR22',
    texname = '\\text{YuR22}' )

YuR23 = Parameter(name='YuR23',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR23 + complex(0,1)*iYuR23',
    texname = '\\text{YuR23}' )

YuR31 = Parameter(name='YuR31',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR31 + complex(0,1)*iYuR31',
    texname = '\\text{YuR31}' )

YuR32 = Parameter(name='YuR32',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR32 + complex(0,1)*iYuR32',
    texname = '\\text{YuR32}' )

YuR33 = Parameter(name='YuR33',
    nature = 'internal',
    type = 'complex',
    value = 'rYuR33 + complex(0,1)*iYuR33',
    texname = '\\text{YuR33}' )

YdL11 = Parameter(name='YdL11',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL11 + complex(0,1)*iYdL11',
    texname = '\\text{YdL11}' )

YdL12 = Parameter(name='YdL12',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL12 + complex(0,1)*iYdL12',
    texname = '\\text{YdL12}' )

YdL13 = Parameter(name='YdL13',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL13 + complex(0,1)*iYdL13',
    texname = '\\text{YdL13}' )

YdL21 = Parameter(name='YdL21',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL21 + complex(0,1)*iYdL21',
    texname = '\\text{YdL21}' )

YdL22 = Parameter(name='YdL22',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL22 + complex(0,1)*iYdL22',
    texname = '\\text{YdL22}' )

YdL23 = Parameter(name='YdL23',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL23 + complex(0,1)*iYdL23',
    texname = '\\text{YdL23}' )

YdL31 = Parameter(name='YdL31',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL31 + complex(0,1)*iYdL31',
    texname = '\\text{YdL31}' )

YdL32 = Parameter(name='YdL32',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL32 + complex(0,1)*iYdL32',
    texname = '\\text{YdL32}' )

YdL33 = Parameter(name='YdL33',
    nature = 'internal',
    type = 'complex',
    value = 'rYdL33 + complex(0,1)*iYdL33',
    texname = '\\text{YdL33}' )

YeL11 = Parameter(name='YeL11',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL11 + complex(0,1)*iYeL11',
    texname = '\\text{YeL11}' )

YeL12 = Parameter(name='YeL12',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL12 + complex(0,1)*iYeL12',
    texname = '\\text{YeL12}' )

YeL13 = Parameter(name='YeL13',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL13 + complex(0,1)*iYeL13',
    texname = '\\text{YeL13}' )

YeL21 = Parameter(name='YeL21',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL21 + complex(0,1)*iYeL21',
    texname = '\\text{YeL21}' )

YeL22 = Parameter(name='YeL22',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL22 + complex(0,1)*iYeL22',
    texname = '\\text{YeL22}' )

YeL23 = Parameter(name='YeL23',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL23 + complex(0,1)*iYeL23',
    texname = '\\text{YeL23}' )

YeL31 = Parameter(name='YeL31',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL31 + complex(0,1)*iYeL31',
    texname = '\\text{YeL31}' )

YeL32 = Parameter(name='YeL32',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL32 + complex(0,1)*iYeL32',
    texname = '\\text{YeL32}' )

YeL33 = Parameter(name='YeL33',
    nature = 'internal',
    type = 'complex',
    value = 'rYeL33 + complex(0,1)*iYeL33',
    texname = '\\text{YeL33}' )

YdR11 = Parameter(name='YdR11',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR11 + complex(0,1)*iYdR11',
    texname = '\\text{YdR11}' )

YdR12 = Parameter(name='YdR12',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR12 + complex(0,1)*iYdR12',
    texname = '\\text{YdR12}' )

YdR13 = Parameter(name='YdR13',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR13 + complex(0,1)*iYdR13',
    texname = '\\text{YdR13}' )

YdR21 = Parameter(name='YdR21',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR21 + complex(0,1)*iYdR21',
    texname = '\\text{YdR21}' )

YdR22 = Parameter(name='YdR22',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR22 + complex(0,1)*iYdR22',
    texname = '\\text{YdR22}' )

YdR23 = Parameter(name='YdR23',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR23 + complex(0,1)*iYdR23',
    texname = '\\text{YdR23}' )

YdR31 = Parameter(name='YdR31',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR31 + complex(0,1)*iYdR31',
    texname = '\\text{YdR31}' )

YdR32 = Parameter(name='YdR32',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR32 + complex(0,1)*iYdR32',
    texname = '\\text{YdR32}' )

YdR33 = Parameter(name='YdR33',
    nature = 'internal',
    type = 'complex',
    value = 'rYdR33 + complex(0,1)*iYdR33',
    texname = '\\text{YdR33}' )

YeR11 = Parameter(name='YeR11',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR11 + complex(0,1)*iYeR11',
    texname = '\\text{YeR11}' )

YeR12 = Parameter(name='YeR12',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR12 + complex(0,1)*iYeR12',
    texname = '\\text{YeR12}' )

YeR13 = Parameter(name='YeR13',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR13 + complex(0,1)*iYeR13',
    texname = '\\text{YeR13}' )

YeR21 = Parameter(name='YeR21',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR21 + complex(0,1)*iYeR21',
    texname = '\\text{YeR21}' )

YeR22 = Parameter(name='YeR22',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR22 + complex(0,1)*iYeR22',
    texname = '\\text{YeR22}' )

YeR23 = Parameter(name='YeR23',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR23 + complex(0,1)*iYeR23',
    texname = '\\text{YeR23}' )

YeR31 = Parameter(name='YeR31',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR31 + complex(0,1)*iYeR31',
    texname = '\\text{YeR31}' )

YeR32 = Parameter(name='YeR32',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR32 + complex(0,1)*iYeR32',
    texname = '\\text{YeR32}' )

YeR33 = Parameter(name='YeR33',
    nature = 'internal',
    type = 'complex',
    value = 'rYeR33 + complex(0,1)*iYeR33',
    texname = '\\text{YeR33}' )

ZDL11 = Parameter(name='ZDL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL11 + complex(0,1)*iZDL11',
    texname = '\\text{ZDL11}' )

ZDL12 = Parameter(name='ZDL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL12 + complex(0,1)*iZDL12',
    texname = '\\text{ZDL12}' )

ZDL13 = Parameter(name='ZDL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL13 + complex(0,1)*iZDL13',
    texname = '\\text{ZDL13}' )

ZDL14 = Parameter(name='ZDL14',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL14 + complex(0,1)*iZDL14',
    texname = '\\text{ZDL14}' )

ZDL15 = Parameter(name='ZDL15',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL15 + complex(0,1)*iZDL15',
    texname = '\\text{ZDL15}' )

ZDL16 = Parameter(name='ZDL16',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL16 + complex(0,1)*iZDL16',
    texname = '\\text{ZDL16}' )

ZDL21 = Parameter(name='ZDL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL21 + complex(0,1)*iZDL21',
    texname = '\\text{ZDL21}' )

ZDL22 = Parameter(name='ZDL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL22 + complex(0,1)*iZDL22',
    texname = '\\text{ZDL22}' )

ZDL23 = Parameter(name='ZDL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL23 + complex(0,1)*iZDL23',
    texname = '\\text{ZDL23}' )

ZDL24 = Parameter(name='ZDL24',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL24 + complex(0,1)*iZDL24',
    texname = '\\text{ZDL24}' )

ZDL25 = Parameter(name='ZDL25',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL25 + complex(0,1)*iZDL25',
    texname = '\\text{ZDL25}' )

ZDL26 = Parameter(name='ZDL26',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL26 + complex(0,1)*iZDL26',
    texname = '\\text{ZDL26}' )

ZDL31 = Parameter(name='ZDL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL31 + complex(0,1)*iZDL31',
    texname = '\\text{ZDL31}' )

ZDL32 = Parameter(name='ZDL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL32 + complex(0,1)*iZDL32',
    texname = '\\text{ZDL32}' )

ZDL33 = Parameter(name='ZDL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL33 + complex(0,1)*iZDL33',
    texname = '\\text{ZDL33}' )

ZDL34 = Parameter(name='ZDL34',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL34 + complex(0,1)*iZDL34',
    texname = '\\text{ZDL34}' )

ZDL35 = Parameter(name='ZDL35',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL35 + complex(0,1)*iZDL35',
    texname = '\\text{ZDL35}' )

ZDL36 = Parameter(name='ZDL36',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL36 + complex(0,1)*iZDL36',
    texname = '\\text{ZDL36}' )

ZDL41 = Parameter(name='ZDL41',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL41 + complex(0,1)*iZDL41',
    texname = '\\text{ZDL41}' )

ZDL42 = Parameter(name='ZDL42',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL42 + complex(0,1)*iZDL42',
    texname = '\\text{ZDL42}' )

ZDL43 = Parameter(name='ZDL43',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL43 + complex(0,1)*iZDL43',
    texname = '\\text{ZDL43}' )

ZDL44 = Parameter(name='ZDL44',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL44 + complex(0,1)*iZDL44',
    texname = '\\text{ZDL44}' )

ZDL45 = Parameter(name='ZDL45',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL45 + complex(0,1)*iZDL45',
    texname = '\\text{ZDL45}' )

ZDL46 = Parameter(name='ZDL46',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL46 + complex(0,1)*iZDL46',
    texname = '\\text{ZDL46}' )

ZDL51 = Parameter(name='ZDL51',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL51 + complex(0,1)*iZDL51',
    texname = '\\text{ZDL51}' )

ZDL52 = Parameter(name='ZDL52',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL52 + complex(0,1)*iZDL52',
    texname = '\\text{ZDL52}' )

ZDL53 = Parameter(name='ZDL53',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL53 + complex(0,1)*iZDL53',
    texname = '\\text{ZDL53}' )

ZDL54 = Parameter(name='ZDL54',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL54 + complex(0,1)*iZDL54',
    texname = '\\text{ZDL54}' )

ZDL55 = Parameter(name='ZDL55',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL55 + complex(0,1)*iZDL55',
    texname = '\\text{ZDL55}' )

ZDL56 = Parameter(name='ZDL56',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL56 + complex(0,1)*iZDL56',
    texname = '\\text{ZDL56}' )

ZDL61 = Parameter(name='ZDL61',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL61 + complex(0,1)*iZDL61',
    texname = '\\text{ZDL61}' )

ZDL62 = Parameter(name='ZDL62',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL62 + complex(0,1)*iZDL62',
    texname = '\\text{ZDL62}' )

ZDL63 = Parameter(name='ZDL63',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL63 + complex(0,1)*iZDL63',
    texname = '\\text{ZDL63}' )

ZDL64 = Parameter(name='ZDL64',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL64 + complex(0,1)*iZDL64',
    texname = '\\text{ZDL64}' )

ZDL65 = Parameter(name='ZDL65',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL65 + complex(0,1)*iZDL65',
    texname = '\\text{ZDL65}' )

ZDL66 = Parameter(name='ZDL66',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL66 + complex(0,1)*iZDL66',
    texname = '\\text{ZDL66}' )

ZDR11 = Parameter(name='ZDR11',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR11 + complex(0,1)*iZDR11',
    texname = '\\text{ZDR11}' )

ZDR12 = Parameter(name='ZDR12',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR12 + complex(0,1)*iZDR12',
    texname = '\\text{ZDR12}' )

ZDR13 = Parameter(name='ZDR13',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR13 + complex(0,1)*iZDR13',
    texname = '\\text{ZDR13}' )

ZDR14 = Parameter(name='ZDR14',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR14 + complex(0,1)*iZDR14',
    texname = '\\text{ZDR14}' )

ZDR15 = Parameter(name='ZDR15',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR15 + complex(0,1)*iZDR15',
    texname = '\\text{ZDR15}' )

ZDR16 = Parameter(name='ZDR16',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR16 + complex(0,1)*iZDR16',
    texname = '\\text{ZDR16}' )

ZDR21 = Parameter(name='ZDR21',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR21 + complex(0,1)*iZDR21',
    texname = '\\text{ZDR21}' )

ZDR22 = Parameter(name='ZDR22',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR22 + complex(0,1)*iZDR22',
    texname = '\\text{ZDR22}' )

ZDR23 = Parameter(name='ZDR23',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR23 + complex(0,1)*iZDR23',
    texname = '\\text{ZDR23}' )

ZDR24 = Parameter(name='ZDR24',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR24 + complex(0,1)*iZDR24',
    texname = '\\text{ZDR24}' )

ZDR25 = Parameter(name='ZDR25',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR25 + complex(0,1)*iZDR25',
    texname = '\\text{ZDR25}' )

ZDR26 = Parameter(name='ZDR26',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR26 + complex(0,1)*iZDR26',
    texname = '\\text{ZDR26}' )

ZDR31 = Parameter(name='ZDR31',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR31 + complex(0,1)*iZDR31',
    texname = '\\text{ZDR31}' )

ZDR32 = Parameter(name='ZDR32',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR32 + complex(0,1)*iZDR32',
    texname = '\\text{ZDR32}' )

ZDR33 = Parameter(name='ZDR33',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR33 + complex(0,1)*iZDR33',
    texname = '\\text{ZDR33}' )

ZDR34 = Parameter(name='ZDR34',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR34 + complex(0,1)*iZDR34',
    texname = '\\text{ZDR34}' )

ZDR35 = Parameter(name='ZDR35',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR35 + complex(0,1)*iZDR35',
    texname = '\\text{ZDR35}' )

ZDR36 = Parameter(name='ZDR36',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR36 + complex(0,1)*iZDR36',
    texname = '\\text{ZDR36}' )

ZDR41 = Parameter(name='ZDR41',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR41 + complex(0,1)*iZDR41',
    texname = '\\text{ZDR41}' )

ZDR42 = Parameter(name='ZDR42',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR42 + complex(0,1)*iZDR42',
    texname = '\\text{ZDR42}' )

ZDR43 = Parameter(name='ZDR43',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR43 + complex(0,1)*iZDR43',
    texname = '\\text{ZDR43}' )

ZDR44 = Parameter(name='ZDR44',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR44 + complex(0,1)*iZDR44',
    texname = '\\text{ZDR44}' )

ZDR45 = Parameter(name='ZDR45',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR45 + complex(0,1)*iZDR45',
    texname = '\\text{ZDR45}' )

ZDR46 = Parameter(name='ZDR46',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR46 + complex(0,1)*iZDR46',
    texname = '\\text{ZDR46}' )

ZDR51 = Parameter(name='ZDR51',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR51 + complex(0,1)*iZDR51',
    texname = '\\text{ZDR51}' )

ZDR52 = Parameter(name='ZDR52',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR52 + complex(0,1)*iZDR52',
    texname = '\\text{ZDR52}' )

ZDR53 = Parameter(name='ZDR53',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR53 + complex(0,1)*iZDR53',
    texname = '\\text{ZDR53}' )

ZDR54 = Parameter(name='ZDR54',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR54 + complex(0,1)*iZDR54',
    texname = '\\text{ZDR54}' )

ZDR55 = Parameter(name='ZDR55',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR55 + complex(0,1)*iZDR55',
    texname = '\\text{ZDR55}' )

ZDR56 = Parameter(name='ZDR56',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR56 + complex(0,1)*iZDR56',
    texname = '\\text{ZDR56}' )

ZDR61 = Parameter(name='ZDR61',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR61 + complex(0,1)*iZDR61',
    texname = '\\text{ZDR61}' )

ZDR62 = Parameter(name='ZDR62',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR62 + complex(0,1)*iZDR62',
    texname = '\\text{ZDR62}' )

ZDR63 = Parameter(name='ZDR63',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR63 + complex(0,1)*iZDR63',
    texname = '\\text{ZDR63}' )

ZDR64 = Parameter(name='ZDR64',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR64 + complex(0,1)*iZDR64',
    texname = '\\text{ZDR64}' )

ZDR65 = Parameter(name='ZDR65',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR65 + complex(0,1)*iZDR65',
    texname = '\\text{ZDR65}' )

ZDR66 = Parameter(name='ZDR66',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR66 + complex(0,1)*iZDR66',
    texname = '\\text{ZDR66}' )

ZUL11 = Parameter(name='ZUL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL11 + complex(0,1)*iZUL11',
    texname = '\\text{ZUL11}' )

ZUL12 = Parameter(name='ZUL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL12 + complex(0,1)*iZUL12',
    texname = '\\text{ZUL12}' )

ZUL13 = Parameter(name='ZUL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL13 + complex(0,1)*iZUL13',
    texname = '\\text{ZUL13}' )

ZUL14 = Parameter(name='ZUL14',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL14 + complex(0,1)*iZUL14',
    texname = '\\text{ZUL14}' )

ZUL15 = Parameter(name='ZUL15',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL15 + complex(0,1)*iZUL15',
    texname = '\\text{ZUL15}' )

ZUL16 = Parameter(name='ZUL16',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL16 + complex(0,1)*iZUL16',
    texname = '\\text{ZUL16}' )

ZUL21 = Parameter(name='ZUL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL21 + complex(0,1)*iZUL21',
    texname = '\\text{ZUL21}' )

ZUL22 = Parameter(name='ZUL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL22 + complex(0,1)*iZUL22',
    texname = '\\text{ZUL22}' )

ZUL23 = Parameter(name='ZUL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL23 + complex(0,1)*iZUL23',
    texname = '\\text{ZUL23}' )

ZUL24 = Parameter(name='ZUL24',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL24 + complex(0,1)*iZUL24',
    texname = '\\text{ZUL24}' )

ZUL25 = Parameter(name='ZUL25',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL25 + complex(0,1)*iZUL25',
    texname = '\\text{ZUL25}' )

ZUL26 = Parameter(name='ZUL26',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL26 + complex(0,1)*iZUL26',
    texname = '\\text{ZUL26}' )

ZUL31 = Parameter(name='ZUL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL31 + complex(0,1)*iZUL31',
    texname = '\\text{ZUL31}' )

ZUL32 = Parameter(name='ZUL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL32 + complex(0,1)*iZUL32',
    texname = '\\text{ZUL32}' )

ZUL33 = Parameter(name='ZUL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL33 + complex(0,1)*iZUL33',
    texname = '\\text{ZUL33}' )

ZUL34 = Parameter(name='ZUL34',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL34 + complex(0,1)*iZUL34',
    texname = '\\text{ZUL34}' )

ZUL35 = Parameter(name='ZUL35',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL35 + complex(0,1)*iZUL35',
    texname = '\\text{ZUL35}' )

ZUL36 = Parameter(name='ZUL36',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL36 + complex(0,1)*iZUL36',
    texname = '\\text{ZUL36}' )

ZUL41 = Parameter(name='ZUL41',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL41 + complex(0,1)*iZUL41',
    texname = '\\text{ZUL41}' )

ZUL42 = Parameter(name='ZUL42',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL42 + complex(0,1)*iZUL42',
    texname = '\\text{ZUL42}' )

ZUL43 = Parameter(name='ZUL43',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL43 + complex(0,1)*iZUL43',
    texname = '\\text{ZUL43}' )

ZUL44 = Parameter(name='ZUL44',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL44 + complex(0,1)*iZUL44',
    texname = '\\text{ZUL44}' )

ZUL45 = Parameter(name='ZUL45',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL45 + complex(0,1)*iZUL45',
    texname = '\\text{ZUL45}' )

ZUL46 = Parameter(name='ZUL46',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL46 + complex(0,1)*iZUL46',
    texname = '\\text{ZUL46}' )

ZUL51 = Parameter(name='ZUL51',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL51 + complex(0,1)*iZUL51',
    texname = '\\text{ZUL51}' )

ZUL52 = Parameter(name='ZUL52',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL52 + complex(0,1)*iZUL52',
    texname = '\\text{ZUL52}' )

ZUL53 = Parameter(name='ZUL53',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL53 + complex(0,1)*iZUL53',
    texname = '\\text{ZUL53}' )

ZUL54 = Parameter(name='ZUL54',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL54 + complex(0,1)*iZUL54',
    texname = '\\text{ZUL54}' )

ZUL55 = Parameter(name='ZUL55',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL55 + complex(0,1)*iZUL55',
    texname = '\\text{ZUL55}' )

ZUL56 = Parameter(name='ZUL56',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL56 + complex(0,1)*iZUL56',
    texname = '\\text{ZUL56}' )

ZUL61 = Parameter(name='ZUL61',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL61 + complex(0,1)*iZUL61',
    texname = '\\text{ZUL61}' )

ZUL62 = Parameter(name='ZUL62',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL62 + complex(0,1)*iZUL62',
    texname = '\\text{ZUL62}' )

ZUL63 = Parameter(name='ZUL63',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL63 + complex(0,1)*iZUL63',
    texname = '\\text{ZUL63}' )

ZUL64 = Parameter(name='ZUL64',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL64 + complex(0,1)*iZUL64',
    texname = '\\text{ZUL64}' )

ZUL65 = Parameter(name='ZUL65',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL65 + complex(0,1)*iZUL65',
    texname = '\\text{ZUL65}' )

ZUL66 = Parameter(name='ZUL66',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL66 + complex(0,1)*iZUL66',
    texname = '\\text{ZUL66}' )

ZUR11 = Parameter(name='ZUR11',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR11 + complex(0,1)*iZUR11',
    texname = '\\text{ZUR11}' )

ZUR12 = Parameter(name='ZUR12',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR12 + complex(0,1)*iZUR12',
    texname = '\\text{ZUR12}' )

ZUR13 = Parameter(name='ZUR13',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR13 + complex(0,1)*iZUR13',
    texname = '\\text{ZUR13}' )

ZUR14 = Parameter(name='ZUR14',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR14 + complex(0,1)*iZUR14',
    texname = '\\text{ZUR14}' )

ZUR15 = Parameter(name='ZUR15',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR15 + complex(0,1)*iZUR15',
    texname = '\\text{ZUR15}' )

ZUR16 = Parameter(name='ZUR16',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR16 + complex(0,1)*iZUR16',
    texname = '\\text{ZUR16}' )

ZUR21 = Parameter(name='ZUR21',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR21 + complex(0,1)*iZUR21',
    texname = '\\text{ZUR21}' )

ZUR22 = Parameter(name='ZUR22',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR22 + complex(0,1)*iZUR22',
    texname = '\\text{ZUR22}' )

ZUR23 = Parameter(name='ZUR23',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR23 + complex(0,1)*iZUR23',
    texname = '\\text{ZUR23}' )

ZUR24 = Parameter(name='ZUR24',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR24 + complex(0,1)*iZUR24',
    texname = '\\text{ZUR24}' )

ZUR25 = Parameter(name='ZUR25',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR25 + complex(0,1)*iZUR25',
    texname = '\\text{ZUR25}' )

ZUR26 = Parameter(name='ZUR26',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR26 + complex(0,1)*iZUR26',
    texname = '\\text{ZUR26}' )

ZUR31 = Parameter(name='ZUR31',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR31 + complex(0,1)*iZUR31',
    texname = '\\text{ZUR31}' )

ZUR32 = Parameter(name='ZUR32',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR32 + complex(0,1)*iZUR32',
    texname = '\\text{ZUR32}' )

ZUR33 = Parameter(name='ZUR33',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR33 + complex(0,1)*iZUR33',
    texname = '\\text{ZUR33}' )

ZUR34 = Parameter(name='ZUR34',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR34 + complex(0,1)*iZUR34',
    texname = '\\text{ZUR34}' )

ZUR35 = Parameter(name='ZUR35',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR35 + complex(0,1)*iZUR35',
    texname = '\\text{ZUR35}' )

ZUR36 = Parameter(name='ZUR36',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR36 + complex(0,1)*iZUR36',
    texname = '\\text{ZUR36}' )

ZUR41 = Parameter(name='ZUR41',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR41 + complex(0,1)*iZUR41',
    texname = '\\text{ZUR41}' )

ZUR42 = Parameter(name='ZUR42',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR42 + complex(0,1)*iZUR42',
    texname = '\\text{ZUR42}' )

ZUR43 = Parameter(name='ZUR43',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR43 + complex(0,1)*iZUR43',
    texname = '\\text{ZUR43}' )

ZUR44 = Parameter(name='ZUR44',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR44 + complex(0,1)*iZUR44',
    texname = '\\text{ZUR44}' )

ZUR45 = Parameter(name='ZUR45',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR45 + complex(0,1)*iZUR45',
    texname = '\\text{ZUR45}' )

ZUR46 = Parameter(name='ZUR46',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR46 + complex(0,1)*iZUR46',
    texname = '\\text{ZUR46}' )

ZUR51 = Parameter(name='ZUR51',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR51 + complex(0,1)*iZUR51',
    texname = '\\text{ZUR51}' )

ZUR52 = Parameter(name='ZUR52',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR52 + complex(0,1)*iZUR52',
    texname = '\\text{ZUR52}' )

ZUR53 = Parameter(name='ZUR53',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR53 + complex(0,1)*iZUR53',
    texname = '\\text{ZUR53}' )

ZUR54 = Parameter(name='ZUR54',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR54 + complex(0,1)*iZUR54',
    texname = '\\text{ZUR54}' )

ZUR55 = Parameter(name='ZUR55',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR55 + complex(0,1)*iZUR55',
    texname = '\\text{ZUR55}' )

ZUR56 = Parameter(name='ZUR56',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR56 + complex(0,1)*iZUR56',
    texname = '\\text{ZUR56}' )

ZUR61 = Parameter(name='ZUR61',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR61 + complex(0,1)*iZUR61',
    texname = '\\text{ZUR61}' )

ZUR62 = Parameter(name='ZUR62',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR62 + complex(0,1)*iZUR62',
    texname = '\\text{ZUR62}' )

ZUR63 = Parameter(name='ZUR63',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR63 + complex(0,1)*iZUR63',
    texname = '\\text{ZUR63}' )

ZUR64 = Parameter(name='ZUR64',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR64 + complex(0,1)*iZUR64',
    texname = '\\text{ZUR64}' )

ZUR65 = Parameter(name='ZUR65',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR65 + complex(0,1)*iZUR65',
    texname = '\\text{ZUR65}' )

ZUR66 = Parameter(name='ZUR66',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR66 + complex(0,1)*iZUR66',
    texname = '\\text{ZUR66}' )

ZEL11 = Parameter(name='ZEL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL11 + complex(0,1)*iZEL11',
    texname = '\\text{ZEL11}' )

ZEL12 = Parameter(name='ZEL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL12 + complex(0,1)*iZEL12',
    texname = '\\text{ZEL12}' )

ZEL13 = Parameter(name='ZEL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL13 + complex(0,1)*iZEL13',
    texname = '\\text{ZEL13}' )

ZEL14 = Parameter(name='ZEL14',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL14 + complex(0,1)*iZEL14',
    texname = '\\text{ZEL14}' )

ZEL15 = Parameter(name='ZEL15',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL15 + complex(0,1)*iZEL15',
    texname = '\\text{ZEL15}' )

ZEL16 = Parameter(name='ZEL16',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL16 + complex(0,1)*iZEL16',
    texname = '\\text{ZEL16}' )

ZEL21 = Parameter(name='ZEL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL21 + complex(0,1)*iZEL21',
    texname = '\\text{ZEL21}' )

ZEL22 = Parameter(name='ZEL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL22 + complex(0,1)*iZEL22',
    texname = '\\text{ZEL22}' )

ZEL23 = Parameter(name='ZEL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL23 + complex(0,1)*iZEL23',
    texname = '\\text{ZEL23}' )

ZEL24 = Parameter(name='ZEL24',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL24 + complex(0,1)*iZEL24',
    texname = '\\text{ZEL24}' )

ZEL25 = Parameter(name='ZEL25',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL25 + complex(0,1)*iZEL25',
    texname = '\\text{ZEL25}' )

ZEL26 = Parameter(name='ZEL26',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL26 + complex(0,1)*iZEL26',
    texname = '\\text{ZEL26}' )

ZEL31 = Parameter(name='ZEL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL31 + complex(0,1)*iZEL31',
    texname = '\\text{ZEL31}' )

ZEL32 = Parameter(name='ZEL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL32 + complex(0,1)*iZEL32',
    texname = '\\text{ZEL32}' )

ZEL33 = Parameter(name='ZEL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL33 + complex(0,1)*iZEL33',
    texname = '\\text{ZEL33}' )

ZEL34 = Parameter(name='ZEL34',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL34 + complex(0,1)*iZEL34',
    texname = '\\text{ZEL34}' )

ZEL35 = Parameter(name='ZEL35',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL35 + complex(0,1)*iZEL35',
    texname = '\\text{ZEL35}' )

ZEL36 = Parameter(name='ZEL36',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL36 + complex(0,1)*iZEL36',
    texname = '\\text{ZEL36}' )

ZEL41 = Parameter(name='ZEL41',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL41 + complex(0,1)*iZEL41',
    texname = '\\text{ZEL41}' )

ZEL42 = Parameter(name='ZEL42',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL42 + complex(0,1)*iZEL42',
    texname = '\\text{ZEL42}' )

ZEL43 = Parameter(name='ZEL43',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL43 + complex(0,1)*iZEL43',
    texname = '\\text{ZEL43}' )

ZEL44 = Parameter(name='ZEL44',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL44 + complex(0,1)*iZEL44',
    texname = '\\text{ZEL44}' )

ZEL45 = Parameter(name='ZEL45',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL45 + complex(0,1)*iZEL45',
    texname = '\\text{ZEL45}' )

ZEL46 = Parameter(name='ZEL46',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL46 + complex(0,1)*iZEL46',
    texname = '\\text{ZEL46}' )

ZEL51 = Parameter(name='ZEL51',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL51 + complex(0,1)*iZEL51',
    texname = '\\text{ZEL51}' )

ZEL52 = Parameter(name='ZEL52',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL52 + complex(0,1)*iZEL52',
    texname = '\\text{ZEL52}' )

ZEL53 = Parameter(name='ZEL53',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL53 + complex(0,1)*iZEL53',
    texname = '\\text{ZEL53}' )

ZEL54 = Parameter(name='ZEL54',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL54 + complex(0,1)*iZEL54',
    texname = '\\text{ZEL54}' )

ZEL55 = Parameter(name='ZEL55',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL55 + complex(0,1)*iZEL55',
    texname = '\\text{ZEL55}' )

ZEL56 = Parameter(name='ZEL56',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL56 + complex(0,1)*iZEL56',
    texname = '\\text{ZEL56}' )

ZEL61 = Parameter(name='ZEL61',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL61 + complex(0,1)*iZEL61',
    texname = '\\text{ZEL61}' )

ZEL62 = Parameter(name='ZEL62',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL62 + complex(0,1)*iZEL62',
    texname = '\\text{ZEL62}' )

ZEL63 = Parameter(name='ZEL63',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL63 + complex(0,1)*iZEL63',
    texname = '\\text{ZEL63}' )

ZEL64 = Parameter(name='ZEL64',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL64 + complex(0,1)*iZEL64',
    texname = '\\text{ZEL64}' )

ZEL65 = Parameter(name='ZEL65',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL65 + complex(0,1)*iZEL65',
    texname = '\\text{ZEL65}' )

ZEL66 = Parameter(name='ZEL66',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL66 + complex(0,1)*iZEL66',
    texname = '\\text{ZEL66}' )

ZER11 = Parameter(name='ZER11',
    nature = 'internal',
    type = 'complex',
    value = 'rZER11 + complex(0,1)*iZER11',
    texname = '\\text{ZER11}' )

ZER12 = Parameter(name='ZER12',
    nature = 'internal',
    type = 'complex',
    value = 'rZER12 + complex(0,1)*iZER12',
    texname = '\\text{ZER12}' )

ZER13 = Parameter(name='ZER13',
    nature = 'internal',
    type = 'complex',
    value = 'rZER13 + complex(0,1)*iZER13',
    texname = '\\text{ZER13}' )

ZER14 = Parameter(name='ZER14',
    nature = 'internal',
    type = 'complex',
    value = 'rZER14 + complex(0,1)*iZER14',
    texname = '\\text{ZER14}' )

ZER15 = Parameter(name='ZER15',
    nature = 'internal',
    type = 'complex',
    value = 'rZER15 + complex(0,1)*iZER15',
    texname = '\\text{ZER15}' )

ZER16 = Parameter(name='ZER16',
    nature = 'internal',
    type = 'complex',
    value = 'rZER16 + complex(0,1)*iZER16',
    texname = '\\text{ZER16}' )

ZER21 = Parameter(name='ZER21',
    nature = 'internal',
    type = 'complex',
    value = 'rZER21 + complex(0,1)*iZER21',
    texname = '\\text{ZER21}' )

ZER22 = Parameter(name='ZER22',
    nature = 'internal',
    type = 'complex',
    value = 'rZER22 + complex(0,1)*iZER22',
    texname = '\\text{ZER22}' )

ZER23 = Parameter(name='ZER23',
    nature = 'internal',
    type = 'complex',
    value = 'rZER23 + complex(0,1)*iZER23',
    texname = '\\text{ZER23}' )

ZER24 = Parameter(name='ZER24',
    nature = 'internal',
    type = 'complex',
    value = 'rZER24 + complex(0,1)*iZER24',
    texname = '\\text{ZER24}' )

ZER25 = Parameter(name='ZER25',
    nature = 'internal',
    type = 'complex',
    value = 'rZER25 + complex(0,1)*iZER25',
    texname = '\\text{ZER25}' )

ZER26 = Parameter(name='ZER26',
    nature = 'internal',
    type = 'complex',
    value = 'rZER26 + complex(0,1)*iZER26',
    texname = '\\text{ZER26}' )

ZER31 = Parameter(name='ZER31',
    nature = 'internal',
    type = 'complex',
    value = 'rZER31 + complex(0,1)*iZER31',
    texname = '\\text{ZER31}' )

ZER32 = Parameter(name='ZER32',
    nature = 'internal',
    type = 'complex',
    value = 'rZER32 + complex(0,1)*iZER32',
    texname = '\\text{ZER32}' )

ZER33 = Parameter(name='ZER33',
    nature = 'internal',
    type = 'complex',
    value = 'rZER33 + complex(0,1)*iZER33',
    texname = '\\text{ZER33}' )

ZER34 = Parameter(name='ZER34',
    nature = 'internal',
    type = 'complex',
    value = 'rZER34 + complex(0,1)*iZER34',
    texname = '\\text{ZER34}' )

ZER35 = Parameter(name='ZER35',
    nature = 'internal',
    type = 'complex',
    value = 'rZER35 + complex(0,1)*iZER35',
    texname = '\\text{ZER35}' )

ZER36 = Parameter(name='ZER36',
    nature = 'internal',
    type = 'complex',
    value = 'rZER36 + complex(0,1)*iZER36',
    texname = '\\text{ZER36}' )

ZER41 = Parameter(name='ZER41',
    nature = 'internal',
    type = 'complex',
    value = 'rZER41 + complex(0,1)*iZER41',
    texname = '\\text{ZER41}' )

ZER42 = Parameter(name='ZER42',
    nature = 'internal',
    type = 'complex',
    value = 'rZER42 + complex(0,1)*iZER42',
    texname = '\\text{ZER42}' )

ZER43 = Parameter(name='ZER43',
    nature = 'internal',
    type = 'complex',
    value = 'rZER43 + complex(0,1)*iZER43',
    texname = '\\text{ZER43}' )

ZER44 = Parameter(name='ZER44',
    nature = 'internal',
    type = 'complex',
    value = 'rZER44 + complex(0,1)*iZER44',
    texname = '\\text{ZER44}' )

ZER45 = Parameter(name='ZER45',
    nature = 'internal',
    type = 'complex',
    value = 'rZER45 + complex(0,1)*iZER45',
    texname = '\\text{ZER45}' )

ZER46 = Parameter(name='ZER46',
    nature = 'internal',
    type = 'complex',
    value = 'rZER46 + complex(0,1)*iZER46',
    texname = '\\text{ZER46}' )

ZER51 = Parameter(name='ZER51',
    nature = 'internal',
    type = 'complex',
    value = 'rZER51 + complex(0,1)*iZER51',
    texname = '\\text{ZER51}' )

ZER52 = Parameter(name='ZER52',
    nature = 'internal',
    type = 'complex',
    value = 'rZER52 + complex(0,1)*iZER52',
    texname = '\\text{ZER52}' )

ZER53 = Parameter(name='ZER53',
    nature = 'internal',
    type = 'complex',
    value = 'rZER53 + complex(0,1)*iZER53',
    texname = '\\text{ZER53}' )

ZER54 = Parameter(name='ZER54',
    nature = 'internal',
    type = 'complex',
    value = 'rZER54 + complex(0,1)*iZER54',
    texname = '\\text{ZER54}' )

ZER55 = Parameter(name='ZER55',
    nature = 'internal',
    type = 'complex',
    value = 'rZER55 + complex(0,1)*iZER55',
    texname = '\\text{ZER55}' )

ZER56 = Parameter(name='ZER56',
    nature = 'internal',
    type = 'complex',
    value = 'rZER56 + complex(0,1)*iZER56',
    texname = '\\text{ZER56}' )

ZER61 = Parameter(name='ZER61',
    nature = 'internal',
    type = 'complex',
    value = 'rZER61 + complex(0,1)*iZER61',
    texname = '\\text{ZER61}' )

ZER62 = Parameter(name='ZER62',
    nature = 'internal',
    type = 'complex',
    value = 'rZER62 + complex(0,1)*iZER62',
    texname = '\\text{ZER62}' )

ZER63 = Parameter(name='ZER63',
    nature = 'internal',
    type = 'complex',
    value = 'rZER63 + complex(0,1)*iZER63',
    texname = '\\text{ZER63}' )

ZER64 = Parameter(name='ZER64',
    nature = 'internal',
    type = 'complex',
    value = 'rZER64 + complex(0,1)*iZER64',
    texname = '\\text{ZER64}' )

ZER65 = Parameter(name='ZER65',
    nature = 'internal',
    type = 'complex',
    value = 'rZER65 + complex(0,1)*iZER65',
    texname = '\\text{ZER65}' )

ZER66 = Parameter(name='ZER66',
    nature = 'internal',
    type = 'complex',
    value = 'rZER66 + complex(0,1)*iZER66',
    texname = '\\text{ZER66}' )

UV11 = Parameter(name='UV11',
    nature = 'internal',
    type = 'complex',
    value = 'rUV11 + complex(0,1)*iUV11',
    texname = '\\text{UV11}' )

UV12 = Parameter(name='UV12',
    nature = 'internal',
    type = 'complex',
    value = 'rUV12 + complex(0,1)*iUV12',
    texname = '\\text{UV12}' )

UV13 = Parameter(name='UV13',
    nature = 'internal',
    type = 'complex',
    value = 'rUV13 + complex(0,1)*iUV13',
    texname = '\\text{UV13}' )

UV14 = Parameter(name='UV14',
    nature = 'internal',
    type = 'complex',
    value = 'rUV14 + complex(0,1)*iUV14',
    texname = '\\text{UV14}' )

UV15 = Parameter(name='UV15',
    nature = 'internal',
    type = 'complex',
    value = 'rUV15 + complex(0,1)*iUV15',
    texname = '\\text{UV15}' )

UV16 = Parameter(name='UV16',
    nature = 'internal',
    type = 'complex',
    value = 'rUV16 + complex(0,1)*iUV16',
    texname = '\\text{UV16}' )

UV17 = Parameter(name='UV17',
    nature = 'internal',
    type = 'complex',
    value = 'rUV17 + complex(0,1)*iUV17',
    texname = '\\text{UV17}' )

UV18 = Parameter(name='UV18',
    nature = 'internal',
    type = 'complex',
    value = 'rUV18 + complex(0,1)*iUV18',
    texname = '\\text{UV18}' )

UV19 = Parameter(name='UV19',
    nature = 'internal',
    type = 'complex',
    value = 'rUV19 + complex(0,1)*iUV19',
    texname = '\\text{UV19}' )

UV21 = Parameter(name='UV21',
    nature = 'internal',
    type = 'complex',
    value = 'rUV21 + complex(0,1)*iUV21',
    texname = '\\text{UV21}' )

UV22 = Parameter(name='UV22',
    nature = 'internal',
    type = 'complex',
    value = 'rUV22 + complex(0,1)*iUV22',
    texname = '\\text{UV22}' )

UV23 = Parameter(name='UV23',
    nature = 'internal',
    type = 'complex',
    value = 'rUV23 + complex(0,1)*iUV23',
    texname = '\\text{UV23}' )

UV24 = Parameter(name='UV24',
    nature = 'internal',
    type = 'complex',
    value = 'rUV24 + complex(0,1)*iUV24',
    texname = '\\text{UV24}' )

UV25 = Parameter(name='UV25',
    nature = 'internal',
    type = 'complex',
    value = 'rUV25 + complex(0,1)*iUV25',
    texname = '\\text{UV25}' )

UV26 = Parameter(name='UV26',
    nature = 'internal',
    type = 'complex',
    value = 'rUV26 + complex(0,1)*iUV26',
    texname = '\\text{UV26}' )

UV27 = Parameter(name='UV27',
    nature = 'internal',
    type = 'complex',
    value = 'rUV27 + complex(0,1)*iUV27',
    texname = '\\text{UV27}' )

UV28 = Parameter(name='UV28',
    nature = 'internal',
    type = 'complex',
    value = 'rUV28 + complex(0,1)*iUV28',
    texname = '\\text{UV28}' )

UV29 = Parameter(name='UV29',
    nature = 'internal',
    type = 'complex',
    value = 'rUV29 + complex(0,1)*iUV29',
    texname = '\\text{UV29}' )

UV31 = Parameter(name='UV31',
    nature = 'internal',
    type = 'complex',
    value = 'rUV31 + complex(0,1)*iUV31',
    texname = '\\text{UV31}' )

UV32 = Parameter(name='UV32',
    nature = 'internal',
    type = 'complex',
    value = 'rUV32 + complex(0,1)*iUV32',
    texname = '\\text{UV32}' )

UV33 = Parameter(name='UV33',
    nature = 'internal',
    type = 'complex',
    value = 'rUV33 + complex(0,1)*iUV33',
    texname = '\\text{UV33}' )

UV34 = Parameter(name='UV34',
    nature = 'internal',
    type = 'complex',
    value = 'rUV34 + complex(0,1)*iUV34',
    texname = '\\text{UV34}' )

UV35 = Parameter(name='UV35',
    nature = 'internal',
    type = 'complex',
    value = 'rUV35 + complex(0,1)*iUV35',
    texname = '\\text{UV35}' )

UV36 = Parameter(name='UV36',
    nature = 'internal',
    type = 'complex',
    value = 'rUV36 + complex(0,1)*iUV36',
    texname = '\\text{UV36}' )

UV37 = Parameter(name='UV37',
    nature = 'internal',
    type = 'complex',
    value = 'rUV37 + complex(0,1)*iUV37',
    texname = '\\text{UV37}' )

UV38 = Parameter(name='UV38',
    nature = 'internal',
    type = 'complex',
    value = 'rUV38 + complex(0,1)*iUV38',
    texname = '\\text{UV38}' )

UV39 = Parameter(name='UV39',
    nature = 'internal',
    type = 'complex',
    value = 'rUV39 + complex(0,1)*iUV39',
    texname = '\\text{UV39}' )

UV41 = Parameter(name='UV41',
    nature = 'internal',
    type = 'complex',
    value = 'rUV41 + complex(0,1)*iUV41',
    texname = '\\text{UV41}' )

UV42 = Parameter(name='UV42',
    nature = 'internal',
    type = 'complex',
    value = 'rUV42 + complex(0,1)*iUV42',
    texname = '\\text{UV42}' )

UV43 = Parameter(name='UV43',
    nature = 'internal',
    type = 'complex',
    value = 'rUV43 + complex(0,1)*iUV43',
    texname = '\\text{UV43}' )

UV44 = Parameter(name='UV44',
    nature = 'internal',
    type = 'complex',
    value = 'rUV44 + complex(0,1)*iUV44',
    texname = '\\text{UV44}' )

UV45 = Parameter(name='UV45',
    nature = 'internal',
    type = 'complex',
    value = 'rUV45 + complex(0,1)*iUV45',
    texname = '\\text{UV45}' )

UV46 = Parameter(name='UV46',
    nature = 'internal',
    type = 'complex',
    value = 'rUV46 + complex(0,1)*iUV46',
    texname = '\\text{UV46}' )

UV47 = Parameter(name='UV47',
    nature = 'internal',
    type = 'complex',
    value = 'rUV47 + complex(0,1)*iUV47',
    texname = '\\text{UV47}' )

UV48 = Parameter(name='UV48',
    nature = 'internal',
    type = 'complex',
    value = 'rUV48 + complex(0,1)*iUV48',
    texname = '\\text{UV48}' )

UV49 = Parameter(name='UV49',
    nature = 'internal',
    type = 'complex',
    value = 'rUV49 + complex(0,1)*iUV49',
    texname = '\\text{UV49}' )

UV51 = Parameter(name='UV51',
    nature = 'internal',
    type = 'complex',
    value = 'rUV51 + complex(0,1)*iUV51',
    texname = '\\text{UV51}' )

UV52 = Parameter(name='UV52',
    nature = 'internal',
    type = 'complex',
    value = 'rUV52 + complex(0,1)*iUV52',
    texname = '\\text{UV52}' )

UV53 = Parameter(name='UV53',
    nature = 'internal',
    type = 'complex',
    value = 'rUV53 + complex(0,1)*iUV53',
    texname = '\\text{UV53}' )

UV54 = Parameter(name='UV54',
    nature = 'internal',
    type = 'complex',
    value = 'rUV54 + complex(0,1)*iUV54',
    texname = '\\text{UV54}' )

UV55 = Parameter(name='UV55',
    nature = 'internal',
    type = 'complex',
    value = 'rUV55 + complex(0,1)*iUV55',
    texname = '\\text{UV55}' )

UV56 = Parameter(name='UV56',
    nature = 'internal',
    type = 'complex',
    value = 'rUV56 + complex(0,1)*iUV56',
    texname = '\\text{UV56}' )

UV57 = Parameter(name='UV57',
    nature = 'internal',
    type = 'complex',
    value = 'rUV57 + complex(0,1)*iUV57',
    texname = '\\text{UV57}' )

UV58 = Parameter(name='UV58',
    nature = 'internal',
    type = 'complex',
    value = 'rUV58 + complex(0,1)*iUV58',
    texname = '\\text{UV58}' )

UV59 = Parameter(name='UV59',
    nature = 'internal',
    type = 'complex',
    value = 'rUV59 + complex(0,1)*iUV59',
    texname = '\\text{UV59}' )

UV61 = Parameter(name='UV61',
    nature = 'internal',
    type = 'complex',
    value = 'rUV61 + complex(0,1)*iUV61',
    texname = '\\text{UV61}' )

UV62 = Parameter(name='UV62',
    nature = 'internal',
    type = 'complex',
    value = 'rUV62 + complex(0,1)*iUV62',
    texname = '\\text{UV62}' )

UV63 = Parameter(name='UV63',
    nature = 'internal',
    type = 'complex',
    value = 'rUV63 + complex(0,1)*iUV63',
    texname = '\\text{UV63}' )

UV64 = Parameter(name='UV64',
    nature = 'internal',
    type = 'complex',
    value = 'rUV64 + complex(0,1)*iUV64',
    texname = '\\text{UV64}' )

UV65 = Parameter(name='UV65',
    nature = 'internal',
    type = 'complex',
    value = 'rUV65 + complex(0,1)*iUV65',
    texname = '\\text{UV65}' )

UV66 = Parameter(name='UV66',
    nature = 'internal',
    type = 'complex',
    value = 'rUV66 + complex(0,1)*iUV66',
    texname = '\\text{UV66}' )

UV67 = Parameter(name='UV67',
    nature = 'internal',
    type = 'complex',
    value = 'rUV67 + complex(0,1)*iUV67',
    texname = '\\text{UV67}' )

UV68 = Parameter(name='UV68',
    nature = 'internal',
    type = 'complex',
    value = 'rUV68 + complex(0,1)*iUV68',
    texname = '\\text{UV68}' )

UV69 = Parameter(name='UV69',
    nature = 'internal',
    type = 'complex',
    value = 'rUV69 + complex(0,1)*iUV69',
    texname = '\\text{UV69}' )

UV71 = Parameter(name='UV71',
    nature = 'internal',
    type = 'complex',
    value = 'rUV71 + complex(0,1)*iUV71',
    texname = '\\text{UV71}' )

UV72 = Parameter(name='UV72',
    nature = 'internal',
    type = 'complex',
    value = 'rUV72 + complex(0,1)*iUV72',
    texname = '\\text{UV72}' )

UV73 = Parameter(name='UV73',
    nature = 'internal',
    type = 'complex',
    value = 'rUV73 + complex(0,1)*iUV73',
    texname = '\\text{UV73}' )

UV74 = Parameter(name='UV74',
    nature = 'internal',
    type = 'complex',
    value = 'rUV74 + complex(0,1)*iUV74',
    texname = '\\text{UV74}' )

UV75 = Parameter(name='UV75',
    nature = 'internal',
    type = 'complex',
    value = 'rUV75 + complex(0,1)*iUV75',
    texname = '\\text{UV75}' )

UV76 = Parameter(name='UV76',
    nature = 'internal',
    type = 'complex',
    value = 'rUV76 + complex(0,1)*iUV76',
    texname = '\\text{UV76}' )

UV77 = Parameter(name='UV77',
    nature = 'internal',
    type = 'complex',
    value = 'rUV77 + complex(0,1)*iUV77',
    texname = '\\text{UV77}' )

UV78 = Parameter(name='UV78',
    nature = 'internal',
    type = 'complex',
    value = 'rUV78 + complex(0,1)*iUV78',
    texname = '\\text{UV78}' )

UV79 = Parameter(name='UV79',
    nature = 'internal',
    type = 'complex',
    value = 'rUV79 + complex(0,1)*iUV79',
    texname = '\\text{UV79}' )

UV81 = Parameter(name='UV81',
    nature = 'internal',
    type = 'complex',
    value = 'rUV81 + complex(0,1)*iUV81',
    texname = '\\text{UV81}' )

UV82 = Parameter(name='UV82',
    nature = 'internal',
    type = 'complex',
    value = 'rUV82 + complex(0,1)*iUV82',
    texname = '\\text{UV82}' )

UV83 = Parameter(name='UV83',
    nature = 'internal',
    type = 'complex',
    value = 'rUV83 + complex(0,1)*iUV83',
    texname = '\\text{UV83}' )

UV84 = Parameter(name='UV84',
    nature = 'internal',
    type = 'complex',
    value = 'rUV84 + complex(0,1)*iUV84',
    texname = '\\text{UV84}' )

UV85 = Parameter(name='UV85',
    nature = 'internal',
    type = 'complex',
    value = 'rUV85 + complex(0,1)*iUV85',
    texname = '\\text{UV85}' )

UV86 = Parameter(name='UV86',
    nature = 'internal',
    type = 'complex',
    value = 'rUV86 + complex(0,1)*iUV86',
    texname = '\\text{UV86}' )

UV87 = Parameter(name='UV87',
    nature = 'internal',
    type = 'complex',
    value = 'rUV87 + complex(0,1)*iUV87',
    texname = '\\text{UV87}' )

UV88 = Parameter(name='UV88',
    nature = 'internal',
    type = 'complex',
    value = 'rUV88 + complex(0,1)*iUV88',
    texname = '\\text{UV88}' )

UV89 = Parameter(name='UV89',
    nature = 'internal',
    type = 'complex',
    value = 'rUV89 + complex(0,1)*iUV89',
    texname = '\\text{UV89}' )

UV91 = Parameter(name='UV91',
    nature = 'internal',
    type = 'complex',
    value = 'rUV91 + complex(0,1)*iUV91',
    texname = '\\text{UV91}' )

UV92 = Parameter(name='UV92',
    nature = 'internal',
    type = 'complex',
    value = 'rUV92 + complex(0,1)*iUV92',
    texname = '\\text{UV92}' )

UV93 = Parameter(name='UV93',
    nature = 'internal',
    type = 'complex',
    value = 'rUV93 + complex(0,1)*iUV93',
    texname = '\\text{UV93}' )

UV94 = Parameter(name='UV94',
    nature = 'internal',
    type = 'complex',
    value = 'rUV94 + complex(0,1)*iUV94',
    texname = '\\text{UV94}' )

UV95 = Parameter(name='UV95',
    nature = 'internal',
    type = 'complex',
    value = 'rUV95 + complex(0,1)*iUV95',
    texname = '\\text{UV95}' )

UV96 = Parameter(name='UV96',
    nature = 'internal',
    type = 'complex',
    value = 'rUV96 + complex(0,1)*iUV96',
    texname = '\\text{UV96}' )

UV97 = Parameter(name='UV97',
    nature = 'internal',
    type = 'complex',
    value = 'rUV97 + complex(0,1)*iUV97',
    texname = '\\text{UV97}' )

UV98 = Parameter(name='UV98',
    nature = 'internal',
    type = 'complex',
    value = 'rUV98 + complex(0,1)*iUV98',
    texname = '\\text{UV98}' )

UV99 = Parameter(name='UV99',
    nature = 'internal',
    type = 'complex',
    value = 'rUV99 + complex(0,1)*iUV99',
    texname = '\\text{UV99}' )

G = Parameter(name='G',
    nature = 'internal',
    type = 'real',
    value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
    texname = 'g_3')

ZH11 = Parameter(name='ZH11',
    nature = 'internal',
    type = 'real',
    value = 'cmath.cos(alphaH)',
    texname = '\\text{ZH11}')

ZH12 = Parameter(name='ZH12',
    nature = 'internal',
    type = 'real',
    value = '-cmath.sin(alphaH)',
    texname = '\\text{ZH12}')

ZH21 = Parameter(name='ZH21',
    nature = 'internal',
    type = 'real',
    value = 'cmath.sin(alphaH)',
    texname = '\\text{ZH21}')

ZH22 = Parameter(name='ZH22',
    nature = 'internal',
    type = 'real',
    value = 'cmath.cos(alphaH)',
    texname = '\\text{ZH22}')

el = Parameter(name='el',
    nature = 'internal',
    type = 'real',
    value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)',
    texname = '\\text{el}')

TW = Parameter(name='TW',
    nature = 'internal',
    type = 'real',
    value = 'cmath.asin(cmath.sqrt(1 - $Failed**2/MZ**2))',
    texname = '\\text{TW}')

MWp = Parameter(name='MWp',
    nature = 'internal',
    type = 'real',
    value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))',
    texname = '\\text{MWp}')

g1 = Parameter(name='g1',
    nature = 'internal',
    type = 'real',
    value = 'el*1./cmath.cos(TW)',
    texname = 'g_1')

g2 = Parameter(name='g2',
    nature = 'internal',
    type = 'real',
    value = 'el*1./cmath.sin(TW)',
    texname = 'g_2')

vH = Parameter(name='vH',
    nature = 'internal',
    type = 'real',
    value = '2*cmath.sqrt(MWp**2/g2**2)',
    texname = 'v_H')

RXiWp = Parameter(name='RXiWp',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{W^+}')

MHp = Parameter(name = 'MHp',
    nature = 'internal',
    type = 'real',
    value = 'MWp*RXiWp',
    texname = 'M_{H^+}')

MgWp = Parameter(name = 'MgWp',
    nature = 'internal',
    type = 'real',
    value = 'MWp*RXiWp',
    texname = 'M_{\\eta^+}')

MgWC = Parameter(name = 'MgWC',
    nature = 'internal',
    type = 'real',
    value = 'MWp*RXiWp',
    texname = 'M_{\\eta^-}')

RXiZ = Parameter(name='RXiZ',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{Z}')

MAh1 = Parameter(name = 'MAh1',
    nature = 'internal',
    type = 'real',
    value = 'MZ*RXiZ',
    texname = 'M_{{A_h}_1}')

MgZ = Parameter(name = 'MgZ',
    nature = 'internal',
    type = 'real',
    value = 'MZ*RXiZ',
    texname = 'M_{\\eta^Z}')

RXiZp = Parameter(name='RXiZp',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{{Z^{\\prime}}}')

MAh2 = Parameter(name = 'MAh2',
    nature = 'internal',
    type = 'real',
    value = 'MZp*RXiZp',
    texname = 'M_{{A_h}_2}')

HPP1 = Parameter(name='HPP1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP1}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [25,22,22] )

HGG1 = Parameter(name='HGG1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG1}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [25,21,21] )

HPP2 = Parameter(name='HPP2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP2}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [35,22,22] )

HGG2 = Parameter(name='HGG2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG2}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [35,21,21] )

