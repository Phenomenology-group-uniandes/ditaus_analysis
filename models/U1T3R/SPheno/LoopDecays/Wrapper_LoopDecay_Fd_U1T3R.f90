! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fd_U1T3R
Use Model_Data_U1T3R 
Use Kinematics 
Use OneLoopDecay_Fd_U1T3R 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fd(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,              & 
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
& cplHpcHpVZ,cplHpcHpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplVGVGVG,ctcplcFdFdAhL,   & 
& ctcplcFdFdAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,   & 
& ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZpL,ctcplcFdFdVZpR,ctcplcFdFdVZR,               & 
& ctcplcFdFucHpL,ctcplcFdFucHpR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,GcplcFdFucHpL,           & 
& GcplcFdFucHpR,GcplcHpVPVWp,GcplHpcVWpVP,GosZcplcFdFucHpL,GosZcplcFdFucHpR,             & 
& GosZcplcHpVPVWp,GosZcplHpcVWpVP,GZcplcFdFucHpL,GZcplcFdFucHpR,GZcplcHpVPVWp,           & 
& GZcplHpcVWpVP,ZcplAhhhVP,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,          & 
& ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZpL,        & 
& ZcplcFdFdVZpR,ZcplcFdFdVZR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,  & 
& ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFuFuVGL,ZcplcFuFuVGR,       & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplhhVPVZ,ZcplhhVPVZp,           & 
& ZcplHpcHpVP,ZcplHpcVWpVP,ZcplVGVGVG,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,               & 
& ZRUVe,ZRUUe,ZRUUV,MLambda,em,gs,deltaM,kont,gP1LFd)

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
& cplHpcVWpVZp,cplVGVGVG,ctcplcFdFdAhL(6,6,2),ctcplcFdFdAhR(6,6,2),ctcplcFdFdhhL(6,6,2), & 
& ctcplcFdFdhhR(6,6,2),ctcplcFdFdVGL(6,6),ctcplcFdFdVGR(6,6),ctcplcFdFdVPL(6,6),         & 
& ctcplcFdFdVPR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZpL(6,6),ctcplcFdFdVZpR(6,6),         & 
& ctcplcFdFdVZR(6,6),ctcplcFdFucHpL(6,6),ctcplcFdFucHpR(6,6),ctcplcFdFucVWpL(6,6),       & 
& ctcplcFdFucVWpR(6,6),GcplcFdFucHpL(6,6),GcplcFdFucHpR(6,6),GcplcHpVPVWp,               & 
& GcplHpcVWpVP,GosZcplcFdFucHpL(6,6),GosZcplcFdFucHpR(6,6),GosZcplcHpVPVWp,              & 
& GosZcplHpcVWpVP,GZcplcFdFucHpL(6,6),GZcplcFdFucHpR(6,6),GZcplcHpVPVWp,GZcplHpcVWpVP,   & 
& ZcplAhhhVP(2,2),ZcplcFdFdAhL(6,6,2),ZcplcFdFdAhR(6,6,2),ZcplcFdFdhhL(6,6,2),           & 
& ZcplcFdFdhhR(6,6,2),ZcplcFdFdVGL(6,6),ZcplcFdFdVGR(6,6),ZcplcFdFdVPL(6,6),             & 
& ZcplcFdFdVPR(6,6),ZcplcFdFdVZL(6,6),ZcplcFdFdVZpL(6,6),ZcplcFdFdVZpR(6,6),             & 
& ZcplcFdFdVZR(6,6),ZcplcFdFucHpL(6,6),ZcplcFdFucHpR(6,6),ZcplcFdFucVWpL(6,6),           & 
& ZcplcFdFucVWpR(6,6),ZcplcFuFdHpL(6,6),ZcplcFuFdHpR(6,6),ZcplcFuFdVWpL(6,6),            & 
& ZcplcFuFdVWpR(6,6),ZcplcFuFuVGL(6,6),ZcplcFuFuVGR(6,6),ZcplcFuFuVPL(6,6),              & 
& ZcplcFuFuVPR(6,6),ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplhhVPVZ(2),ZcplhhVPVZp(2),             & 
& ZcplHpcHpVP,ZcplHpcVWpVP,ZcplVGVGVG

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
Real(dp), Intent(out) :: gP1LFd(6,42) 
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
Real(dp) :: MRPFdToFdhh(6,6,2),MRGFdToFdhh(6,6,2), MRPZFdToFdhh(6,6,2),MRGZFdToFdhh(6,6,2) 
Real(dp) :: MVPFdToFdhh(6,6,2) 
Real(dp) :: RMsqTreeFdToFdhh(6,6,2),RMsqWaveFdToFdhh(6,6,2),RMsqVertexFdToFdhh(6,6,2) 
Complex(dp) :: AmpTreeFdToFdhh(2,6,6,2),AmpWaveFdToFdhh(2,6,6,2)=(0._dp,0._dp),AmpVertexFdToFdhh(2,6,6,2)& 
 & ,AmpVertexIRosFdToFdhh(2,6,6,2),AmpVertexIRdrFdToFdhh(2,6,6,2), AmpSumFdToFdhh(2,6,6,2), AmpSum2FdToFdhh(2,6,6,2) 
