modname = U1T3R  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoU1T3R.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoU1T3R:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoU1T3R.o 
	 ${F90} -o SPhenoU1T3R ${LFlagsB} SPhenoU1T3R.o ../lib/libSPhenoU1T3R.a ../lib/libSPheno.a
	 mv SPhenoU1T3R ../bin
	 rm SPhenoU1T3R.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_U1T3R.o)  \
 ${name}(RGEs_U1T3R.o)   \
 ${name}(Couplings_U1T3R.o) ${name}(TreeLevelMasses_U1T3R.o) ${name}(TadpoleEquations_U1T3R.o) \
 ${name}(LoopCouplings_U1T3R.o) ${name}(CouplingsForDecays_U1T3R.o) \
 ${name}(TreeLevel_Decays_U1T3R.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_U1T3R.o) \
 ${name}(LoopMasses_U1T3R.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_U1T3R.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecayFu_U1T3R.o)  ${name}(LoopDecayFe_U1T3R.o)  ${name}(LoopDecayFd_U1T3R.o)  ${name}(LoopDecayhh_U1T3R.o) \
 ${name}(Wrapper_LoopDecay_Fu_U1T3R.o)  ${name}(Wrapper_LoopDecay_Fe_U1T3R.o)  ${name}(Wrapper_LoopDecay_Fd_U1T3R.o)  ${name}(Wrapper_LoopDecay_hh_U1T3R.o) ${name}(OneLoopDecays_U1T3R.o) \
 ${name}(BranchingRatios_U1T3R.o) ${name}(HiggsCS_U1T3R.o) ${name}(RunSM_U1T3R.o) \
 ${name}(Unitarity_U1T3R.o) \
 ${name}(LowEnergy_U1T3R.o) \
 ${name}(Boundaries_U1T3R.o)  ${name}(InputOutput_U1T3R.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
