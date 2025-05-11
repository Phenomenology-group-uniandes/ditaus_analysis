! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:57 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Unitarity_U1T3R 
 
Use Control 
Use Settings 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_U1T3R 
Use RGEs_U1T3R 
Use LoopMasses_U1T3R 
Use TreeLevelMasses_U1T3R 
Use Couplings_U1T3R 
Use Tadpoles_U1T3R 
 Use StandardModel 
 
Logical :: IncludeGoldstoneContributions=.true. 
Logical :: IncludeGoldstoneExternal=.true. 
Logical :: AddR=.true. 
Real(dp) :: cut_elements = 0.0001_dp 
Real(dp) :: cut_amplitudes = 0.01_dp 
Logical :: Ignore_poles=.false. 
 
Contains 

Subroutine ScatteringEigenvalues(vHinput,vPhiinput,g1input,g1Xinput,g2input,          & 
& g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,YuLinput,         & 
& YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,mChiEinput,           & 
& mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,delta0,kont)

Implicit None 
Integer, Intent(inout) :: kont 
Integer :: ierr 
Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp) :: vH,vPhi

Real(dp) :: gD(229) 
Real(dp) :: tz,dt,q,q2,mudim 
Real(dp), Intent(in) :: delta0 
Integer :: iter 
Complex(dp) :: scatter_matrix(21,21) 
Complex(dp) :: rot_matrix(21,21) 
Real(dp) :: eigenvalues_matrix(21), test(2), unitarity_s, scattering_eigenvalue, step_size
Real(dp),Intent(in) :: g1input,g1Xinput,g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,             & 
& LamPhiinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput

Complex(dp),Intent(in) :: YvLinput(3,3),YuLinput(3,3),YvRinput(3,3),YuRinput(3,3),YdLinput(3,3),YeLinput(3,3),  & 
& YdRinput(3,3),YeRinput(3,3),mChiDinput(3,3),mChiEinput(3,3),mChiNuinput(3,3),          & 
& mChiUinput(3,3)

max_scattering_eigenvalue = 0._dp 

g1 = g1input 
g1X = g1Xinput 
g2 = g2input 
g3 = g3input 
gX = gXinput 
gX1 = gX1input 
LamH = LamHinput 
LamPhiH = LamPhiHinput 
LamPhi = LamPhiinput 
YvL = YvLinput 
YuL = YuLinput 
YvR = YvRinput 
YuR = YuRinput 
YdL = YdLinput 
YeL = YeLinput 
YdR = YdRinput 
YeR = YeRinput 
mChiD = mChiDinput 
mChiE = mChiEinput 
mChiNu = mChiNuinput 
mChiU = mChiUinput 
mu2H = mu2Hinput 
mu2Phi = mu2Phiinput 
vH = vHinput 
vPhi = vPhiinput 
scatter_matrix=0._dp 
scatter_matrix(1,16) =-2._dp*(LamH)
scatter_matrix(2,17) =-2._dp*(LamH)
scatter_matrix(3,18) =-1._dp*(LamPhiH)
scatter_matrix(4,4) =-4._dp*(LamH)
scatter_matrix(4,10) =-2._dp*(LamH)
scatter_matrix(4,15) =-1._dp*(LamPhiH)
scatter_matrix(5,9) =-2._dp*(LamH)
scatter_matrix(6,13) =-1._dp*(LamPhiH)
scatter_matrix(7,19) =-2._dp*(LamH)
scatter_matrix(8,20) =-1._dp*(LamPhiH)
scatter_matrix(9,5) =-2._dp*(LamH)
scatter_matrix(10,4) =-2._dp*(LamH)
scatter_matrix(10,10) =-4._dp*(LamH)
scatter_matrix(10,15) =-1._dp*(LamPhiH)
scatter_matrix(11,14) =-1._dp*(LamPhiH)
scatter_matrix(12,21) =-2._dp*(LamPhi)
scatter_matrix(13,6) =-1._dp*(LamPhiH)
scatter_matrix(14,11) =-1._dp*(LamPhiH)
scatter_matrix(15,4) =-1._dp*(LamPhiH)
scatter_matrix(15,10) =-1._dp*(LamPhiH)
scatter_matrix(15,15) =-4._dp*(LamPhi)
scatter_matrix(16,1) =-2._dp*(LamH)
scatter_matrix(17,2) =-2._dp*(LamH)
scatter_matrix(18,3) =-1._dp*(LamPhiH)
scatter_matrix(19,7) =-2._dp*(LamH)
scatter_matrix(20,8) =-1._dp*(LamPhiH)
scatter_matrix(21,12) =-2._dp*(LamPhi)
Call EigenSystem( oo16pi*scatter_matrix,eigenvalues_matrix,rot_matrix,ierr,test) 

scattering_eigenvalue=MaxVal(Abs(eigenvalues_matrix)) 
max_scattering_eigenvalue=scattering_eigenvalue 
If (max_scattering_eigenvalue.gt.0.5_dp) TreeUnitarity=0._dp 
End Subroutine ScatteringEigenvalues

Subroutine ScatteringEigenvaluesWithTrilinears(alphaHinput,MAhinput,MAh2input,        & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,vHinput,vPhiinput,          & 
& g1input,g1Xinput,g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,              & 
& LamPhiinput,YvLinput,YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,            & 
& YeRinput,mChiDinput,mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,           & 
& delta0,kont)

