# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.0.0 for Linux x86 (64-bit) (December 13, 2023)
# Date: Wed 22 May 2024 21:29:19


from object_library import all_decays, Decay
import particles as P


Decay_H = Decay(name = 'Decay_H',
                particle = P.H,
                partial_widths = {(P.t,P.t__tilde__):'((3*MH**2*yt**2 - 12*MT**2*yt**2)*cmath.sqrt(MH**4 - 4*MH**2*MT**2))/(16.*cmath.pi*abs(MH)**3)',
                                  (P.W__minus__,P.W__plus__):'(((3*ee**4*vev**2)/(4.*sw**4) + (ee**4*MH**4*vev**2)/(16.*MW**4*sw**4) - (ee**4*MH**2*vev**2)/(4.*MW**2*sw**4))*cmath.sqrt(MH**4 - 4*MH**2*MW**2))/(16.*cmath.pi*abs(MH)**3)',
                                  (P.Z,P.Z):'(((9*ee**4*vev**2)/2. + (3*ee**4*MH**4*vev**2)/(8.*MZ**4) - (3*ee**4*MH**2*vev**2)/(2.*MZ**2) + (3*cw**4*ee**4*vev**2)/(4.*sw**4) + (cw**4*ee**4*MH**4*vev**2)/(16.*MZ**4*sw**4) - (cw**4*ee**4*MH**2*vev**2)/(4.*MZ**2*sw**4) + (3*cw**2*ee**4*vev**2)/sw**2 + (cw**2*ee**4*MH**4*vev**2)/(4.*MZ**4*sw**2) - (cw**2*ee**4*MH**2*vev**2)/(MZ**2*sw**2) + (3*ee**4*sw**2*vev**2)/cw**2 + (ee**4*MH**4*sw**2*vev**2)/(4.*cw**2*MZ**4) - (ee**4*MH**2*sw**2*vev**2)/(cw**2*MZ**2) + (3*ee**4*sw**4*vev**2)/(4.*cw**4) + (ee**4*MH**4*sw**4*vev**2)/(16.*cw**4*MZ**4) - (ee**4*MH**2*sw**4*vev**2)/(4.*cw**4*MZ**2))*cmath.sqrt(MH**4 - 4*MH**2*MZ**2))/(32.*cmath.pi*abs(MH)**3)'})

Decay_t = Decay(name = 'Decay_t',
                particle = P.t,
                partial_widths = {(P.W__plus__,P.b):'((MT**2 - MW**2)*((3*CKM3x3*ee**2*MT**2*complexconjugate(CKM3x3))/(2.*sw**2) + (3*CKM3x3*ee**2*MT**4*complexconjugate(CKM3x3))/(2.*MW**2*sw**2) - (3*CKM3x3*ee**2*MW**2*complexconjugate(CKM3x3))/sw**2))/(96.*cmath.pi*abs(MT)**3)',
                                  (P.W__plus__,P.d):'((MT**2 - MW**2)*((3*CKM3x1*ee**2*MT**2*complexconjugate(CKM3x1))/(2.*sw**2) + (3*CKM3x1*ee**2*MT**4*complexconjugate(CKM3x1))/(2.*MW**2*sw**2) - (3*CKM3x1*ee**2*MW**2*complexconjugate(CKM3x1))/sw**2))/(96.*cmath.pi*abs(MT)**3)',
                                  (P.W__plus__,P.s):'((MT**2 - MW**2)*((3*CKM3x2*ee**2*MT**2*complexconjugate(CKM3x2))/(2.*sw**2) + (3*CKM3x2*ee**2*MT**4*complexconjugate(CKM3x2))/(2.*MW**2*sw**2) - (3*CKM3x2*ee**2*MW**2*complexconjugate(CKM3x2))/sw**2))/(96.*cmath.pi*abs(MT)**3)',
                                  (P.Zp,P.c):'((MT**2 - MZp**2)*((gZp**2*I5a23*MT**2*complexconjugate(I5a23))/8. + (gZp**2*I5a23*MT**4*complexconjugate(I5a23))/(8.*MZp**2) - (gZp**2*I5a23*MZp**2*complexconjugate(I5a23))/4.))/(96.*cmath.pi*abs(MT)**3)',
                                  (P.Zp,P.u):'((MT**2 - MZp**2)*((gZp**2*I5a13*MT**2*complexconjugate(I5a13))/8. + (gZp**2*I5a13*MT**4*complexconjugate(I5a13))/(8.*MZp**2) - (gZp**2*I5a13*MZp**2*complexconjugate(I5a13))/4.))/(96.*cmath.pi*abs(MT)**3)'})

