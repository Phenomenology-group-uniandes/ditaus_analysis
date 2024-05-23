ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

C     Parameters that should not be recomputed event by event.
C     
      IF(READLHA) THEN

        G = 2 * DSQRT(AS*PI)  ! for the first init

        MDL_ATAN__TB = ATAN(DBLE(MDL_TB))

        MDL_BETA = MDL_ATAN__TB

        MDL_COS__CABI = COS(MDL_CABI)

        MDL_CKM1X1 = MDL_COS__CABI

        MDL_SIN__CABI = SIN(MDL_CABI)

        MDL_CKM1X2 = MDL_SIN__CABI

        MDL_CKM2X1 = -MDL_SIN__CABI

        MDL_CKM2X2 = MDL_COS__CABI

        MDL_CBA__EXP__2 = MDL_CBA**2

        MDL_SBA = SQRT(DCMPLX(1.000000D+00-MDL_CBA__EXP__2))

        MDL_ACOS__CBA = ACOS(MDL_CBA)

        MDL_ALPHA = MDL_BETA-MDL_ACOS__CBA

        MDL_COS__BETA = COS(MDL_BETA)

        MDL_CB = MDL_COS__BETA

        MDL_MZ__EXP__2 = MDL_MZ**2

        MDL_MZ__EXP__4 = MDL_MZ**4

        MDL_SQRT__2 = SQRT(DCMPLX(2.000000D+00))

        MDL_SIN__BETA = SIN(MDL_BETA)

        MDL_SB = MDL_SIN__BETA

        MDL_CA = MDL_CB*MDL_CBA+MDL_SB*MDL_SBA

        MDL_MHL__EXP__2 = MDL_MHL**2

        MDL_MHH__EXP__2 = MDL_MHH**2

        MDL_M112 = (MDL_M122*MDL_SB)/MDL_CB+(MDL_MHL__EXP__2*MDL_SBA
     $   *(MDL_CBA*MDL_SB-MDL_CB*MDL_SBA))/(2.000000D+00*MDL_CB)
     $   -(MDL_CBA*MDL_MHH__EXP__2*(MDL_CB*MDL_CBA+MDL_SB*MDL_SBA))
     $   /(2.000000D+00*MDL_CB)

        MDL_M222 = (MDL_CB*MDL_M122)/MDL_SB+(MDL_CBA*MDL_MHH__EXP__2*(
     $   -(MDL_CBA*MDL_SB)+MDL_CB*MDL_SBA))/(2.000000D+00*MDL_SB)
     $   -(MDL_MHL__EXP__2*MDL_SBA*(MDL_CB*MDL_CBA+MDL_SB*MDL_SBA))
     $   /(2.000000D+00*MDL_SB)

        MDL_MM2 = MDL_M122/(MDL_CB*MDL_SB)

        MDL_SA = MDL_CBA*MDL_SB-MDL_CB*MDL_SBA

        MDL_CB__EXP__3 = MDL_CB**3

        MDL_SB__EXP__3 = MDL_SB**3

        MDL_MHP__EXP__2 = MDL_MHP**2

        MDL_MHA__EXP__2 = MDL_MHA**2

        MDL_COMPLEXI = DCMPLX(0.000000D+00,1.000000D+00)

        MDL_CB__EXP__4 = MDL_CB**4

        MDL_CBA__EXP__4 = MDL_CBA**4

        MDL_CB__EXP__2 = MDL_CB**2

        MDL_SB__EXP__2 = MDL_SB**2

        MDL_SB__EXP__4 = MDL_SB**4

        MDL_CB__EXP__5 = MDL_CB**5

        MDL_CBA__EXP__3 = MDL_CBA**3

        MDL_SB__EXP__5 = MDL_SB**5

        MDL_SBA__EXP__2 = MDL_SBA**2

        MDL_SB__EXP__6 = MDL_SB**6

        MDL_SBA__EXP__3 = MDL_SBA**3

        MDL_CB__EXP__6 = MDL_CB**6

        MDL_SBA__EXP__4 = MDL_SBA**4

        MDL_CBA__EXP__6 = MDL_CBA**6

        MDL_CBA__EXP__5 = MDL_CBA**5

        MDL_SBA__EXP__5 = MDL_SBA**5

        MDL_SBA__EXP__6 = MDL_SBA**6

        MDL_CONJG__CKM1X1 = CONJG(DCMPLX(MDL_CKM1X1))

        MDL_CONJG__CKM1X2 = CONJG(DCMPLX(MDL_CKM1X2))

        MDL_CONJG__CKM2X1 = CONJG(DCMPLX(MDL_CKM2X1))

        MDL_CONJG__CKM2X2 = CONJG(DCMPLX(MDL_CKM2X2))

        MDL_MB__EXP__2 = MDL_MB**2

        MDL_MT__EXP__2 = MDL_MT**2

        MDL_AEW = 1.000000D+00/AEWM1

        MDL_MW = SQRT(DCMPLX(MDL_MZ__EXP__2/2.000000D+00
     $   +SQRT(DCMPLX(MDL_MZ__EXP__4/4.000000D+00-(MDL_AEW*PI
     $   *MDL_MZ__EXP__2)/(MDL_GF*MDL_SQRT__2)))))

        MDL_SQRT__AEW = SQRT(DCMPLX(MDL_AEW))

        MDL_EE = 2.000000D+00*MDL_SQRT__AEW*SQRT(DCMPLX(PI))

        MDL_MW__EXP__2 = MDL_MW**2

        MDL_SW2 = 1.000000D+00-MDL_MW__EXP__2/MDL_MZ__EXP__2

        MDL_CW = SQRT(DCMPLX(1.000000D+00-MDL_SW2))

        MDL_SQRT__SW2 = SQRT(DCMPLX(MDL_SW2))

        MDL_SW = MDL_SQRT__SW2

        MDL_G1 = MDL_EE/MDL_CW

        MDL_GW = MDL_EE/MDL_SW

        MDL_VEV = (2.000000D+00*MDL_MW*MDL_SW)/MDL_EE

        MDL_VEV__EXP__2 = MDL_VEV**2

        MDL_LAM1 = (-(MDL_M122*MDL_SB)+MDL_CB*(MDL_MHH__EXP__2+(
     $   -MDL_MHH__EXP__2+MDL_MHL__EXP__2)*(MDL_CBA*MDL_SB-MDL_CB
     $   *MDL_SBA)**2))/(MDL_CB__EXP__3*MDL_VEV__EXP__2)

        MDL_LAM2 = (-(MDL_CB*MDL_M122)+MDL_SB*(MDL_MHL__EXP__2
     $   +(MDL_MHH__EXP__2-MDL_MHL__EXP__2)*(MDL_CBA*MDL_SB-MDL_CB
     $   *MDL_SBA)**2))/(MDL_SB__EXP__3*MDL_VEV__EXP__2)

        MDL_LAM3 = (-MDL_M122+2.000000D+00*MDL_CB*MDL_MHP__EXP__2
     $   *MDL_SB+(MDL_MHH__EXP__2-MDL_MHL__EXP__2)*(MDL_CBA*MDL_SB
     $   -MDL_CB*MDL_SBA)*(MDL_CB*MDL_CBA+MDL_SB*MDL_SBA))/(MDL_CB
     $   *MDL_SB*MDL_VEV__EXP__2)

        MDL_LAM4 = (MDL_M122+MDL_CB*(MDL_MHA__EXP__2-2.000000D+00
     $   *MDL_MHP__EXP__2)*MDL_SB)/(MDL_CB*MDL_SB*MDL_VEV__EXP__2)

        MDL_LAM5 = (MDL_M122-MDL_CB*MDL_MHA__EXP__2*MDL_SB)/(MDL_CB
     $   *MDL_SB*MDL_VEV__EXP__2)

        MDL_VEV1 = MDL_CB*MDL_VEV

        MDL_VEV2 = MDL_SB*MDL_VEV

        MDL_YB = (MDL_YMB*MDL_SQRT__2)/MDL_VEV

        MDL_YT = (MDL_YMT*MDL_SQRT__2)/MDL_VEV

        MDL_YTAU = (MDL_YMTAU*MDL_SQRT__2)/MDL_VEV

        MDL_I1A33 = MDL_YB

        MDL_I2A33 = MDL_YT

        MDL_I3A33 = MDL_YT

        MDL_I4A33 = MDL_YB

        MDL_EE__EXP__2 = MDL_EE**2

        MDL_SW__EXP__2 = MDL_SW**2

        MDL_CW__EXP__2 = MDL_CW**2

        MDL_YB__EXP__2 = MDL_YB**2

        MDL_YT__EXP__2 = MDL_YT**2

      ENDIF
C     
C     Parameters that should be recomputed at an event by even basis.
C     
      AS = G**2/4/PI

      MDL_SQRT__AS = SQRT(DCMPLX(AS))

      MDL_G__EXP__2 = G**2

      MDL_G__EXP__3 = G**3

      MDL_G__EXP__4 = G**4

C     
C     Parameters that should be updated for the loops.
C     
C     
C     Definition of the EW coupling used in the write out of aqed
C     
      GAL(1) = 3.5449077018110318D0 / DSQRT(ABS(AEWM1))
      GAL(2) = 1D0