Complex(dp) :: AmpTreeZFdToFdhh(2,6,6,2),AmpWaveZFdToFdhh(2,6,6,2),AmpVertexZFdToFdhh(2,6,6,2) 
Real(dp) :: AmpSqFdToFdhh(6,6,2),  AmpSqTreeFdToFdhh(6,6,2) 
Real(dp) :: MRPFdToFdVZ(6,6),MRGFdToFdVZ(6,6), MRPZFdToFdVZ(6,6),MRGZFdToFdVZ(6,6) 
Real(dp) :: MVPFdToFdVZ(6,6) 
Real(dp) :: RMsqTreeFdToFdVZ(6,6),RMsqWaveFdToFdVZ(6,6),RMsqVertexFdToFdVZ(6,6) 
Complex(dp) :: AmpTreeFdToFdVZ(4,6,6),AmpWaveFdToFdVZ(4,6,6)=(0._dp,0._dp),AmpVertexFdToFdVZ(4,6,6)& 
 & ,AmpVertexIRosFdToFdVZ(4,6,6),AmpVertexIRdrFdToFdVZ(4,6,6), AmpSumFdToFdVZ(4,6,6), AmpSum2FdToFdVZ(4,6,6) 
Complex(dp) :: AmpTreeZFdToFdVZ(4,6,6),AmpWaveZFdToFdVZ(4,6,6),AmpVertexZFdToFdVZ(4,6,6) 
Real(dp) :: AmpSqFdToFdVZ(6,6),  AmpSqTreeFdToFdVZ(6,6) 
Real(dp) :: MRPFdToFdVZp(6,6),MRGFdToFdVZp(6,6), MRPZFdToFdVZp(6,6),MRGZFdToFdVZp(6,6) 
Real(dp) :: MVPFdToFdVZp(6,6) 
Real(dp) :: RMsqTreeFdToFdVZp(6,6),RMsqWaveFdToFdVZp(6,6),RMsqVertexFdToFdVZp(6,6) 
Complex(dp) :: AmpTreeFdToFdVZp(4,6,6),AmpWaveFdToFdVZp(4,6,6)=(0._dp,0._dp),AmpVertexFdToFdVZp(4,6,6)& 
 & ,AmpVertexIRosFdToFdVZp(4,6,6),AmpVertexIRdrFdToFdVZp(4,6,6), AmpSumFdToFdVZp(4,6,6), AmpSum2FdToFdVZp(4,6,6) 
Complex(dp) :: AmpTreeZFdToFdVZp(4,6,6),AmpWaveZFdToFdVZp(4,6,6),AmpVertexZFdToFdVZp(4,6,6) 
Real(dp) :: AmpSqFdToFdVZp(6,6),  AmpSqTreeFdToFdVZp(6,6) 
Real(dp) :: MRPFdToFucVWp(6,6),MRGFdToFucVWp(6,6), MRPZFdToFucVWp(6,6),MRGZFdToFucVWp(6,6) 
Real(dp) :: MVPFdToFucVWp(6,6) 
Real(dp) :: RMsqTreeFdToFucVWp(6,6),RMsqWaveFdToFucVWp(6,6),RMsqVertexFdToFucVWp(6,6) 
Complex(dp) :: AmpTreeFdToFucVWp(4,6,6),AmpWaveFdToFucVWp(4,6,6)=(0._dp,0._dp),AmpVertexFdToFucVWp(4,6,6)& 
 & ,AmpVertexIRosFdToFucVWp(4,6,6),AmpVertexIRdrFdToFucVWp(4,6,6), AmpSumFdToFucVWp(4,6,6), AmpSum2FdToFucVWp(4,6,6) 
Complex(dp) :: AmpTreeZFdToFucVWp(4,6,6),AmpWaveZFdToFucVWp(4,6,6),AmpVertexZFdToFucVWp(4,6,6) 
Real(dp) :: AmpSqFdToFucVWp(6,6),  AmpSqTreeFdToFucVWp(6,6) 
Real(dp) :: MRPFdToFdVG(6,6),MRGFdToFdVG(6,6), MRPZFdToFdVG(6,6),MRGZFdToFdVG(6,6) 
Real(dp) :: MVPFdToFdVG(6,6) 
Real(dp) :: RMsqTreeFdToFdVG(6,6),RMsqWaveFdToFdVG(6,6),RMsqVertexFdToFdVG(6,6) 
Complex(dp) :: AmpTreeFdToFdVG(4,6,6),AmpWaveFdToFdVG(4,6,6)=(0._dp,0._dp),AmpVertexFdToFdVG(4,6,6)& 
 & ,AmpVertexIRosFdToFdVG(4,6,6),AmpVertexIRdrFdToFdVG(4,6,6), AmpSumFdToFdVG(4,6,6), AmpSum2FdToFdVG(4,6,6) 