Decay_W__plus__ = Decay(name = 'Decay_W__plus__',
                        particle = P.W__plus__,
                        partial_widths = {(P.c,P.b__tilde__):'(CKM2x3*ee**2*MW**4*complexconjugate(CKM2x3))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.c,P.d__tilde__):'(CKM2x1*ee**2*MW**4*complexconjugate(CKM2x1))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.c,P.s__tilde__):'(CKM2x2*ee**2*MW**4*complexconjugate(CKM2x2))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.t,P.b__tilde__):'((-MT**2 + MW**2)*((-3*CKM3x3*ee**2*MT**2*complexconjugate(CKM3x3))/(2.*sw**2) - (3*CKM3x3*ee**2*MT**4*complexconjugate(CKM3x3))/(2.*MW**2*sw**2) + (3*CKM3x3*ee**2*MW**2*complexconjugate(CKM3x3))/sw**2))/(48.*cmath.pi*abs(MW)**3)',
                                          (P.t,P.d__tilde__):'((-MT**2 + MW**2)*((-3*CKM3x1*ee**2*MT**2*complexconjugate(CKM3x1))/(2.*sw**2) - (3*CKM3x1*ee**2*MT**4*complexconjugate(CKM3x1))/(2.*MW**2*sw**2) + (3*CKM3x1*ee**2*MW**2*complexconjugate(CKM3x1))/sw**2))/(48.*cmath.pi*abs(MW)**3)',
                                          (P.t,P.s__tilde__):'((-MT**2 + MW**2)*((-3*CKM3x2*ee**2*MT**2*complexconjugate(CKM3x2))/(2.*sw**2) - (3*CKM3x2*ee**2*MT**4*complexconjugate(CKM3x2))/(2.*MW**2*sw**2) + (3*CKM3x2*ee**2*MW**2*complexconjugate(CKM3x2))/sw**2))/(48.*cmath.pi*abs(MW)**3)',
                                          (P.u,P.b__tilde__):'(CKM1x3*ee**2*MW**4*complexconjugate(CKM1x3))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.u,P.d__tilde__):'(CKM1x1*ee**2*MW**4*complexconjugate(CKM1x1))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.u,P.s__tilde__):'(CKM1x2*ee**2*MW**4*complexconjugate(CKM1x2))/(16.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.ve,P.e__plus__):'(ee**2*MW**4)/(48.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.vm,P.mu__plus__):'(ee**2*MW**4)/(48.*cmath.pi*sw**2*abs(MW)**3)',
                                          (P.vt,P.ta__plus__):'(ee**2*MW**4)/(48.*cmath.pi*sw**2*abs(MW)**3)'})

