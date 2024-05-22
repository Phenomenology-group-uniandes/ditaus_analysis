# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Linux x86 (64-bit) (December 13, 2023)
# Date: Wed 22 May 2024 16:01:15


from object_library import all_couplings, Coupling

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot



GC_1 = Coupling(name = 'GC_1',
                value = '-0.3333333333333333*(ee*complex(0,1))',
                order = {'QED':1})

GC_2 = Coupling(name = 'GC_2',
                value = '(2*ee*complex(0,1))/3.',
                order = {'QED':1})

GC_3 = Coupling(name = 'GC_3',
                value = '-(ee*complex(0,1))',
                order = {'QED':1})

GC_4 = Coupling(name = 'GC_4',
                value = 'ee*complex(0,1)',
                order = {'QED':1})

GC_5 = Coupling(name = 'GC_5',
                value = 'ee**2*complex(0,1)',
                order = {'QED':2})

GC_6 = Coupling(name = 'GC_6',
                value = '2*ee**2*complex(0,1)',
                order = {'QED':2})

GC_7 = Coupling(name = 'GC_7',
                value = '-0.5*ee**2/cw',
                order = {'QED':2})

GC_8 = Coupling(name = 'GC_8',
                value = '(ee**2*complex(0,1))/(2.*cw)',
                order = {'QED':2})

GC_9 = Coupling(name = 'GC_9',
                value = 'ee**2/(2.*cw)',
                order = {'QED':2})

GC_10 = Coupling(name = 'GC_10',
                 value = '-G',
                 order = {'QCD':1})

GC_11 = Coupling(name = 'GC_11',
                 value = 'complex(0,1)*G',
                 order = {'QCD':1})

GC_12 = Coupling(name = 'GC_12',
                 value = 'complex(0,1)*G**2',
                 order = {'QCD':2})

GC_13 = Coupling(name = 'GC_13',
                 value = '-I2a13',
                 order = {'QED':1})

GC_14 = Coupling(name = 'GC_14',
                 value = '-I2a23',
                 order = {'QED':1})

GC_15 = Coupling(name = 'GC_15',
                 value = '-I2a33',
                 order = {'QED':1})

GC_16 = Coupling(name = 'GC_16',
                 value = 'I3a31',
                 order = {'QED':1})

GC_17 = Coupling(name = 'GC_17',
                 value = 'I3a32',
                 order = {'QED':1})

GC_18 = Coupling(name = 'GC_18',
                 value = 'I3a33',
                 order = {'QED':1})

GC_19 = Coupling(name = 'GC_19',
                 value = '-2*complex(0,1)*lam',
                 order = {'QED':2})

GC_20 = Coupling(name = 'GC_20',
                 value = '-4*complex(0,1)*lam',
                 order = {'QED':2})

GC_21 = Coupling(name = 'GC_21',
                 value = '-6*complex(0,1)*lam',
                 order = {'QED':2})

GC_22 = Coupling(name = 'GC_22',
                 value = '(ee**2*complex(0,1))/(2.*sw**2)',
                 order = {'QED':2})

GC_23 = Coupling(name = 'GC_23',
                 value = '-((ee**2*complex(0,1))/sw**2)',
                 order = {'QED':2})

GC_24 = Coupling(name = 'GC_24',
                 value = '(cw**2*ee**2*complex(0,1))/sw**2',
                 order = {'QED':2})

GC_25 = Coupling(name = 'GC_25',
                 value = '-0.5*ee/sw',
                 order = {'QED':1})

GC_26 = Coupling(name = 'GC_26',
                 value = '-0.5*(ee*complex(0,1))/sw',
                 order = {'QED':1})

GC_27 = Coupling(name = 'GC_27',
                 value = '(ee*complex(0,1))/(2.*sw)',
                 order = {'QED':1})

