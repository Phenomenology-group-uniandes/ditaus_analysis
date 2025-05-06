! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fu_U1T3R
Use Model_Data_U1T3R 
Use Kinematics 
Use OneLoopDecay_Fu_U1T3R 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fu(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,              & 
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
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,            & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,          & 
& cplHpcHpVZ,cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplVGVGVG,ctcplcFuFdHpL,   & 
& ctcplcFuFdHpR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,ctcplcFuFuAhL,ctcplcFuFuAhR,               & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFuFuVZL,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFuFuVZR,GcplcFuFdHpL,GcplcFuFdHpR,   & 
& GcplcHpVPVWp,GcplHpcVWpVP,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplcHpVPVWp,             & 
& GosZcplHpcVWpVP,GZcplcFuFdHpL,GZcplcFuFdHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,               & 
& ZcplAhhhVP,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFucHpL,          & 
& ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFuFdVWpL,   & 
& ZcplcFuFdVWpR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,        & 
& ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZpL,ZcplcFuFuVZpR,       & 
& ZcplcFuFuVZR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpcHpVP,            & 
& ZcplHpcVWpVP,ZcplVGVGVG,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,               & 
& ZRUUV,MLambda,em,gs,deltaM,kont,gP1LFu)

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
& cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdhhL(6,6,2),               & 
& cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),& 
& cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFdFucHpL(6,6),& 
& cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFuFdHpL(6,6),              & 
& cplcFuFdHpR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuAhL(6,6,2),               & 
& cplcFuFuAhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),             & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6), & 
& cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhhhhh(2,2,2),& 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZpVZp(2),cplhhVZVZ(2),   & 
& cplhhVZVZp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZ,               & 
& cplHpcVWpVZp,cplVGVGVG,ctcplcFuFdHpL(6,6),ctcplcFuFdHpR(6,6),ctcplcFuFdVWpL(6,6),      & 
& ctcplcFuFdVWpR(6,6),ctcplcFuFuAhL(6,6,2),ctcplcFuFuAhR(6,6,2),ctcplcFuFuhhL(6,6,2),    & 
& ctcplcFuFuhhR(6,6,2),ctcplcFuFuVGL(6,6),ctcplcFuFuVGR(6,6),ctcplcFuFuVPL(6,6),         & 
& ctcplcFuFuVPR(6,6),ctcplcFuFuVZL(6,6),ctcplcFuFuVZpL(6,6),ctcplcFuFuVZpR(6,6),         & 
& ctcplcFuFuVZR(6,6),GcplcFuFdHpL(6,6),GcplcFuFdHpR(6,6),GcplcHpVPVWp,GcplHpcVWpVP,      & 
& GosZcplcFuFdHpL(6,6),GosZcplcFuFdHpR(6,6),GosZcplcHpVPVWp,GosZcplHpcVWpVP,             & 
& GZcplcFuFdHpL(6,6),GZcplcFuFdHpR(6,6),GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplAhhhVP(2,2),     & 
& ZcplcFdFdVGL(6,6),ZcplcFdFdVGR(6,6),ZcplcFdFdVPL(6,6),ZcplcFdFdVPR(6,6),               & 
& ZcplcFdFucHpL(6,6),ZcplcFdFucHpR(6,6),ZcplcFdFucVWpL(6,6),ZcplcFdFucVWpR(6,6),         & 
& ZcplcFuFdHpL(6,6),ZcplcFuFdHpR(6,6),ZcplcFuFdVWpL(6,6),ZcplcFuFdVWpR(6,6),             & 
& ZcplcFuFuAhL(6,6,2),ZcplcFuFuAhR(6,6,2),ZcplcFuFuhhL(6,6,2),ZcplcFuFuhhR(6,6,2),       & 
& ZcplcFuFuVGL(6,6),ZcplcFuFuVGR(6,6),ZcplcFuFuVPL(6,6),ZcplcFuFuVPR(6,6),               & 
& ZcplcFuFuVZL(6,6),ZcplcFuFuVZpL(6,6),ZcplcFuFuVZpR(6,6),ZcplcFuFuVZR(6,6),             & 
& ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplhhVPVZ(2),ZcplhhVPVZp(2),ZcplHpcHpVP,ZcplHpcVWpVP,      & 
& ZcplVGVGVG

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
Real(dp), Intent(out) :: gP1LFu(6,42) 
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
Real(dp) :: MRPFuToFdVWp(6,6),MRGFuToFdVWp(6,6), MRPZFuToFdVWp(6,6),MRGZFuToFdVWp(6,6) 
Real(dp) :: MVPFuToFdVWp(6,6) 
Real(dp) :: RMsqTreeFuToFdVWp(6,6),RMsqWaveFuToFdVWp(6,6),RMsqVertexFuToFdVWp(6,6) 
Complex(dp) :: AmpTreeFuToFdVWp(4,6,6),AmpWaveFuToFdVWp(4,6,6)=(0._dp,0._dp),AmpVertexFuToFdVWp(4,6,6)& 
 & ,AmpVertexIRosFuToFdVWp(4,6,6),AmpVertexIRdrFuToFdVWp(4,6,6), AmpSumFuToFdVWp(4,6,6), AmpSum2FuToFdVWp(4,6,6) 
