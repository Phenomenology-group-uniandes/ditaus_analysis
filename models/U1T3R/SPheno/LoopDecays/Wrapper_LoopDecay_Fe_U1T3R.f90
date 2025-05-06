! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fe_U1T3R
Use Model_Data_U1T3R 
Use Kinematics 
Use OneLoopDecay_Fe_U1T3R 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fe(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,              & 
& MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,              & 
& MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,              & 
& g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,          & 
& mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,              & 
& dmChiNu,dmChiU,dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,            & 
& dLamPhiH,dLamPhi,dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,            & 
& ZfAh,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,         & 
& ZfVZpVZ,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,         & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,              & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,          & 
& cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,      & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,          & 
& cplHpcHpVZ,cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,ctcplcFeFeAhL,             & 
& ctcplcFeFeAhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,   & 
& ctcplcFeFeVZpL,ctcplcFeFeVZpR,ctcplcFeFeVZR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,             & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GcplcHpVPVWp,              & 
& GcplHpcVWpVP,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR,GosZcplcHpVPVWp,GosZcplHpcVWpVP,        & 
& GZcplcFeFvcHpL,GZcplcFeFvcHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplAhhhVP,ZcplcFeFeAhL,     & 
& ZcplcFeFeAhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,         & 
& ZcplcFeFeVZpL,ZcplcFeFeVZpR,ZcplcFeFeVZR,ZcplcFeFvcHpL,ZcplcFeFvcHpR,ZcplcFeFvcVWpL,   & 
& ZcplcFeFvcVWpR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplFvFeHpL,ZcplFvFeHpR,ZcplFvFeVWpL,        & 
& ZcplFvFeVWpR,ZcplFvFvVPL,ZcplFvFvVPR,ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpcHpVP,               & 
& ZcplHpcVWpVP,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,ZRUUV,MLambda,            & 
& em,gs,deltaM,kont,gP1LFe)

Implicit None 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(in) :: vH,vPhi

Real(dp),Intent(in) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dgX,dg1X,dgX1,dmu2H,dmu2Phi,dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,             & 
& dZH(2,2),dZA(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp),Intent(in) :: dmChiD(3,3),dmChiE(3,3),dmChiNu(3,3),dmChiU(3,3),dYvL(3,3),dYuL(3,3),dYvR(3,3),       & 
& dYuR(3,3),dYdL(3,3),dYeL(3,3),dYdR(3,3),dYeR(3,3),dZDL(6,6),dZDR(6,6),dZUL(6,6),       & 
& dZUR(6,6),dZEL(6,6),dZER(6,6),dUV(9,9)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),        & 
& cplAhHpcVWp(2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFehhL(6,6,2),               & 
& cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplcVWpVWpVZp,cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),       & 
& cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),     & 
& cplFvFvVZR(9,9),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhhhhh(2,2,2),cplhhHpcHp(2),         & 
& cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),   & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,ctcplcFeFeAhL(6,6,2),& 
& ctcplcFeFeAhR(6,6,2),ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2),ctcplcFeFeVPL(6,6),     & 
& ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZpL(6,6),ctcplcFeFeVZpR(6,6),         & 
& ctcplcFeFeVZR(6,6),ctcplcFeFvcHpL(6,9),ctcplcFeFvcHpR(6,9),ctcplcFeFvcVWpL(6,9),       & 
& ctcplcFeFvcVWpR(6,9),GcplcFeFvcHpL(6,9),GcplcFeFvcHpR(6,9),GcplcHpVPVWp,               & 
& GcplHpcVWpVP,GosZcplcFeFvcHpL(6,9),GosZcplcFeFvcHpR(6,9),GosZcplcHpVPVWp,              & 
& GosZcplHpcVWpVP,GZcplcFeFvcHpL(6,9),GZcplcFeFvcHpR(6,9),GZcplcHpVPVWp,GZcplHpcVWpVP,   & 
& ZcplAhhhVP(2,2),ZcplcFeFeAhL(6,6,2),ZcplcFeFeAhR(6,6,2),ZcplcFeFehhL(6,6,2),           & 
& ZcplcFeFehhR(6,6,2),ZcplcFeFeVPL(6,6),ZcplcFeFeVPR(6,6),ZcplcFeFeVZL(6,6),             & 
& ZcplcFeFeVZpL(6,6),ZcplcFeFeVZpR(6,6),ZcplcFeFeVZR(6,6),ZcplcFeFvcHpL(6,9),            & 
& ZcplcFeFvcHpR(6,9),ZcplcFeFvcVWpL(6,9),ZcplcFeFvcVWpR(6,9),ZcplcHpVPVWp,               & 
& ZcplcVWpVPVWp,ZcplFvFeHpL(9,6),ZcplFvFeHpR(9,6),ZcplFvFeVWpL(9,6),ZcplFvFeVWpR(9,6),   & 
& ZcplFvFvVPL(9,9),ZcplFvFvVPR(9,9),ZcplhhVPVZ(2),ZcplhhVPVZp(2),ZcplHpcHpVP,            & 
& ZcplHpcVWpVP

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh(2,2),ZfAh(2,2),ZfDL(6,6),ZfDR(6,6),              & 
& ZfUL(6,6),ZfUR(6,6),ZfEL(6,6),ZfER(6,6),ZfFV(9,9),ZfVPVZ,ZfVZVP,ZfVPVZp,               & 
& ZfVZpVP,ZfVZVZp,ZfVZpVZ

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MAhOS(2),MAh2OS(2),MFdOS(6),MFd2OS(6),MFuOS(6),MFu2OS(6),          & 
& MFeOS(6),MFe2OS(6),MFvOS(9),MFv2OS(9),MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,        & 
& MVWpOS,MVWp2OS,ZHOS(2,2),ZAOS(2,2)

