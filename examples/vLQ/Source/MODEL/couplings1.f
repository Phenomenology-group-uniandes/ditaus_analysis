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
      GC_15 = (MDL_BETAL1X3*MDL_COMPLEXI*MDL_GU)/MDL_SQRT__2
      GC_16 = (MDL_BETAL2X3*MDL_COMPLEXI*MDL_GU)/MDL_SQRT__2
      GC_18 = (MDL_BETAL3X3*MDL_COMPLEXI*MDL_GU)/MDL_SQRT__2
      GC_19 = (MDL_BETARD3X3*MDL_COMPLEXI*MDL_GU)/MDL_SQRT__2
      END
