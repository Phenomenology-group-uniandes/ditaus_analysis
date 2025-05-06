! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:17 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_U1T3R 
 
Use Control 
Use Settings 
Use Couplings_U1T3R 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_U1T3R 
Use StandardModel 
Use Tadpoles_U1T3R 
 Use Pole2L_U1T3R 
 Use TreeLevelMasses_U1T3R 
 
Real(dp), Private :: Mhh_1L(2), Mhh2_1L(2)  
Complex(dp), Private :: ZH_1L(2,2)  
Real(dp), Private :: MAh_1L(2), MAh2_1L(2)  
Complex(dp), Private :: ZA_1L(2,2)  
Real(dp), Private :: MFd_1L(6), MFd2_1L(6)  
Complex(dp), Private :: ZDL_1L(6,6),ZDR_1L(6,6)
Real(dp), Private :: MFu_1L(6), MFu2_1L(6)  
Complex(dp), Private :: ZUL_1L(6,6),ZUR_1L(6,6)
Real(dp), Private :: MFe_1L(6), MFe2_1L(6)  
Complex(dp), Private :: ZEL_1L(6,6),ZER_1L(6,6)
Real(dp), Private :: MFv_1L(9), MFv2_1L(9)  
Complex(dp), Private :: UV_1L(9,9)  
Real(dp), Private :: MHp_1L, MHp2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZp_1L, MVZp2_1L  
Real(dp), Private :: MVWp_1L, MVWp2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(2)  
Real(dp) :: pi_ep2L(2,2)
Real(dp) :: Pi2S_EffPot(2,2)
Real(dp) :: PiP2S_EffPot(2,2)
Contains 
 
Subroutine OneLoopMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,            & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(inout) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vH,vPhi

Complex(dp) :: cplAhAhcVWpVWp(2,2),cplAhAhHpcHp(2,2),cplAhAhUhh(2,2,2),cplAhAhUhhUhh(2,2,2,2),       & 
& cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),cplAhAhVPVZp(2,2),cplAhAhVZpVZp(2,2),cplAhAhVZVZ(2,2),& 
& cplAhAhVZVZp(2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUAhL(6,6,2),   & 
& cplcFdFdUAhR(6,6,2),cplcFdFdUhhL(6,6,2),cplcFdFdUhhR(6,6,2),cplcFdFdVGL(6,6),          & 
& cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6), & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),& 
& cplcFdFucVWpR(6,6),cplcFeFeUAhL(6,6,2),cplcFeFeUAhR(6,6,2),cplcFeFeUhhL(6,6,2),        & 
& cplcFeFeUhhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcFeUFvcHpL(6,9),cplcFeUFvcHpR(6,9),cplcFeUFvcVWpL(6,9),          & 
& cplcFeUFvcVWpR(6,9),cplcFuFuUAhL(6,6,2),cplcFuFuUAhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),& 
& cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),cplcgAgWpcVWp,   & 
& cplcgGgGVG,cplcgWCgAcVWp,cplcgWCgWCUAh(2),cplcgWCgWCUhh(2),cplcgWCgWCVP,               & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWCgZpcHp,cplcgWCgZpcVWp,    & 
& cplcgWpgWpUAh(2),cplcgWpgWpUhh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,             & 
& cplcgWpgZHp,cplcgWpgZpHp,cplcgZgWCHp,cplcgZgWpcHp,cplcgZgWpcVWp,cplcgZgZpUhh(2),       & 
& cplcgZgZUhh(2),cplcgZpgWCHp,cplcgZpgWpcHp,cplcgZpgWpcVWp,cplcgZpgZpUhh(2),             & 
& cplcgZpgZUhh(2),cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcUFdFdAhL(6,6,2),              & 
& cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),cplcUFdFdVGL(6,6),         & 
& cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),cplcUFdFdVZL(6,6),               & 
& cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),cplcUFdFdVZR(6,6),cplcUFdFucHpL(6,6),            & 
& cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6),cplcUFeFeAhL(6,6,2),        & 
& cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),cplcUFeFeVPL(6,6),         & 
& cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),             & 
& cplcUFeFeVZR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),cplcUFeFvcVWpL(6,9),           & 
& cplcUFeFvcVWpR(6,9),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),cplcUFuFdVWpL(6,6),            & 
& cplcUFuFdVWpR(6,6),cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFuhhL(6,6,2),        & 
& cplcUFuFuhhR(6,6,2),cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),             & 
& cplcUFuFuVPR(6,6),cplcUFuFuVZL(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6),             & 
& cplcUFuFuVZR(6,6),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,            & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVPVWpVZ1,          & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,    & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,     & 
& cplcVWpVWpVZVZp3,cplFvFvUAhL(9,9,2),cplFvFvUAhR(9,9,2),cplFvFvUhhL(9,9,2)