Complex(dp) :: AmpTreeZFdToFdVG(4,6,6),AmpWaveZFdToFdVG(4,6,6),AmpVertexZFdToFdVG(4,6,6) 
Real(dp) :: AmpSqFdToFdVG(6,6),  AmpSqTreeFdToFdVG(6,6) 
Real(dp) :: MRPFdToFdVP(6,6),MRGFdToFdVP(6,6), MRPZFdToFdVP(6,6),MRGZFdToFdVP(6,6) 
Real(dp) :: MVPFdToFdVP(6,6) 
Real(dp) :: RMsqTreeFdToFdVP(6,6),RMsqWaveFdToFdVP(6,6),RMsqVertexFdToFdVP(6,6) 
Complex(dp) :: AmpTreeFdToFdVP(4,6,6),AmpWaveFdToFdVP(4,6,6)=(0._dp,0._dp),AmpVertexFdToFdVP(4,6,6)& 
 & ,AmpVertexIRosFdToFdVP(4,6,6),AmpVertexIRdrFdToFdVP(4,6,6), AmpSumFdToFdVP(4,6,6), AmpSum2FdToFdVP(4,6,6) 
Complex(dp) :: AmpTreeZFdToFdVP(4,6,6),AmpWaveZFdToFdVP(4,6,6),AmpVertexZFdToFdVP(4,6,6) 
Real(dp) :: AmpSqFdToFdVP(6,6),  AmpSqTreeFdToFdVP(6,6) 
Write(*,*) "Calculating one-loop decays of Fd " 
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
! Fd hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,MFd2,              & 
& Mhh2,AmpTreeFdToFdhh)

  Else 