Implicit None 
Integer, Intent(inout) :: kont 
Integer :: ierr 
Logical :: Pole_Present, SPole_Present, TPole_Present, UPole_Present, any_pole_present 
Integer :: RemoveTUpoles(99) 
Integer :: best_submatrix 
Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp) :: vH,vPhi

Complex(dp) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp

Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: g1input,g1Xinput,g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,             & 
& LamPhiinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput

Complex(dp),Intent(in) :: YvLinput(3,3),YuLinput(3,3),YvRinput(3,3),YuRinput(3,3),YdLinput(3,3),YeLinput(3,3),  & 
& YdRinput(3,3),YeRinput(3,3),mChiDinput(3,3),mChiEinput(3,3),mChiNuinput(3,3),          & 
& mChiUinput(3,3)

Real(dp),Intent(in) :: alphaHinput,MAhinput(2),MAh2input(2),MFdinput(6),MFd2input(6),MFeinput(6),            & 
& MFe2input(6),MFuinput(6),MFu2input(6),MFvinput(9),MFv2input(9),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZAinput(2,2),ZHinput(2,2),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(6,6),ZERinput(6,6),ZURinput(6,6),UVinput(9,9),ZDLinput(6,6),ZELinput(6,6),   & 
& ZULinput(6,6),ZWinput(2,2)

Complex(dp) :: scatter_matrix1(11,11) 
Complex(dp) :: scatter_matrix1B(11,11) 
Complex(dp) :: rot_matrix1(11,11) 
Real(dp) :: eigenvalues_matrix1(11)
Complex(dp) :: scatter_matrix2(4,4) 
Complex(dp) :: scatter_matrix2B(4,4) 
Complex(dp) :: rot_matrix2(4,4) 
Real(dp) :: eigenvalues_matrix2(4)
Real(dp) :: step_size,scattering_eigenvalue_trilinears, unitarity_s, test(2) 
Real(dp) :: gD(229) 
Real(dp) :: tz,dt,q,q2,mudim, max_element_removed  
Real(dp), Intent(in) :: delta0 
Integer :: iter, i, il,ir, count 
best_submatrix = 0 
g1 = g1input 
g1X = g1Xinput 
g2 = g2input 
g3 = g3input 
gX = gXinput 
gX1 = gX1input 
LamH = LamHinput 
LamPhiH = LamPhiHinput 
LamPhi = LamPhiinput 
YvL = YvLinput 
YuL = YuLinput 
YvR = YvRinput 
YuR = YuRinput 
YdL = YdLinput 
YeL = YeLinput 
YdR = YdRinput 
YeR = YeRinput 
mChiD = mChiDinput 
mChiE = mChiEinput 
mChiNu = mChiNuinput 
mChiU = mChiUinput 
mu2H = mu2Hinput 
mu2Phi = mu2Phiinput 
vH = vHinput 
vPhi = vPhiinput 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

Call CouplingsColourStructures(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh,           & 
& cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,    & 
& cplHpHpcHpcHp)

max_scattering_eigenvalue_trilinears = 0._dp 
If (unitarity_steps.eq.1) Then  
  step_size = 0._dp