Complex(dp) :: AmpTreeZFuToFdVWp(4,6,6),AmpWaveZFuToFdVWp(4,6,6),AmpVertexZFuToFdVWp(4,6,6) 
Real(dp) :: AmpSqFuToFdVWp(6,6),  AmpSqTreeFuToFdVWp(6,6) 
Real(dp) :: MRPFuToFuhh(6,6,2),MRGFuToFuhh(6,6,2), MRPZFuToFuhh(6,6,2),MRGZFuToFuhh(6,6,2) 
Real(dp) :: MVPFuToFuhh(6,6,2) 
Real(dp) :: RMsqTreeFuToFuhh(6,6,2),RMsqWaveFuToFuhh(6,6,2),RMsqVertexFuToFuhh(6,6,2) 
Complex(dp) :: AmpTreeFuToFuhh(2,6,6,2),AmpWaveFuToFuhh(2,6,6,2)=(0._dp,0._dp),AmpVertexFuToFuhh(2,6,6,2)& 
 & ,AmpVertexIRosFuToFuhh(2,6,6,2),AmpVertexIRdrFuToFuhh(2,6,6,2), AmpSumFuToFuhh(2,6,6,2), AmpSum2FuToFuhh(2,6,6,2) 
Complex(dp) :: AmpTreeZFuToFuhh(2,6,6,2),AmpWaveZFuToFuhh(2,6,6,2),AmpVertexZFuToFuhh(2,6,6,2) 
Real(dp) :: AmpSqFuToFuhh(6,6,2),  AmpSqTreeFuToFuhh(6,6,2) 
Real(dp) :: MRPFuToFuVZ(6,6),MRGFuToFuVZ(6,6), MRPZFuToFuVZ(6,6),MRGZFuToFuVZ(6,6) 
Real(dp) :: MVPFuToFuVZ(6,6) 
Real(dp) :: RMsqTreeFuToFuVZ(6,6),RMsqWaveFuToFuVZ(6,6),RMsqVertexFuToFuVZ(6,6) 
Complex(dp) :: AmpTreeFuToFuVZ(4,6,6),AmpWaveFuToFuVZ(4,6,6)=(0._dp,0._dp),AmpVertexFuToFuVZ(4,6,6)& 
 & ,AmpVertexIRosFuToFuVZ(4,6,6),AmpVertexIRdrFuToFuVZ(4,6,6), AmpSumFuToFuVZ(4,6,6), AmpSum2FuToFuVZ(4,6,6) 
Complex(dp) :: AmpTreeZFuToFuVZ(4,6,6),AmpWaveZFuToFuVZ(4,6,6),AmpVertexZFuToFuVZ(4,6,6) 
Real(dp) :: AmpSqFuToFuVZ(6,6),  AmpSqTreeFuToFuVZ(6,6) 
Real(dp) :: MRPFuToFuVZp(6,6),MRGFuToFuVZp(6,6), MRPZFuToFuVZp(6,6),MRGZFuToFuVZp(6,6) 
Real(dp) :: MVPFuToFuVZp(6,6) 
Real(dp) :: RMsqTreeFuToFuVZp(6,6),RMsqWaveFuToFuVZp(6,6),RMsqVertexFuToFuVZp(6,6) 
Complex(dp) :: AmpTreeFuToFuVZp(4,6,6),AmpWaveFuToFuVZp(4,6,6)=(0._dp,0._dp),AmpVertexFuToFuVZp(4,6,6)& 
 & ,AmpVertexIRosFuToFuVZp(4,6,6),AmpVertexIRdrFuToFuVZp(4,6,6), AmpSumFuToFuVZp(4,6,6), AmpSum2FuToFuVZp(4,6,6) 
Complex(dp) :: AmpTreeZFuToFuVZp(4,6,6),AmpWaveZFuToFuVZp(4,6,6),AmpVertexZFuToFuVZp(4,6,6) 
Real(dp) :: AmpSqFuToFuVZp(6,6),  AmpSqTreeFuToFuVZp(6,6) 
Real(dp) :: MRPFuToFuVG(6,6),MRGFuToFuVG(6,6), MRPZFuToFuVG(6,6),MRGZFuToFuVG(6,6) 
Real(dp) :: MVPFuToFuVG(6,6) 
Real(dp) :: RMsqTreeFuToFuVG(6,6),RMsqWaveFuToFuVG(6,6),RMsqVertexFuToFuVG(6,6) 
Complex(dp) :: AmpTreeFuToFuVG(4,6,6),AmpWaveFuToFuVG(4,6,6)=(0._dp,0._dp),AmpVertexFuToFuVG(4,6,6)& 
 & ,AmpVertexIRosFuToFuVG(4,6,6),AmpVertexIRdrFuToFuVG(4,6,6), AmpSumFuToFuVG(4,6,6), AmpSum2FuToFuVG(4,6,6) 
