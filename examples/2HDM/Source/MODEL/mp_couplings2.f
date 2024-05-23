ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE MP_COUP2()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'
      REAL*16 MP__PI, MP__ZERO
      PARAMETER (MP__PI=3.1415926535897932384626433832795E0_16)
      PARAMETER (MP__ZERO=0E0_16)
      INCLUDE 'mp_input.inc'
      INCLUDE 'mp_coupl.inc'

      MP__GC_7 = MP__MDL_COMPLEXI*MP__G
      MP__R2GC_177_11 = -1.250000E-01_16*(MP__MDL_CBA*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2*MP__MDL_MB*MP__MDL_YB)/(MP__PI**2
     $ *MP__MDL_SQRT__2)-(MP__MDL_COMPLEXI*MP__MDL_G__EXP__2
     $ *MP__MDL_MB*MP__MDL_SB*MP__MDL_SBA*MP__MDL_YB)/(8.000000E+00_16
     $ *MP__MDL_CB*MP__PI**2*MP__MDL_SQRT__2)
      MP__R2GC_177_12 = -1.250000E-01_16*(MP__MDL_CBA*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2*MP__MDL_MT*MP__MDL_YT)/(MP__PI**2
     $ *MP__MDL_SQRT__2)+(MP__MDL_CB*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2*MP__MDL_MT*MP__MDL_SBA*MP__MDL_YT)
     $ /(8.000000E+00_16*MP__PI**2*MP__MDL_SB*MP__MDL_SQRT__2)
      END
