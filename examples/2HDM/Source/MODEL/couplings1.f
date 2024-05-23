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
      REAL*16 MP__PI, MP__ZERO
      PARAMETER (MP__PI=3.1415926535897932384626433832795E0_16)
      PARAMETER (MP__ZERO=0E0_16)
      INCLUDE 'mp_input.inc'
      INCLUDE 'mp_coupl.inc'

      GC_140 = -((MDL_SB*MDL_YB)/(MDL_CB*MDL_SQRT__2))
      MP__GC_140 = -((MP__MDL_SB*MP__MDL_YB)/(MP__MDL_CB
     $ *MP__MDL_SQRT__2))
      GC_141 = (MDL_SB*MDL_YB)/(MDL_CB*MDL_SQRT__2)
      MP__GC_141 = (MP__MDL_SB*MP__MDL_YB)/(MP__MDL_CB*MP__MDL_SQRT__2)
      GC_143 = -((MDL_CBA*MDL_COMPLEXI*MDL_YB)/MDL_SQRT__2)
     $ -(MDL_COMPLEXI*MDL_SB*MDL_SBA*MDL_YB)/(MDL_CB*MDL_SQRT__2)
      MP__GC_143 = -((MP__MDL_CBA*MP__MDL_COMPLEXI*MP__MDL_YB)
     $ /MP__MDL_SQRT__2)-(MP__MDL_COMPLEXI*MP__MDL_SB*MP__MDL_SBA
     $ *MP__MDL_YB)/(MP__MDL_CB*MP__MDL_SQRT__2)
      GC_146 = -((MDL_CB*MDL_YT)/(MDL_SB*MDL_SQRT__2))
      MP__GC_146 = -((MP__MDL_CB*MP__MDL_YT)/(MP__MDL_SB
     $ *MP__MDL_SQRT__2))
      GC_147 = (MDL_CB*MDL_YT)/(MDL_SB*MDL_SQRT__2)
      MP__GC_147 = (MP__MDL_CB*MP__MDL_YT)/(MP__MDL_SB*MP__MDL_SQRT__2)
      GC_149 = -((MDL_CBA*MDL_COMPLEXI*MDL_YT)/MDL_SQRT__2)+(MDL_CB
     $ *MDL_COMPLEXI*MDL_SBA*MDL_YT)/(MDL_SB*MDL_SQRT__2)
      MP__GC_149 = -((MP__MDL_CBA*MP__MDL_COMPLEXI*MP__MDL_YT)
     $ /MP__MDL_SQRT__2)+(MP__MDL_CB*MP__MDL_COMPLEXI*MP__MDL_SBA
     $ *MP__MDL_YT)/(MP__MDL_SB*MP__MDL_SQRT__2)
      END