Else  
 If (unitarity_steps.gt.0) Then 
  step_size = ((Abs(unitarity_s_max)) -(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) 
 Else 
  step_size = (log(Abs(unitarity_s_max)) -log(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) 
 End if 
End if 
Do iter=0,Abs(unitarity_steps)-1 
If (unitarity_steps.lt.0) Then 
  unitarity_s=exp(log(unitarity_s_min) + iter*step_size)**2 
Else 
  unitarity_s=(unitarity_s_min + iter*step_size)**2 
End if 
any_pole_present = .False. 
!! 1. sub-matrix  
Pole_Present = .false. 
max_element_removed = 0._dp 
RemoveTUpoles = 0 
scatter_matrix1=0._dp 
If (IncludeGoldstoneExternal) scatter_matrix1(1,1) = a0_AhAh_AhAh_00(unitarity_s,1,1,1,1,1,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,2) = a0_AhAh_AhAh_00(unitarity_s,1,1,1,2,1,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,3) = a0_AhAh_AhAh_00(unitarity_s,1,1,2,2,1,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,4) = a0_AhAh_Ahhh_00(unitarity_s,1,1,1,1,1,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,5) = a0_AhAh_Ahhh_00(unitarity_s,1,1,1,2,1,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,6) = a0_AhAh_Ahhh_00(unitarity_s,1,1,2,1,1,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,7) = a0_AhAh_Ahhh_00(unitarity_s,1,1,2,2,1,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,8) = a0_AhAh_hhhh_00(unitarity_s,1,1,1,1,1,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,9) = a0_AhAh_hhhh_00(unitarity_s,1,1,1,2,1,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,10) = a0_AhAh_hhhh_00(unitarity_s,1,1,2,2,1,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(1,11) = a0_AhAh_HpHpc_00(unitarity_s,1,1,1,1,1,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,1) = a0_AhAh_AhAh_00(unitarity_s,1,2,1,1,2,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,2) = a0_AhAh_AhAh_00(unitarity_s,1,2,1,2,2,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,3) = a0_AhAh_AhAh_00(unitarity_s,1,2,2,2,2,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,4) = a0_AhAh_Ahhh_00(unitarity_s,1,2,1,1,2,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,5) = a0_AhAh_Ahhh_00(unitarity_s,1,2,1,2,2,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,6) = a0_AhAh_Ahhh_00(unitarity_s,1,2,2,1,2,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,7) = a0_AhAh_Ahhh_00(unitarity_s,1,2,2,2,2,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,8) = a0_AhAh_hhhh_00(unitarity_s,1,2,1,1,2,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,9) = a0_AhAh_hhhh_00(unitarity_s,1,2,1,2,2,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,10) = a0_AhAh_hhhh_00(unitarity_s,1,2,2,2,2,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(2,11) = a0_AhAh_HpHpc_00(unitarity_s,1,2,1,1,2,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,1) = a0_AhAh_AhAh_00(unitarity_s,2,2,1,1,3,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,2) = a0_AhAh_AhAh_00(unitarity_s,2,2,1,2,3,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,3) = a0_AhAh_AhAh_00(unitarity_s,2,2,2,2,3,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,4) = a0_AhAh_Ahhh_00(unitarity_s,2,2,1,1,3,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,5) = a0_AhAh_Ahhh_00(unitarity_s,2,2,1,2,3,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,6) = a0_AhAh_Ahhh_00(unitarity_s,2,2,2,1,3,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,7) = a0_AhAh_Ahhh_00(unitarity_s,2,2,2,2,3,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,8) = a0_AhAh_hhhh_00(unitarity_s,2,2,1,1,3,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,9) = a0_AhAh_hhhh_00(unitarity_s,2,2,1,2,3,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,10) = a0_AhAh_hhhh_00(unitarity_s,2,2,2,2,3,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(3,11) = a0_AhAh_HpHpc_00(unitarity_s,2,2,1,1,3,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,1) = a0_Ahhh_AhAh_00(unitarity_s,1,1,1,1,4,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,2) = a0_Ahhh_AhAh_00(unitarity_s,1,1,1,2,4,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,3) = a0_Ahhh_AhAh_00(unitarity_s,1,1,2,2,4,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,4) = a0_Ahhh_Ahhh_00(unitarity_s,1,1,1,1,4,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,5) = a0_Ahhh_Ahhh_00(unitarity_s,1,1,1,2,4,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,6) = a0_Ahhh_Ahhh_00(unitarity_s,1,1,2,1,4,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,7) = a0_Ahhh_Ahhh_00(unitarity_s,1,1,2,2,4,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,8) = a0_Ahhh_hhhh_00(unitarity_s,1,1,1,1,4,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,9) = a0_Ahhh_hhhh_00(unitarity_s,1,1,1,2,4,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,10) = a0_Ahhh_hhhh_00(unitarity_s,1,1,2,2,4,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(4,11) = a0_Ahhh_HpHpc_00(unitarity_s,1,1,1,1,4,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,1) = a0_Ahhh_AhAh_00(unitarity_s,1,2,1,1,5,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,2) = a0_Ahhh_AhAh_00(unitarity_s,1,2,1,2,5,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,3) = a0_Ahhh_AhAh_00(unitarity_s,1,2,2,2,5,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,4) = a0_Ahhh_Ahhh_00(unitarity_s,1,2,1,1,5,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,5) = a0_Ahhh_Ahhh_00(unitarity_s,1,2,1,2,5,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,6) = a0_Ahhh_Ahhh_00(unitarity_s,1,2,2,1,5,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,7) = a0_Ahhh_Ahhh_00(unitarity_s,1,2,2,2,5,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,8) = a0_Ahhh_hhhh_00(unitarity_s,1,2,1,1,5,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,9) = a0_Ahhh_hhhh_00(unitarity_s,1,2,1,2,5,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,10) = a0_Ahhh_hhhh_00(unitarity_s,1,2,2,2,5,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(5,11) = a0_Ahhh_HpHpc_00(unitarity_s,1,2,1,1,5,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,1) = a0_Ahhh_AhAh_00(unitarity_s,2,1,1,1,6,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,2) = a0_Ahhh_AhAh_00(unitarity_s,2,1,1,2,6,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,3) = a0_Ahhh_AhAh_00(unitarity_s,2,1,2,2,6,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,4) = a0_Ahhh_Ahhh_00(unitarity_s,2,1,1,1,6,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,5) = a0_Ahhh_Ahhh_00(unitarity_s,2,1,1,2,6,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,6) = a0_Ahhh_Ahhh_00(unitarity_s,2,1,2,1,6,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,7) = a0_Ahhh_Ahhh_00(unitarity_s,2,1,2,2,6,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,8) = a0_Ahhh_hhhh_00(unitarity_s,2,1,1,1,6,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,9) = a0_Ahhh_hhhh_00(unitarity_s,2,1,1,2,6,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,10) = a0_Ahhh_hhhh_00(unitarity_s,2,1,2,2,6,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(6,11) = a0_Ahhh_HpHpc_00(unitarity_s,2,1,1,1,6,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,1) = a0_Ahhh_AhAh_00(unitarity_s,2,2,1,1,7,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,2) = a0_Ahhh_AhAh_00(unitarity_s,2,2,1,2,7,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,3) = a0_Ahhh_AhAh_00(unitarity_s,2,2,2,2,7,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,4) = a0_Ahhh_Ahhh_00(unitarity_s,2,2,1,1,7,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,5) = a0_Ahhh_Ahhh_00(unitarity_s,2,2,1,2,7,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,6) = a0_Ahhh_Ahhh_00(unitarity_s,2,2,2,1,7,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,7) = a0_Ahhh_Ahhh_00(unitarity_s,2,2,2,2,7,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,8) = a0_Ahhh_hhhh_00(unitarity_s,2,2,1,1,7,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,9) = a0_Ahhh_hhhh_00(unitarity_s,2,2,1,2,7,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,10) = a0_Ahhh_hhhh_00(unitarity_s,2,2,2,2,7,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(7,11) = a0_Ahhh_HpHpc_00(unitarity_s,2,2,1,1,7,11) 
scatter_matrix1(8,1) = a0_hhhh_AhAh_00(unitarity_s,1,1,1,1,8,1) 
scatter_matrix1(8,2) = a0_hhhh_AhAh_00(unitarity_s,1,1,1,2,8,2) 
scatter_matrix1(8,3) = a0_hhhh_AhAh_00(unitarity_s,1,1,2,2,8,3) 
scatter_matrix1(8,4) = a0_hhhh_Ahhh_00(unitarity_s,1,1,1,1,8,4) 
scatter_matrix1(8,5) = a0_hhhh_Ahhh_00(unitarity_s,1,1,1,2,8,5) 
scatter_matrix1(8,6) = a0_hhhh_Ahhh_00(unitarity_s,1,1,2,1,8,6) 
scatter_matrix1(8,7) = a0_hhhh_Ahhh_00(unitarity_s,1,1,2,2,8,7) 
scatter_matrix1(8,8) = a0_hhhh_hhhh_00(unitarity_s,1,1,1,1,8,8) 
scatter_matrix1(8,9) = a0_hhhh_hhhh_00(unitarity_s,1,1,1,2,8,9) 
scatter_matrix1(8,10) = a0_hhhh_hhhh_00(unitarity_s,1,1,2,2,8,10) 
scatter_matrix1(8,11) = a0_hhhh_HpHpc_00(unitarity_s,1,1,1,1,8,11) 
scatter_matrix1(9,1) = a0_hhhh_AhAh_00(unitarity_s,1,2,1,1,9,1) 
scatter_matrix1(9,2) = a0_hhhh_AhAh_00(unitarity_s,1,2,1,2,9,2) 
scatter_matrix1(9,3) = a0_hhhh_AhAh_00(unitarity_s,1,2,2,2,9,3) 
scatter_matrix1(9,4) = a0_hhhh_Ahhh_00(unitarity_s,1,2,1,1,9,4) 
scatter_matrix1(9,5) = a0_hhhh_Ahhh_00(unitarity_s,1,2,1,2,9,5) 
scatter_matrix1(9,6) = a0_hhhh_Ahhh_00(unitarity_s,1,2,2,1,9,6) 
scatter_matrix1(9,7) = a0_hhhh_Ahhh_00(unitarity_s,1,2,2,2,9,7) 
scatter_matrix1(9,8) = a0_hhhh_hhhh_00(unitarity_s,1,2,1,1,9,8) 
scatter_matrix1(9,9) = a0_hhhh_hhhh_00(unitarity_s,1,2,1,2,9,9) 
scatter_matrix1(9,10) = a0_hhhh_hhhh_00(unitarity_s,1,2,2,2,9,10) 
scatter_matrix1(9,11) = a0_hhhh_HpHpc_00(unitarity_s,1,2,1,1,9,11) 
scatter_matrix1(10,1) = a0_hhhh_AhAh_00(unitarity_s,2,2,1,1,10,1) 
scatter_matrix1(10,2) = a0_hhhh_AhAh_00(unitarity_s,2,2,1,2,10,2) 
scatter_matrix1(10,3) = a0_hhhh_AhAh_00(unitarity_s,2,2,2,2,10,3) 
scatter_matrix1(10,4) = a0_hhhh_Ahhh_00(unitarity_s,2,2,1,1,10,4) 
scatter_matrix1(10,5) = a0_hhhh_Ahhh_00(unitarity_s,2,2,1,2,10,5) 
scatter_matrix1(10,6) = a0_hhhh_Ahhh_00(unitarity_s,2,2,2,1,10,6) 
scatter_matrix1(10,7) = a0_hhhh_Ahhh_00(unitarity_s,2,2,2,2,10,7) 
scatter_matrix1(10,8) = a0_hhhh_hhhh_00(unitarity_s,2,2,1,1,10,8) 
scatter_matrix1(10,9) = a0_hhhh_hhhh_00(unitarity_s,2,2,1,2,10,9) 
scatter_matrix1(10,10) = a0_hhhh_hhhh_00(unitarity_s,2,2,2,2,10,10) 
scatter_matrix1(10,11) = a0_hhhh_HpHpc_00(unitarity_s,2,2,1,1,10,11) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,1) = a0_HpHpc_AhAh_00(unitarity_s,1,1,1,1,11,1) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,2) = a0_HpHpc_AhAh_00(unitarity_s,1,1,1,2,11,2) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,3) = a0_HpHpc_AhAh_00(unitarity_s,1,1,2,2,11,3) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,4) = a0_HpHpc_Ahhh_00(unitarity_s,1,1,1,1,11,4) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,5) = a0_HpHpc_Ahhh_00(unitarity_s,1,1,1,2,11,5) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,6) = a0_HpHpc_Ahhh_00(unitarity_s,1,1,2,1,11,6) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,7) = a0_HpHpc_Ahhh_00(unitarity_s,1,1,2,2,11,7) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,8) = a0_HpHpc_hhhh_00(unitarity_s,1,1,1,1,11,8) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,9) = a0_HpHpc_hhhh_00(unitarity_s,1,1,1,2,11,9) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,10) = a0_HpHpc_hhhh_00(unitarity_s,1,1,2,2,11,10) 
If (IncludeGoldstoneExternal) scatter_matrix1(11,11) = a0_HpHpc_HpHpc_00(unitarity_s,1,1,1,1,11,11) 