Complex(dp) :: cplFvFvUhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZpL(9,9),   & 
& cplFvFvVZpR(9,9),cplFvFvVZR(9,9),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),   & 
& cplhhhhHpcHp(2,2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),cplhhhhVZpVZp(2,2),& 
& cplhhhhVZVZ(2,2),cplhhhhVZVZp(2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),          & 
& cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpcVWpVWp,               & 
& cplHpcHpVP,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpVZ,cplHpcHpVZp,             & 
& cplHpcHpVZpVZp,cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,        & 
& cplHpHpcHpcHp,cplUAhAhhh(2,2,2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),cplUAhhhVZp(2,2),      & 
& cplUAhHpcVWp(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhcVWpVWp(2,2),cplUAhUAhhhhh(2,2,2,2),   & 
& cplUAhUAhHpcHp(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhVZpVZp(2,2),cplUAhUAhVZVZ(2,2),        & 
& cplUFvFeHpL(9,6),cplUFvFeHpR(9,6),cplUFvFeVWpL(9,6),cplUFvFeVWpR(9,6),cplUFvFvAhL(9,9,2),& 
& cplUFvFvAhR(9,9,2),cplUFvFvhhL(9,9,2),cplUFvFvhhR(9,9,2),cplUFvFvVPL(9,9),             & 
& cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZpL(9,9),cplUFvFvVZpR(9,9),cplUFvFvVZR(9,9),& 
& cplUhhcVWpVWp(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhUhhcVWpVWp(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhVZpVZp(2,2),    & 
& cplUhhUhhVZVZ(2,2),cplUhhVPVZ(2),cplUhhVPVZp(2),cplUhhVZpVZp(2),cplUhhVZVZ(2),         & 
& cplUhhVZVZp(2),cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(2,2), diff(2,2)
Complex(dp) :: Tad1Loop(2), dmz2  
Real(dp) :: comp(2), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWp = RXi 
RXiZ = RXi 
RXiZp = RXi 

 ! Running angles 

 
Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

mu2HTree  = mu2H
mu2PhiTree  = mu2Phi

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
vH=vSM 
Else 
Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,  & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,               & 
& cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,             & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,            & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplAhAhVPVZp,cplhhhhVPVZp,             & 
& cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp,         & 
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
vSM=sqrt(vev2) 
vH=vSM 
End if 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

Call CouplingsForLoopMasses(LamH,LamPhiH,LamPhi,vH,vPhi,ZA,g1,g2,gX1,TW,              & 
& gX,g1X,TWp,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,ZH,              & 
& g3,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,             & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,       & 
& cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,              & 
& cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,        & 
& cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,cplUAhAhhh,               & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,             & 
& cplUAhhhVZp,cplUAhHpcVWp,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,     & 
& cplUAhUAhcVWpVWp,cplUAhUAhVZVZ,cplUAhUAhVZpVZp,cplcUFdFdAhL,cplcUFdFdAhR,              & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,     & 
& cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,     & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,         & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,     & 
& cplcUFeFvcVWpL,cplcUFeFvcVWpR,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,         & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,      & 
& cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,         & 
& cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,              & 
& cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,              & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,     & 
& cplVGVGVGVG2,cplVGVGVGVG3,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,   & 
& cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1, & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,   & 
& cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1, & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWpVZp,          & 
& cplcgWCgWCVZp,cplhhVZpVZp,cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,      & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplAhHpcVWp,cplcFdFucVWpL,       & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,   & 
& cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,               & 
& cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,  & 
& cplAhAhVPVZp,cplhhhhVPVZp,cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,             & 
& cplcVWpVPVWpVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,             & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

Call OneLoopTadpoleshh(vH,vPhi,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,cplcFdFdUhhL,         & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,          & 
& cplUhhHpcHp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZpVZp,Tad1Loop(1:2))

mu2HTree  = mu2H
mu2PhiTree  = mu2Phi
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  vHFix = 0._dp 
  vPhiFix = 0._dp 
   g1_saveEP =g1
   g1 = 0._dp 
   g1X_saveEP =g1X
   g1X = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
   gX_saveEP =gX
   gX = 0._dp 
   gX1_saveEP =gX1
   gX1 = 0._dp 
     Else 
  vHFix = vH 
  vPhiFix = vPhi 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   YvL_saveEP =YvL
   where (aint(Abs(YvL)).eq.YvL) YvL=YvL*(1 + 1*1.0E-12_dp)
   YuL_saveEP =YuL
   where (aint(Abs(YuL)).eq.YuL) YuL=YuL*(1 + 2*1.0E-12_dp)
   YvR_saveEP =YvR
   where (aint(Abs(YvR)).eq.YvR) YvR=YvR*(1 + 3*1.0E-12_dp)
   YuR_saveEP =YuR
   where (aint(Abs(YuR)).eq.YuR) YuR=YuR*(1 + 4*1.0E-12_dp)
   YdL_saveEP =YdL
   where (aint(Abs(YdL)).eq.YdL) YdL=YdL*(1 + 5*1.0E-12_dp)
   YeL_saveEP =YeL
   where (aint(Abs(YeL)).eq.YeL) YeL=YeL*(1 + 6*1.0E-12_dp)
   YdR_saveEP =YdR
   where (aint(Abs(YdR)).eq.YdR) YdR=YdR*(1 + 7*1.0E-12_dp)
   YeR_saveEP =YeR
   where (aint(Abs(YeR)).eq.YeR) YeR=YeR*(1 + 8*1.0E-12_dp)
   mChiD_saveEP =mChiD
   where (aint(Abs(mChiD)).eq.mChiD) mChiD=mChiD*(1 + 9*1.0E-12_dp)
   mChiE_saveEP =mChiE
   where (aint(Abs(mChiE)).eq.mChiE) mChiE=mChiE*(1 + 10*1.0E-12_dp)
   mChiNu_saveEP =mChiNu
   where (aint(Abs(mChiNu)).eq.mChiNu) mChiNu=mChiNu*(1 + 11*1.0E-12_dp)
   mChiU_saveEP =mChiU
   where (aint(Abs(mChiU)).eq.mChiU) mChiU=mChiU*(1 + 12*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,               & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,             & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont,             & 
& ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

End if 
   YvL =YvL_saveEP 
   YuL =YuL_saveEP 
   YvR =YvR_saveEP 
   YuR =YuR_saveEP 
   YdL =YdL_saveEP 
   YeL =YeL_saveEP 
   YdR =YdR_saveEP 
   YeR =YeR_saveEP 
   mChiD =mChiD_saveEP 
   mChiE =mChiE_saveEP 
   mChiNu =mChiNu_saveEP 
   mChiU =mChiU_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   g1 =g1_saveEP 
   g1X =g1X_saveEP 
   g2 =g2_saveEP 
   gX =gX_saveEP 
   gX1 =gX1_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,Tad1Loop)

mu2H1L = mu2H
mu2Phi1L = mu2Phi
Tad1Loop(1:2) = Tad1Loop(1:2) - ti_ep2L 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,Tad1Loop)

mu2H2L = mu2H
mu2Phi2L = mu2Phi
Call OneLoophh(mu2H2L,mu2Phi2L,LamH,LamPhiH,LamPhi,vH,vPhi,MAh,MAh2,MVZ,              & 
& MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,          & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,       & 
& cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,              & 
& cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,        & 
& cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,0.1_dp*delta_mass,        & 
& Mhh_1L,Mhh2_1L,ZH_1L,kont)

If (TwoLoopMethod.gt.2) Then 
Call OneLoopAh(g1,g2,gX,g1X,gX1,mu2H2L,mu2Phi2L,LamH,LamPhiH,LamPhi,vH,               & 
& vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,      & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWpgWpUAh,          & 
& cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,cplUAhUAhAhAh,            & 
& cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,cplUAhUAhVZVZ,             & 
& cplUAhUAhVZpVZp,0.1_dp*delta_mass,MAh_1L,MAh2_1L,ZA_1L,kont)

Else 
Call OneLoopAh(g1,g2,gX,g1X,gX1,mu2H1L,mu2Phi1L,LamH,LamPhiH,LamPhi,vH,               & 
& vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,      & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWpgWpUAh,          & 
& cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,cplUAhUAhAhAh,            & 
& cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,cplUAhUAhVZVZ,             & 
& cplUAhUAhVZpVZp,0.1_dp*delta_mass,MAh_1L,MAh2_1L,ZA_1L,kont)

End if 
Call OneLoopFd(mChiD,YdL,YdR,vH,vPhi,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZp,MVZp2,MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,        & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,   & 
& cplcUFdFucVWpR,0.1_dp*delta_mass,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,kont)

Call OneLoopFu(mChiU,YuL,YuR,vH,vPhi,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,             & 
& MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,        & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,0.1_dp*delta_mass,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,kont)

Call OneLoopFe(mChiE,YeL,YeR,vH,vPhi,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MVZp,MVZp2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,        & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,               & 
& 0.1_dp*delta_mass,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,kont)

Call OneLoopFv(mChiNu,YvL,YvR,vH,vPhi,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,            & 
& MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,           & 
& cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,             & 
& cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,           & 
& cplcFeUFvcHpR,cplcFeUFvcVWpL,cplcFeUFvcVWpR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,          & 
& UV_1L,kont)

Call OneLoopHp(g2,mu2H1L,LamH,LamPhiH,vH,vPhi,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,           & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,          & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,          & 
& cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,        & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplcHpVWpVZp,cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,     & 
& cplHpcHpVZVZ,cplHpcHpVZpVZp,0.1_dp*delta_mass,MHp_1L,MHp2_1L,kont)

Call OneLoopVZp(g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,             & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,        & 
& cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,0.1_dp*delta_mass,& 
& MVZp_1L,MVZp2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
ZA = ZA_1L 
MFd = MFd_1L 
MFd2 = MFd2_1L 
ZDL = ZDL_1L 
ZDR = ZDR_1L 
MFu = MFu_1L 
MFu2 = MFu2_1L 
ZUL = ZUL_1L 
ZUR = ZUR_1L 
MFe = MFe_1L 
MFe2 = MFe2_1L 
ZEL = ZEL_1L 
ZER = ZER_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MHp = MHp_1L 
MHp2 = MHp2_1L 
MVZp = MVZp_1L 
MVZp2 = MVZp2_1L 
End If 
 
Call SortGoldstones(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,kont)

! Set pole masses 
MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWp = 1._dp 
RXiZ = 1._dp 
RXiZp = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
mu2H  = mu2HTree 
mu2Phi  = mu2PhiTree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(vH,vPhi,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhUhh,cplcFdFdUhhL,     & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,          & 
& cplUhhHpcHp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZpVZp,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplcFdFdUhhL(6,6,2),cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),        & 
& cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),        & 
& cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZpUhh(2),  & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZpVZp(2)

Real(dp), Intent(in) :: vH,vPhi

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(2)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
Do i1 = 1, 2
 A0m = SA_A0(MAh2(i1)) 
  Do gO1 = 1, 2
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 End if 
!------------------------ 
! bar[Fd] 
!------------------------ 
If (Include_in_loopFd) Then 
Do i1 = 1, 6
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 End if 
!------------------------ 
! bar[Fe] 
!------------------------ 
If (Include_in_loopFe) Then 
Do i1 = 1, 6
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 End if 
!------------------------ 
! bar[Fu] 
!------------------------ 
If (Include_in_loopFu) Then 
Do i1 = 1, 6
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 End if 
!------------------------ 
! Fv 
!------------------------ 
If (Include_in_loopFv) Then 
Do i1 = 1, 9
 A0m = 2._dp*MFv(i1)*SA_A0(MFv2(i1)) 
  Do gO1 = 1, 2
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 End if 
!------------------------ 
! bar[gWp] 
!------------------------ 
If (Include_in_loopgWp) Then 
A0m = 1._dp*SA_A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWpgWpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! bar[gWpC] 
!------------------------ 
If (Include_in_loopgWC) Then 
A0m = 1._dp*SA_A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWCgWCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! bar[gZ] 
!------------------------ 
If (Include_in_loopgZ) Then 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! bar[gZp] 
!------------------------ 
If (Include_in_loopgZp) Then 
A0m = 1._dp*SA_A0(MVZp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
Do i1 = 1, 2
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 2
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
A0m = SA_A0(MHp2) 
  Do gO1 = 1, 2
   coup = cplUhhHpcHp(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
A0m = 3._dp*SA_A0(MVWp2)+RXi*SA_A0(MVWp2*RXi) - 2._dp*MVWp2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhcVWpVWp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End if 
!------------------------ 
! VZ 
!------------------------ 
If (Include_in_loopVZ) Then 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End if 
!------------------------ 
! VZp 
!------------------------ 
If (Include_in_loopVZp) Then 
A0m = 3._dp*SA_A0(MVZp2)+RXi*SA_A0(MVZp2*RXi) - 2._dp*MVZp2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZpVZp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End if 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,MAh,MAh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,          & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,       & 
& cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,              & 
& cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,        & 
& cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,cplUhhUhhVZpVZp,delta,mass,               & 
& mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MVZ,MVZ2,MVZp,MVZp2,MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),              & 
& MFu2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mu2H
mat2a(1,1) = mat2a(1,1)+3*LamH*vH**2
mat2a(1,1) = mat2a(1,1)+(LamPhiH*vPhi**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+LamPhiH*vH*vPhi
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mu2Phi
mat2a(2,2) = mat2a(2,2)+(LamPhiH*vH**2)/2._dp
mat2a(2,2) = mat2a(2,2)+3*LamPhi*vPhi**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,          & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,             & 
& cplUhhVPVZp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,             & 
& cplUhhUhhVZpVZp,kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,          & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,             & 
& cplUhhVPVZp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,             & 
& cplUhhUhhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,          & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,             & 
& cplUhhVPVZp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,           & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,             & 
& cplUhhUhhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,       & 
& cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,          & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,          & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,           & 
& cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,              & 
& cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhVPVP,cplUhhUhhcVWpVWp,             & 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MVZ,MVZ2,MVZp,MVZp2,MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),              & 
& MFu2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZp, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,MAh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZp(i2,gO1)
coup2 =  Conjg(cplAhUhhVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUhh(gO1)
coup2 =  cplcgWpgWpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUhh(gO1)
coup2 =  cplcgWCgWCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gZp], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! bar[gZp], gZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgZp)) Then 
F0m2 = -Real(SA_B0(p2,MVZp2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
B0m2 = Real(SA_B0(p2,MHp2,MHp2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpcHp(gO1)
coup2 = Conjg(cplUhhHpcHp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpcVWp(gO1)
coup2 =  Conjg(cplUhhHpcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVP)) Then 
F0m2 = Real(SVVloop(p2,0._dp,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZp, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVP)) Then 
F0m2 = Real(SVVloop(p2,0._dp,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZp(gO1)
coup2 =  Conjg(cplUhhVPVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
F0m2 = Real(SVVloop(p2,MVWp2,MVWp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWpVWp(gO1)
coup2 =  Conjg(cplUhhcVWpVWp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
F0m2 = Real(SVVloop(p2,MVZ2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZp(gO1)
coup2 =  Conjg(cplUhhVZVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
F0m2 = Real(SVVloop(p2,MVZp2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZpVZp(gO1)
coup2 =  Conjg(cplUhhVZpVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
End If 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_A0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHpcHp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 = 0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,       & 
& cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,          & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,          & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,           & 
& cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,              & 
& cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhVPVP,cplUhhUhhcVWpVWp,             & 
& cplUhhUhhVZVZ,cplUhhUhhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MVZ,MVZ2,MVZp,MVZp2,MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),              & 
& MFu2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVP2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZp, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,MAh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZp(i2,gO1)
coup2 =  Conjg(cplAhUhhVZp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUhh(gO1)
coup2 =  cplcgWpgWpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUhh(gO1)
coup2 =  cplcgWCgWCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gZp], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! bar[gZp], gZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgZp)) Then 
F0m2 = -Real(SA_DerB0(p2,MVZp2*RXi,MVZp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
B0m2 = Real(SA_DerB0(p2,MHp2,MHp2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpcHp(gO1)
coup2 = Conjg(cplUhhHpcHp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
F0m2 = DerFloopRXi(p2,MHp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpcVWp(gO1)
coup2 =  Conjg(cplUhhHpcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVP)) Then 
F0m2 = Real(DerSVVloop(p2,MVP2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZp, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVP)) Then 
F0m2 = Real(DerSVVloop(p2,MVP2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVPVZp(gO1)
coup2 =  Conjg(cplUhhVPVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
F0m2 = Real(DerSVVloop(p2,MVWp2,MVWp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWpVWp(gO1)
coup2 =  Conjg(cplUhhcVWpVWp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZp(gO1)
coup2 =  Conjg(cplUhhVZVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
F0m2 = Real(DerSVVloop(p2,MVZp2,MVZp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZpVZp(gO1)
coup2 =  Conjg(cplUhhVZpVZp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
End If 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_DerA0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHpcHp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1Loophh 
 
Subroutine OneLoopAh(g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,             & 
& vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,            & 
& MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,      & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWpgWpUAh,          & 
& cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,cplUAhUAhAhAh,            & 
& cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,cplUAhUAhVZVZ,             & 
& cplUAhUAhVZpVZp,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,TW,TWp

Complex(dp), Intent(in) :: cplUAhAhhh(2,2,2),cplcFdFdUAhL(6,6,2),cplcFdFdUAhR(6,6,2),cplcFeFeUAhL(6,6,2),        & 
& cplcFeFeUAhR(6,6,2),cplcFuFuUAhL(6,6,2),cplcFuFuUAhR(6,6,2),cplFvFvUAhL(9,9,2),        & 
& cplFvFvUAhR(9,9,2),cplcgWpgWpUAh(2),cplcgWCgWCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),  & 
& cplUAhhhVZp(2,2),cplUAhHpcVWp(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),        & 
& cplUAhUAhHpcHp(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhcVWpVWp(2,2),cplUAhUAhVZVZ(2,2),       & 
& cplUAhUAhVZpVZp(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mu2H
mat2a(1,1) = mat2a(1,1)+LamH*vH**2
mat2a(1,1) = mat2a(1,1)+(LamPhiH*vPhi**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vH**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1X**2*vH**2*Cos(TWp)**2*RXiZp)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*vH**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vH**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(g1X*g2*vH**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat2a(1,1) = mat2a(1,1)+(g1X*g2*vH**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(g1*g1X*vH**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat2a(1,1) = mat2a(1,1)+(g1*g1X*vH**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,1) = mat2a(1,1)+(g1X**2*vH**2*RXiZ*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vH**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g1*g2*vH**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g1**2*vH**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(g1X*gX*vH*vPhi*Cos(TWp)**2*RXiZp)/2._dp
mat2a(1,2) = mat2a(1,2)+(g2*gX1*vH*vPhi*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat2a(1,2) = mat2a(1,2)+(g1*gX1*vH*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat2a(1,2) = mat2a(1,2)-1._dp/2._dp*(g2*gX*vH*vPhi*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat2a(1,2) = mat2a(1,2)+(g2*gX*vH*vPhi*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)-1._dp/2._dp*(g1*gX*vH*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat2a(1,2) = mat2a(1,2)-1._dp/2._dp*(g1X*gX1*vH*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat2a(1,2) = mat2a(1,2)+(g1*gX*vH*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)+(g1X*gX1*vH*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat2a(1,2) = mat2a(1,2)+(g1X*gX*vH*vPhi*RXiZ*Sin(TWp)**2)/2._dp
mat2a(1,2) = mat2a(1,2)+(g2*gX1*vH*vPhi*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat2a(1,2) = mat2a(1,2)+(g1*gX1*vH*vPhi*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mu2Phi
mat2a(2,2) = mat2a(2,2)+(LamPhiH*vH**2)/2._dp
mat2a(2,2) = mat2a(2,2)+LamPhi*vPhi**2
mat2a(2,2) = mat2a(2,2)+gX**2*vPhi**2*Cos(TWp)**2*RXiZp
mat2a(2,2) = mat2a(2,2)+gX1**2*vPhi**2*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat2a(2,2) = mat2a(2,2)-2*gX*gX1*vPhi**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat2a(2,2) = mat2a(2,2)+2*gX*gX1*vPhi**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat2a(2,2) = mat2a(2,2)+gX**2*vPhi**2*RXiZ*Sin(TWp)**2
mat2a(2,2) = mat2a(2,2)+gX1**2*vPhi**2*RXiZp*Sin(TW)**2*Sin(TWp)**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,          & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,            & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,          & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,            & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,          & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,            & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZAOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,     & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,cplUAhHpcVWp,            & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,             & 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2

Complex(dp), Intent(in) :: cplUAhAhhh(2,2,2),cplcFdFdUAhL(6,6,2),cplcFdFdUAhR(6,6,2),cplcFeFeUAhL(6,6,2),        & 
& cplcFeFeUAhR(6,6,2),cplcFuFuUAhL(6,6,2),cplcFuFuUAhR(6,6,2),cplFvFvUAhL(9,9,2),        & 
& cplFvFvUAhR(9,9,2),cplcgWpgWpUAh(2),cplcgWCgWCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),  & 
& cplUAhhhVZp(2,2),cplUAhHpcVWp(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),        & 
& cplUAhUAhHpcHp(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhcVWpVWp(2,2),cplUAhUAhVZVZ(2,2),       & 
& cplUAhUAhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUAh(gO1)
coup2 =  cplcgWpgWpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUAh(gO1)
coup2 =  cplcgWCgWCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZp(gO1,i2)
coup2 =  Conjg(cplUAhhhVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhHpcVWp(gO1)
coup2 =  Conjg(cplUAhHpcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_A0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhHpcHp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 = 0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 = 0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplUAhAhhh,cplcFdFdUAhL,              & 
& cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,          & 
& cplFvFvUAhR,cplcgWpgWpUAh,cplcgWCgWCUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZp,             & 
& cplUAhHpcVWp,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpcHp,cplUAhUAhVPVP,cplUAhUAhcVWpVWp,& 
& cplUAhUAhVZVZ,cplUAhUAhVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2

Complex(dp), Intent(in) :: cplUAhAhhh(2,2,2),cplcFdFdUAhL(6,6,2),cplcFdFdUAhR(6,6,2),cplcFeFeUAhL(6,6,2),        & 
& cplcFeFeUAhR(6,6,2),cplcFuFuUAhL(6,6,2),cplcFuFuUAhR(6,6,2),cplFvFvUAhL(9,9,2),        & 
& cplFvFvUAhR(9,9,2),cplcgWpgWpUAh(2),cplcgWCgWCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),  & 
& cplUAhhhVZp(2,2),cplUAhHpcVWp(2),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),        & 
& cplUAhUAhHpcHp(2,2),cplUAhUAhVPVP(2,2),cplUAhUAhcVWpVWp(2,2),cplUAhUAhVZVZ(2,2),       & 
& cplUAhUAhVZpVZp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_DerGloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 End If 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUAh(gO1)
coup2 =  cplcgWpgWpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUAh(gO1)
coup2 =  cplcgWCgWCUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVP2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! VZp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVZp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhhhVZp(gO1,i2)
coup2 =  Conjg(cplUAhhhVZp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 End If 
 !------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
F0m2 = DerFloopRXi(p2,MHp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhHpcVWp(gO1)
coup2 =  Conjg(cplUAhHpcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MAh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 End If 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_DerA0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhHpcHp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
End If 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVPVP(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
End If 
 !------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 !------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 = 0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUAhUAhVZpVZp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
End If 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopAh 
 
Subroutine OneLoopFd(mChiD,YdL,YdR,vH,vPhi,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,   & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,   & 
& cplcUFdFucVWpR,delta,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFu(6),MFu2(6),MVWp,MVWp2

Real(dp), Intent(in) :: vH,vPhi

Complex(dp), Intent(in) :: mChiD(3,3),YdL(3,3),YdR(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6)

Complex(dp) :: mat1a(6,6), mat1(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6), p2 
Real(dp), Intent(out) :: MFd_1L(6),MFd2_1L(6) 
 Complex(dp), Intent(out) :: ZDL_1L(6,6), ZDR_1L(6,6) 
 
 Real(dp) :: MFd_t(6),MFd2_t(6) 
 Complex(dp) :: ZDL_t(6,6), ZDR_t(6,6), sigL(6,6), sigR(6,6), sigSL(6,6), sigSR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZDL2(6,6), ZDR2(6,6) 
 
 Real(dp) :: ZDL1(6,6), ZDR1(6,6), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vH*YdL(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vH*YdL(2,1))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vH*YdL(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vH*YdL(1,2))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vH*YdL(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vH*YdL(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vH*YdL(1,3))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vH*YdL(2,3))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vH*YdL(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vPhi*YdR(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vPhi*YdR(2,1))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vPhi*YdR(3,1))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+mChiD(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+mChiD(1,2)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+mChiD(1,3)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vPhi*YdR(1,2))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vPhi*YdR(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vPhi*YdR(3,2))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+mChiD(2,1)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+mChiD(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+mChiD(2,3)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vPhi*YdR(1,3))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vPhi*YdR(2,3))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vPhi*YdR(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+mChiD(3,1)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+mChiD(3,2)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+mChiD(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,      & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFu(6),MFu2(6),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fd 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VG, Fd 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VP, Fd 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fd 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fd 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fu 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHp2),dp) 
coupL1 = cplcUFdFucHpL(gO1,i2)
coupR1 = cplcUFdFucHpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucHpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fu 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFucVWpL(gO1,i2)
coupR1 = cplcUFdFucVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,               & 
& MVZp2,MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,             & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,   & 
& cplcUFdFucVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFu(6),MFu2(6),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fd 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VG, Fd 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VP, Fd 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fd 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fd 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fu 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MHp2),dp) 
coupL1 = cplcUFdFucHpL(gO1,i2)
coupR1 = cplcUFdFucHpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucHpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fu 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFucVWpL(gO1,i2)
coupR1 = cplcUFdFucVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFd 
 
Subroutine OneLoopFu(mChiU,YuL,YuR,vH,vPhi,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,            & 
& MFd2,MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,   & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(6),MFu2(6),MAh(2),MAh2(2),MHp,MHp2,MFd(6),MFd2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: vH,vPhi

Complex(dp), Intent(in) :: mChiU(3,3),YuL(3,3),YuR(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),          & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6)

Complex(dp) :: mat1a(6,6), mat1(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6), p2 
Real(dp), Intent(out) :: MFu_1L(6),MFu2_1L(6) 
 Complex(dp), Intent(out) :: ZUL_1L(6,6), ZUR_1L(6,6) 
 
 Real(dp) :: MFu_t(6),MFu2_t(6) 
 Complex(dp) :: ZUL_t(6,6), ZUR_t(6,6), sigL(6,6), sigR(6,6), sigSL(6,6), sigSR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZUL2(6,6), ZUR2(6,6) 
 
 Real(dp) :: ZUL1(6,6), ZUR1(6,6), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vH*YuL(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vH*YuL(2,1))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vH*YuL(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vH*YuL(1,2))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vH*YuL(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vH*YuL(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vH*YuL(1,3))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vH*YuL(2,3))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vH*YuL(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vPhi*YuR(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vPhi*YuR(2,1))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vPhi*YuR(3,1))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+mChiU(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+mChiU(1,2)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+mChiU(1,3)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vPhi*YuR(1,2))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vPhi*YuR(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vPhi*YuR(3,2))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+mChiU(2,1)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+mChiU(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+mChiU(2,3)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vPhi*YuR(1,3))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vPhi*YuR(2,3))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vPhi*YuR(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+mChiU(3,1)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+mChiU(3,2)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+mChiU(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,          & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,          & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,          & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,      & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(6),MFu2(6),MAh(2),MAh2(2),MHp,MHp2,MFd(6),MFd2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),          & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! Hp, Fd 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHp2),dp) 
coupL1 = cplcUFuFdHpL(gO1,i2)
coupR1 = cplcUFuFdHpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdHpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VWp, Fd 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdVWpL(gO1,i2)
coupR1 = cplcUFuFdVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! hh, Fu 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VG, Fu 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VP, Fu 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fu 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fu 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,               & 
& MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,             & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(6),MFu2(6),MAh(2),MAh2(2),MHp,MHp2,MFd(6),MFd2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),          & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! Hp, Fd 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MHp2),dp) 
coupL1 = cplcUFuFdHpL(gO1,i2)
coupR1 = cplcUFuFdHpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdHpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VWp, Fd 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFdVWpL(gO1,i2)
coupR1 = cplcUFuFdVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! hh, Fu 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VG, Fu 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VP, Fu 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fu 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fu 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFu 
 
Subroutine OneLoopFe(mChiE,YeL,YeR,vH,vPhi,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MVZp,MVZp2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,   & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,               & 
& delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(6),MFe2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFv(9),MFv2(9),MVWp,MVWp2

Real(dp), Intent(in) :: vH,vPhi

Complex(dp), Intent(in) :: mChiE(3,3),YeL(3,3),YeR(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),      & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Complex(dp) :: mat1a(6,6), mat1(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6), p2 
Real(dp), Intent(out) :: MFe_1L(6),MFe2_1L(6) 
 Complex(dp), Intent(out) :: ZEL_1L(6,6), ZER_1L(6,6) 
 
 Real(dp) :: MFe_t(6),MFe2_t(6) 
 Complex(dp) :: ZEL_t(6,6), ZER_t(6,6), sigL(6,6), sigR(6,6), sigSL(6,6), sigSR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZEL2(6,6), ZER2(6,6) 
 
 Real(dp) :: ZEL1(6,6), ZER1(6,6), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vH*YeL(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vH*YeL(2,1))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vH*YeL(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vH*YeL(1,2))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vH*YeL(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vH*YeL(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vH*YeL(1,3))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vH*YeL(2,3))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vH*YeL(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vPhi*YeR(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vPhi*YeR(2,1))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vPhi*YeR(3,1))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+mChiE(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+mChiE(1,2)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+mChiE(1,3)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vPhi*YeR(1,2))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vPhi*YeR(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vPhi*YeR(3,2))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+mChiE(2,1)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+mChiE(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+mChiE(2,3)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vPhi*YeR(1,3))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vPhi*YeR(2,3))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vPhi*YeR(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+mChiE(3,1)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+mChiE(3,2)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+mChiE(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,            & 
& MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,      & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(6),MFe2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFv(9),MFv2(9),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),      & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fe 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VP, Fe 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fe 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fe 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fv 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHp2),dp) 
coupL1 = cplcUFeFvcHpL(gO1,i2)
coupR1 = cplcUFeFvcHpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcHpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fv 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvcVWpL(gO1,i2)
coupR1 = cplcUFeFvcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,               & 
& MVZp2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,             & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,               & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(6),MFe2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFv(9),MFv2(9),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),      & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fe 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VP, Fe 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZ, Fe 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fe 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fv 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MHp2),dp) 
coupL1 = cplcUFeFvcHpL(gO1,i2)
coupR1 = cplcUFeFvcHpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcHpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fv 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFvcVWpL(gO1,i2)
coupR1 = cplcUFeFvcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFe 
 
Subroutine OneLoopFv(mChiNu,YvL,YvR,vH,vPhi,MFv,MFv2,MAh,MAh2,MHp,MHp2,               & 
& MFe,MFe2,MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,              & 
& cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,             & 
& cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,             & 
& cplcFeUFvcHpL,cplcFeUFvcHpR,cplcFeUFvcVWpL,cplcFeUFvcVWpR,delta,MFv_1L,MFv2_1L,        & 
& UV_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(2),MAh2(2),MHp,MHp2,MFe(6),MFe2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: vH,vPhi

Complex(dp), Intent(in) :: mChiNu(3,3),YvL(3,3),YvR(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,2),cplUFvFvAhR(9,9,2),cplUFvFeHpL(9,6),cplUFvFeHpR(9,6),              & 
& cplUFvFeVWpL(9,6),cplUFvFeVWpR(9,6),cplUFvFvhhL(9,9,2),cplUFvFvhhR(9,9,2),             & 
& cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUFvFvVZpL(9,9), & 
& cplUFvFvVZpR(9,9),cplcFeUFvcHpL(6,9),cplcFeUFvcHpR(6,9),cplcFeUFvcVWpL(6,9),           & 
& cplcFeUFvcVWpR(6,9)

Complex(dp) :: mat1a(9,9), mat1(9,9), mat2(9,9) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(9), test_m2(9),p2 
Real(dp), Intent(out) :: MFv_1L(9),MFv2_1L(9) 
Complex(dp), Intent(out) ::  UV_1L(9,9) 
Real(dp) :: MFv_t(9),MFv2_t(9) 
Complex(dp) ::  UV_t(9,9) 
Complex(dp) ::  phaseM, E9(9), sigL(9,9), sigR(9,9), sigSL(9,9), sigSR(9,9) 
Real(dp) :: UVa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,5) = 0._dp 
mat1a(1,6) = 0._dp 
mat1a(1,7) = 0._dp 
mat1a(1,7) = mat1a(1,7)+(vH*YvL(1,1))/sqrt(2._dp)
mat1a(1,8) = 0._dp 
mat1a(1,8) = mat1a(1,8)+(vH*YvL(2,1))/sqrt(2._dp)
mat1a(1,9) = 0._dp 
mat1a(1,9) = mat1a(1,9)+(vH*YvL(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,5) = 0._dp 
mat1a(2,6) = 0._dp 
mat1a(2,7) = 0._dp 
mat1a(2,7) = mat1a(2,7)+(vH*YvL(1,2))/sqrt(2._dp)
mat1a(2,8) = 0._dp 
mat1a(2,8) = mat1a(2,8)+(vH*YvL(2,2))/sqrt(2._dp)
mat1a(2,9) = 0._dp 
mat1a(2,9) = mat1a(2,9)+(vH*YvL(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,5) = 0._dp 
mat1a(3,6) = 0._dp 
mat1a(3,7) = 0._dp 
mat1a(3,7) = mat1a(3,7)+(vH*YvL(1,3))/sqrt(2._dp)
mat1a(3,8) = 0._dp 
mat1a(3,8) = mat1a(3,8)+(vH*YvL(2,3))/sqrt(2._dp)
mat1a(3,9) = 0._dp 
mat1a(3,9) = mat1a(3,9)+(vH*YvL(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,2) = 0._dp 
mat1a(4,3) = 0._dp 
mat1a(4,4) = 0._dp 
mat1a(4,5) = 0._dp 
mat1a(4,6) = 0._dp 
mat1a(4,7) = 0._dp 
mat1a(4,7) = mat1a(4,7)+(vPhi*YvR(1,1))/sqrt(2._dp)
mat1a(4,8) = 0._dp 
mat1a(4,8) = mat1a(4,8)+(vPhi*YvR(1,2))/sqrt(2._dp)
mat1a(4,9) = 0._dp 
mat1a(4,9) = mat1a(4,9)+(vPhi*YvR(1,3))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,2) = 0._dp 
mat1a(5,3) = 0._dp 
mat1a(5,4) = 0._dp 
mat1a(5,5) = 0._dp 
mat1a(5,6) = 0._dp 
mat1a(5,7) = 0._dp 
mat1a(5,7) = mat1a(5,7)+(vPhi*YvR(2,1))/sqrt(2._dp)
mat1a(5,8) = 0._dp 
mat1a(5,8) = mat1a(5,8)+(vPhi*YvR(2,2))/sqrt(2._dp)
mat1a(5,9) = 0._dp 
mat1a(5,9) = mat1a(5,9)+(vPhi*YvR(2,3))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,2) = 0._dp 
mat1a(6,3) = 0._dp 
mat1a(6,4) = 0._dp 
mat1a(6,5) = 0._dp 
mat1a(6,6) = 0._dp 
mat1a(6,7) = 0._dp 
mat1a(6,7) = mat1a(6,7)+(vPhi*YvR(3,1))/sqrt(2._dp)
mat1a(6,8) = 0._dp 
mat1a(6,8) = mat1a(6,8)+(vPhi*YvR(3,2))/sqrt(2._dp)
mat1a(6,9) = 0._dp 
mat1a(6,9) = mat1a(6,9)+(vPhi*YvR(3,3))/sqrt(2._dp)
mat1a(7,1) = 0._dp 
mat1a(7,1) = mat1a(7,1)+(vH*YvL(1,1))/sqrt(2._dp)
mat1a(7,2) = 0._dp 
mat1a(7,2) = mat1a(7,2)+(vH*YvL(1,2))/sqrt(2._dp)
mat1a(7,3) = 0._dp 
mat1a(7,3) = mat1a(7,3)+(vH*YvL(1,3))/sqrt(2._dp)
mat1a(7,4) = 0._dp 
mat1a(7,4) = mat1a(7,4)+(vPhi*YvR(1,1))/sqrt(2._dp)
mat1a(7,5) = 0._dp 
mat1a(7,5) = mat1a(7,5)+(vPhi*YvR(2,1))/sqrt(2._dp)
mat1a(7,6) = 0._dp 
mat1a(7,6) = mat1a(7,6)+(vPhi*YvR(3,1))/sqrt(2._dp)
mat1a(7,7) = 0._dp 
mat1a(7,7) = mat1a(7,7)+mChiNu(1,1)
mat1a(7,8) = 0._dp 
mat1a(7,8) = mat1a(7,8)+mChiNu(1,2)/2._dp
mat1a(7,8) = mat1a(7,8)+mChiNu(2,1)/2._dp
mat1a(7,9) = 0._dp 
mat1a(7,9) = mat1a(7,9)+mChiNu(1,3)/2._dp
mat1a(7,9) = mat1a(7,9)+mChiNu(3,1)/2._dp
mat1a(8,1) = 0._dp 
mat1a(8,1) = mat1a(8,1)+(vH*YvL(2,1))/sqrt(2._dp)
mat1a(8,2) = 0._dp 
mat1a(8,2) = mat1a(8,2)+(vH*YvL(2,2))/sqrt(2._dp)
mat1a(8,3) = 0._dp 
mat1a(8,3) = mat1a(8,3)+(vH*YvL(2,3))/sqrt(2._dp)
mat1a(8,4) = 0._dp 
mat1a(8,4) = mat1a(8,4)+(vPhi*YvR(1,2))/sqrt(2._dp)
mat1a(8,5) = 0._dp 
mat1a(8,5) = mat1a(8,5)+(vPhi*YvR(2,2))/sqrt(2._dp)
mat1a(8,6) = 0._dp 
mat1a(8,6) = mat1a(8,6)+(vPhi*YvR(3,2))/sqrt(2._dp)
mat1a(8,7) = 0._dp 
mat1a(8,7) = mat1a(8,7)+mChiNu(1,2)/2._dp
mat1a(8,7) = mat1a(8,7)+mChiNu(2,1)/2._dp
mat1a(8,8) = 0._dp 
mat1a(8,8) = mat1a(8,8)+mChiNu(2,2)
mat1a(8,9) = 0._dp 
mat1a(8,9) = mat1a(8,9)+mChiNu(2,3)/2._dp
mat1a(8,9) = mat1a(8,9)+mChiNu(3,2)/2._dp
mat1a(9,1) = 0._dp 
mat1a(9,1) = mat1a(9,1)+(vH*YvL(3,1))/sqrt(2._dp)
mat1a(9,2) = 0._dp 
mat1a(9,2) = mat1a(9,2)+(vH*YvL(3,2))/sqrt(2._dp)
mat1a(9,3) = 0._dp 
mat1a(9,3) = mat1a(9,3)+(vH*YvL(3,3))/sqrt(2._dp)
mat1a(9,4) = 0._dp 
mat1a(9,4) = mat1a(9,4)+(vPhi*YvR(1,3))/sqrt(2._dp)
mat1a(9,5) = 0._dp 
mat1a(9,5) = mat1a(9,5)+(vPhi*YvR(2,3))/sqrt(2._dp)
mat1a(9,6) = 0._dp 
mat1a(9,6) = mat1a(9,6)+(vPhi*YvR(3,3))/sqrt(2._dp)
mat1a(9,7) = 0._dp 
mat1a(9,7) = mat1a(9,7)+mChiNu(1,3)/2._dp
mat1a(9,7) = mat1a(9,7)+mChiNu(3,1)/2._dp
mat1a(9,8) = 0._dp 
mat1a(9,8) = mat1a(9,8)+mChiNu(2,3)/2._dp
mat1a(9,8) = mat1a(9,8)+mChiNu(3,2)/2._dp
mat1a(9,9) = 0._dp 
mat1a(9,9) = mat1a(9,9)+mChiNu(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,              & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
UVOS_0 = UV_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_0 = UV_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=9,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,              & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,              & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,          & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(2),MAh2(2),MHp,MHp2,MFe(6),MFe2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,2),cplUFvFvAhR(9,9,2),cplUFvFeHpL(9,6),cplUFvFeHpR(9,6),              & 
& cplUFvFeVWpL(9,6),cplUFvFeVWpR(9,6),cplUFvFvhhL(9,9,2),cplUFvFvhhR(9,9,2),             & 
& cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUFvFvVZpL(9,9), & 
& cplUFvFvVZpR(9,9),cplcFeUFvcHpL(6,9),cplcFeUFvcHpR(6,9),cplcFeUFvcVWpL(6,9),           & 
& cplcFeUFvcVWpR(6,9)

Complex(dp), Intent(out) :: SigL(9,9),SigR(9,9), SigSL(9,9), SigSR(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(9,9), sumR(9,9), sumSL(9,9), sumSR(9,9) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_B0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 End if 
 !------------------------ 
! Hp, Fe 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHp2),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHp2),dp) 
coupL1 = cplUFvFeHpL(gO1,i2)
coupR1 = cplUFvFeHpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeHpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VWp, Fe 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFeVWpL(gO1,i2)
coupR1 = cplUFvFeVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! hh, Fv 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 End if 
 !------------------------ 
! VP, Fv 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),0._dp),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VZ, Fv 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VZp, Fv 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZp2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZpL(gO1,i2)
coupR1 = cplUFvFvVZpR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZpL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! conj[Hp], bar[Fe] 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHp2),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHp2),dp) 
coupL1 = cplcFeUFvcHpL(i2,gO1)
coupR1 = cplcFeUFvcHpR(i2,gO1)
coupL2 =  Conjg(cplcFeUFvcHpL(i2,gO2))
coupR2 =  Conjg(cplcFeUFvcHpR(i2,gO2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! conj[VWp], bar[Fe] 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvcVWpL(i2,gO1)
coupR1 = cplcFeUFvcVWpR(i2,gO1)
coupL2 =  Conjg(cplcFeUFvcVWpL(i2,gO2))
coupR2 =  Conjg(cplcFeUFvcVWpR(i2,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,               & 
& MVWp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpL,cplUFvFeHpR,    & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,             & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZpL,cplUFvFvVZpR,cplcFeUFvcHpL,cplcFeUFvcHpR,         & 
& cplcFeUFvcVWpL,cplcFeUFvcVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(2),MAh2(2),MHp,MHp2,MFe(6),MFe2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,2),cplUFvFvAhR(9,9,2),cplUFvFeHpL(9,6),cplUFvFeHpR(9,6),              & 
& cplUFvFeVWpL(9,6),cplUFvFeVWpR(9,6),cplUFvFvhhL(9,9,2),cplUFvFvhhR(9,9,2),             & 
& cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUFvFvVZpL(9,9), & 
& cplUFvFvVZpR(9,9),cplcFeUFvcHpL(6,9),cplcFeUFvcHpR(6,9),cplcFeUFvcVWpL(6,9),           & 
& cplcFeUFvcVWpR(6,9)

Complex(dp), Intent(out) :: SigL(9,9),SigR(9,9), SigSL(9,9), SigSR(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(9,9), sumR(9,9), sumSL(9,9), sumSR(9,9) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 9
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_DerB0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 End if 
 !------------------------ 
! Hp, Fe 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHp2),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHp2),dp) 
coupL1 = cplUFvFeHpL(gO1,i2)
coupR1 = cplUFvFeHpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeHpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VWp, Fe 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_DerB0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFeVWpL(gO1,i2)
coupR1 = cplUFvFeVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! hh, Fv 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 End if 
 !------------------------ 
! VP, Fv 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVP2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVP2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VZ, Fv 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! VZp, Fv 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZpL(gO1,i2)
coupR1 = cplUFvFvVZpR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZpL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! conj[Hp], bar[Fe] 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHp2),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHp2),dp) 
coupL1 = cplcFeUFvcHpL(i2,gO1)
coupR1 = cplcFeUFvcHpR(i2,gO1)
coupL2 =  Conjg(cplcFeUFvcHpL(i2,gO2))
coupR2 =  Conjg(cplcFeUFvcHpR(i2,gO2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 !------------------------ 
! conj[VWp], bar[Fe] 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_DerB0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcFeUFvcVWpL(i2,gO1)
coupR1 = cplcFeUFvcVWpR(i2,gO1)
coupL2 =  Conjg(cplcFeUFvcVWpL(i2,gO2))
coupR2 =  Conjg(cplcFeUFvcVWpR(i2,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 End if 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFv 
 
Subroutine OneLoopHp(g2,mu2H,LamH,LamPhiH,vH,vPhi,MVWp,MVWp2,MAh,MAh2,MFd,            & 
& MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,     & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,          & 
& cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,        & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplcHpVWpVZp,cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,     & 
& cplHpcHpVZVZ,cplHpcHpVZpVZp,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MVWp,MVWp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),               & 
& MFv(9),MFv2(9),MHp,MHp2,Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: g2,mu2H,LamH,LamPhiH,vH,vPhi

Complex(dp), Intent(in) :: cplAhcHpVWp(2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),& 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,          & 
& cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,         & 
& cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp(2,2),cplhhhhHpcHp(2,2),  & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHp'
 
mi2 = 0._dp 
mi2 = mi2+mu2H
mi2 = mi2+LamH*vH**2
mi2 = mi2+(LamPhiH*vPhi**2)/2._dp
mi2 = mi2+(g2**2*vH**2*RXiWp)/4._dp

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,            & 
& MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,         & 
& cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,            & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,   & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,            & 
& MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,         & 
& cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,            & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,   & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHp
 
 
Subroutine Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,               & 
& MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,               & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,         & 
& cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,           & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,    & 
& cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,     & 
& cplHpcHpVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),               & 
& MFv(9),MFv2(9),MHp,MHp2,Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhcHpVWp(2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),& 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,          & 
& cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,         & 
& cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp(2,2),cplhhhhHpcHp(2,2),  & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! VWp, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = Real(FloopRXi(p2,MAh2(i2),MVWp2),dp) 
coup1 = cplAhcHpVWp(i2)
coup2 =  Conjg(cplAhcHpVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = SA_Gloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*SA_B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucHpL(i1,i2)
coupR1 = cplcFdFucHpR(i1,i2)
coupL2 =  Conjg(cplcFdFucHpL(i1,i2))
coupR2 =  Conjg(cplcFdFucHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 9
 G0m2 = SA_Gloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*SA_B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcHpL(i1,i2)
coupR1 = cplcFeFvcHpR(i1,i2)
coupL2 =  Conjg(cplcFeFvcHpL(i1,i2))
coupR2 =  Conjg(cplcFeFvcHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWpcHp
coup2 =  cplcgWpgZHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVZp2*RXi),dp) 
 coup1 = cplcgZpgWpcHp
coup2 =  cplcgWpgZpHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
F0m2 =  -Real(SA_B0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgZcHp
coup2 =  cplcgZgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
F0m2 =  -Real(SA_B0(p2,MVZp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgZpcHp
coup2 =  cplcgZpgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHp2,Mhh2(i2)),dp) 
coup1 = cplhhHpcHp(i2)
coup2 = Conjg(cplhhHpcHp(i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = Real(FloopRXi(p2,Mhh2(i2),MVWp2),dp) 
coup1 = cplhhcHpVWp(i2)
coup2 =  Conjg(cplhhcHpVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
F0m2 = Real(FloopRXi(p2,MHp2,0._dp),dp) 
coup1 = cplHpcHpVP
coup2 =  Conjg(cplHpcHpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
F0m2 = Real(FloopRXi(p2,MHp2,MVZ2),dp) 
coup1 = cplHpcHpVZ
coup2 =  Conjg(cplHpcHpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopHp)) Then 
F0m2 = Real(FloopRXi(p2,MHp2,MVZp2),dp) 
coup1 = cplHpcHpVZp
coup2 =  Conjg(cplHpcHpVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
F0m2 = Real(SVVloop(p2,0._dp,MVWp2),dp) 
coup1 = cplcHpVPVWp
coup2 =  Conjg(cplcHpVPVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
F0m2 = Real(SVVloop(p2,MVWp2,MVZ2),dp) 
coup1 = cplcHpVWpVZ
coup2 =  Conjg(cplcHpVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
F0m2 = Real(SVVloop(p2,MVWp2,MVZp2),dp) 
coup1 = cplcHpVWpVZp
coup2 =  Conjg(cplcHpVWpVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(MAh2(i1)) 
coup1 = cplAhAhHpcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
coup1 = cplhhhhHpcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_A0(MHp2) 
coup1 = cplHpHpcHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
A0m2 =  0.75_dp*SA_A0(0._dp) + 0.25_dp*RXi*SA_A0(0._dp*RXi) - 0.5_dp*0._dp*rMS 
coup1 = cplHpcHpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 =  0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cplHpcHpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
End if 
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 =  0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplHpcHpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 =  0.75_dp*SA_A0(MVZp2) + 0.25_dp*RXi*SA_A0(MVZp2*RXi) - 0.5_dp*MVZp2*rMS 
coup1 = cplHpcHpVZpVZp
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 


res = oo16pi2*res 
 
End Subroutine Pi1LoopHp 
 
Subroutine DerPi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,            & 
& MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,               & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,         & 
& cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,           & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,    & 
& cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,     & 
& cplHpcHpVZpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),               & 
& MFv(9),MFv2(9),MHp,MHp2,Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhcHpVWp(2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),& 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,          & 
& cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,         & 
& cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp(2,2),cplhhhhHpcHp(2,2),  & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! VWp, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopAh)) Then 
      Do i2 = 1, 2
 F0m2 = Real(DerFloopRXi(p2,MAh2(i2),MVWp2),dp) 
coup1 = cplAhcHpVWp(i2)
coup2 =  Conjg(cplAhcHpVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFd).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = SA_DerGloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*SA_DerB0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucHpL(i1,i2)
coupR1 = cplcFdFucHpR(i1,i2)
coupL2 =  Conjg(cplcFdFucHpL(i1,i2))
coupR2 =  Conjg(cplcFdFucHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopFe).and.(Include_in_loopFv)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 9
 G0m2 = SA_DerGloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*SA_DerB0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcHpL(i1,i2)
coupR1 = cplcFeFvcHpR(i1,i2)
coupL2 =  Conjg(cplcFeFvcHpL(i1,i2))
coupR2 =  Conjg(cplcFeFvcHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWpcHp
coup2 =  cplcgWpgZHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVZp2*RXi),dp) 
 coup1 = cplcgZpgWpcHp
coup2 =  cplcgWpgZpHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
F0m2 =  -Real(SA_DerB0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgZcHp
coup2 =  cplcgZgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
F0m2 =  -Real(SA_DerB0(p2,MVZp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgZpcHp
coup2 =  cplcgZpgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHp2,Mhh2(i2)),dp) 
coup1 = cplhhHpcHp(i2)
coup2 = Conjg(cplhhHpcHp(i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
      Do i2 = 1, 2
 F0m2 = Real(DerFloopRXi(p2,Mhh2(i2),MVWp2),dp) 
coup1 = cplhhcHpVWp(i2)
coup2 =  Conjg(cplhhcHpVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
F0m2 = Real(DerFloopRXi(p2,MHp2,MVP2),dp) 
coup1 = cplHpcHpVP
coup2 =  Conjg(cplHpcHpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
F0m2 = Real(DerFloopRXi(p2,MHp2,MVZ2),dp) 
coup1 = cplHpcHpVZ
coup2 =  Conjg(cplHpcHpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopHp)) Then 
F0m2 = Real(DerFloopRXi(p2,MHp2,MVZp2),dp) 
coup1 = cplHpcHpVZp
coup2 =  Conjg(cplHpcHpVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
F0m2 = Real(DerSVVloop(p2,MVP2,MVWp2),dp) 
coup1 = cplcHpVPVWp
coup2 =  Conjg(cplcHpVPVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
F0m2 = Real(DerSVVloop(p2,MVWp2,MVZ2),dp) 
coup1 = cplcHpVWpVZ
coup2 =  Conjg(cplcHpVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
F0m2 = Real(DerSVVloop(p2,MVWp2,MVZp2),dp) 
coup1 = cplcHpVWpVZp
coup2 =  Conjg(cplcHpVWpVZp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(MAh2(i1)) 
coup1 = cplAhAhHpcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
coup1 = cplhhhhHpcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
A0m2 = SA_DerA0(MHp2) 
coup1 = cplHpHpcHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVP).and.(Include_in_loopVP)) Then 
A0m2 =  0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
coup1 = cplHpcHpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
A0m2 =  0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
coup1 = cplHpcHpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
End if 
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
A0m2 =  0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
coup1 = cplHpcHpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! VZp, VZp 
!------------------------ 
sumI = 0._dp 
 
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
A0m2 =  0.75_dp*SA_DerA0(MVZp2) + 0.25_dp*RXi*SA_DerA0(MVZp2*RXi) - 0.5_dp*MVZp2*DerrMS 
coup1 = cplHpcHpVZpVZp
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
End if 


res = oo16pi2*res 
 
End Subroutine DerPi1LoopHp 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,        & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFu(6),MFu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gG], gG 
!------------------------ 
If ((Include_in_loopgG).and.(Include_in_loopgG)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
End if 
!------------------------ 
! VG, VG 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopVG)) Then 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
End if 
!------------------------ 
! VG 
!------------------------ 
If (Include_in_loopVG) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,     & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFu(6),MFu2(6)

Complex(dp), Intent(in) :: cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gG], gG 
!------------------------ 
If ((Include_in_loopgG).and.(Include_in_loopgG)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
End if 
!------------------------ 
! VG, VG 
!------------------------ 
If ((Include_in_loopVG).and.(Include_in_loopVG)) Then 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
End if 
!------------------------ 
! VG 
!------------------------ 
If (Include_in_loopVG) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,        & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),   & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWpVP,        & 
& cplcgWCgWCVP,cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,           & 
& cplAhAhVPVP(2,2),cplhhhhVPVP(2,2),cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,        & 
& cplcVWpVPVPVWp2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZp2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZp2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHp2.gt.50._dp**2).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHp2.lt.50._dp**2).and.(MHp2.lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVP
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MHp2.lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVPVP
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,    & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),   & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWpVP,        & 
& cplcgWCgWCVP,cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,           & 
& cplAhAhVPVP(2,2),cplhhhhVPVP(2,2),cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,        & 
& cplcVWpVPVPVWp2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZp2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZp2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHp2.gt.50._dp**2).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHp2.lt.50._dp**2).and.(MHp2.lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVP
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MHp2.lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVPVP
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVZ(g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,           & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),   & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWpVZ,        & 
& cplcgWCgWCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,cplHpcVWpVZ,           & 
& cplcVWpVWpVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplHpcHpVZVZ,cplcVWpVWpVZVZ1,           & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),   & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWpVZ,        & 
& cplcgWCgWCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,cplHpcVWpVZ,           & 
& cplcVWpVWpVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplHpcHpVZVZ,cplcVWpVWpVZVZ1,           & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),   & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWpVZ,        & 
& cplcgWCgWCVZ,cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,cplHpcVWpVZ,           & 
& cplcVWpVWpVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplHpcHpVZVZ,cplcVWpVWpVZVZ1,           & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVZp(g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,Mhh,Mhh2,MAh,MAh2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,           & 
& cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,           & 
& cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,           & 
& cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,    & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(in) :: cplAhhhVZp(2,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWpVZp,   & 
& cplcgWCgWCVZp,cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,     & 
& cplcVWpVWpVZp,cplAhAhVZpVZp(2,2),cplhhhhVZpVZp(2,2),cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,  & 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZp'
 
mi2 = MVZp2 

 
p2 = MVZp2
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,          & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,          & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZp
 
 
Subroutine Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,     & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZp(2,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWpVZp,   & 
& cplcgWCgWCVZp,cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,     & 
& cplcVWpVWpVZp,cplAhAhVZpVZp(2,2),cplhhhhVZpVZp(2,2),cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,  & 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZpVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVZp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVZpVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZpVZp1
coup2 = cplcVWpVWpVZpVZp2
coup3 = cplcVWpVWpVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZp 
 
Subroutine DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,          & 
& cplFvFvVZpR,cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,             & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,     & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZp(2,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWpVZp,   & 
& cplcgWCgWCVZp,cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,     & 
& cplcVWpVWpVZp,cplAhAhVZpVZp(2,2),cplhhhhVZpVZp(2,2),cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,  & 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp)
coup1 = cplhhVZpVZp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp)  
coup1 = cplHpcHpVZp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp)
coup1 = cplHpcVWpVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZpVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVZpVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZpVZp1
coup2 = cplcVWpVWpVZpVZp2
coup3 = cplcVWpVWpVZpVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZp 
 
Subroutine OneLoopVWp(g2,vH,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,             & 
& MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,            & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,       & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3, & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHp,MHp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),MFv(9),          & 
& MFv2(9),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(in) :: cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),              & 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,               & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp(2,2),  & 
& cplhhhhcVWpVWp(2,2),cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,   & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWp'
 
mi2 = MVWp2 

 
p2 = MVWp2
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,             & 
& Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,             & 
& Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWp
 
 
Subroutine Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,            & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHp,MHp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),MFv(9),          & 
& MFv2(9),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),              & 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,               & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp(2,2),  & 
& cplhhhhcVWpVWp(2,2),cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,   & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hp, Ah 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHp2),dp)  
coup1 = cplAhHpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFucVWpL(i1,i2)
coupR1 = cplcFdFucVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fv 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvcVWpL(i1,i2)
coupR1 = cplcFeFvcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWpC], gP 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgA)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWp2),dp)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gP], gWp 
!------------------------ 
If ((Include_in_loopgA).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,0._dp),dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
If ((Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVZ2),dp)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWp 
!------------------------ 
If ((Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVZp2),dp)
coup1 = cplcgZpgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWp2),dp)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZp 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZp2,MVWp2),dp)
coup1 = cplcgWCgZpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Hp, hh 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHp2),dp)  
coup1 = cplhhHpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VWp, hh 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWp2,Mhh2(i2)),dp)
coup1 = cplhhcVWpVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VP, Hp 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,0._dp,MHp2),dp)
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, Hp 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVZ2,MHp2),dp)
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, Hp 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVZp2,MHp2),dp)
coup1 = cplHpcVWpVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VWp, VP 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, VWp 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, VWp 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! VP 
!------------------------ 
If (Include_in_loopVP) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
!------------------------ 
! VZ 
!------------------------ 
If (Include_in_loopVZ) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
!------------------------ 
! VZp 
!------------------------ 
If (Include_in_loopVZp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZp2) +RXi/4._dp*SA_A0(MVZp2*RXi) 
coup1 = cplcVWpVWpVZpVZp1
coup2 = cplcVWpVWpVZpVZp2
coup3 = cplcVWpVWpVZpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWp 
 
Subroutine DerPi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,             & 
& MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,            & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,       & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHp,MHp2,MAh(2),MAh2(2),MFd(6),MFd2(6),MFu(6),MFu2(6),MFe(6),MFe2(6),MFv(9),          & 
& MFv2(9),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),              & 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,               & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp(2,2),  & 
& cplhhhhcVWpVWp(2,2),cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,   & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hp, Ah 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHp2),dp)  
coup1 = cplAhHpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFucVWpL(i1,i2)
coupR1 = cplcFdFucVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fv 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvcVWpL(i1,i2)
coupR1 = cplcFeFvcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWpC], gP 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgA)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWp2),dp)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gP], gWp 
!------------------------ 
If ((Include_in_loopgA).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVP2),dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
If ((Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVZ2),dp)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWp 
!------------------------ 
If ((Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVZp2),dp)
coup1 = cplcgZpgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWp2),dp)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gZp 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZp2,MVWp2),dp)
coup1 = cplcgWCgZpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Hp, hh 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHp2),dp)  
coup1 = cplhhHpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VWp, hh 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWp2,Mhh2(i2)),dp)
coup1 = cplhhcVWpVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VP, Hp 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVP2,MHp2),dp)
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, Hp 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVZ2,MHp2),dp)
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, Hp 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVZp2,MHp2),dp)
coup1 = cplHpcVWpVZp
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VWp, VP 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, VWp 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZp, VWp 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! VP 
!------------------------ 
If (Include_in_loopVP) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
!------------------------ 
! VZ 
!------------------------ 
If (Include_in_loopVZ) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
!------------------------ 
! VZp 
!------------------------ 
If (Include_in_loopVZp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZp2) +RXi/4._dp*SA_DerA0(MVZp2*RXi) 
coup1 = cplcVWpVWpVZpVZp1
coup2 = cplcVWpVWpVZpVZp2
coup3 = cplcVWpVWpVZpVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWp 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,          & 
& MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,      & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(6),MFe2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFv(9),MFv2(9),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),      & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fe 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFe)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VZ, Fe 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fe 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFe)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZpL(gO1,i2)
coupR1 = cplcUFeFeVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fv 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHp2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHp2),dp) 
End If 
coupL1 = cplcUFeFvcHpL(gO1,i2)
coupR1 = cplcUFeFvcHpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcHpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fv 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFv)) Then 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvcVWpL(gO1,i2)
coupR1 = cplcUFeFvcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,          & 
& MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,      & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,            & 
& MFu(6),MFu2(6),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! hh, Fd 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFd)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VZ, Fd 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fd 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZpL(gO1,i2)
coupR1 = cplcUFdFdVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[Hp], Fu 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHp2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHp2),dp) 
End If 
coupL1 = cplcUFdFucHpL(gO1,i2)
coupR1 = cplcUFdFucHpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucHpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! conj[VWp], Fu 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFucVWpL(gO1,i2)
coupR1 = cplcUFdFucVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,          & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,      & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(6),MFu2(6),MAh(2),MAh2(2),MHp,MHp2,MFd(6),MFd2(6),MVWp,MVWp2,Mhh(2),              & 
& Mhh2(2),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),          & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigSL(6,6), SigSR(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumSL(6,6), sumSR(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopAh)) Then 
    Do i1 = 1, 6
       Do i2 = 1, 2
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! Hp, Fd 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHp2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHp2),dp) 
End If 
coupL1 = cplcUFuFdHpL(gO1,i2)
coupR1 = cplcUFuFdHpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdHpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdHpR(gO2,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VWp, Fd 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopFd)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdVWpL(gO1,i2)
coupR1 = cplcUFuFdVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! hh, Fu 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopFu)) Then 
    Do i1 = 1, 2
       Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 End if 
