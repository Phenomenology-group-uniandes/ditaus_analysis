! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_U1T3R
 
Use Control 
Use Settings 
Use Model_Data_U1T3R 
Use Couplings_U1T3R 
Use LoopCouplings_U1T3R 
Use Tadpoles_U1T3R 
 Use TreeLevelMasses_U1T3R 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),            & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),              & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,UV,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplhhhhhh,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cplcFdFdhhL(6,6,2),   & 
& cplcFdFdhhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),           & 
& cplcFuFuhhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplhhhhhh(2,2,2),               & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Complex(dp) :: ratFd(6),ratFe(6),ratFu(6),ratHp,ratVWp

Complex(dp) :: ratPFd(6),ratPFe(6),ratPFu(6),ratPHp,ratPVWp

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,vH,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWpVWp/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWp(i1) = Abs(-0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2) 
Do i2=1, 6
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 6
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 6
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 9
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 6
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 6
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 6
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
ratHp = 0._dp 
ratVWp = -0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHp,ratVWp,MFd,MFe,MFu,            & 
& MHp,MVWp,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,vH,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_VZp_decays_2B(m_in,i1,alphaHinput,MAhinput,MAh2input,         & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplhhVZVZp,cplhhVZpVZp,cplcVWpVWpVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),              & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplhhVZVZp(2),   & 
& cplhhVZpVZp(2),cplcVWpVWpVZp

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZp_2B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcVWpVWpVZp = 0._dp 
Call CouplingcVWpVWpVZpT(g2,TW,TWp,cplcVWpVWpVZp)



cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZp_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,          & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,        & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),             & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),              & 
& cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),              & 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZL(gt1,gt2)           & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,UV,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),             & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),              & 
& cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),             & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),               & 
& cplcFuFuVZR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWpL = 0._dp 
cplFvFeVWpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeVWpT(gt1,gt2,g2,ZEL,UV,cplFvFeVWpL(gt1,gt2),cplFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZL(gt1,gt2)           & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,UV,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,alphaHinput,MAhinput,MAh2input,          & 
& MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,           & 
& Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,ZDRinput,ZERinput,ZURinput,UVinput,              & 
& ZDLinput,ZELinput,ZULinput,ZAinput,ZHinput,ZWinput,ZZinput,g1input,g1Xinput,           & 
& g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,          & 
& YuLinput,YvRinput,YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,             & 
& mChiEinput,mChiNuinput,mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,          & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,            & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
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

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp),Intent(out) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),             & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),              & 
& cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),               & 
& cplcFuFuVZR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
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
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZA = ZAinput 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
End if 
cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWpL = 0._dp 
cplFvFeVWpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeVWpT(gt1,gt2,g2,ZEL,UV,cplFvFeVWpL(gt1,gt2),cplFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZL(gt1,gt2)           & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_U1T3R