Select CASE (TUcutLevel)  
CASE (2) 
  scatter_matrix1B = scatter_matrix1
Do i=1,11 
  If (RemoveTUpoles(i).eq.1) Then
   scatter_matrix1(i,:) = 0._dp 
   scatter_matrix1(:,i) = 0._dp 
    If (AddR) scatter_matrix1(i,i) = -1111._dp ! to get a fixed order of the eigenvalues 
   scatter_matrix1B(:,i) = 0._dp 
  Else 
   scatter_matrix1B(i,:) = 0._dp 
  End If 
End Do 
CASE (1) 
If ((Abs(max_element_removed)/MaxVal(Abs(scatter_matrix1))).gt.cut_elements) Then 
 ! Write(*,*)  (Abs(max_element_removed)/MaxVal(Abs(scatter_matrix1)))  
End if 
End Select 
If ((.not. pole_present) .and. (.not. any_pole_present) ) Then 
Call EigenSystem(scatter_matrix1,eigenvalues_matrix1,rot_matrix1,ierr,test)
 If ((TUcutLevel.eq.2).and.(AddR)) Then ! Calculate 'R' 
  scatter_matrix1B = MatMul(scatter_matrix1B,Conjg(Transpose(rot_matrix1))) 
   Do i=1,11 
    If (eigenvalues_matrix1 (i).lt.-1000._dp) Then
     eigenvalues_matrix1(i) = 0._dp 
    Else 
     eigenvalues_matrix1(i) = sqrt(eigenvalues_matrix1(i)**2+  sum(scatter_matrix1B(i,:)**2) )
    End If
   End Do 
 End If 