!------------------------ 
! VZ, Fu 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
!------------------------ 
! VZp, Fu 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loopFu)) Then 
      Do i2 = 1, 6
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZp2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZpL(gO1,i2)
coupR1 = cplcUFuFuVZpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 End if 
SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,      & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZ(2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),     & 
& cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),  & 
& cplcFeFeVZR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhhhVPVZ(2,2),      & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVP,cplHpcHpVPVZ,         & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVP
coup2 = cplHpcHpVZ
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVP
coup2 = cplcHpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVPVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZ2
coup2 = cplcVWpVPVWpVZ1
coup3 = cplcVWpVPVWpVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZ 
 
Subroutine DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,      & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZ(2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),     & 
& cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),  & 
& cplcFeFeVZR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhhhVPVZ(2,2),      & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVP,cplHpcHpVPVZ,         & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZ(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZL(i1,i2)
coupR2 = cplFvFvVZR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVP
coup2 = cplHpcHpVZ
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVP
coup2 = cplcHpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVPVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZ2
coup2 = cplcVWpVPVWpVZ1
coup3 = cplcVWpVPVWpVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZ 
 
Subroutine Pi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,               & 
& cplAhhhVZp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,        & 
& cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,          & 
& cplcVWpVWpVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,              & 
& cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,      & 
& cplHpcVWpVP,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZp(2,2),cplAhhhVP(2,2),cplAhhhVZp(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),   & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),& 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplhhhhVPVZp(2,2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZp(2),cplHpcHpVP,cplHpcHpVPVZp,      & 
& cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVP
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVP
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVPVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZp2
coup2 = cplcVWpVPVWpVZp1
coup3 = cplcVWpVPVWpVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZp 
 
Subroutine DerPi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,               & 
& cplAhhhVZp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,        & 
& cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,          & 
& cplcVWpVWpVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,              & 
& cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,      & 
& cplHpcVWpVP,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVPVZp(2,2),cplAhhhVP(2,2),cplAhhhVZp(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),   & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),& 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplhhhhVPVZp(2,2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZp(2),cplHpcHpVP,cplHpcHpVPVZp,      & 
& cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVP(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVP
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVP
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVPVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZp2
coup2 = cplcVWpVPVWpVZp1
coup3 = cplcVWpVPVWpVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZp 
 
Subroutine Pi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,               & 
& cplAhhhVZp,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,              & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFuFuVZR,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,         & 
& cplcHpVWpVZp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,             & 
& cplcVWpVWpVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,           & 
& cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,          & 
& cplHpcHpVZVZp,cplHpcVWpVZ,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVZVZp(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),  & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFeFeVZR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),& 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9),cplhhhhVZVZp(2,2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,       & 
& cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(VSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZ
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplHpcVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplcVWpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHp2)
 coup1 = cplHpcHpVZVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZp1
coup2 = cplcVWpVWpVZVZp2
coup3 = cplcVWpVWpVZVZp3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZVZp 
 
Subroutine DerPi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,               & 
& cplAhhhVZp,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,              & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFuFuVZR,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,         & 
& cplcHpVWpVZp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,             & 
& cplcVWpVWpVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,           & 
& cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,          & 
& cplHpcHpVZVZp,cplHpcVWpVZ,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhVZVZp(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),  & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFeFeVZR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),& 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9),cplhhhhVZVZp(2,2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,       & 
& cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZp(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZpL(i2,i1)
coupR2 = cplcFdFdVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZpL(i2,i1)
coupR2 = cplcFeFeVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZpL(i2,i1)
coupR2 = cplcFuFuVZpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZpL(i1,i2)
coupR2 = cplFvFvVZpR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCVZp 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVPVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplhhVZpVZp(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B22m2 = Real(DerVSSloop(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZ
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplHpcVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplcVWpVWpVZp
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End if 
!------------------------ 
! Ah 
!------------------------ 
If (Include_in_loopAh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! hh 
!------------------------ 
If (Include_in_loophh) Then 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 End if 
!------------------------ 
! conj[Hp] 
!------------------------ 
If (Include_in_loopHp) Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHp2)
 coup1 = cplHpcHpVZVZp
 SumI = coup1*A0m2 
res = res +1* SumI  
End if 
!------------------------ 
! conj[VWp] 
!------------------------ 
If (Include_in_loopVWp) Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZp1
coup2 = cplcVWpVWpVZVZp2
coup3 = cplcVWpVWpVZVZp3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZVZp 
 
Subroutine Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,               & 
& MVWp,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplcgWpgWphh(2),cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhcHpVWp(2),    & 
& cplhhcVWpVWp(2),cplhhHpcHp(2),cplhhHpcVWp(2),cplHpcHpVZ,cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MHp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZ
coup2 = cplhhHpcHp(gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplhhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplhhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,            & 
& MVWp,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplcgWpgWphh(2),cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,    & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhcHpVWp(2),    & 
& cplhhcVWpVWp(2),cplhhHpcHp(2),cplhhHpcVWp(2),cplHpcHpVZ,cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MHp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZ
coup2 = cplhhHpcHp(gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplhhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplhhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplcgWCgWCAh(2),cplcgWCgWCVZ,cplcgWpgWpAh(2),cplcgWpgWpVZ,cplcHpVWpVZ,cplFvFvAhL(9,9,2),& 
& cplFvFvAhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVPVZ(2),cplhhVZVZ(2),           & 
& cplhhVZVZp(2),cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplAhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplAhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplcgWCgWCAh(2),cplcgWCgWCVZ,cplcgWpgWpAh(2),cplcgWpgWpVZ,cplcHpVWpVZ,cplFvFvAhL(9,9,2),& 
& cplFvFvAhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVPVZ(2),cplhhVZVZ(2),           & 
& cplhhVZVZp(2),cplHpcVWpVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZ
coup2 = cplAhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplAhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,              & 
& MVWp,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,       & 
& cplcVWpVWpVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,               & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),            & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplcgWCgWChh(2),cplcgWCgWCVZp,cplcgWpgWphh(2),cplcgWpgWpVZp,cplcHpVWpVZp,              & 
& cplcVWpVWpVZp,cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhHpcHp(2),cplhhHpcVWp(2),cplHpcHpVZp,               & 
& cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZp
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZp
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MHp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZp
coup2 = cplhhHpcHp(gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZp
coup2 = cplhhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplhhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZp
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZphh 
 
Subroutine DerPi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,           & 
& MVWp,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,       & 
& cplcVWpVWpVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,               & 
& cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),            & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplcgWCgWChh(2),cplcgWCgWCVZp,cplcgWpgWphh(2),cplcgWpgWpVZp,cplcHpVWpVZp,              & 
& cplcVWpVWpVZp,cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhHpcHp(2),cplhhHpcVWp(2),cplHpcHpVZp,               & 
& cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZp
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZp
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MHp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MHp2,MHp2),dp) 
coup1 = cplHpcHpVZp
coup2 = cplhhHpcHp(gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZp
coup2 = cplhhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplhhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZp
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZphh 
 
Subroutine Pi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplcgWCgWCAh(2),cplcgWCgWCVZp,cplcgWpgWpAh(2),cplcgWpgWpVZp,cplcHpVWpVZp,              & 
& cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplhhVPVZp(2),   & 
& cplhhVZpVZp(2),cplhhVZVZp(2),cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZp(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZp
coup2 = cplcgWpgWpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZp
coup2 = cplcgWCgWCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZpVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZp
coup2 = cplAhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplAhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZpAh 
 
Subroutine DerPi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,      & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplcgWCgWCAh(2),cplcgWCgWCVZp,cplcgWpgWpAh(2),cplcgWpgWpVZp,cplcHpVWpVZp,              & 
& cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplhhVPVZp(2),   & 
& cplhhVZpVZp(2),cplhhVZVZp(2),cplHpcVWpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
If ((Include_in_loophh).and.(Include_in_loopAh)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZp(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
If ((Include_in_loopFd).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZpL(i1,i2)
coupR1 = cplcFdFdVZpR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fe], Fe 
!------------------------ 
If ((Include_in_loopFe).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZpL(i1,i2)
coupR1 = cplcFeFeVZpR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[Fu], Fu 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFu)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZpL(i1,i2)
coupR1 = cplcFuFuVZpR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fv 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFv)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZpL(i1,i2)
coupR1 = cplFvFvVZpR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gWp], gWp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZp
coup2 = cplcgWpgWpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
If ((Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZp
coup2 = cplcgWCgWCAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! VP, hh 
!------------------------ 
If ((Include_in_loopVP).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZp(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZ, hh 
!------------------------ 
If ((Include_in_loopVZ).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZp(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! VZp, hh 
!------------------------ 
If ((Include_in_loopVZp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVZp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,Mhh2(i2)),dp) 
coup1 = cplhhVZpVZp(i2)
coup2 = cplAhhhVZp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplHpcVWpVZp
coup2 = cplAhcHpVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VWp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplAhHpcVWp(gO2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZpAh 
 
Subroutine Pi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,        & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),              & 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,            & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplhhcHpVWp(2),cplhhcVWpVWp(2),        & 
& cplhhHpcHp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fu], Fd 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdVWpL(i1,i2)
coupR1 = cplcFuFdVWpR(i1,i2)
coupL2 = cplcFdFucHpL(i2,i1)
coupR2 = cplcFdFucHpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fe 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFeVWpL(i1,i2)
coupR1 = cplFvFeVWpR(i1,i2)
coupL2 = cplcFeFvcHpL(i2,i1)
coupR2 = cplcFeFvcHpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gP], gWpC 
!------------------------ 
If ((Include_in_loopgA).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,0._dp),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,0._dp),dp) 
coup1 = cplcgAgWCVWp
coup2 = cplcgWCgAcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZ], gWpC 
!------------------------ 
If ((Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVZ2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVZ2),dp) 
coup1 = cplcgZgWCVWp
coup2 = cplcgWCgZcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWpC 
!------------------------ 
If ((Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVZp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVZp2),dp) 
coup1 = cplcgZpgWCVWp
coup2 = cplcgWCgZpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZ2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MVWp2),dp) 
coup1 = cplcgWpgZVWp
coup2 = cplcgZgWpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWp], gZp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,MVWp2),dp) 
coup1 = cplcgWpgZpVWp
coup2 = cplcgZpgWpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], hh 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHp2),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHp2),dp) 
coup1 = cplhhcHpVWp(i2)
coup2 = cplhhHpcHp(i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], hh 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,Mhh2(i2)),dp) 
coup1 = cplhhcVWpVWp(i2)
coup2 = cplhhcHpVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], VP 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,0._dp,MHp2),dp) 
B1m2 = Real(SA_B1(p2,0._dp,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcHpVP
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VP 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,0._dp),dp)
B1m2 = Real(SA_B1(p2,MVWp2,0._dp),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcHpVPVWp
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VZ 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZ2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplHpcHpVZ
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVZ2),dp)
B1m2 = Real(SA_B1(p2,MVWp2,MVZ2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplcHpVWpVZ
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VZp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZp2,MHp2),dp) 
B1m2 = Real(SA_B1(p2,MVZp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VZp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVZp2),dp)
B1m2 = Real(SA_B1(p2,MVWp2,MVZp2),dp) 
coup1 = cplcVWpVWpVZp
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWpHp 
 