GC_28 = Coupling(name = 'GC_28',
                 value = '(ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_29 = Coupling(name = 'GC_29',
                 value = '(CKM1x1*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_30 = Coupling(name = 'GC_30',
                 value = '(CKM1x2*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_31 = Coupling(name = 'GC_31',
                 value = '(CKM1x3*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_32 = Coupling(name = 'GC_32',
                 value = '(CKM2x1*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_33 = Coupling(name = 'GC_33',
                 value = '(CKM2x2*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_34 = Coupling(name = 'GC_34',
                 value = '(CKM2x3*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_35 = Coupling(name = 'GC_35',
                 value = '(CKM3x1*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_36 = Coupling(name = 'GC_36',
                 value = '(CKM3x2*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_37 = Coupling(name = 'GC_37',
                 value = '(CKM3x3*ee*complex(0,1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_38 = Coupling(name = 'GC_38',
                 value = '(cw*ee*complex(0,1))/(2.*sw)',
                 order = {'QED':1})

GC_39 = Coupling(name = 'GC_39',
                 value = '-((cw*ee*complex(0,1))/sw)',
                 order = {'QED':1})

GC_40 = Coupling(name = 'GC_40',
                 value = '(cw*ee*complex(0,1))/sw',
                 order = {'QED':1})

GC_41 = Coupling(name = 'GC_41',
                 value = '-0.5*ee**2/sw',
                 order = {'QED':2})

GC_42 = Coupling(name = 'GC_42',
                 value = '-0.5*(ee**2*complex(0,1))/sw',
                 order = {'QED':2})

GC_43 = Coupling(name = 'GC_43',
                 value = 'ee**2/(2.*sw)',
                 order = {'QED':2})

GC_44 = Coupling(name = 'GC_44',
                 value = '(-2*cw*ee**2*complex(0,1))/sw',
                 order = {'QED':2})

GC_45 = Coupling(name = 'GC_45',
                 value = '-0.16666666666666666*(ee*complex(0,1)*sw)/cw',
                 order = {'QED':1})

GC_46 = Coupling(name = 'GC_46',
                 value = '(ee*complex(0,1)*sw)/(3.*cw)',
                 order = {'QED':1})

GC_47 = Coupling(name = 'GC_47',
                 value = '(ee*complex(0,1)*sw)/cw',
                 order = {'QED':1})

GC_48 = Coupling(name = 'GC_48',
                 value = '-0.5*(cw*ee)/sw - (ee*sw)/(2.*cw)',
                 order = {'QED':1})

GC_49 = Coupling(name = 'GC_49',
                 value = '-0.5*(cw*ee*complex(0,1))/sw - (ee*complex(0,1)*sw)/(6.*cw)',
                 order = {'QED':1})

GC_50 = Coupling(name = 'GC_50',
                 value = '-0.5*(cw*ee*complex(0,1))/sw + (ee*complex(0,1)*sw)/(2.*cw)',
                 order = {'QED':1})

GC_51 = Coupling(name = 'GC_51',
                 value = '(cw*ee*complex(0,1))/(2.*sw) + (ee*complex(0,1)*sw)/(2.*cw)',
                 order = {'QED':1})

GC_52 = Coupling(name = 'GC_52',
                 value = '(cw*ee**2*complex(0,1))/sw - (ee**2*complex(0,1)*sw)/cw',
                 order = {'QED':2})

GC_53 = Coupling(name = 'GC_53',
                 value = '-(ee**2*complex(0,1)) + (cw**2*ee**2*complex(0,1))/(2.*sw**2) + (ee**2*complex(0,1)*sw**2)/(2.*cw**2)',
                 order = {'QED':2})

GC_54 = Coupling(name = 'GC_54',
                 value = 'ee**2*complex(0,1) + (cw**2*ee**2*complex(0,1))/(2.*sw**2) + (ee**2*complex(0,1)*sw**2)/(2.*cw**2)',
                 order = {'QED':2})

GC_55 = Coupling(name = 'GC_55',
                 value = '-0.5*(ee**2*vev)/cw',
                 order = {'QED':1})