scattering_eigenvalue_trilinears=MaxVal(Abs(eigenvalues_matrix1)) 
Else 
  scattering_eigenvalue_trilinears = 0._dp 
End if 
If (scattering_eigenvalue_trilinears.gt.max_scattering_eigenvalue_trilinears) Then 
   max_scattering_eigenvalue_trilinears=scattering_eigenvalue_trilinears 
   unitarity_s_best=sqrt(unitarity_s)
   best_submatrix=1
End if 
 
!! 2. sub-matrix  
Pole_Present = .false. 
max_element_removed = 0._dp 
RemoveTUpoles = 0 
scatter_matrix2=0._dp 
If (IncludeGoldstoneExternal) scatter_matrix2(1,1) = a0_AhHp_AhHpc_00(unitarity_s,1,1,1,1,1,1) 
If (IncludeGoldstoneExternal) scatter_matrix2(1,2) = a0_AhHp_AhHpc_00(unitarity_s,1,1,2,1,1,2) 
If (IncludeGoldstoneExternal) scatter_matrix2(1,3) = a0_AhHp_hhHpc_00(unitarity_s,1,1,1,1,1,3) 
If (IncludeGoldstoneExternal) scatter_matrix2(1,4) = a0_AhHp_hhHpc_00(unitarity_s,1,1,2,1,1,4) 
If (IncludeGoldstoneExternal) scatter_matrix2(2,1) = a0_AhHp_AhHpc_00(unitarity_s,2,1,1,1,2,1) 
If (IncludeGoldstoneExternal) scatter_matrix2(2,2) = a0_AhHp_AhHpc_00(unitarity_s,2,1,2,1,2,2) 
If (IncludeGoldstoneExternal) scatter_matrix2(2,3) = a0_AhHp_hhHpc_00(unitarity_s,2,1,1,1,2,3) 
If (IncludeGoldstoneExternal) scatter_matrix2(2,4) = a0_AhHp_hhHpc_00(unitarity_s,2,1,2,1,2,4) 
If (IncludeGoldstoneExternal) scatter_matrix2(3,1) = a0_hhHp_AhHpc_00(unitarity_s,1,1,1,1,3,1) 
If (IncludeGoldstoneExternal) scatter_matrix2(3,2) = a0_hhHp_AhHpc_00(unitarity_s,1,1,2,1,3,2) 
If (IncludeGoldstoneExternal) scatter_matrix2(3,3) = a0_hhHp_hhHpc_00(unitarity_s,1,1,1,1,3,3) 
If (IncludeGoldstoneExternal) scatter_matrix2(3,4) = a0_hhHp_hhHpc_00(unitarity_s,1,1,2,1,3,4) 
If (IncludeGoldstoneExternal) scatter_matrix2(4,1) = a0_hhHp_AhHpc_00(unitarity_s,2,1,1,1,4,1) 
If (IncludeGoldstoneExternal) scatter_matrix2(4,2) = a0_hhHp_AhHpc_00(unitarity_s,2,1,2,1,4,2) 
If (IncludeGoldstoneExternal) scatter_matrix2(4,3) = a0_hhHp_hhHpc_00(unitarity_s,2,1,1,1,4,3) 
If (IncludeGoldstoneExternal) scatter_matrix2(4,4) = a0_hhHp_hhHpc_00(unitarity_s,2,1,2,1,4,4) 