Subroutine DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,        & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),              & 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,            & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplhhcHpVWp(2),cplhhcVWpVWp(2),        & 
& cplhhHpcHp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fu], Fd 
!------------------------ 
If ((Include_in_loopFu).and.(Include_in_loopFd)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdVWpL(i1,i2)
coupR1 = cplcFuFdVWpR(i1,i2)
coupL2 = cplcFdFucHpL(i2,i1)
coupR2 = cplcFdFucHpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! Fv, Fe 
!------------------------ 
If ((Include_in_loopFv).and.(Include_in_loopFe)) Then 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 6
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFeVWpL(i1,i2)
coupR1 = cplFvFeVWpR(i1,i2)
coupL2 = cplcFeFvcHpL(i2,i1)
coupR2 = cplcFeFvcHpR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 End if 
!------------------------ 
! bar[gP], gWpC 
!------------------------ 
If ((Include_in_loopgA).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVP2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVP2),dp) 
coup1 = cplcgAgWCVWp
coup2 = cplcgWCgAcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZ], gWpC 
!------------------------ 
If ((Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVZ2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVZ2),dp) 
coup1 = cplcgZgWCVWp
coup2 = cplcgWCgZcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gZp], gWpC 
!------------------------ 
If ((Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVZp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVZp2),dp) 
coup1 = cplcgZpgWCVWp
coup2 = cplcgWCgZpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZ2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MVWp2),dp) 
coup1 = cplcgWpgZVWp
coup2 = cplcgZgWpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! bar[gWp], gZp 
!------------------------ 
If ((Include_in_loopgWp).and.(Include_in_loopgZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,MVWp2),dp) 
coup1 = cplcgWpgZpVWp
coup2 = cplcgZpgWpcHp 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], hh 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHp2),dp) 
coup1 = cplhhcHpVWp(i2)
coup2 = cplhhHpcHp(i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[VWp], hh 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loophh)) Then 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,Mhh2(i2)),dp) 
coup1 = cplhhcVWpVWp(i2)
coup2 = cplhhcHpVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 End if 
!------------------------ 
! conj[Hp], VP 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVP2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,MHp2),dp) 
coup1 = cplcHpVPVWp
coup2 = cplHpcHpVP
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VP 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVP)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVP2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVP2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcHpVPVWp
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VZ 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZ2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,MHp2),dp) 
coup1 = cplcHpVWpVZ
coup2 = cplHpcHpVZ
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVZ2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVZ2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplcHpVWpVZ
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[Hp], VZp 
!------------------------ 
If ((Include_in_loopHp).and.(Include_in_loopVZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZp2,MHp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVZp2,MHp2),dp) 
coup1 = cplcHpVWpVZp
coup2 = cplHpcHpVZp
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
End if 
!------------------------ 
! conj[VWp], VZp 
!------------------------ 
If ((Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVZp2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVZp2),dp) 
coup1 = cplcVWpVWpVZp
coup2 = cplcHpVWpVZp
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
End if 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWpHp 
 
End Module LoopMasses_U1T3R 