Complex(dp),Intent(in) :: ZDLOS(6,6),ZDROS(6,6),ZULOS(6,6),ZUROS(6,6),ZELOS(6,6),ZEROS(6,6),UVOS(9,9)

Complex(dp),Intent(in) :: ZRUZh(2,2),ZRUZA(2,2),ZRUVd(6,6),ZRUUd(6,6),ZRUVu(6,6),ZRUUu(6,6),ZRUVe(6,6),         & 
& ZRUUe(6,6),ZRUUV(9,9)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LFe(6,39) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZhc(2, 2) 
Complex(dp) :: ZRUZAc(2, 2) 
Complex(dp) :: ZRUVdc(6, 6) 
Complex(dp) :: ZRUUdc(6, 6) 
Complex(dp) :: ZRUVuc(6, 6) 
Complex(dp) :: ZRUUuc(6, 6) 
Complex(dp) :: ZRUVec(6, 6) 
Complex(dp) :: ZRUUec(6, 6) 
Complex(dp) :: ZRUUVc(9, 9) 
Real(dp) :: MRPFeToFehh(6,6,2),MRGFeToFehh(6,6,2), MRPZFeToFehh(6,6,2),MRGZFeToFehh(6,6,2) 
Real(dp) :: MVPFeToFehh(6,6,2) 
Real(dp) :: RMsqTreeFeToFehh(6,6,2),RMsqWaveFeToFehh(6,6,2),RMsqVertexFeToFehh(6,6,2) 
Complex(dp) :: AmpTreeFeToFehh(2,6,6,2),AmpWaveFeToFehh(2,6,6,2)=(0._dp,0._dp),AmpVertexFeToFehh(2,6,6,2)& 
 & ,AmpVertexIRosFeToFehh(2,6,6,2),AmpVertexIRdrFeToFehh(2,6,6,2), AmpSumFeToFehh(2,6,6,2), AmpSum2FeToFehh(2,6,6,2) 
Complex(dp) :: AmpTreeZFeToFehh(2,6,6,2),AmpWaveZFeToFehh(2,6,6,2),AmpVertexZFeToFehh(2,6,6,2) 
Real(dp) :: AmpSqFeToFehh(6,6,2),  AmpSqTreeFeToFehh(6,6,2) 
Real(dp) :: MRPFeToFeVZ(6,6),MRGFeToFeVZ(6,6), MRPZFeToFeVZ(6,6),MRGZFeToFeVZ(6,6) 
Real(dp) :: MVPFeToFeVZ(6,6) 
Real(dp) :: RMsqTreeFeToFeVZ(6,6),RMsqWaveFeToFeVZ(6,6),RMsqVertexFeToFeVZ(6,6) 
Complex(dp) :: AmpTreeFeToFeVZ(4,6,6),AmpWaveFeToFeVZ(4,6,6)=(0._dp,0._dp),AmpVertexFeToFeVZ(4,6,6)& 
 & ,AmpVertexIRosFeToFeVZ(4,6,6),AmpVertexIRdrFeToFeVZ(4,6,6), AmpSumFeToFeVZ(4,6,6), AmpSum2FeToFeVZ(4,6,6) 