Select CASE (TUcutLevel)  
CASE (2) 
  scatter_matrix2B = scatter_matrix2
Do i=1,4 
  If (RemoveTUpoles(i).eq.1) Then
   scatter_matrix2(i,:) = 0._dp 
   scatter_matrix2(:,i) = 0._dp 
    If (AddR) scatter_matrix2(i,i) = -1111._dp ! to get a fixed order of the eigenvalues 
   scatter_matrix2B(:,i) = 0._dp 
  Else 
   scatter_matrix2B(i,:) = 0._dp 
  End If 
End Do 
CASE (1) 
If ((Abs(max_element_removed)/MaxVal(Abs(scatter_matrix2))).gt.cut_elements) Then 
 ! Write(*,*)  (Abs(max_element_removed)/MaxVal(Abs(scatter_matrix2)))  
End if 
End Select 
If ((.not. pole_present) .and. (.not. any_pole_present) ) Then 
Call EigenSystem(scatter_matrix2,eigenvalues_matrix2,rot_matrix2,ierr,test)
 If ((TUcutLevel.eq.2).and.(AddR)) Then ! Calculate 'R' 
  scatter_matrix2B = MatMul(scatter_matrix2B,Conjg(Transpose(rot_matrix2))) 
   Do i=1,4 
    If (eigenvalues_matrix2 (i).lt.-1000._dp) Then
     eigenvalues_matrix2(i) = 0._dp 
    Else 
     eigenvalues_matrix2(i) = sqrt(eigenvalues_matrix2(i)**2+  sum(scatter_matrix2B(i,:)**2) )
    End If
   End Do 
 End If 
scattering_eigenvalue_trilinears=MaxVal(Abs(eigenvalues_matrix2)) 
Else 
  scattering_eigenvalue_trilinears = 0._dp 
End if 
If (scattering_eigenvalue_trilinears.gt.max_scattering_eigenvalue_trilinears) Then 
   max_scattering_eigenvalue_trilinears=scattering_eigenvalue_trilinears 
   unitarity_s_best=sqrt(unitarity_s)
   best_submatrix=2
End if 
 
!! 3. sub-matrix  
Pole_Present = .false. 
max_element_removed = 0._dp 
RemoveTUpoles = 0 
If (IncludeGoldstoneExternal) scattering_eigenvalue_trilinears= a0_HpHp_HpcHpc_00(unitarity_s,1,1,1,1,1,1) 
scattering_eigenvalue_trilinears=Abs(scattering_eigenvalue_trilinears) 


Select CASE (TUcutLevel)  
CASE (2) 
If (RemoveTUpoles(1).eq.1) scattering_eigenvalue_trilinears = 0._dp 
CASE (1) 
End Select 
If (scattering_eigenvalue_trilinears.gt.max_scattering_eigenvalue_trilinears) Then 
   max_scattering_eigenvalue_trilinears=scattering_eigenvalue_trilinears 
   unitarity_s_best=sqrt(unitarity_s)
   best_submatrix=3
End if 
 
End do 

If (max_scattering_eigenvalue_trilinears.gt.0.5_dp) TreeUnitarityTrilinear=0._dp 
 
 Write(*,*) "Best submatrix: ",best_submatrix 
 
! Write(*,*) (max_scattering_eigenvalue_trilinears) 
 


 Contains 

Complex(dp) Function a0_AhAh_AhAh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MAh(i2)
m3 = MAh(i3)
m4 = MAh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhAhAh(i1,i2,i3,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i2,iprop)
unicpl2(1)=cplAhAhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i3,iprop)
unicpl2(1)=cplAhAhhh(i2,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i4,iprop)
unicpl2(1)=cplAhAhhh(i2,i3,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhAh_AhAh_00

Complex(dp) Function a0_AhAh_Ahhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MAh(i2)
m3 = MAh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhAh_Ahhh_00

Complex(dp) Function a0_AhAh_hhhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MAh(i2)
m3 = Mhh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhhhhh(i1,i2,i3,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i2,iprop)
unicpl2(1)=cplhhhhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,iprop,i3)
unicpl2(1)=cplAhAhhh(i2,iprop,i4)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,MAh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,MAh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,iprop,i4)
unicpl2(1)=cplAhAhhh(i2,iprop,i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MAh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MAh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhAh_hhhh_00

Complex(dp) Function a0_AhAh_HpHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MAh(i2)
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhHpcHp(i1,i2)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i2,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhAh_HpHpc_00

Complex(dp) Function a0_Ahhh_AhAh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = Mhh(i2)
m3 = MAh(i3)
m4 = MAh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_Ahhh_AhAh_00

Complex(dp) Function a0_Ahhh_Ahhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = Mhh(i2)
m3 = MAh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhhhhh(i1,i3,i2,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,iprop,i2)
unicpl2(1)=cplAhAhhh(i3,iprop,i4)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/MAh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i3,iprop)
unicpl2(1)=cplhhhhhh(i2,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,iprop,i4)
unicpl2(1)=cplAhAhhh(i3,iprop,i2)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MAh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MAh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_Ahhh_Ahhh_00

Complex(dp) Function a0_Ahhh_hhhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = Mhh(i2)
m3 = Mhh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_Ahhh_hhhh_00