GC_56 = Coupling(name = 'GC_56',
                 value = '(ee**2*vev)/(2.*cw)',
                 order = {'QED':1})

GC_57 = Coupling(name = 'GC_57',
                 value = '-2*complex(0,1)*lam*vev',
                 order = {'QED':1})

GC_58 = Coupling(name = 'GC_58',
                 value = '-6*complex(0,1)*lam*vev',
                 order = {'QED':1})

GC_59 = Coupling(name = 'GC_59',
                 value = '-0.25*(ee**2*vev)/sw**2',
                 order = {'QED':1})

GC_60 = Coupling(name = 'GC_60',
                 value = '-0.25*(ee**2*complex(0,1)*vev)/sw**2',
                 order = {'QED':1})

GC_61 = Coupling(name = 'GC_61',
                 value = '(ee**2*complex(0,1)*vev)/(2.*sw**2)',
                 order = {'QED':1})

GC_62 = Coupling(name = 'GC_62',
                 value = '(ee**2*vev)/(4.*sw**2)',
                 order = {'QED':1})

GC_63 = Coupling(name = 'GC_63',
                 value = '-0.5*(ee**2*vev)/sw',
                 order = {'QED':1})

GC_64 = Coupling(name = 'GC_64',
                 value = '(ee**2*vev)/(2.*sw)',
                 order = {'QED':1})

GC_65 = Coupling(name = 'GC_65',
                 value = '-0.25*(ee**2*vev)/cw - (cw*ee**2*vev)/(4.*sw**2)',
                 order = {'QED':1})

GC_66 = Coupling(name = 'GC_66',
                 value = '(ee**2*vev)/(4.*cw) - (cw*ee**2*vev)/(4.*sw**2)',
                 order = {'QED':1})

GC_67 = Coupling(name = 'GC_67',
                 value = '-0.25*(ee**2*vev)/cw + (cw*ee**2*vev)/(4.*sw**2)',
                 order = {'QED':1})

GC_68 = Coupling(name = 'GC_68',
                 value = '(ee**2*vev)/(4.*cw) + (cw*ee**2*vev)/(4.*sw**2)',
                 order = {'QED':1})

GC_69 = Coupling(name = 'GC_69',
                 value = '-0.5*(ee**2*complex(0,1)*vev) - (cw**2*ee**2*complex(0,1)*vev)/(4.*sw**2) - (ee**2*complex(0,1)*sw**2*vev)/(4.*cw**2)',
                 order = {'QED':1})

GC_70 = Coupling(name = 'GC_70',
                 value = 'ee**2*complex(0,1)*vev + (cw**2*ee**2*complex(0,1)*vev)/(2.*sw**2) + (ee**2*complex(0,1)*sw**2*vev)/(2.*cw**2)',
                 order = {'QED':1})

GC_71 = Coupling(name = 'GC_71',
                 value = '-((complex(0,1)*yt)/cmath.sqrt(2))',
                 order = {'QED':1})

GC_72 = Coupling(name = 'GC_72',
                 value = 'yt/cmath.sqrt(2)',
                 order = {'QED':1})