Complex(dp) :: AmpTreeZFuToFuVG(4,6,6),AmpWaveZFuToFuVG(4,6,6),AmpVertexZFuToFuVG(4,6,6) 
Real(dp) :: AmpSqFuToFuVG(6,6),  AmpSqTreeFuToFuVG(6,6) 
Real(dp) :: MRPFuToFuVP(6,6),MRGFuToFuVP(6,6), MRPZFuToFuVP(6,6),MRGZFuToFuVP(6,6) 
Real(dp) :: MVPFuToFuVP(6,6) 
Real(dp) :: RMsqTreeFuToFuVP(6,6),RMsqWaveFuToFuVP(6,6),RMsqVertexFuToFuVP(6,6) 
Complex(dp) :: AmpTreeFuToFuVP(4,6,6),AmpWaveFuToFuVP(4,6,6)=(0._dp,0._dp),AmpVertexFuToFuVP(4,6,6)& 
 & ,AmpVertexIRosFuToFuVP(4,6,6),AmpVertexIRdrFuToFuVP(4,6,6), AmpSumFuToFuVP(4,6,6), AmpSum2FuToFuVP(4,6,6) 
Complex(dp) :: AmpTreeZFuToFuVP(4,6,6),AmpWaveZFuToFuVP(4,6,6),AmpVertexZFuToFuVP(4,6,6) 
Real(dp) :: AmpSqFuToFuVP(6,6),  AmpSqTreeFuToFuVP(6,6) 
Write(*,*) "Calculating one-loop decays of Fu " 
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
! Fd VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FuToFdVWp(cplcFuFdVWpL,cplcFuFdVWpR,MFd,MFu,MVWp,           & 
& MFd2,MFu2,MVWp2,AmpTreeFuToFdVWp)

  Else 