Complex(dp) Function a0_Ahhh_HpHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = Mhh(i2)
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_Ahhh_HpHpc_00

Complex(dp) Function a0_AhHp_AhHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MHp
m3 = MAh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhHpcHp(i1,i3)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i3,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhHp_AhHpc_00

Complex(dp) Function a0_AhHp_hhHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MHp
m3 = Mhh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhHp_hhHpc_00

Complex(dp) Function a0_AhHpc_AhHp_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MHp
m3 = MAh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhHpcHp(i1,i3)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i1,i3,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhHpc_AhHp_00

Complex(dp) Function a0_AhHpc_hhHp_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MAh(i1)
m2 = MHp
m3 = Mhh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_AhHpc_hhHp_00

Complex(dp) Function a0_hhhh_AhAh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = Mhh(i2)
m3 = MAh(i3)
m4 = MAh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhhhhh(i3,i4,i1,i2)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i2,iprop)
unicpl2(1)=cplAhAhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i3,iprop,i1)
unicpl2(1)=cplAhAhhh(i4,iprop,i2)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,MAh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,MAh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=3
Do iprop=istart,2
unicpl1(1)=cplAhAhhh(i4,iprop,i1)
unicpl2(1)=cplAhAhhh(i3,iprop,i2)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MAh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MAh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MAh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhhh_AhAh_00

Complex(dp) Function a0_hhhh_Ahhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = Mhh(i2)
m3 = MAh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhhh_Ahhh_00

Complex(dp) Function a0_hhhh_hhhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = Mhh(i2)
m3 = Mhh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplhhhhhhhh(i1,i2,i3,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i2,iprop)
unicpl2(1)=cplhhhhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i3,iprop)
unicpl2(1)=cplhhhhhh(i2,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i4,iprop)
unicpl2(1)=cplhhhhhh(i2,i3,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhhh_hhhh_00

Complex(dp) Function a0_hhhh_HpHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = Mhh(i2)
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplhhhhHpcHp(i1,i2)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i2,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i2)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i2)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhhh_HpHpc_00

Complex(dp) Function a0_hhHp_AhHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = MHp
m3 = MAh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhHp_AhHpc_00

Complex(dp) Function a0_hhHp_hhHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = MHp
m3 = Mhh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplhhhhHpcHp(i1,i3)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/MHp**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i3,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhHp_hhHpc_00

Complex(dp) Function a0_hhHpc_AhHp_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = MHp
m3 = MAh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhHpc_AhHp_00

Complex(dp) Function a0_hhHpc_hhHp_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = Mhh(i1)
m2 = MHp
m3 = Mhh(i3)
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplhhhhHpcHp(i1,i3)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/MHp**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhhhhh(i1,i3,iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i1)
unicpl2(1)=cplhhHpcHp(i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_hhHpc_hhHp_00

Complex(dp) Function a0_HpHp_HpcHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplHpHpcHpcHp
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpHp_HpcHpc_00

Complex(dp) Function a0_HpHpc_AhAh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = MAh(i3)
m4 = MAh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplAhAhHpcHp(i3,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplAhAhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpHpc_AhAh_00

Complex(dp) Function a0_HpHpc_Ahhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = MAh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 


! S-Channel 


! T-Channel 


! U-Channel 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpHpc_Ahhh_00

Complex(dp) Function a0_HpHpc_hhhh_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = Mhh(i3)
m4 = Mhh(i4)
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplhhhhHpcHp(i3,i4)
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhhhhh(i3,i4,iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i3)
unicpl2(1)=cplhhHpcHp(i4)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
If (.not.IncludeGoldstoneContributions) istart=2
Do iprop=istart,1
unicpl1(1)=cplhhHpcHp(i4)
unicpl2(1)=cplhhHpcHp(i3)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,MHp,s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,MHp**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,MHp  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpHpc_hhhh_00

Complex(dp) Function a0_HpHpc_HpHpc_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplHpHpcHpcHp
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Schannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If (Abs(1-s/Mhh(iProp)**2).lt.CutSpole) Then 
 Any_Pole_Present = .true. 
 Pole_Present = .true. 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! T-Channel 


! U-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpHpc_HpHpc_00

Complex(dp) Function a0_HpcHpc_HpHp_00(s,i1,i2,i3,i4,ind1,ind2)  Result(amp)
Implicit None 
Integer, Intent(in) :: i1,i2,i3,i4,ind1,ind2 
Real(dp), Intent(in) :: s 
Integer :: iprop, istart,c1,c2,c2end 
Logical :: pole_s_channel=.False. 
Real(dp) :: m1,m2,m3,m4 
Complex(dp) :: tempamp2(1,1) 
Complex(dp) :: amp_poles 
Complex(dp) :: unicpl1(8),unicpl2(8) 
amp = 0._dp 
tempamp2(:,:) = 0._dp 
amp_poles = 0._dp 
m1 = MHp
m2 = MHp
m3 = MHp
m4 = MHp
If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then 


! Quartic 
unicpl1(1)=cplHpHpcHpcHp
amp = amp +(-2._dp)*(unicpl1(1))


! S-Channel 


! T-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Tchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "T",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 


! U-Channel 
istart=1
Do iprop=istart,2
unicpl1(1)=cplhhHpcHp(iprop)
unicpl2(1)=cplhhHpcHp(iprop)
tempamp2(1,1)= unicpl1(1)*unicpl2(1)*Uchannel(m1,m2,m3,m4,Mhh(iProp),s,(1._dp,0._dp),(1._dp,0._dp)) 
If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,Mhh(iProp)**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then 
! Write(*,*) "U",m1,m2,m3,m4,Mhh(iProp)  
Select Case (TUcutLevel) 
 Case (4) 
   Any_Pole_Present = .True. 
 Case (3) 
   Pole_Present = .True. 
 Case (2) 
  RemoveTUpoles(ind1) = 1 
  RemoveTUpoles(ind2) = 1 
 Case (1) 
  amp_poles  = 0._dp
 Case (0) 
  amp = amp + tempamp2(1,1)
End Select 
Else 
  amp = amp + tempamp2(1,1)
End if 
End Do 
End if 
amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp=amp/sqrt(2._dp) 
If (i3.eq.i4) amp=amp/sqrt(2._dp) 
If (TUcutLevel.eq.1) Then 
 amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s 
If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) 
If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) 
  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then 
   ! Write(*,*) "TU ratio", (Abs(amp_poles)/Abs(amp))  
   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) 
   amp = 0._dp 
  End if 
