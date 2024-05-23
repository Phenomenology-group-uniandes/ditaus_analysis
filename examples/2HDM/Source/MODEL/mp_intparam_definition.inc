ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

C     Parameters that should not be recomputed event by event.
C     
      IF(READLHA) THEN

        MP__G = 2 * SQRT(MP__AS*MP__PI)  ! for the first init

        MP__MDL_ATAN__TB = ATAN(REAL(MP__MDL_TB))

        MP__MDL_BETA = MP__MDL_ATAN__TB

        MP__MDL_COS__CABI = COS(MP__MDL_CABI)

        MP__MDL_CKM1X1 = MP__MDL_COS__CABI

        MP__MDL_SIN__CABI = SIN(MP__MDL_CABI)

        MP__MDL_CKM1X2 = MP__MDL_SIN__CABI

        MP__MDL_CKM2X1 = -MP__MDL_SIN__CABI

        MP__MDL_CKM2X2 = MP__MDL_COS__CABI

        MP__MDL_CBA__EXP__2 = MP__MDL_CBA**2

        MP__MDL_SBA = SQRT(CMPLX((1.000000E+00_16-MP__MDL_CBA__EXP__2)
     $   ,KIND=16))

        MP__MDL_ACOS__CBA = ACOS(MP__MDL_CBA)

        MP__MDL_ALPHA = MP__MDL_BETA-MP__MDL_ACOS__CBA

        MP__MDL_COS__BETA = COS(MP__MDL_BETA)

        MP__MDL_CB = MP__MDL_COS__BETA

        MP__MDL_MZ__EXP__2 = MP__MDL_MZ**2

        MP__MDL_MZ__EXP__4 = MP__MDL_MZ**4

        MP__MDL_SQRT__2 = SQRT(CMPLX((2.000000E+00_16),KIND=16))

        MP__MDL_SIN__BETA = SIN(MP__MDL_BETA)

        MP__MDL_SB = MP__MDL_SIN__BETA

        MP__MDL_CA = MP__MDL_CB*MP__MDL_CBA+MP__MDL_SB*MP__MDL_SBA

        MP__MDL_MHL__EXP__2 = MP__MDL_MHL**2

        MP__MDL_MHH__EXP__2 = MP__MDL_MHH**2

        MP__MDL_M112 = (MP__MDL_M122*MP__MDL_SB)/MP__MDL_CB
     $   +(MP__MDL_MHL__EXP__2*MP__MDL_SBA*(MP__MDL_CBA*MP__MDL_SB
     $   -MP__MDL_CB*MP__MDL_SBA))/(2.000000E+00_16*MP__MDL_CB)
     $   -(MP__MDL_CBA*MP__MDL_MHH__EXP__2*(MP__MDL_CB*MP__MDL_CBA
     $   +MP__MDL_SB*MP__MDL_SBA))/(2.000000E+00_16*MP__MDL_CB)

        MP__MDL_M222 = (MP__MDL_CB*MP__MDL_M122)/MP__MDL_SB
     $   +(MP__MDL_CBA*MP__MDL_MHH__EXP__2*(-(MP__MDL_CBA*MP__MDL_SB)
     $   +MP__MDL_CB*MP__MDL_SBA))/(2.000000E+00_16*MP__MDL_SB)
     $   -(MP__MDL_MHL__EXP__2*MP__MDL_SBA*(MP__MDL_CB*MP__MDL_CBA
     $   +MP__MDL_SB*MP__MDL_SBA))/(2.000000E+00_16*MP__MDL_SB)

        MP__MDL_MM2 = MP__MDL_M122/(MP__MDL_CB*MP__MDL_SB)

        MP__MDL_SA = MP__MDL_CBA*MP__MDL_SB-MP__MDL_CB*MP__MDL_SBA

        MP__MDL_CB__EXP__3 = MP__MDL_CB**3

        MP__MDL_SB__EXP__3 = MP__MDL_SB**3

        MP__MDL_MHP__EXP__2 = MP__MDL_MHP**2

        MP__MDL_MHA__EXP__2 = MP__MDL_MHA**2

        MP__MDL_COMPLEXI = CMPLX(0.000000E+00_16,1.000000E+00_16
     $   ,KIND=16)

        MP__MDL_CB__EXP__4 = MP__MDL_CB**4

        MP__MDL_CBA__EXP__4 = MP__MDL_CBA**4

        MP__MDL_CB__EXP__2 = MP__MDL_CB**2

        MP__MDL_SB__EXP__2 = MP__MDL_SB**2

        MP__MDL_SB__EXP__4 = MP__MDL_SB**4

        MP__MDL_CB__EXP__5 = MP__MDL_CB**5

        MP__MDL_CBA__EXP__3 = MP__MDL_CBA**3

        MP__MDL_SB__EXP__5 = MP__MDL_SB**5

        MP__MDL_SBA__EXP__2 = MP__MDL_SBA**2

        MP__MDL_SB__EXP__6 = MP__MDL_SB**6

        MP__MDL_SBA__EXP__3 = MP__MDL_SBA**3

        MP__MDL_CB__EXP__6 = MP__MDL_CB**6

        MP__MDL_SBA__EXP__4 = MP__MDL_SBA**4

        MP__MDL_CBA__EXP__6 = MP__MDL_CBA**6

        MP__MDL_CBA__EXP__5 = MP__MDL_CBA**5

        MP__MDL_SBA__EXP__5 = MP__MDL_SBA**5

        MP__MDL_SBA__EXP__6 = MP__MDL_SBA**6

        MP__MDL_CONJG__CKM1X1 = CONJG(CMPLX((MP__MDL_CKM1X1),KIND=16))

        MP__MDL_CONJG__CKM1X2 = CONJG(CMPLX((MP__MDL_CKM1X2),KIND=16))

        MP__MDL_CONJG__CKM2X1 = CONJG(CMPLX((MP__MDL_CKM2X1),KIND=16))

        MP__MDL_CONJG__CKM2X2 = CONJG(CMPLX((MP__MDL_CKM2X2),KIND=16))

        MP__MDL_MB__EXP__2 = MP__MDL_MB**2

        MP__MDL_MT__EXP__2 = MP__MDL_MT**2

        MP__MDL_AEW = 1.000000E+00_16/MP__AEWM1

        MP__MDL_MW = SQRT(CMPLX((MP__MDL_MZ__EXP__2/2.000000E+00_16
     $   +SQRT(CMPLX((MP__MDL_MZ__EXP__4/4.000000E+00_16-(MP__MDL_AEW
     $   *MP__PI*MP__MDL_MZ__EXP__2)/(MP__MDL_GF*MP__MDL_SQRT__2))
     $   ,KIND=16))),KIND=16))

        MP__MDL_SQRT__AEW = SQRT(CMPLX((MP__MDL_AEW),KIND=16))

        MP__MDL_EE = 2.000000E+00_16*MP__MDL_SQRT__AEW
     $   *SQRT(CMPLX((MP__PI),KIND=16))

        MP__MDL_MW__EXP__2 = MP__MDL_MW**2

        MP__MDL_SW2 = 1.000000E+00_16-MP__MDL_MW__EXP__2
     $   /MP__MDL_MZ__EXP__2

        MP__MDL_CW = SQRT(CMPLX((1.000000E+00_16-MP__MDL_SW2),KIND=16))

        MP__MDL_SQRT__SW2 = SQRT(CMPLX((MP__MDL_SW2),KIND=16))

        MP__MDL_SW = MP__MDL_SQRT__SW2

        MP__MDL_G1 = MP__MDL_EE/MP__MDL_CW

        MP__MDL_GW = MP__MDL_EE/MP__MDL_SW

        MP__MDL_VEV = (2.000000E+00_16*MP__MDL_MW*MP__MDL_SW)
     $   /MP__MDL_EE

        MP__MDL_VEV__EXP__2 = MP__MDL_VEV**2

        MP__MDL_LAM1 = (-(MP__MDL_M122*MP__MDL_SB)+MP__MDL_CB
     $   *(MP__MDL_MHH__EXP__2+(-MP__MDL_MHH__EXP__2
     $   +MP__MDL_MHL__EXP__2)*(MP__MDL_CBA*MP__MDL_SB-MP__MDL_CB
     $   *MP__MDL_SBA)**2))/(MP__MDL_CB__EXP__3*MP__MDL_VEV__EXP__2)

        MP__MDL_LAM2 = (-(MP__MDL_CB*MP__MDL_M122)+MP__MDL_SB
     $   *(MP__MDL_MHL__EXP__2+(MP__MDL_MHH__EXP__2
     $   -MP__MDL_MHL__EXP__2)*(MP__MDL_CBA*MP__MDL_SB-MP__MDL_CB
     $   *MP__MDL_SBA)**2))/(MP__MDL_SB__EXP__3*MP__MDL_VEV__EXP__2)

        MP__MDL_LAM3 = (-MP__MDL_M122+2.000000E+00_16*MP__MDL_CB
     $   *MP__MDL_MHP__EXP__2*MP__MDL_SB+(MP__MDL_MHH__EXP__2
     $   -MP__MDL_MHL__EXP__2)*(MP__MDL_CBA*MP__MDL_SB-MP__MDL_CB
     $   *MP__MDL_SBA)*(MP__MDL_CB*MP__MDL_CBA+MP__MDL_SB*MP__MDL_SBA))
     $   /(MP__MDL_CB*MP__MDL_SB*MP__MDL_VEV__EXP__2)

        MP__MDL_LAM4 = (MP__MDL_M122+MP__MDL_CB*(MP__MDL_MHA__EXP__2
     $   -2.000000E+00_16*MP__MDL_MHP__EXP__2)*MP__MDL_SB)/(MP__MDL_CB
     $   *MP__MDL_SB*MP__MDL_VEV__EXP__2)

        MP__MDL_LAM5 = (MP__MDL_M122-MP__MDL_CB*MP__MDL_MHA__EXP__2
     $   *MP__MDL_SB)/(MP__MDL_CB*MP__MDL_SB*MP__MDL_VEV__EXP__2)

        MP__MDL_VEV1 = MP__MDL_CB*MP__MDL_VEV

        MP__MDL_VEV2 = MP__MDL_SB*MP__MDL_VEV

        MP__MDL_YB = (MP__MDL_YMB*MP__MDL_SQRT__2)/MP__MDL_VEV

        MP__MDL_YT = (MP__MDL_YMT*MP__MDL_SQRT__2)/MP__MDL_VEV

        MP__MDL_YTAU = (MP__MDL_YMTAU*MP__MDL_SQRT__2)/MP__MDL_VEV

        MP__MDL_I1A33 = MP__MDL_YB

        MP__MDL_I2A33 = MP__MDL_YT

        MP__MDL_I3A33 = MP__MDL_YT

        MP__MDL_I4A33 = MP__MDL_YB

        MP__MDL_EE__EXP__2 = MP__MDL_EE**2

        MP__MDL_SW__EXP__2 = MP__MDL_SW**2

        MP__MDL_CW__EXP__2 = MP__MDL_CW**2

        MP__MDL_YB__EXP__2 = MP__MDL_YB**2

        MP__MDL_YT__EXP__2 = MP__MDL_YT**2

      ENDIF
C     
C     Parameters that should be recomputed at an event by even basis.
C     
      MP__AS = MP__G**2/4/MP__PI

      MP__MDL_SQRT__AS = SQRT(CMPLX((MP__AS),KIND=16))

      MP__MDL_G__EXP__2 = MP__G**2

      MP__MDL_G__EXP__3 = MP__G**3

      MP__MDL_G__EXP__4 = MP__G**4

C     
C     Parameters that should be updated for the loops.
C     
C     
C     Definition of the EW coupling used in the write out of aqed
C     
      MP__GAL(1) = 2 * SQRT(MP__PI/ABS(MP__AEWM1))
      MP__GAL(2) = 1D0