Decay_Z = Decay(name = 'Decay_Z',
                particle = P.Z,
                partial_widths = {(P.b,P.b__tilde__):'(MZ**2*(ee**2*MZ**2 + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(6.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.c,P.c__tilde__):'(MZ**2*(-(ee**2*MZ**2) + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (17*ee**2*MZ**2*sw**2)/(6.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.d,P.d__tilde__):'(MZ**2*(ee**2*MZ**2 + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(6.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.e__minus__,P.e__plus__):'(MZ**2*(-(ee**2*MZ**2) + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.mu__minus__,P.mu__plus__):'(MZ**2*(-(ee**2*MZ**2) + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.s,P.s__tilde__):'(MZ**2*(ee**2*MZ**2 + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(6.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.t,P.t__tilde__):'((-11*ee**2*MT**2 - ee**2*MZ**2 - (3*cw**2*ee**2*MT**2)/(2.*sw**2) + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (7*ee**2*MT**2*sw**2)/(6.*cw**2) + (17*ee**2*MZ**2*sw**2)/(6.*cw**2))*cmath.sqrt(-4*MT**2*MZ**2 + MZ**4))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.ta__minus__,P.ta__plus__):'(MZ**2*(-(ee**2*MZ**2) + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (5*ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.u,P.u__tilde__):'(MZ**2*(-(ee**2*MZ**2) + (3*cw**2*ee**2*MZ**2)/(2.*sw**2) + (17*ee**2*MZ**2*sw**2)/(6.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.ve,P.ve__tilde__):'(MZ**2*(ee**2*MZ**2 + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.vm,P.vm__tilde__):'(MZ**2*(ee**2*MZ**2 + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.vt,P.vt__tilde__):'(MZ**2*(ee**2*MZ**2 + (cw**2*ee**2*MZ**2)/(2.*sw**2) + (ee**2*MZ**2*sw**2)/(2.*cw**2)))/(48.*cmath.pi*abs(MZ)**3)',
                                  (P.W__minus__,P.W__plus__):'(((-12*cw**2*ee**2*MW**2)/sw**2 - (17*cw**2*ee**2*MZ**2)/sw**2 + (4*cw**2*ee**2*MZ**4)/(MW**2*sw**2) + (cw**2*ee**2*MZ**6)/(4.*MW**4*sw**2))*cmath.sqrt(-4*MW**2*MZ**2 + MZ**4))/(48.*cmath.pi*abs(MZ)**3)'})

Decay_Zp = Decay(name = 'Decay_Zp',
                 particle = P.Zp,
                 partial_widths = {(P.b,P.b__tilde__):'(MZp**2*((gZp**2*MZp**2*zetaq3x3**2)/4. + (gZp**2*MZp**2*zetaRd3x3**2)/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.c,P.c__tilde__):'(MZp**2*((gZp**2*MZp**2*zetaRu2x2**2)/4. + (gZp**2*I5a22*MZp**2*complexconjugate(I5a22))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.c,P.t__tilde__):'((-MT**2 + MZp**2)*(-0.125*(gZp**2*I5a23*MT**2*complexconjugate(I5a23)) - (gZp**2*I5a23*MT**4*complexconjugate(I5a23))/(8.*MZp**2) + (gZp**2*I5a23*MZp**2*complexconjugate(I5a23))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.c,P.u__tilde__):'(gZp**2*I5a21*MZp**4*complexconjugate(I5a21))/(192.*cmath.pi*abs(MZp)**3)',
                                   (P.d,P.d__tilde__):'(MZp**2*((gZp**2*MZp**2*zetaq1x1**2)/4. + (gZp**2*MZp**2*zetaRd1x1**2)/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.mu__minus__,P.mu__plus__):'(MZp**2*((3*gZp**2*MZp**2*zetal2x2**2)/4. + (3*gZp**2*MZp**2*zetaRe2x2**2)/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.mu__minus__,P.ta__plus__):'(gZp**2*MZp**4*zetal2x3**2)/(64.*cmath.pi*abs(MZp)**3)',
                                   (P.s,P.s__tilde__):'(MZp**2*((gZp**2*MZp**2*zetaq2x2**2)/4. + (gZp**2*MZp**2*zetaRd2x2**2)/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.t,P.c__tilde__):'((-MT**2 + MZp**2)*(-0.125*(gZp**2*I5a32*MT**2*complexconjugate(I5a32)) - (gZp**2*I5a32*MT**4*complexconjugate(I5a32))/(8.*MZp**2) + (gZp**2*I5a32*MZp**2*complexconjugate(I5a32))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.t,P.t__tilde__):'(((3*gZp**2*I5a33*MT**2*zetaRu3x3)/4. - (gZp**2*MT**2*zetaRu3x3**2)/4. + (gZp**2*MZp**2*zetaRu3x3**2)/4. - (gZp**2*I5a33*MT**2*complexconjugate(I5a33))/4. + (gZp**2*I5a33*MZp**2*complexconjugate(I5a33))/4. + (3*gZp**2*MT**2*zetaRu3x3*complexconjugate(I5a33))/4.)*cmath.sqrt(-4*MT**2*MZp**2 + MZp**4))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.t,P.u__tilde__):'((-MT**2 + MZp**2)*(-0.125*(gZp**2*I5a31*MT**2*complexconjugate(I5a31)) - (gZp**2*I5a31*MT**4*complexconjugate(I5a31))/(8.*MZp**2) + (gZp**2*I5a31*MZp**2*complexconjugate(I5a31))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.ta__minus__,P.mu__plus__):'(gZp**2*MZp**4*zetal3x2**2)/(64.*cmath.pi*abs(MZp)**3)',
                                   (P.ta__minus__,P.ta__plus__):'(MZp**2*((3*gZp**2*MZp**2*zetal3x3**2)/4. + (3*gZp**2*MZp**2*zetaRe3x3**2)/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.u,P.c__tilde__):'(gZp**2*I5a12*MZp**4*complexconjugate(I5a12))/(192.*cmath.pi*abs(MZp)**3)',
                                   (P.u,P.t__tilde__):'((-MT**2 + MZp**2)*(-0.125*(gZp**2*I5a13*MT**2*complexconjugate(I5a13)) - (gZp**2*I5a13*MT**4*complexconjugate(I5a13))/(8.*MZp**2) + (gZp**2*I5a13*MZp**2*complexconjugate(I5a13))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.u,P.u__tilde__):'(MZp**2*((gZp**2*MZp**2*zetaRu1x1**2)/4. + (gZp**2*I5a11*MZp**2*complexconjugate(I5a11))/4.))/(48.*cmath.pi*abs(MZp)**3)',
                                   (P.vm,P.vm__tilde__):'(gZp**2*MZp**4*zetal2x2**2)/(64.*cmath.pi*abs(MZp)**3)',
                                   (P.vm,P.vt__tilde__):'(gZp**2*MZp**4*zetal2x3**2)/(64.*cmath.pi*abs(MZp)**3)',
                                   (P.vt,P.vm__tilde__):'(gZp**2*MZp**4*zetal3x2**2)/(64.*cmath.pi*abs(MZp)**3)',
                                   (P.vt,P.vt__tilde__):'(gZp**2*MZp**4*zetal3x3**2)/(64.*cmath.pi*abs(MZp)**3)'})