End if 
End Function a0_HpcHpc_HpHp_00

End Subroutine ScatteringEigenvaluesWithTrilinears

Complex(dp) Function Kaehler(a,b,c) 
Implicit None 
Real(dp),Intent(in)::a,b,c
Kaehler = a**2-2._dp*a*(b+c)+(b-c)**2 
End Function Kaehler 
  
Real(dp) Function CheckTpole(m1,m2,m3,m4,mP) 
Implicit None 
Real(dp),Intent(in)::m1,m2,m3,m4,mP
Complex(dp):: res
res = (m2*m3 - m3*m4 + m2*mP + m3*mP + m4*mP - mP**2 + m1*(-m2 + m4 + mP) + Sqrt(m1**2 + (m3 - mP)**2 &
  &  - 2*m1*(m3 + mP))*Sqrt(m2**2 + (m4 - mP)**2 - 2*m2*(m4 + mP)))/(2.*mP)
If (res.ne.res) res=0._dp 
If (Aimag(res).gt.1._dp) Then 
 CheckTpole = 0._dp 
Else 
 CheckTpole = Real(1.05_dp*res,dp) 
End If 
End Function CheckTpole 
 
Real(dp) Function CheckUpole(m1,m2,m3,m4,mP) 
Implicit None 
Real(dp),Intent(in)::m1,m2,m3,m4,mP
Complex(dp) :: res
res =(m2*m4-m3*m4+m2*mP+m3*mP+m4*mP-mP**2+m1*(-m2+m3+mP)+Sqrt(m2**2+(m3-mP)**2 &
  &-2*m2*(m3+mP))*Sqrt(m1**2+(m4-mP)**2-2*m1*(m4+mP)))/(2.*mP)
If (res.ne.res) res=0._dp 
If (Aimag(res).gt.1._dp) Then 
 CheckUpole = 0._dp 
Else 
 CheckUpole = Real(1.05_dp*res,dp) 
End If 
End Function CheckUpole 
 
Complex(dp) Function Schannel(m1,m2,m3,m4,mP,s,c1,c2) 
Implicit None 
Real(dp),Intent(in)::m1,m2,m3,m4,mP,s
Complex(dp),Intent(in)::c1,c2
Schannel = 2._dp/(-mP**2+s) 
Schannel = c1*c2*Schannel 
End Function Schannel 
 
Complex(dp) Function Uchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) 
Implicit None 
Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s
Complex(dp),Intent(in)::c1,c2
Complex(dp)::m1,m2,m3,m4,mP 
m1=Cmplx(m1r,0._dp)
m2=Cmplx(m2r,0._dp)
m3=Cmplx(m3r,0._dp)
m4=Cmplx(m4r,0._dp)
mP=Cmplx(mPr,0._dp)
Uchannel = (2*s*Log(-(((m1 - m2)*(m1 + m2)*(m3 - m4)*(m3 + m4) + (m1**2 + m2**2 + m3**2 + m4**2 - 2*mP**2)*s & 
  & - s**2 + Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s))))/& 
  &((-m1 + m2)*(m1 + m2)*(m3 - m4)*(m3 + m4) - (m1**2 + m2**2 + m3**2 + m4**2 - 2*mP**2)*s + s**2 + & 
  & Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s)))))))/& 
 &Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s))) 
Uchannel = c1*c2*Uchannel 
End Function Uchannel 
  
Complex(dp) Function Tchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) 
Implicit None 
Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s
Complex(dp),Intent(in)::c1,c2
Complex(dp)::m1,m2,m3,m4,mP 
m1=Cmplx(m1r,0._dp)
m2=Cmplx(m2r,0._dp)
m3=Cmplx(m3r,0._dp)
m4=Cmplx(m4r,0._dp)
mP=Cmplx(mPr,0._dp)
Tchannel =(2*s*Log(((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)-(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s+s**2& 
  & -Sqrt((m1**4+(m2**2-s)**2-2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))))/& 
  & ((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)-(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s+s**2+Sqrt((m1**4+(m2**2-s)**2& 
  & -2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))))))/& 
  & Sqrt((m1**4+(m2**2-s)**2-2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))) 
Tchannel = c1*c2*Tchannel 
End Function Tchannel 
  
End Module Unitarity_U1T3R 