Call Amplitude_Tree_U1T3R_FdToFdhh(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,Mhh,MFd2,            & 
& Mhh2,AmpTreeFdToFdhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFdOS,           & 
& MhhOS,MRPFdToFdhh,MRGFdToFdhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FdToFdhh(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,               & 
& MFdOS,MhhOS,MRPFdToFdhh,MRGFdToFdhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFd,             & 
& Mhh,MRPFdToFdhh,MRGFdToFdhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FdToFdhh(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,               & 
& MFd,Mhh,MRPFdToFdhh,MRGFdToFdhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,             & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,AmpWaveFdToFdhh)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,        & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexFdToFdhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrFdToFdhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFdToFdhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHpL,      & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFdToFdhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFdToFdhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosFdToFdhh)

 End if 
 End if 
AmpVertexFdToFdhh = AmpVertexFdToFdhh -  AmpVertexIRdrFdToFdhh! +  AmpVertexIRosFdToFdhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdhh(1,gt2,:,:) = AmpWaveZFdToFdhh(1,gt2,:,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdhh(1,gt1,:,:) 
AmpVertexZFdToFdhh(1,gt2,:,:)= AmpVertexZFdToFdhh(1,gt2,:,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdhh(1,gt1,:,:) 
AmpWaveZFdToFdhh(2,gt2,:,:) = AmpWaveZFdToFdhh(2,gt2,:,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdhh(2,gt1,:,:) 
AmpVertexZFdToFdhh(2,gt2,:,:)= AmpVertexZFdToFdhh(2,gt2,:,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdhh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
! Final State 1 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdhh(1,:,gt2,:) = AmpWaveZFdToFdhh(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpWaveFdToFdhh(1,:,gt1,:) 
AmpVertexZFdToFdhh(1,:,gt2,:)= AmpVertexZFdToFdhh(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpVertexFdToFdhh(1,:,gt1,:) 
AmpWaveZFdToFdhh(2,:,gt2,:) = AmpWaveZFdToFdhh(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdhh(2,:,gt1,:) 
AmpVertexZFdToFdhh(2,:,gt2,:)= AmpVertexZFdToFdhh(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdhh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
! Final State 2 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFdToFdhh(:,:,:,gt2) = AmpWaveZFdToFdhh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpWaveFdToFdhh(:,:,:,gt1) 
AmpVertexZFdToFdhh(:,:,:,gt2)= AmpVertexZFdToFdhh(:,:,:,gt2)+ZRUZh(gt2,gt1)*AmpVertexFdToFdhh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdhh = AmpVertexFdToFdhh  +  AmpVertexIRosFdToFdhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdhh = AmpTreeFdToFdhh 
 AmpSum2FdToFdhh = AmpTreeFdToFdhh + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh  
Else 
 AmpSumFdToFdhh = AmpTreeFdToFdhh + AmpWaveFdToFdhh + AmpVertexFdToFdhh
 AmpSum2FdToFdhh = AmpTreeFdToFdhh + AmpWaveFdToFdhh + AmpVertexFdToFdhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdhh = AmpTreeFdToFdhh
 AmpSum2FdToFdhh = AmpTreeFdToFdhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFd(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = 2._dp*AmpWaveFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = 2._dp*AmpVertexFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqTreeFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3)  
  AmpSum2FdToFdhh = + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3) + AmpSqTreeFdToFdhh(gt1, gt2, gt3)  
Else  
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqTreeFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3)  
  AmpSum2FdToFdhh = + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3) + AmpSqTreeFdToFdhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFdToFdhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),helfactor*AmpSqFdToFdhh(gt1, gt2, gt3))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),Mhh(gt3),helfactor*AmpSqFdToFdhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdhh(gt1, gt2, gt3) + MRGFdToFdhh(gt1, gt2, gt3)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdhh(gt1, gt2, gt3) + MRGFdToFdhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fd VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FdToFdVZ(cplcFdFdVZL,cplcFdFdVZR,MFd,MVZ,MFd2,              & 
& MVZ2,AmpTreeFdToFdVZ)

  Else 
Call Amplitude_Tree_U1T3R_FdToFdVZ(ZcplcFdFdVZL,ZcplcFdFdVZR,MFd,MVZ,MFd2,            & 
& MVZ2,AmpTreeFdToFdVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,MFdOS,           & 
& MVZOS,MRPFdToFdVZ,MRGFdToFdVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZ(MLambda,em,gs,ZcplcFdFdVZL,ZcplcFdFdVZR,               & 
& MFdOS,MVZOS,MRPFdToFdVZ,MRGFdToFdVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,MFd,             & 
& MVZ,MRPFdToFdVZ,MRGFdToFdVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZ(MLambda,em,gs,ZcplcFdFdVZL,ZcplcFdFdVZR,               & 
& MFd,MVZ,MRPFdToFdVZ,MRGFdToFdVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFdVZ(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,MVZ,MVZ2,ZfDL,           & 
& ZfDR,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveFdToFdVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,     & 
& cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexFdToFdVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRdrFdToFdVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFdToFdVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFdFdVZL,            & 
& ZcplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,           & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFdToFdVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,            & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,        & 
& AmpVertexIRosFdToFdVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFdToFdVZ)

 End if 
 End if 
AmpVertexFdToFdVZ = AmpVertexFdToFdVZ -  AmpVertexIRdrFdToFdVZ! +  AmpVertexIRosFdToFdVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdVZ=0._dp 
AmpVertexZFdToFdVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdVZ(1,gt2,:) = AmpWaveZFdToFdVZ(1,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZ(1,gt1,:) 
AmpVertexZFdToFdVZ(1,gt2,:)= AmpVertexZFdToFdVZ(1,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZ(1,gt1,:) 
AmpWaveZFdToFdVZ(2,gt2,:) = AmpWaveZFdToFdVZ(2,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZ(2,gt1,:) 
AmpVertexZFdToFdVZ(2,gt2,:)= AmpVertexZFdToFdVZ(2,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZ(2,gt1,:) 
AmpWaveZFdToFdVZ(3,gt2,:) = AmpWaveZFdToFdVZ(3,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZ(3,gt1,:) 
AmpVertexZFdToFdVZ(3,gt2,:)= AmpVertexZFdToFdVZ(3,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZ(3,gt1,:) 
AmpWaveZFdToFdVZ(4,gt2,:) = AmpWaveZFdToFdVZ(4,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZ(4,gt1,:) 
AmpVertexZFdToFdVZ(4,gt2,:)= AmpVertexZFdToFdVZ(4,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdVZ=AmpWaveZFdToFdVZ 
AmpVertexFdToFdVZ= AmpVertexZFdToFdVZ
! Final State 1 
AmpWaveZFdToFdVZ=0._dp 
AmpVertexZFdToFdVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdVZ(1,:,gt2) = AmpWaveZFdToFdVZ(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZ(1,:,gt1) 
AmpVertexZFdToFdVZ(1,:,gt2)= AmpVertexZFdToFdVZ(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZ(1,:,gt1) 
AmpWaveZFdToFdVZ(2,:,gt2) = AmpWaveZFdToFdVZ(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZ(2,:,gt1) 
AmpVertexZFdToFdVZ(2,:,gt2)= AmpVertexZFdToFdVZ(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZ(2,:,gt1) 
AmpWaveZFdToFdVZ(3,:,gt2) = AmpWaveZFdToFdVZ(3,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZ(3,:,gt1) 
AmpVertexZFdToFdVZ(3,:,gt2)= AmpVertexZFdToFdVZ(3,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZ(3,:,gt1) 
AmpWaveZFdToFdVZ(4,:,gt2) = AmpWaveZFdToFdVZ(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZ(4,:,gt1) 
AmpVertexZFdToFdVZ(4,:,gt2)= AmpVertexZFdToFdVZ(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdVZ=AmpWaveZFdToFdVZ 
AmpVertexFdToFdVZ= AmpVertexZFdToFdVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdVZ = AmpVertexFdToFdVZ  +  AmpVertexIRosFdToFdVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ 
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ  
Else 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ + AmpWaveFdToFdVZ + AmpVertexFdToFdVZ
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + AmpWaveFdToFdVZ + AmpVertexFdToFdVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFd(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = 2._dp*AmpWaveFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = 2._dp*AmpVertexFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqTreeFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2)  
  AmpSum2FdToFdVZ = + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2) + AmpSqTreeFdToFdVZ(gt1, gt2)  
Else  
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqTreeFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2)  
  AmpSum2FdToFdVZ = + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2) + AmpSqTreeFdToFdVZ(gt1, gt2)  
End if  
Else  
  AmpSqFdToFdVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVZ(gt1, gt2).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MVZOS,helfactor*AmpSqFdToFdVZ(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MVZ,helfactor*AmpSqFdToFdVZ(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZ(gt1, gt2) + MRGFdToFdVZ(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZ(gt1, gt2) + MRGFdToFdVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fd VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FdToFdVZp(cplcFdFdVZpL,cplcFdFdVZpR,MFd,MVZp,               & 
& MFd2,MVZp2,AmpTreeFdToFdVZp)

  Else 
Call Amplitude_Tree_U1T3R_FdToFdVZp(ZcplcFdFdVZpL,ZcplcFdFdVZpR,MFd,MVZp,             & 
& MFd2,MVZp2,AmpTreeFdToFdVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZp(MLambda,em,gs,cplcFdFdVZpL,cplcFdFdVZpR,              & 
& MFdOS,MVZpOS,MRPFdToFdVZp,MRGFdToFdVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZp(MLambda,em,gs,ZcplcFdFdVZpL,ZcplcFdFdVZpR,            & 
& MFdOS,MVZpOS,MRPFdToFdVZp,MRGFdToFdVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FdToFdVZp(MLambda,em,gs,cplcFdFdVZpL,cplcFdFdVZpR,              & 
& MFd,MVZp,MRPFdToFdVZp,MRGFdToFdVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FdToFdVZp(MLambda,em,gs,ZcplcFdFdVZpL,ZcplcFdFdVZpR,            & 
& MFd,MVZp,MRPFdToFdVZp,MRGFdToFdVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFdVZp(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,MVZp,MVZp2,              & 
& ZfDL,ZfDR,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveFdToFdVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexFdToFdVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRdrFdToFdVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,         & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFdToFdVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,        & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFdToFdVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,AmpVertexIRosFdToFdVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,AmpVertexIRosFdToFdVZp)

 End if 
 End if 
AmpVertexFdToFdVZp = AmpVertexFdToFdVZp -  AmpVertexIRdrFdToFdVZp! +  AmpVertexIRosFdToFdVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdVZp=0._dp 
AmpVertexZFdToFdVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdVZp(1,gt2,:) = AmpWaveZFdToFdVZp(1,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZp(1,gt1,:) 
AmpVertexZFdToFdVZp(1,gt2,:)= AmpVertexZFdToFdVZp(1,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZp(1,gt1,:) 
AmpWaveZFdToFdVZp(2,gt2,:) = AmpWaveZFdToFdVZp(2,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZp(2,gt1,:) 
AmpVertexZFdToFdVZp(2,gt2,:)= AmpVertexZFdToFdVZp(2,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZp(2,gt1,:) 
AmpWaveZFdToFdVZp(3,gt2,:) = AmpWaveZFdToFdVZp(3,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZp(3,gt1,:) 
AmpVertexZFdToFdVZp(3,gt2,:)= AmpVertexZFdToFdVZp(3,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZp(3,gt1,:) 
AmpWaveZFdToFdVZp(4,gt2,:) = AmpWaveZFdToFdVZp(4,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZp(4,gt1,:) 
AmpVertexZFdToFdVZp(4,gt2,:)= AmpVertexZFdToFdVZp(4,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdVZp=AmpWaveZFdToFdVZp 
AmpVertexFdToFdVZp= AmpVertexZFdToFdVZp
! Final State 1 
AmpWaveZFdToFdVZp=0._dp 
AmpVertexZFdToFdVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFdVZp(1,:,gt2) = AmpWaveZFdToFdVZp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZp(1,:,gt1) 
AmpVertexZFdToFdVZp(1,:,gt2)= AmpVertexZFdToFdVZp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZp(1,:,gt1) 
AmpWaveZFdToFdVZp(2,:,gt2) = AmpWaveZFdToFdVZp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZp(2,:,gt1) 
AmpVertexZFdToFdVZp(2,:,gt2)= AmpVertexZFdToFdVZp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZp(2,:,gt1) 
AmpWaveZFdToFdVZp(3,:,gt2) = AmpWaveZFdToFdVZp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZp(3,:,gt1) 
AmpVertexZFdToFdVZp(3,:,gt2)= AmpVertexZFdToFdVZp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZp(3,:,gt1) 
AmpWaveZFdToFdVZp(4,:,gt2) = AmpWaveZFdToFdVZp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZp(4,:,gt1) 
AmpVertexZFdToFdVZp(4,:,gt2)= AmpVertexZFdToFdVZp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdVZp=AmpWaveZFdToFdVZp 
AmpVertexFdToFdVZp= AmpVertexZFdToFdVZp
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdVZp = AmpVertexFdToFdVZp  +  AmpVertexIRosFdToFdVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdVZp = AmpTreeFdToFdVZp 
 AmpSum2FdToFdVZp = AmpTreeFdToFdVZp + 2._dp*AmpWaveFdToFdVZp + 2._dp*AmpVertexFdToFdVZp  
Else 
 AmpSumFdToFdVZp = AmpTreeFdToFdVZp + AmpWaveFdToFdVZp + AmpVertexFdToFdVZp
 AmpSum2FdToFdVZp = AmpTreeFdToFdVZp + AmpWaveFdToFdVZp + AmpVertexFdToFdVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVZp = AmpTreeFdToFdVZp
 AmpSum2FdToFdVZp = AmpTreeFdToFdVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFd(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFdVZp = AmpTreeFdToFdVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdVZp(gt1, gt2) 
  AmpSum2FdToFdVZp = 2._dp*AmpWaveFdToFdVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdVZp(gt1, gt2) 
  AmpSum2FdToFdVZp = 2._dp*AmpVertexFdToFdVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdVZp(gt1, gt2) 
  AmpSum2FdToFdVZp = AmpTreeFdToFdVZp + 2._dp*AmpWaveFdToFdVZp + 2._dp*AmpVertexFdToFdVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdVZp = AmpTreeFdToFdVZp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
  AmpSqTreeFdToFdVZp(gt1, gt2) = AmpSqFdToFdVZp(gt1, gt2)  
  AmpSum2FdToFdVZp = + 2._dp*AmpWaveFdToFdVZp + 2._dp*AmpVertexFdToFdVZp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZpOS,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
  AmpSqFdToFdVZp(gt1, gt2) = AmpSqFdToFdVZp(gt1, gt2) + AmpSqTreeFdToFdVZp(gt1, gt2)  
Else  
  AmpSum2FdToFdVZp = AmpTreeFdToFdVZp
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
  AmpSqTreeFdToFdVZp(gt1, gt2) = AmpSqFdToFdVZp(gt1, gt2)  
  AmpSum2FdToFdVZp = + 2._dp*AmpWaveFdToFdVZp + 2._dp*AmpVertexFdToFdVZp
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZp,AmpSumFdToFdVZp(:,gt1, gt2),AmpSum2FdToFdVZp(:,gt1, gt2),AmpSqFdToFdVZp(gt1, gt2)) 
  AmpSqFdToFdVZp(gt1, gt2) = AmpSqFdToFdVZp(gt1, gt2) + AmpSqTreeFdToFdVZp(gt1, gt2)  
End if  
Else  
  AmpSqFdToFdVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVZp(gt1, gt2).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MVZpOS,helfactor*AmpSqFdToFdVZp(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MVZp,helfactor*AmpSqFdToFdVZp(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZp(gt1, gt2) + MRGFdToFdVZp(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZp(gt1, gt2) + MRGFdToFdVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fu Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_FdToFucVWp(cplcFdFucVWpL,cplcFdFucVWpR,MFd,MFu,             & 
& MVWp,MFd2,MFu2,MVWp2,AmpTreeFdToFucVWp)

  Else 
Call Amplitude_Tree_U1T3R_FdToFucVWp(ZcplcFdFucVWpL,ZcplcFdFucVWpR,MFd,               & 
& MFu,MVWp,MFd2,MFu2,MVWp2,AmpTreeFdToFucVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_FdToFucVWp(MLambda,em,gs,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& MFdOS,MFuOS,MVWpOS,MRPFdToFucVWp,MRGFdToFucVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_FdToFucVWp(MLambda,em,gs,ZcplcFdFucVWpL,ZcplcFdFucVWpR,         & 
& MFdOS,MFuOS,MVWpOS,MRPFdToFucVWp,MRGFdToFucVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_FdToFucVWp(MLambda,em,gs,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& MFd,MFu,MVWp,MRPFdToFucVWp,MRGFdToFucVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_FdToFucVWp(MLambda,em,gs,ZcplcFdFucVWpL,ZcplcFdFucVWpR,         & 
& MFd,MFu,MVWp,MRPFdToFucVWp,MRGFdToFucVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFucVWp(cplcFdFucVWpL,cplcFdFucVWpR,ctcplcFdFucVWpL,     & 
& ctcplcFdFucVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,ZfUR,ZfVWp,AmpWaveFdToFucVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,              & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,        & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& AmpVertexFdToFucVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,        & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& AmpVertexIRdrFdToFucVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,              & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,    & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,GosZcplcFdFucHpL,GosZcplcFdFucHpR,ZcplcFdFucVWpL,            & 
& ZcplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,GosZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,      & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexIRosFdToFucVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& GZcplcFdFucHpL,GZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,cplhhHpcVWp,               & 
& cplhhcVWpVWp,GZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,         & 
& cplcVWpVWpVZp,AmpVertexIRosFdToFucVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,              & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,    & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,GcplcFdFucHpL,GcplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,     & 
& cplhhHpcVWp,cplhhcVWpVWp,GcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,           & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,AmpVertexIRosFdToFucVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,        & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& AmpVertexIRosFdToFucVWp)

 End if 
 End if 
AmpVertexFdToFucVWp = AmpVertexFdToFucVWp -  AmpVertexIRdrFdToFucVWp! +  AmpVertexIRosFdToFucVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFucVWp=0._dp 
AmpVertexZFdToFucVWp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFucVWp(1,gt2,:) = AmpWaveZFdToFucVWp(1,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFucVWp(1,gt1,:) 
AmpVertexZFdToFucVWp(1,gt2,:)= AmpVertexZFdToFucVWp(1,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFucVWp(1,gt1,:) 
AmpWaveZFdToFucVWp(2,gt2,:) = AmpWaveZFdToFucVWp(2,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFucVWp(2,gt1,:) 
AmpVertexZFdToFucVWp(2,gt2,:)= AmpVertexZFdToFucVWp(2,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFucVWp(2,gt1,:) 
AmpWaveZFdToFucVWp(3,gt2,:) = AmpWaveZFdToFucVWp(3,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFucVWp(3,gt1,:) 
AmpVertexZFdToFucVWp(3,gt2,:)= AmpVertexZFdToFucVWp(3,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFucVWp(3,gt1,:) 
AmpWaveZFdToFucVWp(4,gt2,:) = AmpWaveZFdToFucVWp(4,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFucVWp(4,gt1,:) 
AmpVertexZFdToFucVWp(4,gt2,:)= AmpVertexZFdToFucVWp(4,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFucVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFucVWp=AmpWaveZFdToFucVWp 
AmpVertexFdToFucVWp= AmpVertexZFdToFucVWp
! Final State 1 
AmpWaveZFdToFucVWp=0._dp 
AmpVertexZFdToFucVWp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZFdToFucVWp(1,:,gt2) = AmpWaveZFdToFucVWp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFdToFucVWp(1,:,gt1) 
AmpVertexZFdToFucVWp(1,:,gt2)= AmpVertexZFdToFucVWp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFdToFucVWp(1,:,gt1) 
AmpWaveZFdToFucVWp(2,:,gt2) = AmpWaveZFdToFucVWp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFdToFucVWp(2,:,gt1) 
AmpVertexZFdToFucVWp(2,:,gt2)= AmpVertexZFdToFucVWp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFdToFucVWp(2,:,gt1) 
AmpWaveZFdToFucVWp(3,:,gt2) = AmpWaveZFdToFucVWp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFdToFucVWp(3,:,gt1) 
AmpVertexZFdToFucVWp(3,:,gt2)= AmpVertexZFdToFucVWp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFdToFucVWp(3,:,gt1) 
AmpWaveZFdToFucVWp(4,:,gt2) = AmpWaveZFdToFucVWp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFdToFucVWp(4,:,gt1) 
AmpVertexZFdToFucVWp(4,:,gt2)= AmpVertexZFdToFucVWp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFdToFucVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFucVWp=AmpWaveZFdToFucVWp 
AmpVertexFdToFucVWp= AmpVertexZFdToFucVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFucVWp = AmpVertexFdToFucVWp  +  AmpVertexIRosFdToFucVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fu conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFucVWp = AmpTreeFdToFucVWp 
 AmpSum2FdToFucVWp = AmpTreeFdToFucVWp + 2._dp*AmpWaveFdToFucVWp + 2._dp*AmpVertexFdToFucVWp  
Else 
 AmpSumFdToFucVWp = AmpTreeFdToFucVWp + AmpWaveFdToFucVWp + AmpVertexFdToFucVWp
 AmpSum2FdToFucVWp = AmpTreeFdToFucVWp + AmpWaveFdToFucVWp + AmpVertexFdToFucVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFucVWp = AmpTreeFdToFucVWp
 AmpSum2FdToFucVWp = AmpTreeFdToFucVWp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MVWpOS)))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFu(gt2))+Abs(MVWp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFucVWp = AmpTreeFdToFucVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFucVWp(gt1, gt2) 
  AmpSum2FdToFucVWp = 2._dp*AmpWaveFdToFucVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFucVWp(gt1, gt2) 
  AmpSum2FdToFucVWp = 2._dp*AmpVertexFdToFucVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFucVWp(gt1, gt2) 
  AmpSum2FdToFucVWp = AmpTreeFdToFucVWp + 2._dp*AmpWaveFdToFucVWp + 2._dp*AmpVertexFdToFucVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFucVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFucVWp = AmpTreeFdToFucVWp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
  AmpSqTreeFdToFucVWp(gt1, gt2) = AmpSqFdToFucVWp(gt1, gt2)  
  AmpSum2FdToFucVWp = + 2._dp*AmpWaveFdToFucVWp + 2._dp*AmpVertexFdToFucVWp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
  AmpSqFdToFucVWp(gt1, gt2) = AmpSqFdToFucVWp(gt1, gt2) + AmpSqTreeFdToFucVWp(gt1, gt2)  
Else  
  AmpSum2FdToFucVWp = AmpTreeFdToFucVWp
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
  AmpSqTreeFdToFucVWp(gt1, gt2) = AmpSqFdToFucVWp(gt1, gt2)  
  AmpSum2FdToFucVWp = + 2._dp*AmpWaveFdToFucVWp + 2._dp*AmpVertexFdToFucVWp
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFucVWp(:,gt1, gt2),AmpSum2FdToFucVWp(:,gt1, gt2),AmpSqFdToFucVWp(gt1, gt2)) 
  AmpSqFdToFucVWp(gt1, gt2) = AmpSqFdToFucVWp(gt1, gt2) + AmpSqTreeFdToFucVWp(gt1, gt2)  
End if  
Else  
  AmpSqFdToFucVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFucVWp(gt1, gt2).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFuOS(gt2),MVWpOS,helfactor*AmpSqFdToFucVWp(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFu(gt2),MVWp,helfactor*AmpSqFdToFucVWp(gt1, gt2))
End if 
If ((Abs(MRPFdToFucVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFucVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFucVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFucVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFucVWp(gt1, gt2) + MRGFdToFucVWp(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFucVWp(gt1, gt2) + MRGFdToFucVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Fd VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_FdToFdVG(ZcplcFdFdVGL,ZcplcFdFdVGR,ctcplcFdFdVGL,           & 
& ctcplcFdFdVGR,MFdOS,MFd2OS,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)

 Else 
Call Amplitude_WAVE_U1T3R_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,ctcplcFdFdVGL,             & 
& ctcplcFdFdVGR,MFdOS,MFd2OS,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_FdToFdVG(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHpL,       & 
& ZcplcFuFdHpR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdVWpL,        & 
& ZcplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,ZcplcFuFuVGL,      & 
& ZcplcFuFuVGR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplVGVGVG,     & 
& AmpVertexFdToFdVG)

 Else 
Call Amplitude_VERTEX_U1T3R_FdToFdVG(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,            & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,           & 
& AmpVertexFdToFdVG)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,ctcplcFdFdVGL,             & 
& ctcplcFdFdVGR,MFd,MFd2,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFdVG(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,AmpVertexFdToFdVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVG = 0._dp 
 AmpSum2FdToFdVG = 0._dp  
Else 
 AmpSumFdToFdVG = AmpVertexFdToFdVG + AmpWaveFdToFdVG
 AmpSum2FdToFdVG = AmpVertexFdToFdVG + AmpWaveFdToFdVG 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFd(gt2))+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),0._dp,AmpSumFdToFdVG(:,gt1, gt2),AmpSum2FdToFdVG(:,gt1, gt2),AmpSqFdToFdVG(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVG,AmpSumFdToFdVG(:,gt1, gt2),AmpSum2FdToFdVG(:,gt1, gt2),AmpSqFdToFdVG(gt1, gt2)) 
End if  
Else  
  AmpSqFdToFdVG(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVG(gt1, gt2).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 4._dp/3._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),0._dp,helfactor*AmpSqFdToFdVG(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 4._dp/3._dp*GammaTPS(MFd(gt1),MFd(gt2),MVG,helfactor*AmpSqFdToFdVG(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVG(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVG(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Fd VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_FdToFdVP(ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,            & 
& ZcplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,    & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFdOS,MFd2OS,MVP,MVP2,ZfDL,ZfDR,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFdToFdVP)

 Else 
Call Amplitude_WAVE_U1T3R_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFdOS,MFd2OS,MVP,MVP2,ZfDL,ZfDR,           & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFdToFdVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_FdToFdVP(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplAhhhVP,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& ZcplcFuFdHpL,ZcplcFuFdHpR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,         & 
& ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,     & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,   & 
& ZcplhhVPVZ,ZcplhhVPVZp,ZcplHpcHpVP,ZcplHpcVWpVP,ZcplcHpVPVWp,ZcplcVWpVPVWp,            & 
& AmpVertexFdToFdVP)

 Else 
Call Amplitude_VERTEX_U1T3R_FdToFdVP(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,MVG,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,MVWp2OS,          & 
& MVZ2OS,MVZp2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFdToFdVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,ZfDL,ZfDR,               & 
& ZfVP,ZfVZpVP,ZfVZVP,AmpWaveFdToFdVP)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_FdToFdVP(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplAhhhVP,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,               & 
& cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFdToFdVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVP = 0._dp 
 AmpSum2FdToFdVP = 0._dp  
Else 
 AmpSumFdToFdVP = AmpVertexFdToFdVP + AmpWaveFdToFdVP
 AmpSum2FdToFdVP = AmpVertexFdToFdVP + AmpWaveFdToFdVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MFdOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFd(gt1)).gt.(Abs(MFd(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),0._dp,AmpSumFdToFdVP(:,gt1, gt2),AmpSum2FdToFdVP(:,gt1, gt2),AmpSqFdToFdVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVP,AmpSumFdToFdVP(:,gt1, gt2),AmpSum2FdToFdVP(:,gt1, gt2),AmpSqFdToFdVP(gt1, gt2)) 
End if  
Else  
  AmpSqFdToFdVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVP(gt1, gt2).eq.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),0._dp,helfactor*AmpSqFdToFdVP(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MVP,helfactor*AmpSqFdToFdVP(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Fd

End Module Wrapper_OneLoopDecay_Fd_U1T3R
