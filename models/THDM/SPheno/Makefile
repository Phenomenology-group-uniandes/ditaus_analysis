modname = THDMII  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoTHDMII.a
 
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
bin/SPhenoTHDMII:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoTHDMII.o 
	 ${F90} -o SPhenoTHDMII ${LFlagsB} SPhenoTHDMII.o ../lib/libSPhenoTHDMII.a ../lib/libSPheno.a
	 mv SPhenoTHDMII ../bin
	 rm SPhenoTHDMII.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_THDMII.o)  \
 ${name}(RGEs_THDMII.o)   \
 ${name}(Couplings_THDMII.o) ${name}(TreeLevelMasses_THDMII.o) ${name}(TadpoleEquations_THDMII.o) \
 ${name}(LoopCouplings_THDMII.o) ${name}(CouplingsForDecays_THDMII.o) \
 ${name}(TreeLevel_Decays_THDMII.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_THDMII.o) \
 ${name}(LoopMasses_THDMII.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_THDMII.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecayFu_THDMII.o)  ${name}(LoopDecayFe_THDMII.o)  ${name}(LoopDecayFd_THDMII.o)  ${name}(LoopDecayhh_THDMII.o)  ${name}(LoopDecayAh_THDMII.o)  ${name}(LoopDecayHm_THDMII.o) \
 ${name}(Wrapper_LoopDecay_Fu_THDMII.o)  ${name}(Wrapper_LoopDecay_Fe_THDMII.o)  ${name}(Wrapper_LoopDecay_Fd_THDMII.o)  ${name}(Wrapper_LoopDecay_hh_THDMII.o)  ${name}(Wrapper_LoopDecay_Ah_THDMII.o)  ${name}(Wrapper_LoopDecay_Hm_THDMII.o) ${name}(OneLoopDecays_THDMII.o) \
 ${name}(BranchingRatios_THDMII.o) ${name}(HiggsCS_THDMII.o) ${name}(RunSM_THDMII.o) \
 ${name}(Unitarity_THDMII.o) \
${name}(FlavorKit_LFV_THDMII.o) ${name}(FlavorKit_QFV_THDMII.o) ${name}(FlavorKit_Observables_THDMII.o)\
 ${name}(LowEnergy_THDMII.o) \
 ${name}(Boundaries_THDMII.o)  ${name}(InputOutput_THDMII.o) 
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