Call Amplitude_Tree_U1T3R_FuToFdVWp(ZcplcFuFdVWpL,ZcplcFuFdVWpR,MFd,MFu,              & 
& MVWp,MFd2,MFu2,MVWp2,AmpTreeFuToFdVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FuToFdVWp(MLambda,em,gs,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& MFdOS,MFuOS,MVWpOS,MRPFuToFdVWp,MRGFuToFdVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FuToFdVWp(MLambda,em,gs,ZcplcFuFdVWpL,ZcplcFuFdVWpR,            & 
& MFdOS,MFuOS,MVWpOS,MRPFuToFdVWp,MRGFuToFdVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FuToFdVWp(MLambda,em,gs,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& MFd,MFu,MVWp,MRPFuToFdVWp,MRGFuToFdVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FuToFdVWp(MLambda,em,gs,ZcplcFuFdVWpL,ZcplcFuFdVWpR,            & 
& MFd,MFu,MVWp,MRPFuToFdVWp,MRGFuToFdVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFdVWp(cplcFuFdVWpL,cplcFuFdVWpR,ctcplcFuFdVWpL,         & 
& ctcplcFuFdVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,ZfUR,ZfVWp,AmpWaveFuToFdVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFdVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& AmpVertexFuToFdVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FuToFdVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& AmpVertexIRdrFuToFdVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFdVWp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,    & 
& cplcFdFdhhL,cplcFdFdhhR,GosZcplcFuFdHpL,GosZcplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,       & 
& cplcFdFdVPL,cplcFdFdVPR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplhhcHpVWp,cplhhcVWpVWp,GosZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFuToFdVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFdVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& GZcplcFuFdHpL,GZcplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,           & 
& ZcplcFuFdVWpL,ZcplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhcHpVWp,cplhhcVWpVWp,            & 
& GZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,        & 
& AmpVertexIRosFuToFdVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFdVWp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,    & 
& cplcFdFdhhL,cplcFdFdhhR,GcplcFuFdHpL,GcplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplhhcHpVWp,cplhhcVWpVWp,GcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,           & 
& cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFuToFdVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFdVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& AmpVertexIRosFuToFdVWp)

 End if 
 End if 
AmpVertexFuToFdVWp = AmpVertexFuToFdVWp -  AmpVertexIRdrFuToFdVWp! +  AmpVertexIRosFuToFdVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFdVWp=0._dp 
AmpVertexZFuToFdVWp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFdVWp(1,gt2,:) = AmpWaveZFuToFdVWp(1,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFdVWp(1,gt1,:) 
AmpVertexZFuToFdVWp(1,gt2,:)= AmpVertexZFuToFdVWp(1,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFdVWp(1,gt1,:) 
AmpWaveZFuToFdVWp(2,gt2,:) = AmpWaveZFuToFdVWp(2,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFdVWp(2,gt1,:) 
AmpVertexZFuToFdVWp(2,gt2,:)= AmpVertexZFuToFdVWp(2,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFdVWp(2,gt1,:) 
AmpWaveZFuToFdVWp(3,gt2,:) = AmpWaveZFuToFdVWp(3,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFdVWp(3,gt1,:) 
AmpVertexZFuToFdVWp(3,gt2,:)= AmpVertexZFuToFdVWp(3,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFdVWp(3,gt1,:) 
AmpWaveZFuToFdVWp(4,gt2,:) = AmpWaveZFuToFdVWp(4,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFdVWp(4,gt1,:) 
AmpVertexZFuToFdVWp(4,gt2,:)= AmpVertexZFuToFdVWp(4,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFdVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFdVWp=AmpWaveZFuToFdVWp 
AmpVertexFuToFdVWp= AmpVertexZFuToFdVWp
! Final State 1 
AmpWaveZFuToFdVWp=0._dp 
AmpVertexZFuToFdVWp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFdVWp(1,:,gt2) = AmpWaveZFuToFdVWp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFuToFdVWp(1,:,gt1) 
AmpVertexZFuToFdVWp(1,:,gt2)= AmpVertexZFuToFdVWp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFuToFdVWp(1,:,gt1) 
AmpWaveZFuToFdVWp(2,:,gt2) = AmpWaveZFuToFdVWp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFuToFdVWp(2,:,gt1) 
AmpVertexZFuToFdVWp(2,:,gt2)= AmpVertexZFuToFdVWp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFuToFdVWp(2,:,gt1) 
AmpWaveZFuToFdVWp(3,:,gt2) = AmpWaveZFuToFdVWp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFuToFdVWp(3,:,gt1) 
AmpVertexZFuToFdVWp(3,:,gt2)= AmpVertexZFuToFdVWp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFuToFdVWp(3,:,gt1) 
AmpWaveZFuToFdVWp(4,:,gt2) = AmpWaveZFuToFdVWp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFuToFdVWp(4,:,gt1) 
AmpVertexZFuToFdVWp(4,:,gt2)= AmpVertexZFuToFdVWp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFuToFdVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFdVWp=AmpWaveZFuToFdVWp 
AmpVertexFuToFdVWp= AmpVertexZFuToFdVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFdVWp = AmpVertexFuToFdVWp  +  AmpVertexIRosFuToFdVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fd VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFdVWp = AmpTreeFuToFdVWp 
 AmpSum2FuToFdVWp = AmpTreeFuToFdVWp + 2._dp*AmpWaveFuToFdVWp + 2._dp*AmpVertexFuToFdVWp  
Else 
 AmpSumFuToFdVWp = AmpTreeFuToFdVWp + AmpWaveFuToFdVWp + AmpVertexFuToFdVWp
 AmpSum2FuToFdVWp = AmpTreeFuToFdVWp + AmpWaveFuToFdVWp + AmpVertexFuToFdVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFdVWp = AmpTreeFuToFdVWp
 AmpSum2FuToFdVWp = AmpTreeFuToFdVWp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MVWpOS)))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFd(gt2))+Abs(MVWp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFdVWp = AmpTreeFuToFdVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFdVWp(gt1, gt2) 
  AmpSum2FuToFdVWp = 2._dp*AmpWaveFuToFdVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFdVWp(gt1, gt2) 
  AmpSum2FuToFdVWp = 2._dp*AmpVertexFuToFdVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFdVWp(gt1, gt2) 
  AmpSum2FuToFdVWp = AmpTreeFuToFdVWp + 2._dp*AmpWaveFuToFdVWp + 2._dp*AmpVertexFuToFdVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFdVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFdVWp = AmpTreeFuToFdVWp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
  AmpSqTreeFuToFdVWp(gt1, gt2) = AmpSqFuToFdVWp(gt1, gt2)  
  AmpSum2FuToFdVWp = + 2._dp*AmpWaveFuToFdVWp + 2._dp*AmpVertexFuToFdVWp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
  AmpSqFuToFdVWp(gt1, gt2) = AmpSqFuToFdVWp(gt1, gt2) + AmpSqTreeFuToFdVWp(gt1, gt2)  
Else  
  AmpSum2FuToFdVWp = AmpTreeFuToFdVWp
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
  AmpSqTreeFuToFdVWp(gt1, gt2) = AmpSqFuToFdVWp(gt1, gt2)  
  AmpSum2FuToFdVWp = + 2._dp*AmpWaveFuToFdVWp + 2._dp*AmpVertexFuToFdVWp
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdVWp(:,gt1, gt2),AmpSum2FuToFdVWp(:,gt1, gt2),AmpSqFuToFdVWp(gt1, gt2)) 
  AmpSqFuToFdVWp(gt1, gt2) = AmpSqFuToFdVWp(gt1, gt2) + AmpSqTreeFuToFdVWp(gt1, gt2)  
End if  
Else  
  AmpSqFuToFdVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFdVWp(gt1, gt2).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFdOS(gt2),MVWpOS,helfactor*AmpSqFuToFdVWp(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFd(gt2),MVWp,helfactor*AmpSqFuToFdVWp(gt1, gt2))
End if 
If ((Abs(MRPFuToFdVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFdVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFdVWp(gt1, gt2) + MRGFuToFdVWp(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFdVWp(gt1, gt2) + MRGFuToFdVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fu hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,MFu2,              & 
& Mhh2,AmpTreeFuToFuhh)

  Else 
Call Amplitude_Tree_U1T3R_FuToFuhh(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,Mhh,MFu2,            & 
& Mhh2,AmpTreeFuToFuhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FuToFuhh(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFuOS,           & 
& MhhOS,MRPFuToFuhh,MRGFuToFuhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FuToFuhh(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,               & 
& MFuOS,MhhOS,MRPFuToFuhh,MRGFuToFuhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FuToFuhh(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFu,             & 
& Mhh,MRPFuToFuhh,MRGFuToFuhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FuToFuhh(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,               & 
& MFu,Mhh,MRPFuToFuhh,MRGFuToFuhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,             & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,AmpWaveFuToFuhh)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFuhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,        & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexFuToFuhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrFuToFuhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuhh(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFuToFuhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFuToFuhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuhh(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFuToFuhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFuToFuhh)

 End if 
 End if 
AmpVertexFuToFuhh = AmpVertexFuToFuhh -  AmpVertexIRdrFuToFuhh! +  AmpVertexIRosFuToFuhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuhh(1,gt2,:,:) = AmpWaveZFuToFuhh(1,gt2,:,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuhh(1,gt1,:,:) 
AmpVertexZFuToFuhh(1,gt2,:,:)= AmpVertexZFuToFuhh(1,gt2,:,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuhh(1,gt1,:,:) 
AmpWaveZFuToFuhh(2,gt2,:,:) = AmpWaveZFuToFuhh(2,gt2,:,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuhh(2,gt1,:,:) 
AmpVertexZFuToFuhh(2,gt2,:,:)= AmpVertexZFuToFuhh(2,gt2,:,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuhh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
! Final State 1 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuhh(1,:,gt2,:) = AmpWaveZFuToFuhh(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpWaveFuToFuhh(1,:,gt1,:) 
AmpVertexZFuToFuhh(1,:,gt2,:)= AmpVertexZFuToFuhh(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpVertexFuToFuhh(1,:,gt1,:) 
AmpWaveZFuToFuhh(2,:,gt2,:) = AmpWaveZFuToFuhh(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuhh(2,:,gt1,:) 
AmpVertexZFuToFuhh(2,:,gt2,:)= AmpVertexZFuToFuhh(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuhh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
! Final State 2 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFuToFuhh(:,:,:,gt2) = AmpWaveZFuToFuhh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpWaveFuToFuhh(:,:,:,gt1) 
AmpVertexZFuToFuhh(:,:,:,gt2)= AmpVertexZFuToFuhh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpVertexFuToFuhh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuhh = AmpVertexFuToFuhh  +  AmpVertexIRosFuToFuhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuhh = AmpTreeFuToFuhh 
 AmpSum2FuToFuhh = AmpTreeFuToFuhh + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh  
Else 
 AmpSumFuToFuhh = AmpTreeFuToFuhh + AmpWaveFuToFuhh + AmpVertexFuToFuhh
 AmpSum2FuToFuhh = AmpTreeFuToFuhh + AmpWaveFuToFuhh + AmpVertexFuToFuhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuhh = AmpTreeFuToFuhh
 AmpSum2FuToFuhh = AmpTreeFuToFuhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFu(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = 2._dp*AmpWaveFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = 2._dp*AmpVertexFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqTreeFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3)  
  AmpSum2FuToFuhh = + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3) + AmpSqTreeFuToFuhh(gt1, gt2, gt3)  
Else  
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqTreeFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3)  
  AmpSum2FuToFuhh = + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3) + AmpSqTreeFuToFuhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFuToFuhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),helfactor*AmpSqFuToFuhh(gt1, gt2, gt3))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),Mhh(gt3),helfactor*AmpSqFuToFuhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuhh(gt1, gt2, gt3) + MRGFuToFuhh(gt1, gt2, gt3)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuhh(gt1, gt2, gt3) + MRGFuToFuhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fu VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FuToFuVZ(cplcFuFuVZL,cplcFuFuVZR,MFu,MVZ,MFu2,              & 
& MVZ2,AmpTreeFuToFuVZ)

  Else 
Call Amplitude_Tree_U1T3R_FuToFuVZ(ZcplcFuFuVZL,ZcplcFuFuVZR,MFu,MVZ,MFu2,            & 
& MVZ2,AmpTreeFuToFuVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZ(MLambda,em,gs,cplcFuFuVZL,cplcFuFuVZR,MFuOS,           & 
& MVZOS,MRPFuToFuVZ,MRGFuToFuVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZ(MLambda,em,gs,ZcplcFuFuVZL,ZcplcFuFuVZR,               & 
& MFuOS,MVZOS,MRPFuToFuVZ,MRGFuToFuVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FuToFuVZ(MLambda,em,gs,cplcFuFuVZL,cplcFuFuVZR,MFu,             & 
& MVZ,MRPFuToFuVZ,MRGFuToFuVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZ(MLambda,em,gs,ZcplcFuFuVZL,ZcplcFuFuVZR,               & 
& MFu,MVZ,MRPFuToFuVZ,MRGFuToFuVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFuVZ(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,       & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,MFu,MFu2,MVP,MVP2,MVZ,MVZ2,ZfUL,           & 
& ZfUR,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveFuToFuVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFuVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexFuToFuVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRdrFuToFuVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZ(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,              & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFuToFuVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFuToFuVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZ(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,              & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFuToFuVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFuToFuVZ)

 End if 
 End if 
AmpVertexFuToFuVZ = AmpVertexFuToFuVZ -  AmpVertexIRdrFuToFuVZ! +  AmpVertexIRosFuToFuVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuVZ=0._dp 
AmpVertexZFuToFuVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuVZ(1,gt2,:) = AmpWaveZFuToFuVZ(1,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZ(1,gt1,:) 
AmpVertexZFuToFuVZ(1,gt2,:)= AmpVertexZFuToFuVZ(1,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZ(1,gt1,:) 
AmpWaveZFuToFuVZ(2,gt2,:) = AmpWaveZFuToFuVZ(2,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZ(2,gt1,:) 
AmpVertexZFuToFuVZ(2,gt2,:)= AmpVertexZFuToFuVZ(2,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZ(2,gt1,:) 
AmpWaveZFuToFuVZ(3,gt2,:) = AmpWaveZFuToFuVZ(3,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZ(3,gt1,:) 
AmpVertexZFuToFuVZ(3,gt2,:)= AmpVertexZFuToFuVZ(3,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZ(3,gt1,:) 
AmpWaveZFuToFuVZ(4,gt2,:) = AmpWaveZFuToFuVZ(4,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZ(4,gt1,:) 
AmpVertexZFuToFuVZ(4,gt2,:)= AmpVertexZFuToFuVZ(4,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuVZ=AmpWaveZFuToFuVZ 
AmpVertexFuToFuVZ= AmpVertexZFuToFuVZ
! Final State 1 
AmpWaveZFuToFuVZ=0._dp 
AmpVertexZFuToFuVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuVZ(1,:,gt2) = AmpWaveZFuToFuVZ(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZ(1,:,gt1) 
AmpVertexZFuToFuVZ(1,:,gt2)= AmpVertexZFuToFuVZ(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZ(1,:,gt1) 
AmpWaveZFuToFuVZ(2,:,gt2) = AmpWaveZFuToFuVZ(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZ(2,:,gt1) 
AmpVertexZFuToFuVZ(2,:,gt2)= AmpVertexZFuToFuVZ(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZ(2,:,gt1) 
AmpWaveZFuToFuVZ(3,:,gt2) = AmpWaveZFuToFuVZ(3,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZ(3,:,gt1) 
AmpVertexZFuToFuVZ(3,:,gt2)= AmpVertexZFuToFuVZ(3,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZ(3,:,gt1) 
AmpWaveZFuToFuVZ(4,:,gt2) = AmpWaveZFuToFuVZ(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZ(4,:,gt1) 
AmpVertexZFuToFuVZ(4,:,gt2)= AmpVertexZFuToFuVZ(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuVZ=AmpWaveZFuToFuVZ 
AmpVertexFuToFuVZ= AmpVertexZFuToFuVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuVZ = AmpVertexFuToFuVZ  +  AmpVertexIRosFuToFuVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ 
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ  
Else 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ + AmpWaveFuToFuVZ + AmpVertexFuToFuVZ
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + AmpWaveFuToFuVZ + AmpVertexFuToFuVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFu(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = 2._dp*AmpWaveFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = 2._dp*AmpVertexFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqTreeFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2)  
  AmpSum2FuToFuVZ = + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2) + AmpSqTreeFuToFuVZ(gt1, gt2)  
Else  
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqTreeFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2)  
  AmpSum2FuToFuVZ = + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2) + AmpSqTreeFuToFuVZ(gt1, gt2)  
End if  
Else  
  AmpSqFuToFuVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVZ(gt1, gt2).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MVZOS,helfactor*AmpSqFuToFuVZ(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MVZ,helfactor*AmpSqFuToFuVZ(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZ(gt1, gt2) + MRGFuToFuVZ(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZ(gt1, gt2) + MRGFuToFuVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fu VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FuToFuVZp(cplcFuFuVZpL,cplcFuFuVZpR,MFu,MVZp,               & 
& MFu2,MVZp2,AmpTreeFuToFuVZp)

  Else 
Call Amplitude_Tree_U1T3R_FuToFuVZp(ZcplcFuFuVZpL,ZcplcFuFuVZpR,MFu,MVZp,             & 
& MFu2,MVZp2,AmpTreeFuToFuVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZp(MLambda,em,gs,cplcFuFuVZpL,cplcFuFuVZpR,              & 
& MFuOS,MVZpOS,MRPFuToFuVZp,MRGFuToFuVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZp(MLambda,em,gs,ZcplcFuFuVZpL,ZcplcFuFuVZpR,            & 
& MFuOS,MVZpOS,MRPFuToFuVZp,MRGFuToFuVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FuToFuVZp(MLambda,em,gs,cplcFuFuVZpL,cplcFuFuVZpR,              & 
& MFu,MVZp,MRPFuToFuVZp,MRGFuToFuVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FuToFuVZp(MLambda,em,gs,ZcplcFuFuVZpL,ZcplcFuFuVZpR,            & 
& MFu,MVZp,MRPFuToFuVZp,MRGFuToFuVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFuVZp(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,       & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,MFu,MFu2,MVP,MVP2,MVZp,MVZp2,              & 
& ZfUL,ZfUR,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveFuToFuVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFuVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexFuToFuVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRdrFuToFuVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& ZcplcFuFuVZpL,ZcplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,     & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFuToFuVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,           & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFuToFuVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFuToFuVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FuToFuVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZp,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,              & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFuToFuVZp)

 End if 
 End if 
AmpVertexFuToFuVZp = AmpVertexFuToFuVZp -  AmpVertexIRdrFuToFuVZp! +  AmpVertexIRosFuToFuVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuVZp=0._dp 
AmpVertexZFuToFuVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuVZp(1,gt2,:) = AmpWaveZFuToFuVZp(1,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZp(1,gt1,:) 
AmpVertexZFuToFuVZp(1,gt2,:)= AmpVertexZFuToFuVZp(1,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZp(1,gt1,:) 
AmpWaveZFuToFuVZp(2,gt2,:) = AmpWaveZFuToFuVZp(2,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZp(2,gt1,:) 
AmpVertexZFuToFuVZp(2,gt2,:)= AmpVertexZFuToFuVZp(2,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZp(2,gt1,:) 
AmpWaveZFuToFuVZp(3,gt2,:) = AmpWaveZFuToFuVZp(3,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZp(3,gt1,:) 
AmpVertexZFuToFuVZp(3,gt2,:)= AmpVertexZFuToFuVZp(3,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZp(3,gt1,:) 
AmpWaveZFuToFuVZp(4,gt2,:) = AmpWaveZFuToFuVZp(4,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZp(4,gt1,:) 
AmpVertexZFuToFuVZp(4,gt2,:)= AmpVertexZFuToFuVZp(4,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuVZp=AmpWaveZFuToFuVZp 
AmpVertexFuToFuVZp= AmpVertexZFuToFuVZp
! Final State 1 
AmpWaveZFuToFuVZp=0._dp 
AmpVertexZFuToFuVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFuToFuVZp(1,:,gt2) = AmpWaveZFuToFuVZp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZp(1,:,gt1) 
AmpVertexZFuToFuVZp(1,:,gt2)= AmpVertexZFuToFuVZp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZp(1,:,gt1) 
AmpWaveZFuToFuVZp(2,:,gt2) = AmpWaveZFuToFuVZp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZp(2,:,gt1) 
AmpVertexZFuToFuVZp(2,:,gt2)= AmpVertexZFuToFuVZp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZp(2,:,gt1) 
AmpWaveZFuToFuVZp(3,:,gt2) = AmpWaveZFuToFuVZp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZp(3,:,gt1) 
AmpVertexZFuToFuVZp(3,:,gt2)= AmpVertexZFuToFuVZp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZp(3,:,gt1) 
AmpWaveZFuToFuVZp(4,:,gt2) = AmpWaveZFuToFuVZp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZp(4,:,gt1) 
AmpVertexZFuToFuVZp(4,:,gt2)= AmpVertexZFuToFuVZp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuVZp=AmpWaveZFuToFuVZp 
AmpVertexFuToFuVZp= AmpVertexZFuToFuVZp
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuVZp = AmpVertexFuToFuVZp  +  AmpVertexIRosFuToFuVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuVZp = AmpTreeFuToFuVZp 
 AmpSum2FuToFuVZp = AmpTreeFuToFuVZp + 2._dp*AmpWaveFuToFuVZp + 2._dp*AmpVertexFuToFuVZp  
Else 
 AmpSumFuToFuVZp = AmpTreeFuToFuVZp + AmpWaveFuToFuVZp + AmpVertexFuToFuVZp
 AmpSum2FuToFuVZp = AmpTreeFuToFuVZp + AmpWaveFuToFuVZp + AmpVertexFuToFuVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVZp = AmpTreeFuToFuVZp
 AmpSum2FuToFuVZp = AmpTreeFuToFuVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFu(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFuVZp = AmpTreeFuToFuVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuVZp(gt1, gt2) 
  AmpSum2FuToFuVZp = 2._dp*AmpWaveFuToFuVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuVZp(gt1, gt2) 
  AmpSum2FuToFuVZp = 2._dp*AmpVertexFuToFuVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuVZp(gt1, gt2) 
  AmpSum2FuToFuVZp = AmpTreeFuToFuVZp + 2._dp*AmpWaveFuToFuVZp + 2._dp*AmpVertexFuToFuVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuVZp = AmpTreeFuToFuVZp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
  AmpSqTreeFuToFuVZp(gt1, gt2) = AmpSqFuToFuVZp(gt1, gt2)  
  AmpSum2FuToFuVZp = + 2._dp*AmpWaveFuToFuVZp + 2._dp*AmpVertexFuToFuVZp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZpOS,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
  AmpSqFuToFuVZp(gt1, gt2) = AmpSqFuToFuVZp(gt1, gt2) + AmpSqTreeFuToFuVZp(gt1, gt2)  
Else  
  AmpSum2FuToFuVZp = AmpTreeFuToFuVZp
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
  AmpSqTreeFuToFuVZp(gt1, gt2) = AmpSqFuToFuVZp(gt1, gt2)  
  AmpSum2FuToFuVZp = + 2._dp*AmpWaveFuToFuVZp + 2._dp*AmpVertexFuToFuVZp
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZp,AmpSumFuToFuVZp(:,gt1, gt2),AmpSum2FuToFuVZp(:,gt1, gt2),AmpSqFuToFuVZp(gt1, gt2)) 
  AmpSqFuToFuVZp(gt1, gt2) = AmpSqFuToFuVZp(gt1, gt2) + AmpSqTreeFuToFuVZp(gt1, gt2)  
End if  
Else  
  AmpSqFuToFuVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVZp(gt1, gt2).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MVZpOS,helfactor*AmpSqFuToFuVZp(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MVZp,helfactor*AmpSqFuToFuVZp(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZp(gt1, gt2) + MRGFuToFuVZp(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZp(gt1, gt2) + MRGFuToFuVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Fu VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_FuToFuVG(ZcplcFuFuVGL,ZcplcFuFuVGR,ctcplcFuFuVGL,           & 
& ctcplcFuFuVGR,MFuOS,MFu2OS,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)

 Else 
Call Amplitude_WAVE_U1T3R_FuToFuVG(cplcFuFuVGL,cplcFuFuVGR,ctcplcFuFuVGL,             & 
& ctcplcFuFuVGR,MFuOS,MFu2OS,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_FuToFuVG(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFdFdVGL,       & 
& ZcplcFdFdVGR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,       & 
& ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFuFuVZpL,        & 
& ZcplcFuFuVZpR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,               & 
& ZcplVGVGVG,AmpVertexFuToFuVG)

 Else 
Call Amplitude_VERTEX_U1T3R_FuToFuVG(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,          & 
& AmpVertexFuToFuVG)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFuVG(cplcFuFuVGL,cplcFuFuVGR,ctcplcFuFuVGL,             & 
& ctcplcFuFuVGR,MFu,MFu2,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFuVG(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,AmpVertexFuToFuVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVG = 0._dp 
 AmpSum2FuToFuVG = 0._dp  
Else 
 AmpSumFuToFuVG = AmpVertexFuToFuVG + AmpWaveFuToFuVG
 AmpSum2FuToFuVG = AmpVertexFuToFuVG + AmpWaveFuToFuVG 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFu(gt2))+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),0._dp,AmpSumFuToFuVG(:,gt1, gt2),AmpSum2FuToFuVG(:,gt1, gt2),AmpSqFuToFuVG(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVG,AmpSumFuToFuVG(:,gt1, gt2),AmpSum2FuToFuVG(:,gt1, gt2),AmpSqFuToFuVG(gt1, gt2)) 
End if  
Else  
  AmpSqFuToFuVG(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVG(gt1, gt2).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 4._dp/3._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),0._dp,helfactor*AmpSqFuToFuVG(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 4._dp/3._dp*GammaTPS(MFu(gt1),MFu(gt2),MVG,helfactor*AmpSqFuToFuVG(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVG(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVG(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Fu VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_FuToFuVP(ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,            & 
& ZcplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,    & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,MFuOS,MFu2OS,MVP,MVP2,ZfUL,ZfUR,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFuToFuVP)

 Else 
Call Amplitude_WAVE_U1T3R_FuToFuVP(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,       & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,MFuOS,MFu2OS,MVP,MVP2,ZfUL,ZfUR,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFuToFuVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_FuToFuVP(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplAhhhVP,ZcplcFuFdHpL,ZcplcFuFdHpR,         & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,       & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,         & 
& ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR, & 
& ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpcHpVP,ZcplHpcVWpVP,ZcplcHpVPVWp,ZcplcVWpVPVWp,            & 
& AmpVertexFuToFuVP)

 Else 
Call Amplitude_VERTEX_U1T3R_FuToFuVP(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplcFuFdHpL,cplcFuFdHpR,              & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFuToFuVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FuToFuVP(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,       & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,MFu,MFu2,MVP,MVP2,ZfUL,ZfUR,               & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFuToFuVP)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FuToFuVP(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplAhhhVP,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,               & 
& cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFuToFuVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVP = 0._dp 
 AmpSum2FuToFuVP = 0._dp  
Else 
 AmpSumFuToFuVP = AmpVertexFuToFuVP + AmpWaveFuToFuVP
 AmpSum2FuToFuVP = AmpVertexFuToFuVP + AmpWaveFuToFuVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFuOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFu(gt1)).gt.(Abs(MFu(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),0._dp,AmpSumFuToFuVP(:,gt1, gt2),AmpSum2FuToFuVP(:,gt1, gt2),AmpSqFuToFuVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVP,AmpSumFuToFuVP(:,gt1, gt2),AmpSum2FuToFuVP(:,gt1, gt2),AmpSqFuToFuVP(gt1, gt2)) 
End if  
Else  
  AmpSqFuToFuVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVP(gt1, gt2).eq.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),0._dp,helfactor*AmpSqFuToFuVP(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MVP,helfactor*AmpSqFuToFuVP(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Fu

End Module Wrapper_OneLoopDecay_Fu_U1T3R