Complex(dp) :: AmpTreeZFeToFeVZ(4,6,6),AmpWaveZFeToFeVZ(4,6,6),AmpVertexZFeToFeVZ(4,6,6) 
Real(dp) :: AmpSqFeToFeVZ(6,6),  AmpSqTreeFeToFeVZ(6,6) 
Real(dp) :: MRPFeToFeVZp(6,6),MRGFeToFeVZp(6,6), MRPZFeToFeVZp(6,6),MRGZFeToFeVZp(6,6) 
Real(dp) :: MVPFeToFeVZp(6,6) 
Real(dp) :: RMsqTreeFeToFeVZp(6,6),RMsqWaveFeToFeVZp(6,6),RMsqVertexFeToFeVZp(6,6) 
Complex(dp) :: AmpTreeFeToFeVZp(4,6,6),AmpWaveFeToFeVZp(4,6,6)=(0._dp,0._dp),AmpVertexFeToFeVZp(4,6,6)& 
 & ,AmpVertexIRosFeToFeVZp(4,6,6),AmpVertexIRdrFeToFeVZp(4,6,6), AmpSumFeToFeVZp(4,6,6), AmpSum2FeToFeVZp(4,6,6) 
Complex(dp) :: AmpTreeZFeToFeVZp(4,6,6),AmpWaveZFeToFeVZp(4,6,6),AmpVertexZFeToFeVZp(4,6,6) 
Real(dp) :: AmpSqFeToFeVZp(6,6),  AmpSqTreeFeToFeVZp(6,6) 
Real(dp) :: MRPFeToFvcVWp(6,9),MRGFeToFvcVWp(6,9), MRPZFeToFvcVWp(6,9),MRGZFeToFvcVWp(6,9) 
Real(dp) :: MVPFeToFvcVWp(6,9) 
Real(dp) :: RMsqTreeFeToFvcVWp(6,9),RMsqWaveFeToFvcVWp(6,9),RMsqVertexFeToFvcVWp(6,9) 
Complex(dp) :: AmpTreeFeToFvcVWp(4,6,9),AmpWaveFeToFvcVWp(4,6,9)=(0._dp,0._dp),AmpVertexFeToFvcVWp(4,6,9)& 
 & ,AmpVertexIRosFeToFvcVWp(4,6,9),AmpVertexIRdrFeToFvcVWp(4,6,9), AmpSumFeToFvcVWp(4,6,9), AmpSum2FeToFvcVWp(4,6,9) 
Complex(dp) :: AmpTreeZFeToFvcVWp(4,6,9),AmpWaveZFeToFvcVWp(4,6,9),AmpVertexZFeToFvcVWp(4,6,9) 
Real(dp) :: AmpSqFeToFvcVWp(6,9),  AmpSqTreeFeToFvcVWp(6,9) 
Real(dp) :: MRPFeToFeVP(6,6),MRGFeToFeVP(6,6), MRPZFeToFeVP(6,6),MRGZFeToFeVP(6,6) 
Real(dp) :: MVPFeToFeVP(6,6) 
Real(dp) :: RMsqTreeFeToFeVP(6,6),RMsqWaveFeToFeVP(6,6),RMsqVertexFeToFeVP(6,6) 
Complex(dp) :: AmpTreeFeToFeVP(4,6,6),AmpWaveFeToFeVP(4,6,6)=(0._dp,0._dp),AmpVertexFeToFeVP(4,6,6)& 
 & ,AmpVertexIRosFeToFeVP(4,6,6),AmpVertexIRdrFeToFeVP(4,6,6), AmpSumFeToFeVP(4,6,6), AmpSum2FeToFeVP(4,6,6) 
Complex(dp) :: AmpTreeZFeToFeVP(4,6,6),AmpWaveZFeToFeVP(4,6,6),AmpVertexZFeToFeVP(4,6,6) 
Real(dp) :: AmpSqFeToFeVP(6,6),  AmpSqTreeFeToFeVP(6,6) 
Write(*,*) "Calculating one-loop decays of Fe " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZhc = Conjg(ZRUZh)
ZRUZAc = Conjg(ZRUZA)
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)
ZRUUVc = Conjg(ZRUUV)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FeToFehh(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,MFe2,              & 
& Mhh2,AmpTreeFeToFehh)

  Else 