GC_73 = Coupling(name = 'GC_73',
                 value = '-0.5*(complex(0,1)*gZp*zetal2x2*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_74 = Coupling(name = 'GC_74',
                 value = '-0.5*(complex(0,1)*gZp*zetal2x3*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_75 = Coupling(name = 'GC_75',
                 value = '-0.5*(complex(0,1)*gZp*zetal3x2*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_76 = Coupling(name = 'GC_76',
                 value = '-0.5*(complex(0,1)*gZp*zetal3x3*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_77 = Coupling(name = 'GC_77',
                 value = '(complex(0,1)*gZp*zetaq1x1)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_78 = Coupling(name = 'GC_78',
                 value = '(complex(0,1)*gZp*zetaq2x2)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_79 = Coupling(name = 'GC_79',
                 value = '(complex(0,1)*gZp*zetaq3x3)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_80 = Coupling(name = 'GC_80',
                 value = '(complex(0,1)*gZp*zetaRd1x1)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_81 = Coupling(name = 'GC_81',
                 value = '(complex(0,1)*gZp*zetaRd2x2)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_82 = Coupling(name = 'GC_82',
                 value = '(complex(0,1)*gZp*zetaRd3x3)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_83 = Coupling(name = 'GC_83',
                 value = '-0.5*(complex(0,1)*gZp*zetaRe2x2*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_84 = Coupling(name = 'GC_84',
                 value = '-0.5*(complex(0,1)*gZp*zetaRe3x3*cmath.sqrt(1.5))',
                 order = {'NP':1})

GC_85 = Coupling(name = 'GC_85',
                 value = '(complex(0,1)*gZp*zetaRu1x1)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_86 = Coupling(name = 'GC_86',
                 value = '(complex(0,1)*gZp*zetaRu2x2)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_87 = Coupling(name = 'GC_87',
                 value = '(complex(0,1)*gZp*zetaRu3x3)/(2.*cmath.sqrt(6))',
                 order = {'NP':1})

GC_88 = Coupling(name = 'GC_88',
                 value = '(ee*complex(0,1)*complexconjugate(CKM1x1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_89 = Coupling(name = 'GC_89',
                 value = '(ee*complex(0,1)*complexconjugate(CKM1x2))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_90 = Coupling(name = 'GC_90',
                 value = '(ee*complex(0,1)*complexconjugate(CKM1x3))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_91 = Coupling(name = 'GC_91',
                 value = '(ee*complex(0,1)*complexconjugate(CKM2x1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_92 = Coupling(name = 'GC_92',
                 value = '(ee*complex(0,1)*complexconjugate(CKM2x2))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_93 = Coupling(name = 'GC_93',
                 value = '(ee*complex(0,1)*complexconjugate(CKM2x3))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_94 = Coupling(name = 'GC_94',
                 value = '(ee*complex(0,1)*complexconjugate(CKM3x1))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_95 = Coupling(name = 'GC_95',
                 value = '(ee*complex(0,1)*complexconjugate(CKM3x2))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_96 = Coupling(name = 'GC_96',
                 value = '(ee*complex(0,1)*complexconjugate(CKM3x3))/(sw*cmath.sqrt(2))',
                 order = {'QED':1})

GC_97 = Coupling(name = 'GC_97',
                 value = '(complex(0,1)*gZp*I5a1*I6a1*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                 order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_98 = Coupling(name = 'GC_98',
                 value = '(complex(0,1)*gZp*I5a2*I6a1*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                 order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_99 = Coupling(name = 'GC_99',
                 value = '(complex(0,1)*gZp*I5a3*I6a1*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                 order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_100 = Coupling(name = 'GC_100',
                  value = '(complex(0,1)*gZp*I5a1*I6a2*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_101 = Coupling(name = 'GC_101',
                  value = '(complex(0,1)*gZp*I5a2*I6a2*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_102 = Coupling(name = 'GC_102',
                  value = '(complex(0,1)*gZp*I5a3*I6a2*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_103 = Coupling(name = 'GC_103',
                  value = '(complex(0,1)*gZp*I5a1*I6a3*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_104 = Coupling(name = 'GC_104',
                  value = '(complex(0,1)*gZp*I5a2*I6a3*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

GC_105 = Coupling(name = 'GC_105',
                  value = '(complex(0,1)*gZp*I5a3*I6a3*I7ax*complexconjugate(newCKM(ff4,ff2))*newCKM(ff3,ff1))/(2.*cmath.sqrt(6))',
                  order = {'NP':1,'PRIVATE`GetIntOrder[newCKM[ff3, ff1]]':1,'PRIVATE`GetIntOrder[newCKM[ff4, ff2]]':1})

