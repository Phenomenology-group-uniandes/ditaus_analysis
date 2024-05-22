ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE COUP1()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'

      DOUBLE PRECISION PI, ZERO
      PARAMETER  (PI=3.141592653589793D0)
      PARAMETER  (ZERO=0D0)
      INCLUDE 'input.inc'
      INCLUDE 'coupl.inc'
      GC_61 = MDL_COMPLEXI*MDL_YRR1X1
      GC_62 = MDL_COMPLEXI*MDL_YRR1X2
      GC_63 = MDL_COMPLEXI*MDL_YRR1X3
      GC_64 = MDL_COMPLEXI*MDL_YRR2X1
      GC_65 = MDL_COMPLEXI*MDL_YRR2X2
      GC_66 = MDL_COMPLEXI*MDL_YRR2X3
      END
