ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE COUP2()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'

      DOUBLE PRECISION PI, ZERO
      PARAMETER  (PI=3.141592653589793D0)
      PARAMETER  (ZERO=0D0)
      INCLUDE 'input.inc'
      INCLUDE 'coupl.inc'
      GC_7 = MDL_COMPLEXI*G
      R2GC_177_11 = -1.250000D-01*(MDL_CBA*MDL_COMPLEXI*MDL_G__EXP__2
     $ *MDL_MB*MDL_YB)/(PI**2*MDL_SQRT__2)-(MDL_COMPLEXI*MDL_G__EXP__2
     $ *MDL_MB*MDL_SB*MDL_SBA*MDL_YB)/(8.000000D+00*MDL_CB*PI**2
     $ *MDL_SQRT__2)
      R2GC_177_12 = -1.250000D-01*(MDL_CBA*MDL_COMPLEXI*MDL_G__EXP__2
     $ *MDL_MT*MDL_YT)/(PI**2*MDL_SQRT__2)+(MDL_CB*MDL_COMPLEXI
     $ *MDL_G__EXP__2*MDL_MT*MDL_SBA*MDL_YT)/(8.000000D+00*PI**2
     $ *MDL_SB*MDL_SQRT__2)
      END