Call Amplitude_Tree_U1T3R_FeToFehh(ZcplcFeFehhL,ZcplcFeFehhR,MFe,Mhh,MFe2,            & 
& Mhh2,AmpTreeFeToFehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFeOS,           & 
& MhhOS,MRPFeToFehh,MRGFeToFehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,               & 
& MFeOS,MhhOS,MRPFeToFehh,MRGFeToFehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFe,             & 
& Mhh,MRPFeToFehh,MRGFeToFehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,               & 
& MFe,Mhh,MRPFeToFehh,MRGFeToFehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FeToFehh(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,             & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWaveFeToFehh)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,MVZp,           & 
& MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexFeToFehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRdrFeToFehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,ZcplcFeFehhL,ZcplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFeToFehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,ZcplcFeFehhL,ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRosFeToFehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,            & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFeToFehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRosFeToFehh)

 End if 
 End if 
AmpVertexFeToFehh = AmpVertexFeToFehh -  AmpVertexIRdrFeToFehh! +  AmpVertexIRosFeToFehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFehh(1,gt2,:,:) = AmpWaveZFeToFehh(1,gt2,:,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFehh(1,gt1,:,:) 
AmpVertexZFeToFehh(1,gt2,:,:)= AmpVertexZFeToFehh(1,gt2,:,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFehh(1,gt1,:,:) 
AmpWaveZFeToFehh(2,gt2,:,:) = AmpWaveZFeToFehh(2,gt2,:,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFehh(2,gt1,:,:) 
AmpVertexZFeToFehh(2,gt2,:,:)= AmpVertexZFeToFehh(2,gt2,:,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFehh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
! Final State 1 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFehh(1,:,gt2,:) = AmpWaveZFeToFehh(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpWaveFeToFehh(1,:,gt1,:) 
AmpVertexZFeToFehh(1,:,gt2,:)= AmpVertexZFeToFehh(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpVertexFeToFehh(1,:,gt1,:) 
AmpWaveZFeToFehh(2,:,gt2,:) = AmpWaveZFeToFehh(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpWaveFeToFehh(2,:,gt1,:) 
AmpVertexZFeToFehh(2,:,gt2,:)= AmpVertexZFeToFehh(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpVertexFeToFehh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
! Final State 2 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFeToFehh(:,:,:,gt2) = AmpWaveZFeToFehh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpWaveFeToFehh(:,:,:,gt1) 
AmpVertexZFeToFehh(:,:,:,gt2)= AmpVertexZFeToFehh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpVertexFeToFehh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFehh = AmpVertexFeToFehh  +  AmpVertexIRosFeToFehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh 
 AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh  
Else 
 AmpSumFeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FeToFehh = AmpTreeFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = 2._dp*AmpWaveFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqTreeFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3) + AmpSqTreeFeToFehh(gt1, gt2, gt3)  
Else  
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqTreeFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3) + AmpSqTreeFeToFehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFeToFehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFehh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),helfactor*AmpSqFeToFehh(gt1, gt2, gt3))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),Mhh(gt3),helfactor*AmpSqFeToFehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2, gt3) + MRGFeToFehh(gt1, gt2, gt3)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2, gt3) + MRGFeToFehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,MFe,MVZ,MFe2,              & 
& MVZ2,AmpTreeFeToFeVZ)

  Else 
Call Amplitude_Tree_U1T3R_FeToFeVZ(ZcplcFeFeVZL,ZcplcFeFeVZR,MFe,MVZ,MFe2,            & 
& MVZ2,AmpTreeFeToFeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,MFeOS,           & 
& MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,               & 
& MFeOS,MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,MFe,             & 
& MVZ,MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,               & 
& MFe,MVZ,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,MVZ,MVZ2,ZfEL,           & 
& ZfER,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveFeToFeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,MVZp,           & 
& MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,      & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexFeToFeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRdrFeToFeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,ZcplcFeFeVZL,              & 
& ZcplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFeToFeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFeToFeVZ)

 End if 
 End if 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ -  AmpVertexIRdrFeToFeVZ! +  AmpVertexIRosFeToFeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFeVZ(1,gt2,:) = AmpWaveZFeToFeVZ(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(1,gt1,:) 
AmpVertexZFeToFeVZ(1,gt2,:)= AmpVertexZFeToFeVZ(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(1,gt1,:) 
AmpWaveZFeToFeVZ(2,gt2,:) = AmpWaveZFeToFeVZ(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(2,gt1,:) 
AmpVertexZFeToFeVZ(2,gt2,:)= AmpVertexZFeToFeVZ(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(2,gt1,:) 
AmpWaveZFeToFeVZ(3,gt2,:) = AmpWaveZFeToFeVZ(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(3,gt1,:) 
AmpVertexZFeToFeVZ(3,gt2,:)= AmpVertexZFeToFeVZ(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(3,gt1,:) 
AmpWaveZFeToFeVZ(4,gt2,:) = AmpWaveZFeToFeVZ(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(4,gt1,:) 
AmpVertexZFeToFeVZ(4,gt2,:)= AmpVertexZFeToFeVZ(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
! Final State 1 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFeVZ(1,:,gt2) = AmpWaveZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(1,:,gt1) 
AmpVertexZFeToFeVZ(1,:,gt2)= AmpVertexZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(1,:,gt1) 
AmpWaveZFeToFeVZ(2,:,gt2) = AmpWaveZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(2,:,gt1) 
AmpVertexZFeToFeVZ(2,:,gt2)= AmpVertexZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(2,:,gt1) 
AmpWaveZFeToFeVZ(3,:,gt2) = AmpWaveZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(3,:,gt1) 
AmpVertexZFeToFeVZ(3,:,gt2)= AmpVertexZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(3,:,gt1) 
AmpWaveZFeToFeVZ(4,:,gt2) = AmpWaveZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(4,:,gt1) 
AmpVertexZFeToFeVZ(4,:,gt2)= AmpVertexZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ  +  AmpVertexIRosFeToFeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ 
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ  
Else 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpWaveFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
Else  
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
End if  
Else  
  AmpSqFeToFeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVZ(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MVZOS,helfactor*AmpSqFeToFeVZ(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVZ,helfactor*AmpSqFeToFeVZ(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FeToFeVZp(cplcFeFeVZpL,cplcFeFeVZpR,MFe,MVZp,               & 
& MFe2,MVZp2,AmpTreeFeToFeVZp)

  Else 
Call Amplitude_Tree_U1T3R_FeToFeVZp(ZcplcFeFeVZpL,ZcplcFeFeVZpR,MFe,MVZp,             & 
& MFe2,MVZp2,AmpTreeFeToFeVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZp(MLambda,em,gs,cplcFeFeVZpL,cplcFeFeVZpR,              & 
& MFeOS,MVZpOS,MRPFeToFeVZp,MRGFeToFeVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZp(MLambda,em,gs,ZcplcFeFeVZpL,ZcplcFeFeVZpR,            & 
& MFeOS,MVZpOS,MRPFeToFeVZp,MRGFeToFeVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FeToFeVZp(MLambda,em,gs,cplcFeFeVZpL,cplcFeFeVZpR,              & 
& MFe,MVZp,MRPFeToFeVZp,MRGFeToFeVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FeToFeVZp(MLambda,em,gs,ZcplcFeFeVZpL,ZcplcFeFeVZpR,            & 
& MFe,MVZp,MRPFeToFeVZp,MRGFeToFeVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FeToFeVZp(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,MVZp,MVZp2,              & 
& ZfEL,ZfER,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveFeToFeVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,               & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexFeToFeVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRdrFeToFeVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,               & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFeToFeVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,           & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFeToFeVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,               & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFeToFeVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFeToFeVZp)

 End if 
 End if 
AmpVertexFeToFeVZp = AmpVertexFeToFeVZp -  AmpVertexIRdrFeToFeVZp! +  AmpVertexIRosFeToFeVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFeVZp=0._dp 
AmpVertexZFeToFeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFeVZp(1,gt2,:) = AmpWaveZFeToFeVZp(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZp(1,gt1,:) 
AmpVertexZFeToFeVZp(1,gt2,:)= AmpVertexZFeToFeVZp(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZp(1,gt1,:) 
AmpWaveZFeToFeVZp(2,gt2,:) = AmpWaveZFeToFeVZp(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZp(2,gt1,:) 
AmpVertexZFeToFeVZp(2,gt2,:)= AmpVertexZFeToFeVZp(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZp(2,gt1,:) 
AmpWaveZFeToFeVZp(3,gt2,:) = AmpWaveZFeToFeVZp(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZp(3,gt1,:) 
AmpVertexZFeToFeVZp(3,gt2,:)= AmpVertexZFeToFeVZp(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZp(3,gt1,:) 
AmpWaveZFeToFeVZp(4,gt2,:) = AmpWaveZFeToFeVZp(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZp(4,gt1,:) 
AmpVertexZFeToFeVZp(4,gt2,:)= AmpVertexZFeToFeVZp(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFeVZp=AmpWaveZFeToFeVZp 
AmpVertexFeToFeVZp= AmpVertexZFeToFeVZp
! Final State 1 
AmpWaveZFeToFeVZp=0._dp 
AmpVertexZFeToFeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFeVZp(1,:,gt2) = AmpWaveZFeToFeVZp(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZp(1,:,gt1) 
AmpVertexZFeToFeVZp(1,:,gt2)= AmpVertexZFeToFeVZp(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZp(1,:,gt1) 
AmpWaveZFeToFeVZp(2,:,gt2) = AmpWaveZFeToFeVZp(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZp(2,:,gt1) 
AmpVertexZFeToFeVZp(2,:,gt2)= AmpVertexZFeToFeVZp(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZp(2,:,gt1) 
AmpWaveZFeToFeVZp(3,:,gt2) = AmpWaveZFeToFeVZp(3,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZp(3,:,gt1) 
AmpVertexZFeToFeVZp(3,:,gt2)= AmpVertexZFeToFeVZp(3,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZp(3,:,gt1) 
AmpWaveZFeToFeVZp(4,:,gt2) = AmpWaveZFeToFeVZp(4,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZp(4,:,gt1) 
AmpVertexZFeToFeVZp(4,:,gt2)= AmpVertexZFeToFeVZp(4,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFeVZp=AmpWaveZFeToFeVZp 
AmpVertexFeToFeVZp= AmpVertexZFeToFeVZp
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFeVZp = AmpVertexFeToFeVZp  +  AmpVertexIRosFeToFeVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFeVZp = AmpTreeFeToFeVZp 
 AmpSum2FeToFeVZp = AmpTreeFeToFeVZp + 2._dp*AmpWaveFeToFeVZp + 2._dp*AmpVertexFeToFeVZp  
Else 
 AmpSumFeToFeVZp = AmpTreeFeToFeVZp + AmpWaveFeToFeVZp + AmpVertexFeToFeVZp
 AmpSum2FeToFeVZp = AmpTreeFeToFeVZp + AmpWaveFeToFeVZp + AmpVertexFeToFeVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVZp = AmpTreeFeToFeVZp
 AmpSum2FeToFeVZp = AmpTreeFeToFeVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFeVZp = AmpTreeFeToFeVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFeVZp(gt1, gt2) 
  AmpSum2FeToFeVZp = 2._dp*AmpWaveFeToFeVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFeVZp(gt1, gt2) 
  AmpSum2FeToFeVZp = 2._dp*AmpVertexFeToFeVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFeVZp(gt1, gt2) 
  AmpSum2FeToFeVZp = AmpTreeFeToFeVZp + 2._dp*AmpWaveFeToFeVZp + 2._dp*AmpVertexFeToFeVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFeVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFeVZp = AmpTreeFeToFeVZp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
  AmpSqTreeFeToFeVZp(gt1, gt2) = AmpSqFeToFeVZp(gt1, gt2)  
  AmpSum2FeToFeVZp = + 2._dp*AmpWaveFeToFeVZp + 2._dp*AmpVertexFeToFeVZp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZpOS,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
  AmpSqFeToFeVZp(gt1, gt2) = AmpSqFeToFeVZp(gt1, gt2) + AmpSqTreeFeToFeVZp(gt1, gt2)  
Else  
  AmpSum2FeToFeVZp = AmpTreeFeToFeVZp
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
  AmpSqTreeFeToFeVZp(gt1, gt2) = AmpSqFeToFeVZp(gt1, gt2)  
  AmpSum2FeToFeVZp = + 2._dp*AmpWaveFeToFeVZp + 2._dp*AmpVertexFeToFeVZp
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZp,AmpSumFeToFeVZp(:,gt1, gt2),AmpSum2FeToFeVZp(:,gt1, gt2),AmpSqFeToFeVZp(gt1, gt2)) 
  AmpSqFeToFeVZp(gt1, gt2) = AmpSqFeToFeVZp(gt1, gt2) + AmpSqTreeFeToFeVZp(gt1, gt2)  
End if  
Else  
  AmpSqFeToFeVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVZp(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MVZpOS,helfactor*AmpSqFeToFeVZp(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVZp,helfactor*AmpSqFeToFeVZp(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZp(gt1, gt2) + MRGFeToFeVZp(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZp(gt1, gt2) + MRGFeToFeVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,MFe,MFv,             & 
& MVWp,MFe2,MFv2,MVWp2,AmpTreeFeToFvcVWp)

  Else 
Call Amplitude_Tree_U1T3R_FeToFvcVWp(ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,MFe,               & 
& MFv,MVWp,MFe2,MFv2,MVWp2,AmpTreeFeToFvcVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FeToFvcVWp(MLambda,em,gs,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& MFeOS,MFvOS,MVWpOS,MRPFeToFvcVWp,MRGFeToFvcVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FeToFvcVWp(MLambda,em,gs,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,         & 
& MFeOS,MFvOS,MVWpOS,MRPFeToFvcVWp,MRGFeToFvcVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FeToFvcVWp(MLambda,em,gs,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& MFe,MFv,MVWp,MRPFeToFvcVWp,MRGFeToFvcVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FeToFvcVWp(MLambda,em,gs,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,         & 
& MFe,MFv,MVWp,MRPFeToFvcVWp,MRGFeToFvcVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,ctcplcFeFvcVWpL,     & 
& ctcplcFeFvcVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfFV,ZfVWp,AmpWaveFeToFvcVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,              & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexFeToFvcVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexIRdrFeToFvcVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,              & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,              & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& GosZcplcFeFvcHpL,GosZcplcFeFvcHpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,cplhhHpcVWp,           & 
& cplhhcVWpVWp,GosZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,       & 
& cplcVWpVWpVZp,AmpVertexIRosFeToFvcVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,GZcplcFeFvcHpL,GZcplcFeFvcHpR,ZcplcFeFvcVWpL,       & 
& ZcplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,GZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexIRosFeToFvcVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,              & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,              & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& GcplcFeFvcHpL,GcplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,      & 
& GcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,         & 
& AmpVertexIRosFeToFvcVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexIRosFeToFvcVWp)

 End if 
 End if 
AmpVertexFeToFvcVWp = AmpVertexFeToFvcVWp -  AmpVertexIRdrFeToFvcVWp! +  AmpVertexIRosFeToFvcVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFvcVWp=0._dp 
AmpVertexZFeToFvcVWp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFeToFvcVWp(1,gt2,:) = AmpWaveZFeToFvcVWp(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvcVWp(1,gt1,:) 
AmpVertexZFeToFvcVWp(1,gt2,:)= AmpVertexZFeToFvcVWp(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvcVWp(1,gt1,:) 
AmpWaveZFeToFvcVWp(2,gt2,:) = AmpWaveZFeToFvcVWp(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvcVWp(2,gt1,:) 
AmpVertexZFeToFvcVWp(2,gt2,:)= AmpVertexZFeToFvcVWp(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvcVWp(2,gt1,:) 
AmpWaveZFeToFvcVWp(3,gt2,:) = AmpWaveZFeToFvcVWp(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvcVWp(3,gt1,:) 
AmpVertexZFeToFvcVWp(3,gt2,:)= AmpVertexZFeToFvcVWp(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvcVWp(3,gt1,:) 
AmpWaveZFeToFvcVWp(4,gt2,:) = AmpWaveZFeToFvcVWp(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvcVWp(4,gt1,:) 
AmpVertexZFeToFvcVWp(4,gt2,:)= AmpVertexZFeToFvcVWp(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvcVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFvcVWp=AmpWaveZFeToFvcVWp 
AmpVertexFeToFvcVWp= AmpVertexZFeToFvcVWp
! Final State 1 
AmpWaveZFeToFvcVWp=0._dp 
AmpVertexZFeToFvcVWp=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZFeToFvcVWp(1,:,gt2) = AmpWaveZFeToFvcVWp(1,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFeToFvcVWp(1,:,gt1) 
AmpVertexZFeToFvcVWp(1,:,gt2)= AmpVertexZFeToFvcVWp(1,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFeToFvcVWp(1,:,gt1) 
AmpWaveZFeToFvcVWp(2,:,gt2) = AmpWaveZFeToFvcVWp(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFeToFvcVWp(2,:,gt1) 
AmpVertexZFeToFvcVWp(2,:,gt2)= AmpVertexZFeToFvcVWp(2,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFeToFvcVWp(2,:,gt1) 
AmpWaveZFeToFvcVWp(3,:,gt2) = AmpWaveZFeToFvcVWp(3,:,gt2)+ZRUUV(gt2,gt1)*AmpWaveFeToFvcVWp(3,:,gt1) 
AmpVertexZFeToFvcVWp(3,:,gt2)= AmpVertexZFeToFvcVWp(3,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexFeToFvcVWp(3,:,gt1) 
AmpWaveZFeToFvcVWp(4,:,gt2) = AmpWaveZFeToFvcVWp(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpWaveFeToFvcVWp(4,:,gt1) 
AmpVertexZFeToFvcVWp(4,:,gt2)= AmpVertexZFeToFvcVWp(4,:,gt2)+ZRUUVc(gt2,gt1)*AmpVertexFeToFvcVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFvcVWp=AmpWaveZFeToFvcVWp 
AmpVertexFeToFvcVWp= AmpVertexZFeToFvcVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFvcVWp = AmpVertexFeToFvcVWp  +  AmpVertexIRosFeToFvcVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fv conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp 
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp  
Else 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp + AmpWaveFeToFvcVWp + AmpVertexFeToFvcVWp
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + AmpWaveFeToFvcVWp + AmpVertexFeToFvcVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MVWpOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFv(gt2))+Abs(MVWp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = 2._dp*AmpWaveFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = 2._dp*AmpVertexFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFvcVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqTreeFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2)  
  AmpSum2FeToFvcVWp = + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2) + AmpSqTreeFeToFvcVWp(gt1, gt2)  
Else  
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqTreeFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2)  
  AmpSum2FeToFvcVWp = + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2) + AmpSqTreeFeToFvcVWp(gt1, gt2)  
End if  
Else  
  AmpSqFeToFvcVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFvcVWp(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFvOS(gt2),MVWpOS,helfactor*AmpSqFeToFvcVWp(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFv(gt2),MVWp,helfactor*AmpSqFeToFvcVWp(gt1, gt2))
End if 
If ((Abs(MRPFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcVWp(gt1, gt2) + MRGFeToFvcVWp(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcVWp(gt1, gt2) + MRGFeToFvcVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Fe VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_FeToFeVP(ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,            & 
& ZcplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,    & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFeOS,MFe2OS,MVP,MVP2,ZfEL,ZfER,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFeToFeVP)

 Else 
Call Amplitude_WAVE_U1T3R_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFeOS,MFe2OS,MVP,MVP2,ZfEL,ZfER,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFeToFeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_FeToFeVP(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,               & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplAhhhVP,ZcplFvFeHpL,ZcplFvFeHpR,ZcplFvFeVWpL,     & 
& ZcplFvFeVWpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,         & 
& ZcplcFeFeVZR,ZcplcFeFeVZpL,ZcplcFeFeVZpR,ZcplFvFvVPL,ZcplFvFvVPR,ZcplcFeFvcHpL,        & 
& ZcplcFeFvcHpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpcHpVP,        & 
& ZcplHpcVWpVP,ZcplcHpVPVWp,ZcplcVWpVPVWp,AmpVertexFeToFeVP)

 Else 
Call Amplitude_VERTEX_U1T3R_FeToFeVP(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,               & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,              & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFeToFeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,ZfEL,ZfER,               & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFeToFeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FeToFeVP(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,MVZp,           & 
& MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,      & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,              & 
& cplFvFvVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVPVZ,            & 
& cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFeToFeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVP = 0._dp 
 AmpSum2FeToFeVP = 0._dp  
Else 
 AmpSumFeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP
 AmpSum2FeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),0._dp,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVP,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
End if  
Else  
  AmpSqFeToFeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVP(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),0._dp,helfactor*AmpSqFeToFeVP(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVP,helfactor*AmpSqFeToFeVP(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Fe

End Module Wrapper_OneLoopDecay_Fe_U1T3R
