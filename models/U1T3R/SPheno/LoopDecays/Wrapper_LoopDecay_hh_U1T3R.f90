! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:53 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_U1T3R
Use Model_Data_U1T3R 
Use Kinematics 
Use OneLoopDecay_hh_U1T3R 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,              & 
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
& ZfVZpVZ,cplAhAhAhAh1,cplAhAhcVWpVWp1,cplAhAhhh,cplAhAhhhhh1,cplAhAhHpcHp1,             & 
& cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhAhVZpVZp1,cplAhAhVZVZ1,cplAhAhVZVZp1,     & 
& cplAhcHpVPVWp1,cplAhcHpVWp,cplAhcHpVWpVZ1,cplAhcHpVWpVZp1,cplAhhhVP,cplAhhhVZ,         & 
& cplAhhhVZp,cplAhHpcVWp,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhHpcVWpVZp1,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,         & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgAgWCVWp,cplcgAgWpcVWp,cplcgWCgAcVWp,        & 
& cplcgWCgWCAh,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWCgZcHp,        & 
& cplcgWCgZcVWp,cplcgWCgZpcHp,cplcgWCgZpcVWp,cplcgWpgAHp,cplcgWpgAVWp,cplcgWpgWpAh,      & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWpgZHp,cplcgWpgZpHp,         & 
& cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgAhh,cplcgZgWCHp,cplcgZgWCVWp,cplcgZgWpcHp,           & 
& cplcgZgWpcVWp,cplcgZgZhh,cplcgZgZphh,cplcgZpgAhh,cplcgZpgWCHp,cplcgZpgWCVWp,           & 
& cplcgZpgWpcHp,cplcgZpgWpcVWp,cplcgZpgZhh,cplcgZpgZphh,cplcHpVPVWp,cplcHpVWpVZ,         & 
& cplcHpVWpVZp,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,              & 
& cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,      & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZp1Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp3Q,& 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1Q,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,   & 
& cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZVZp2Q,& 
& cplcVWpVWpVZVZp3Q,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvAhL,            & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplFvFvVZR,cplhhcHpVPVWp1,cplhhcHpVWp,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,      & 
& cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVP1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZpVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcHp,       & 
& cplhhHpcVWp,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpcVWpVWp1,cplHpcHpVP,cplHpcHpVPVP1,            & 
& cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZpVZp1,cplHpcHpVZVZ1,     & 
& cplHpcHpVZVZp1,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplHpHpcHpcHp1,ctcplAhAhhh,        & 
& ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFeFehhL,        & 
& ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplhhcVWpVWp,    & 
& ctcplhhhhhh,ctcplhhHpcHp,ctcplhhHpcVWp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZpVZp,         & 
& ctcplhhVZVZ,ctcplhhVZVZp,GcplcHpVPVWp,GcplhhcHpVWp,GcplhhHpcHp,GcplHpcVWpVP,           & 
& GosZcplcHpVPVWp,GosZcplhhcHpVWp,GosZcplhhHpcHp,GosZcplHpcVWpVP,GZcplcHpVPVWp,          & 
& GZcplhhcHpVWp,GZcplhhHpcHp,GZcplHpcVWpVP,ZcplAhAhhh,ZcplAhhhVZ,ZcplAhhhVZp,            & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& ZcplFvFvhhL,ZcplFvFvhhR,ZcplhhcVWpVWp,Zcplhhhhhh,ZcplhhHpcHp,ZcplhhHpcVWp,             & 
& ZcplhhVZpVZp,ZcplhhVZVZ,ZcplhhVZVZp,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,               & 
& ZRUVe,ZRUUe,ZRUUV,MLambda,em,gs,deltaM,kont,gP1Lhh)

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

Complex(dp),Intent(in) :: cplAhAhAhAh1(2,2,2,2),cplAhAhcVWpVWp1(2,2),cplAhAhhh(2,2,2),cplAhAhhhhh1(2,2,2,2),    & 
& cplAhAhHpcHp1(2,2),cplAhAhVPVP1(2,2),cplAhAhVPVZ1(2,2),cplAhAhVPVZp1(2,2),             & 
& cplAhAhVZpVZp1(2,2),cplAhAhVZVZ1(2,2),cplAhAhVZVZp1(2,2),cplAhcHpVPVWp1(2),            & 
& cplAhcHpVWp(2),cplAhcHpVWpVZ1(2),cplAhcHpVWpVZp1(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),     & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhHpcVWpVP1(2),cplAhHpcVWpVZ1(2),cplAhHpcVWpVZp1(2), & 
& cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),           & 
& cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),  & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),& 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),           & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcHpL(6,9),& 
& cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplcFuFdHpL(6,6),              & 
& cplcFuFdHpR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuAhL(6,6,2),               & 
& cplcFuFuAhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),             & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6), & 
& cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),cplcgAgWCVWp,cplcgAgWpcVWp,cplcgWCgAcVWp,           & 
& cplcgWCgWCAh(2),cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgWCVZp,               & 
& cplcgWCgZcHp,cplcgWCgZcVWp,cplcgWCgZpcHp,cplcgWCgZpcVWp,cplcgWpgAHp,cplcgWpgAVWp,      & 
& cplcgWpgWpAh(2),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,               & 
& cplcgWpgZHp,cplcgWpgZpHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgAhh(2),cplcgZgWCHp,         & 
& cplcgZgWCVWp,cplcgZgWpcHp,cplcgZgWpcVWp,cplcgZgZhh(2),cplcgZgZphh(2),cplcgZpgAhh(2),   & 
& cplcgZpgWCHp,cplcgZpgWCVWp,cplcgZpgWpcHp,cplcgZpgWpcVWp,cplcgZpgZhh(2),cplcgZpgZphh(2),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,          & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,   & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZp1Q,cplcVWpVPVWpVZp2Q,& 
& cplcVWpVPVWpVZp3Q,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1Q,cplcVWpVWpVZpVZp2Q,    & 
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZp1Q,& 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp3Q,cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),  & 
& cplFvFeVWpR(9,6),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),     & 
& cplFvFvVZR(9,9),cplhhcHpVPVWp1(2),cplhhcHpVWp(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2), & 
& cplhhcVWpVWp(2),cplhhhhcVWpVWp1(2,2),cplhhhhhh(2,2,2),cplhhhhhhhh1(2,2,2,2),           & 
& cplhhhhHpcHp1(2,2),cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),             & 
& cplhhhhVZpVZp1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcHp(2),cplhhHpcVWp(2), & 
& cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplhhVPVZ(2),cplhhVPVZp(2),     & 
& cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpcVWpVWp1,cplHpcHpVP,cplHpcHpVPVP1,   & 
& cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZpVZp1,cplHpcHpVZVZ1

Complex(dp),Intent(in) :: cplHpcHpVZVZp1,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplHpHpcHpcHp1,ctcplAhAhhh(2,2,2), & 
& ctcplAhhhVP(2,2),ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2),ctcplcFdFdhhL(6,6,2),              & 
& ctcplcFdFdhhR(6,6,2),ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2),ctcplcFuFuhhL(6,6,2),   & 
& ctcplcFuFuhhR(6,6,2),ctcplFvFvhhL(9,9,2),ctcplFvFvhhR(9,9,2),ctcplhhcVWpVWp(2),        & 
& ctcplhhhhhh(2,2,2),ctcplhhHpcHp(2),ctcplhhHpcVWp(2),ctcplhhVPVZ(2),ctcplhhVPVZp(2),    & 
& ctcplhhVZpVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),GcplcHpVPVWp,GcplhhcHpVWp(2),          & 
& GcplhhHpcHp(2),GcplHpcVWpVP,GosZcplcHpVPVWp,GosZcplhhcHpVWp(2),GosZcplhhHpcHp(2),      & 
& GosZcplHpcVWpVP,GZcplcHpVPVWp,GZcplhhcHpVWp(2),GZcplhhHpcHp(2),GZcplHpcVWpVP,          & 
& ZcplAhAhhh(2,2,2),ZcplAhhhVZ(2,2),ZcplAhhhVZp(2,2),ZcplcFdFdhhL(6,6,2),ZcplcFdFdhhR(6,6,2),& 
& ZcplcFeFehhL(6,6,2),ZcplcFeFehhR(6,6,2),ZcplcFuFuhhL(6,6,2),ZcplcFuFuhhR(6,6,2),       & 
& ZcplFvFvhhL(9,9,2),ZcplFvFvhhR(9,9,2),ZcplhhcVWpVWp(2),Zcplhhhhhh(2,2,2),              & 
& ZcplhhHpcHp(2),ZcplhhHpcVWp(2),ZcplhhVZpVZp(2),ZcplhhVZVZ(2),ZcplhhVZVZp(2)

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
Real(dp), Intent(out) :: gP1Lhh(2,174) 
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
Real(dp) :: MRPhhTocFdFd(2,6,6),MRGhhTocFdFd(2,6,6), MRPZhhTocFdFd(2,6,6),MRGZhhTocFdFd(2,6,6) 
Real(dp) :: MVPhhTocFdFd(2,6,6) 
Real(dp) :: RMsqTreehhTocFdFd(2,6,6),RMsqWavehhTocFdFd(2,6,6),RMsqVertexhhTocFdFd(2,6,6) 
Complex(dp) :: AmpTreehhTocFdFd(2,2,6,6),AmpWavehhTocFdFd(2,2,6,6)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,2,6,6)& 
 & ,AmpVertexIRoshhTocFdFd(2,2,6,6),AmpVertexIRdrhhTocFdFd(2,2,6,6), AmpSumhhTocFdFd(2,2,6,6), AmpSum2hhTocFdFd(2,2,6,6) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,2,6,6),AmpWaveZhhTocFdFd(2,2,6,6),AmpVertexZhhTocFdFd(2,2,6,6) 
Real(dp) :: AmpSqhhTocFdFd(2,6,6),  AmpSqTreehhTocFdFd(2,6,6) 
Real(dp) :: MRPhhTocFeFe(2,6,6),MRGhhTocFeFe(2,6,6), MRPZhhTocFeFe(2,6,6),MRGZhhTocFeFe(2,6,6) 
Real(dp) :: MVPhhTocFeFe(2,6,6) 
Real(dp) :: RMsqTreehhTocFeFe(2,6,6),RMsqWavehhTocFeFe(2,6,6),RMsqVertexhhTocFeFe(2,6,6) 
Complex(dp) :: AmpTreehhTocFeFe(2,2,6,6),AmpWavehhTocFeFe(2,2,6,6)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,2,6,6)& 
 & ,AmpVertexIRoshhTocFeFe(2,2,6,6),AmpVertexIRdrhhTocFeFe(2,2,6,6), AmpSumhhTocFeFe(2,2,6,6), AmpSum2hhTocFeFe(2,2,6,6) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,2,6,6),AmpWaveZhhTocFeFe(2,2,6,6),AmpVertexZhhTocFeFe(2,2,6,6) 
Real(dp) :: AmpSqhhTocFeFe(2,6,6),  AmpSqTreehhTocFeFe(2,6,6) 
Real(dp) :: MRPhhTocFuFu(2,6,6),MRGhhTocFuFu(2,6,6), MRPZhhTocFuFu(2,6,6),MRGZhhTocFuFu(2,6,6) 
Real(dp) :: MVPhhTocFuFu(2,6,6) 
Real(dp) :: RMsqTreehhTocFuFu(2,6,6),RMsqWavehhTocFuFu(2,6,6),RMsqVertexhhTocFuFu(2,6,6) 
Complex(dp) :: AmpTreehhTocFuFu(2,2,6,6),AmpWavehhTocFuFu(2,2,6,6)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,2,6,6)& 
 & ,AmpVertexIRoshhTocFuFu(2,2,6,6),AmpVertexIRdrhhTocFuFu(2,2,6,6), AmpSumhhTocFuFu(2,2,6,6), AmpSum2hhTocFuFu(2,2,6,6) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,2,6,6),AmpWaveZhhTocFuFu(2,2,6,6),AmpVertexZhhTocFuFu(2,2,6,6) 
Real(dp) :: AmpSqhhTocFuFu(2,6,6),  AmpSqTreehhTocFuFu(2,6,6) 
Real(dp) :: MRPhhToFvFv(2,9,9),MRGhhToFvFv(2,9,9), MRPZhhToFvFv(2,9,9),MRGZhhToFvFv(2,9,9) 
Real(dp) :: MVPhhToFvFv(2,9,9) 
Real(dp) :: RMsqTreehhToFvFv(2,9,9),RMsqWavehhToFvFv(2,9,9),RMsqVertexhhToFvFv(2,9,9) 
Complex(dp) :: AmpTreehhToFvFv(2,2,9,9),AmpWavehhToFvFv(2,2,9,9)=(0._dp,0._dp),AmpVertexhhToFvFv(2,2,9,9)& 
 & ,AmpVertexIRoshhToFvFv(2,2,9,9),AmpVertexIRdrhhToFvFv(2,2,9,9), AmpSumhhToFvFv(2,2,9,9), AmpSum2hhToFvFv(2,2,9,9) 
Complex(dp) :: AmpTreeZhhToFvFv(2,2,9,9),AmpWaveZhhToFvFv(2,2,9,9),AmpVertexZhhToFvFv(2,2,9,9) 
Real(dp) :: AmpSqhhToFvFv(2,9,9),  AmpSqTreehhToFvFv(2,9,9) 
Real(dp) :: MRPhhTohhhh(2,2,2),MRGhhTohhhh(2,2,2), MRPZhhTohhhh(2,2,2),MRGZhhTohhhh(2,2,2) 
Real(dp) :: MVPhhTohhhh(2,2,2) 
Real(dp) :: RMsqTreehhTohhhh(2,2,2),RMsqWavehhTohhhh(2,2,2),RMsqVertexhhTohhhh(2,2,2) 
Complex(dp) :: AmpTreehhTohhhh(2,2,2),AmpWavehhTohhhh(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhhh(2,2,2)& 
 & ,AmpVertexIRoshhTohhhh(2,2,2),AmpVertexIRdrhhTohhhh(2,2,2), AmpSumhhTohhhh(2,2,2), AmpSum2hhTohhhh(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhhh(2,2,2),AmpWaveZhhTohhhh(2,2,2),AmpVertexZhhTohhhh(2,2,2) 
Real(dp) :: AmpSqhhTohhhh(2,2,2),  AmpSqTreehhTohhhh(2,2,2) 
Real(dp) :: MRPhhTocVWpVWp(2),MRGhhTocVWpVWp(2), MRPZhhTocVWpVWp(2),MRGZhhTocVWpVWp(2) 
Real(dp) :: MVPhhTocVWpVWp(2) 
Real(dp) :: RMsqTreehhTocVWpVWp(2),RMsqWavehhTocVWpVWp(2),RMsqVertexhhTocVWpVWp(2) 
Complex(dp) :: AmpTreehhTocVWpVWp(2,2),AmpWavehhTocVWpVWp(2,2)=(0._dp,0._dp),AmpVertexhhTocVWpVWp(2,2)& 
 & ,AmpVertexIRoshhTocVWpVWp(2,2),AmpVertexIRdrhhTocVWpVWp(2,2), AmpSumhhTocVWpVWp(2,2), AmpSum2hhTocVWpVWp(2,2) 
Complex(dp) :: AmpTreeZhhTocVWpVWp(2,2),AmpWaveZhhTocVWpVWp(2,2),AmpVertexZhhTocVWpVWp(2,2) 
Real(dp) :: AmpSqhhTocVWpVWp(2),  AmpSqTreehhTocVWpVWp(2) 
Real(dp) :: MRPhhToVZVZ(2),MRGhhToVZVZ(2), MRPZhhToVZVZ(2),MRGZhhToVZVZ(2) 
Real(dp) :: MVPhhToVZVZ(2) 
Real(dp) :: RMsqTreehhToVZVZ(2),RMsqWavehhToVZVZ(2),RMsqVertexhhToVZVZ(2) 
Complex(dp) :: AmpTreehhToVZVZ(2,2),AmpWavehhToVZVZ(2,2)=(0._dp,0._dp),AmpVertexhhToVZVZ(2,2)& 
 & ,AmpVertexIRoshhToVZVZ(2,2),AmpVertexIRdrhhToVZVZ(2,2), AmpSumhhToVZVZ(2,2), AmpSum2hhToVZVZ(2,2) 
Complex(dp) :: AmpTreeZhhToVZVZ(2,2),AmpWaveZhhToVZVZ(2,2),AmpVertexZhhToVZVZ(2,2) 
Real(dp) :: AmpSqhhToVZVZ(2),  AmpSqTreehhToVZVZ(2) 
Real(dp) :: MRPhhToVZpVZ(2),MRGhhToVZpVZ(2), MRPZhhToVZpVZ(2),MRGZhhToVZpVZ(2) 
Real(dp) :: MVPhhToVZpVZ(2) 
Real(dp) :: RMsqTreehhToVZpVZ(2),RMsqWavehhToVZpVZ(2),RMsqVertexhhToVZpVZ(2) 
Complex(dp) :: AmpTreehhToVZpVZ(2,2),AmpWavehhToVZpVZ(2,2)=(0._dp,0._dp),AmpVertexhhToVZpVZ(2,2)& 
 & ,AmpVertexIRoshhToVZpVZ(2,2),AmpVertexIRdrhhToVZpVZ(2,2), AmpSumhhToVZpVZ(2,2), AmpSum2hhToVZpVZ(2,2) 
Complex(dp) :: AmpTreeZhhToVZpVZ(2,2),AmpWaveZhhToVZpVZ(2,2),AmpVertexZhhToVZpVZ(2,2) 
Real(dp) :: AmpSqhhToVZpVZ(2),  AmpSqTreehhToVZpVZ(2) 
Real(dp) :: MRPhhToVZpVZp(2),MRGhhToVZpVZp(2), MRPZhhToVZpVZp(2),MRGZhhToVZpVZp(2) 
Real(dp) :: MVPhhToVZpVZp(2) 
Real(dp) :: RMsqTreehhToVZpVZp(2),RMsqWavehhToVZpVZp(2),RMsqVertexhhToVZpVZp(2) 
Complex(dp) :: AmpTreehhToVZpVZp(2,2),AmpWavehhToVZpVZp(2,2)=(0._dp,0._dp),AmpVertexhhToVZpVZp(2,2)& 
 & ,AmpVertexIRoshhToVZpVZp(2,2),AmpVertexIRdrhhToVZpVZp(2,2), AmpSumhhToVZpVZp(2,2), AmpSum2hhToVZpVZp(2,2) 
Complex(dp) :: AmpTreeZhhToVZpVZp(2,2),AmpWaveZhhToVZpVZp(2,2),AmpVertexZhhToVZpVZp(2,2) 
Real(dp) :: AmpSqhhToVZpVZp(2),  AmpSqTreehhToVZpVZp(2) 
Real(dp) :: MRPhhTohhVP(2,2),MRGhhTohhVP(2,2), MRPZhhTohhVP(2,2),MRGZhhTohhVP(2,2) 
Real(dp) :: MVPhhTohhVP(2,2) 
Real(dp) :: RMsqTreehhTohhVP(2,2),RMsqWavehhTohhVP(2,2),RMsqVertexhhTohhVP(2,2) 
Complex(dp) :: AmpTreehhTohhVP(2,2,2),AmpWavehhTohhVP(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhVP(2,2,2)& 
 & ,AmpVertexIRoshhTohhVP(2,2,2),AmpVertexIRdrhhTohhVP(2,2,2), AmpSumhhTohhVP(2,2,2), AmpSum2hhTohhVP(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhVP(2,2,2),AmpWaveZhhTohhVP(2,2,2),AmpVertexZhhTohhVP(2,2,2) 
Real(dp) :: AmpSqhhTohhVP(2,2),  AmpSqTreehhTohhVP(2,2) 
Real(dp) :: MRPhhTohhVZ(2,2),MRGhhTohhVZ(2,2), MRPZhhTohhVZ(2,2),MRGZhhTohhVZ(2,2) 
Real(dp) :: MVPhhTohhVZ(2,2) 
Real(dp) :: RMsqTreehhTohhVZ(2,2),RMsqWavehhTohhVZ(2,2),RMsqVertexhhTohhVZ(2,2) 
Complex(dp) :: AmpTreehhTohhVZ(2,2,2),AmpWavehhTohhVZ(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhVZ(2,2,2)& 
 & ,AmpVertexIRoshhTohhVZ(2,2,2),AmpVertexIRdrhhTohhVZ(2,2,2), AmpSumhhTohhVZ(2,2,2), AmpSum2hhTohhVZ(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhVZ(2,2,2),AmpWaveZhhTohhVZ(2,2,2),AmpVertexZhhTohhVZ(2,2,2) 
Real(dp) :: AmpSqhhTohhVZ(2,2),  AmpSqTreehhTohhVZ(2,2) 
Real(dp) :: MRPhhTohhVZp(2,2),MRGhhTohhVZp(2,2), MRPZhhTohhVZp(2,2),MRGZhhTohhVZp(2,2) 
Real(dp) :: MVPhhTohhVZp(2,2) 
Real(dp) :: RMsqTreehhTohhVZp(2,2),RMsqWavehhTohhVZp(2,2),RMsqVertexhhTohhVZp(2,2) 
Complex(dp) :: AmpTreehhTohhVZp(2,2,2),AmpWavehhTohhVZp(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhVZp(2,2,2)& 
 & ,AmpVertexIRoshhTohhVZp(2,2,2),AmpVertexIRdrhhTohhVZp(2,2,2), AmpSumhhTohhVZp(2,2,2), AmpSum2hhTohhVZp(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhVZp(2,2,2),AmpWaveZhhTohhVZp(2,2,2),AmpVertexZhhTohhVZp(2,2,2) 
Real(dp) :: AmpSqhhTohhVZp(2,2),  AmpSqTreehhTohhVZp(2,2) 
Real(dp) :: MRPhhToVGVG(2),MRGhhToVGVG(2), MRPZhhToVGVG(2),MRGZhhToVGVG(2) 
Real(dp) :: MVPhhToVGVG(2) 
Real(dp) :: RMsqTreehhToVGVG(2),RMsqWavehhToVGVG(2),RMsqVertexhhToVGVG(2) 
Complex(dp) :: AmpTreehhToVGVG(2,2),AmpWavehhToVGVG(2,2)=(0._dp,0._dp),AmpVertexhhToVGVG(2,2)& 
 & ,AmpVertexIRoshhToVGVG(2,2),AmpVertexIRdrhhToVGVG(2,2), AmpSumhhToVGVG(2,2), AmpSum2hhToVGVG(2,2) 
Complex(dp) :: AmpTreeZhhToVGVG(2,2),AmpWaveZhhToVGVG(2,2),AmpVertexZhhToVGVG(2,2) 
Real(dp) :: AmpSqhhToVGVG(2),  AmpSqTreehhToVGVG(2) 
Real(dp) :: MRPhhToVPVP(2),MRGhhToVPVP(2), MRPZhhToVPVP(2),MRGZhhToVPVP(2) 
Real(dp) :: MVPhhToVPVP(2) 
Real(dp) :: RMsqTreehhToVPVP(2),RMsqWavehhToVPVP(2),RMsqVertexhhToVPVP(2) 
Complex(dp) :: AmpTreehhToVPVP(2,2),AmpWavehhToVPVP(2,2)=(0._dp,0._dp),AmpVertexhhToVPVP(2,2)& 
 & ,AmpVertexIRoshhToVPVP(2,2),AmpVertexIRdrhhToVPVP(2,2), AmpSumhhToVPVP(2,2), AmpSum2hhToVPVP(2,2) 
Complex(dp) :: AmpTreeZhhToVPVP(2,2),AmpWaveZhhToVPVP(2,2),AmpVertexZhhToVPVP(2,2) 
Real(dp) :: AmpSqhhToVPVP(2),  AmpSqTreehhToVPVP(2) 
Real(dp) :: MRPhhToVPVZ(2),MRGhhToVPVZ(2), MRPZhhToVPVZ(2),MRGZhhToVPVZ(2) 
Real(dp) :: MVPhhToVPVZ(2) 
Real(dp) :: RMsqTreehhToVPVZ(2),RMsqWavehhToVPVZ(2),RMsqVertexhhToVPVZ(2) 
Complex(dp) :: AmpTreehhToVPVZ(2,2),AmpWavehhToVPVZ(2,2)=(0._dp,0._dp),AmpVertexhhToVPVZ(2,2)& 
 & ,AmpVertexIRoshhToVPVZ(2,2),AmpVertexIRdrhhToVPVZ(2,2), AmpSumhhToVPVZ(2,2), AmpSum2hhToVPVZ(2,2) 
Complex(dp) :: AmpTreeZhhToVPVZ(2,2),AmpWaveZhhToVPVZ(2,2),AmpVertexZhhToVPVZ(2,2) 
Real(dp) :: AmpSqhhToVPVZ(2),  AmpSqTreehhToVPVZ(2) 
Real(dp) :: MRPhhToVPVZp(2),MRGhhToVPVZp(2), MRPZhhToVPVZp(2),MRGZhhToVPVZp(2) 
Real(dp) :: MVPhhToVPVZp(2) 
Real(dp) :: RMsqTreehhToVPVZp(2),RMsqWavehhToVPVZp(2),RMsqVertexhhToVPVZp(2) 
Complex(dp) :: AmpTreehhToVPVZp(2,2),AmpWavehhToVPVZp(2,2)=(0._dp,0._dp),AmpVertexhhToVPVZp(2,2)& 
 & ,AmpVertexIRoshhToVPVZp(2,2),AmpVertexIRdrhhToVPVZp(2,2), AmpSumhhToVPVZp(2,2), AmpSum2hhToVPVZp(2,2) 
Complex(dp) :: AmpTreeZhhToVPVZp(2,2),AmpWaveZhhToVPVZp(2,2),AmpVertexZhhToVPVZp(2,2) 
Real(dp) :: AmpSqhhToVPVZp(2),  AmpSqTreehhToVPVZp(2) 
Write(*,*) "Calculating one-loop decays of hh " 
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
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,MFd2,             & 
& Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_U1T3R_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,Mhh,MFd2,           & 
& Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFdOS,          & 
& MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,              & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,MFd,            & 
& Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,              & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,            & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,          & 
& cplAhhhVZp,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHpL,      & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,          & 
& cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,              & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFdFd(:,gt2,:,:) = AmpWaveZhhTocFdFd(:,gt2,:,:)+ZRUZh(gt2,gt1)*AmpWavehhTocFdFd(:,gt1,:,:) 
AmpVertexZhhTocFdFd(:,gt2,:,:)= AmpVertexZhhTocFdFd(:,gt2,:,:) + ZRUZh(gt2,gt1)*AmpVertexhhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFdFd(1,:,gt2,:) = AmpWaveZhhTocFdFd(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1,:) 
AmpVertexZhhTocFdFd(1,:,gt2,:)= AmpVertexZhhTocFdFd(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1,:) 
AmpWaveZhhTocFdFd(2,:,gt2,:) = AmpWaveZhhTocFdFd(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1,:) 
AmpVertexZhhTocFdFd(2,:,gt2,:)= AmpVertexZhhTocFdFd(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFdFd(1,:,:,gt2) = AmpWaveZhhTocFdFd(1,:,:,gt2)+ZRUVd(gt2,gt1)*AmpWavehhTocFdFd(1,:,:,gt1) 
AmpVertexZhhTocFdFd(1,:,:,gt2)= AmpVertexZhhTocFdFd(1,:,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexhhTocFdFd(1,:,:,gt1) 
AmpWaveZhhTocFdFd(2,:,:,gt2) = AmpWaveZhhTocFdFd(2,:,:,gt2)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(2,:,:,gt1) 
AmpVertexZhhTocFdFd(2,:,:,gt2)= AmpVertexZhhTocFdFd(2,:,:,gt2)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFd(gt2))+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,MFe2,             & 
& Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_U1T3R_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,MFe,Mhh,MFe2,           & 
& Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFeOS,          & 
& MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,              & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFe,            & 
& Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,              & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,            & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,               & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,ZcplcFeFehhL,ZcplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,ZcplcFeFehhL,ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,               & 
& MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,               & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,       & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,            & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,            & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,             & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFeFe(:,gt2,:,:) = AmpWaveZhhTocFeFe(:,gt2,:,:)+ZRUZh(gt2,gt1)*AmpWavehhTocFeFe(:,gt1,:,:) 
AmpVertexZhhTocFeFe(:,gt2,:,:)= AmpVertexZhhTocFeFe(:,gt2,:,:) + ZRUZh(gt2,gt1)*AmpVertexhhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFeFe(1,:,gt2,:) = AmpWaveZhhTocFeFe(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1,:) 
AmpVertexZhhTocFeFe(1,:,gt2,:)= AmpVertexZhhTocFeFe(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1,:) 
AmpWaveZhhTocFeFe(2,:,gt2,:) = AmpWaveZhhTocFeFe(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1,:) 
AmpVertexZhhTocFeFe(2,:,gt2,:)= AmpVertexZhhTocFeFe(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFeFe(1,:,:,gt2) = AmpWaveZhhTocFeFe(1,:,:,gt2)+ZRUVe(gt2,gt1)*AmpWavehhTocFeFe(1,:,:,gt1) 
AmpVertexZhhTocFeFe(1,:,:,gt2)= AmpVertexZhhTocFeFe(1,:,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexhhTocFeFe(1,:,:,gt1) 
AmpWaveZhhTocFeFe(2,:,:,gt2) = AmpWaveZhhTocFeFe(2,:,:,gt2)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(2,:,:,gt1) 
AmpVertexZhhTocFeFe(2,:,:,gt2)= AmpVertexZhhTocFeFe(2,:,:,gt2)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFe(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,MFu2,             & 
& Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_U1T3R_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,Mhh,MFu2,           & 
& Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFuOS,          & 
& MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,              & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,MFu,            & 
& Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,              & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,            & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,               & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,          & 
& cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,               & 
& cplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAhOS,MFdOS,MFuOS,MhhOS,MHpOS,               & 
& MVG,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFu2OS,Mhh2OS,MHp2OS,MVG2,MVP2,              & 
& MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,          & 
& cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,               & 
& cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFuFu(:,gt2,:,:) = AmpWaveZhhTocFuFu(:,gt2,:,:)+ZRUZh(gt2,gt1)*AmpWavehhTocFuFu(:,gt1,:,:) 
AmpVertexZhhTocFuFu(:,gt2,:,:)= AmpVertexZhhTocFuFu(:,gt2,:,:) + ZRUZh(gt2,gt1)*AmpVertexhhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFuFu(1,:,gt2,:) = AmpWaveZhhTocFuFu(1,:,gt2,:)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1,:) 
AmpVertexZhhTocFuFu(1,:,gt2,:)= AmpVertexZhhTocFuFu(1,:,gt2,:)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1,:) 
AmpWaveZhhTocFuFu(2,:,gt2,:) = AmpWaveZhhTocFuFu(2,:,gt2,:)+ZRUVuc(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1,:) 
AmpVertexZhhTocFuFu(2,:,gt2,:)= AmpVertexZhhTocFuFu(2,:,gt2,:)+ZRUVuc(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFuFu(1,:,:,gt2) = AmpWaveZhhTocFuFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpWavehhTocFuFu(1,:,:,gt1) 
AmpVertexZhhTocFuFu(1,:,:,gt2)= AmpVertexZhhTocFuFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexhhTocFuFu(1,:,:,gt1) 
AmpWaveZhhTocFuFu(2,:,:,gt2) = AmpWaveZhhTocFuFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(2,:,:,gt1) 
AmpVertexZhhTocFuFu(2,:,:,gt2)= AmpVertexZhhTocFuFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MFuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFu(gt2))+Abs(MFu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Fv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhToFvFv(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,MFv2,Mhh2,           & 
& AmpTreehhToFvFv)

  Else 
Call Amplitude_Tree_U1T3R_hhToFvFv(ZcplFvFvhhL,ZcplFvFvhhR,MFv,Mhh,MFv2,              & 
& Mhh2,AmpTreehhToFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFvOS,             & 
& MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFvOS,           & 
& MhhOS,MRPhhToFvFv,MRGhhToFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,MFv,               & 
& Mhh,MRPhhToFvFv,MRGhhToFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhToFvFv(MLambda,em,gs,ZcplFvFvhhL,ZcplFvFvhhR,MFv,             & 
& Mhh,MRPhhToFvFv,MRGhhToFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToFvFv(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,ctcplFvFvhhR,   & 
& MFv,MFv2,Mhh,Mhh2,ZfFV,Zfhh,AmpWavehhToFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,MVZp,           & 
& MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,        & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,          & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexhhToFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,              & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhToFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,     & 
& cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,ZcplFvFvhhL,ZcplFvFvhhR,    & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,      & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhToFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,              & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,ZcplFvFvhhL,ZcplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAhOS,MFeOS,MFvOS,MhhOS,MHpOS,MVP,            & 
& MVWpOS,MVZOS,MVZpOS,MAh2OS,MFe2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,            & 
& MVZp2OS,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,     & 
& cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,      & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,      & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& AmpVertexIRoshhToFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,MVZ,             & 
& MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,              & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToFvFv)

 End if 
 End if 
AmpVertexhhToFvFv = AmpVertexhhToFvFv -  AmpVertexIRdrhhToFvFv! +  AmpVertexIRoshhToFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToFvFv(:,gt2,:,:) = AmpWaveZhhToFvFv(:,gt2,:,:)+ZRUZh(gt2,gt1)*AmpWavehhToFvFv(:,gt1,:,:) 
AmpVertexZhhToFvFv(:,gt2,:,:)= AmpVertexZhhToFvFv(:,gt2,:,:) + ZRUZh(gt2,gt1)*AmpVertexhhToFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 1 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToFvFv(1,:,gt2,:) = AmpWaveZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,gt1,:) 
AmpVertexZhhToFvFv(1,:,gt2,:)= AmpVertexZhhToFvFv(1,:,gt2,:)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,gt1,:) 
AmpWaveZhhToFvFv(2,:,gt2,:) = AmpWaveZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpWavehhToFvFv(2,:,gt1,:) 
AmpVertexZhhToFvFv(2,:,gt2,:)= AmpVertexZhhToFvFv(2,:,gt2,:)+ZRUUVc(gt2,gt1)*AmpVertexhhToFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
! Final State 2 
AmpWaveZhhToFvFv=0._dp 
AmpVertexZhhToFvFv=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToFvFv(1,:,:,gt2) = AmpWaveZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(1,:,:,gt1) 
AmpVertexZhhToFvFv(1,:,:,gt2)= AmpVertexZhhToFvFv(1,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(1,:,:,gt1) 
AmpWaveZhhToFvFv(2,:,:,gt2) = AmpWaveZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpWavehhToFvFv(2,:,:,gt1) 
AmpVertexZhhToFvFv(2,:,:,gt2)= AmpVertexZhhToFvFv(2,:,:,gt2)+ZRUUV(gt2,gt1)*AmpVertexhhToFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToFvFv=AmpWaveZhhToFvFv 
AmpVertexhhToFvFv= AmpVertexZhhToFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexhhToFvFv = AmpVertexhhToFvFv  +  AmpVertexIRoshhToFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fv Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv 
 AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv  
Else 
 AmpSumhhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv + AmpWavehhToFvFv + AmpVertexhhToFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFvFv = AmpTreehhToFvFv
 AmpSum2hhToFvFv = AmpTreehhToFvFv 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MFvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFv(gt2))+Abs(MFv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpWavehhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToFvFv(gt1, gt2, gt3) 
  AmpSum2hhToFvFv = AmpTreehhToFvFv + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2hhToFvFv = AmpTreehhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3)  
  AmpSum2hhToFvFv = + 2._dp*AmpWavehhToFvFv + 2._dp*AmpVertexhhToFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
  AmpSqhhToFvFv(gt1, gt2, gt3) = AmpSqhhToFvFv(gt1, gt2, gt3) + AmpSqTreehhToFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToFvFv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToFvFv(gt1, gt2, gt3) + MRGhhToFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_U1T3R_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,MRPhhTohhhh,             & 
& MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,MRPhhTohhhh,            & 
& MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,MRPhhTohhhh,               & 
& MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,MRPhhTohhhh,              & 
& MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,Zfhh,               & 
& AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,          & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,    & 
& cplcgZpgZphh,Zcplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,cplhhhhhhhh1,               & 
& cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhhhVZVZp1,   & 
& cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,Zcplhhhhhh,cplhhHpcHp,cplhhHpcVWp,     & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,          & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,    & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,cplhhhhhhhh1,               & 
& cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhhhVZVZp1,   & 
& cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(gt2,:,:) = AmpWaveZhhTohhhh(gt2,:,:)+ZRUZh(gt2,gt1)*AmpWavehhTohhhh(gt1,:,:) 
AmpVertexZhhTohhhh(gt2,:,:)= AmpVertexZhhTohhhh(gt2,:,:) + ZRUZh(gt2,gt1)*AmpVertexhhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 1 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(:,gt2,:) = AmpWaveZhhTohhhh(:,gt2,:)+ZRUZh(gt2,gt1)*AmpWavehhTohhhh(:,gt1,:) 
AmpVertexZhhTohhhh(:,gt2,:)= AmpVertexZhhTohhhh(:,gt2,:)+ZRUZh(gt2,gt1)*AmpVertexhhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 2 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(:,:,gt2) = AmpWaveZhhTohhhh(:,:,gt2)+ZRUZh(gt2,gt1)*AmpWavehhTohhhh(:,:,gt1) 
AmpVertexZhhTohhhh(:,:,gt2)= AmpVertexZhhTohhhh(:,:,gt2)+ZRUZh(gt2,gt1)*AmpVertexhhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=gt2,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(VWp) VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhTocVWpVWp(cplhhcVWpVWp,Mhh,MVWp,Mhh2,MVWp2,               & 
& AmpTreehhTocVWpVWp)

  Else 
Call Amplitude_Tree_U1T3R_hhTocVWpVWp(ZcplhhcVWpVWp,Mhh,MVWp,Mhh2,MVWp2,              & 
& AmpTreehhTocVWpVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,MhhOS,MVWpOS,            & 
& MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,MhhOS,MVWpOS,           & 
& MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,Mhh,MVWp,MRPhhTocVWpVWp, & 
& MRGhhTocVWpVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,Mhh,MVWp,               & 
& MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp,Mhh,Mhh2,           & 
& MVWp,MVWp2,Zfhh,ZfVWp,AmpWavehhTocVWpVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,        & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,         & 
& cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,     & 
& cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,          & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,cplcVWpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,   & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,           & 
& cplhhcHpVWpVZp1,cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,   & 
& cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,             & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,& 
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,AmpVertexhhTocVWpVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,            & 
& cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,            & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,    & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,           & 
& cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,         & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,               & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhcVWpVWp1,      & 
& cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,          & 
& cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,     & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,& 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,& 
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,AmpVertexIRdrhhTocVWpVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,             & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,          & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,            & 
& cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,GosZcplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,           & 
& cplhhVPVZp,GosZcplhhcHpVWp,ZcplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,             & 
& GosZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,GosZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,               & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,           & 
& cplhhcHpVWpVZp1,cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,   & 
& cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,             & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,& 
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,            & 
& cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,            & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,    & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,           & 
& cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,         & 
& GZcplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,GZcplhhcHpVWp,ZcplhhcVWpVWp,             & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,GZcplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,               & 
& GZcplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,        & 
& cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,         & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,       & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,& 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,          & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,& 
& cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,             & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,          & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,            & 
& cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,               & 
& cplhhVPVZp,GcplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,     & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,            & 
& cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhcVWpVWp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,             & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,          & 
& cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q, & 
& cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,           & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,& 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,             & 
& cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdVWpL,cplcFuFdVWpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,            & 
& cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAVWp,            & 
& cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,    & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZVWp,           & 
& cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh,         & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,               & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhcVWpVWp1,      & 
& cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,          & 
& cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,     & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,& 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,& 
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 End if 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp -  AmpVertexIRdrhhTocVWpVWp! +  AmpVertexIRoshhTocVWpVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocVWpVWp=0._dp 
AmpVertexZhhTocVWpVWp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocVWpVWp(:,gt2) = AmpWaveZhhTocVWpVWp(:,gt2)+ZRUZh(gt2,gt1)*AmpWavehhTocVWpVWp(:,gt1) 
AmpVertexZhhTocVWpVWp(:,gt2)= AmpVertexZhhTocVWpVWp(:,gt2) + ZRUZh(gt2,gt1)*AmpVertexhhTocVWpVWp(:,gt1) 
 End Do 
End Do 
AmpWavehhTocVWpVWp=AmpWaveZhhTocVWpVWp 
AmpVertexhhTocVWpVWp= AmpVertexZhhTocVWpVWp
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp  +  AmpVertexIRoshhTocVWpVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWp] VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp 
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp  
Else 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVWpOS)+Abs(MVWpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVWp)+Abs(MVWp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = 2._dp*AmpWavehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWpVWp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqTreehhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1)  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqhhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1) + AmpSqTreehhTocVWpVWp(gt1)  
Else  
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqTreehhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1)  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqhhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1) + AmpSqTreehhTocVWpVWp(gt1)  
End if  
Else  
  AmpSqhhTocVWpVWp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWpVWp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVWpOS,MVWpOS,helfactor*AmpSqhhTocVWpVWp(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVWp,MVWp,helfactor*AmpSqhhTocVWpVWp(gt1))
End if 
If ((Abs(MRPhhTocVWpVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWpVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp(gt1) + MRGhhTocVWpVWp(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp(gt1) + MRGhhTocVWpVWp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_U1T3R_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,MVZOS,MRPhhToVZVZ,       & 
& MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,MVZOS,MRPhhToVZVZ,      & 
& MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,           & 
& MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,          & 
& MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVZVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVPVZ,ZfVZ,ZfVZpVZ,ZfVZVP,ZfVZVZp,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,             & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,             & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,          & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,    & 
& cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,ZcplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,     & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,      & 
& cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,ZcplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,             & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,          & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,    & 
& cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,      & 
& cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,cplhhhhVPVZ1,             & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,& 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZVZ=0._dp 
AmpVertexZhhToVZVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToVZVZ(:,gt2) = AmpWaveZhhToVZVZ(:,gt2)+ZRUZh(gt2,gt1)*AmpWavehhToVZVZ(:,gt1) 
AmpVertexZhhToVZVZ(:,gt2)= AmpVertexZhhToVZVZ(:,gt2) + ZRUZh(gt2,gt1)*AmpVertexhhToVZVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZVZ=AmpWaveZhhToVZVZ 
AmpVertexhhToVZVZ= AmpVertexZhhToVZVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZ)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
End if  
Else  
  AmpSqhhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZ,MVZ,helfactor*AmpSqhhToVZVZ(gt1))
End if 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhToVZpVZ(cplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,MVZp2,          & 
& AmpTreehhToVZpVZ)

  Else 
Call Amplitude_Tree_U1T3R_hhToVZpVZ(ZcplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,               & 
& MVZp2,AmpTreehhToVZpVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,MhhOS,MVZOS,MVZpOS,          & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,MhhOS,MVZOS,MVZpOS,         & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,Mhh,MVZ,MVZp,MRPhhToVZpVZ,   & 
& MRGhhToVZpVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,Mhh,MVZ,MVZp,               & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVZpVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZ,ZfVZ,ZfVZp,ZfVZpVP,ZfVZpVZ,          & 
& AmpWavehhToVZpVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,         & 
& cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,      & 
& cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,   & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,       & 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,AmpVertexhhToVZpVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,             & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,         & 
& cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,      & 
& cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,   & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,       & 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,AmpVertexIRdrhhToVZpVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,               & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWCgWCVZp,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& ZcplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,               & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,        & 
& cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,& 
& cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,     & 
& cplcVWpVWpVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,             & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,         & 
& cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,ZcplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,     & 
& cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,   & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,       & 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,               & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWCgWCVZp,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,      & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,              & 
& cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,     & 
& cplcVWpVWpVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,             & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,        & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZ,         & 
& cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,      & 
& cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1,        & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZ1,   & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,       & 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 End if 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ -  AmpVertexIRdrhhToVZpVZ! +  AmpVertexIRoshhToVZpVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZ=0._dp 
AmpVertexZhhToVZpVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToVZpVZ(:,gt2) = AmpWaveZhhToVZpVZ(:,gt2)+ZRUZh(gt2,gt1)*AmpWavehhToVZpVZ(:,gt1) 
AmpVertexZhhToVZpVZ(:,gt2)= AmpVertexZhhToVZpVZ(:,gt2) + ZRUZh(gt2,gt1)*AmpVertexhhToVZpVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZ=AmpWaveZhhToVZpVZ 
AmpVertexhhToVZpVZ= AmpVertexZhhToVZpVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ  +  AmpVertexIRoshhToVZpVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ 
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ  
Else 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpWavehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
Else  
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
End if  
Else  
  AmpSqhhToVZpVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZOS,helfactor*AmpSqhhToVZpVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVZp,MVZ,helfactor*AmpSqhhToVZpVZ(gt1))
End if 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_U1T3R_hhToVZpVZp(cplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,AmpTreehhToVZpVZp)

  Else 
Call Amplitude_Tree_U1T3R_hhToVZpVZp(ZcplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,AmpTreehhToVZpVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,MhhOS,MVZpOS,              & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,MhhOS,MVZpOS,             & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_U1T3R_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,Mhh,MVZp,MRPhhToVZpVZp,    & 
& MRGhhToVZpVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_U1T3R_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,Mhh,MVZp,MRPhhToVZpVZp,   & 
& MRGhhToVZpVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVZpVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZp,ZfVZp,ZfVZpVP,ZfVZpVZ,              & 
& ZfVZVZp,AmpWavehhToVZpVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,               & 
& cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,            & 
& cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,              & 
& AmpVertexhhToVZpVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,               & 
& cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,            & 
& cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,              & 
& AmpVertexIRdrhhToVZpVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,              & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,              & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,ZcplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,   & 
& cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,  & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q, & 
& cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,               & 
& cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& ZcplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,       & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,            & 
& cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,              & 
& AmpVertexIRoshhToVZpVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,              & 
& MhhOS,MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,         & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,              & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,    & 
& cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,  & 
& cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q, & 
& cplcVWpVWpVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,      & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,               & 
& cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,            & 
& cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,              & 
& AmpVertexIRoshhToVZpVZp)

 End if 
 End if 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp -  AmpVertexIRdrhhToVZpVZp! +  AmpVertexIRoshhToVZpVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZp=0._dp 
AmpVertexZhhToVZpVZp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToVZpVZp(:,gt2) = AmpWaveZhhToVZpVZp(:,gt2)+ZRUZh(gt2,gt1)*AmpWavehhToVZpVZp(:,gt1) 
AmpVertexZhhToVZpVZp(:,gt2)= AmpVertexZhhToVZpVZp(:,gt2) + ZRUZh(gt2,gt1)*AmpVertexhhToVZpVZp(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZp=AmpWaveZhhToVZpVZp 
AmpVertexhhToVZpVZp= AmpVertexZhhToVZpVZp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp  +  AmpVertexIRoshhToVZpVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp 
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp  
Else 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpWavehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
Else  
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
End if  
Else  
  AmpSqhhToVZpVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZpOS,helfactor*AmpSqhhToVZpVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZp,MVZp,helfactor*AmpSqhhToVZpVZp(gt1))
End if 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhTohhVP(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,             & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_U1T3R_hhTohhVP(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,             & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplhhHpcVWpVP1,cplhhcHpVPVWp1,AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTohhVP(MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,              & 
& cplhhHpcVWpVP1,cplhhcHpVPVWp1,AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),0._dp,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVP,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqhhTohhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVP,helfactor*AmpSqhhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhTohhVZ(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,             & 
& MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,             & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_U1T3R_hhTohhVZ(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,             & 
& MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZ2OS,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,             & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTohhVZ(MFd,MFe,MFu,MFv,Mhh,MHp,MVWp,MVZ,MFd2,           & 
& MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,              & 
& cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZOS,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZ,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqhhTohhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqhhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! hh VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhTohhVZp(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,            & 
& MVWpOS,MVZpOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZp2OS,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,              & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,   & 
& AmpVertexhhTohhVZp)

 Else 
Call Amplitude_VERTEX_U1T3R_hhTohhVZp(MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,MHpOS,            & 
& MVWpOS,MVZpOS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHp2OS,MVWp2OS,MVZp2OS,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,              & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,   & 
& AmpVertexhhTohhVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhTohhVZp(MFd,MFe,MFu,MFv,Mhh,MHp,MVWp,MVZp,              & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,        & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhHpcHp,          & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,            & 
& cplcVWpVWpVZp,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,AmpVertexhhTohhVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZp = 0._dp 
 AmpSum2hhTohhVZp = 0._dp  
Else 
 AmpSumhhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp
 AmpSum2hhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZp,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZp(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZpOS,helfactor*AmpSqhhTohhVZp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZp,helfactor*AmpSqhhTohhVZp(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,MFd2OS,MFu2OS,             & 
& Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_U1T3R_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,MFd2OS,MFu2OS,             & 
& Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,Mhh2,MVG2,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVG)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVG,MVG,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
End if  
Else  
  AmpSqhhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVGVG(gt1))
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh(gt1),MVG,MVG,helfactor*AmpSqhhToVGVG(gt1))
End if 
If ((Abs(MRPhhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,            & 
& AmpWavehhToVPVP)

 Else 
Call Amplitude_WAVE_U1T3R_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,            & 
& AmpWavehhToVPVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhToVPVP(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,             & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,    & 
& cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,      & 
& cplcVWpVPVWp,cplAhAhVPVP1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpcVWpVP1,      & 
& cplhhcHpVPVWp1,cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,       & 
& AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_U1T3R_hhToVPVP(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,             & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,    & 
& cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,      & 
& cplcVWpVPVWp,cplAhAhVPVP1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpcVWpVP1,      & 
& cplhhcHpVPVWp1,cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,       & 
& AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP,AmpWavehhToVPVP)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVPVP(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,      & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1,cplhhhhVPVP1,             & 
& cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,& 
& cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVP,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
End if  
Else  
  AmpSqhhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVPVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVP,MVP,helfactor*AmpSqhhToVPVP(gt1))
End if 
If ((Abs(MRPhhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,              & 
& AmpWavehhToVPVZ)

 Else 
Call Amplitude_WAVE_U1T3R_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,              & 
& AmpWavehhToVPVZ)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhToVPVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,             & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,        & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhhhhh,            & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,      & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,          & 
& cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1, & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,       & 
& AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_U1T3R_hhToVPVZ(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,             & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,        & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhhhhh,            & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,      & 
& cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,          & 
& cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1, & 
& cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,       & 
& AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,         & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,AmpWavehhToVPVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVPVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,        & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,           & 
& cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,       & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1,            & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVP1,     & 
& cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,           & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZOS,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZ,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
End if  
Else  
  AmpSqhhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZOS,helfactor*AmpSqhhToVPVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZ,helfactor*AmpSqhhToVPVZ(gt1))
End if 
If ((Abs(MRPhhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_U1T3R_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,            & 
& ZfVZp,ZfVZVZp,AmpWavehhToVPVZp)

 Else 
Call Amplitude_WAVE_U1T3R_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,            & 
& ZfVZp,ZfVZVZp,AmpWavehhToVPVZp)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_U1T3R_hhToVPVZp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,      & 
& cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZp,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,       & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVP1,cplhhHpcVWpVZp1,             & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZp1,cplHpcHpVPVZp1,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,     & 
& cplcVWpVPVWpVZp1Q,AmpVertexhhToVPVZp)

 Else 
Call Amplitude_VERTEX_U1T3R_hhToVPVZp(MAhOS,MFdOS,MFeOS,MFuOS,MFvOS,MhhOS,            & 
& MHpOS,MVP,MVWpOS,MVZOS,MVZpOS,MAh2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,               & 
& MHp2OS,MVP2,MVWp2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,      & 
& cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZp,cplhhhhhh,          & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,    & 
& cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,       & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVP1,cplhhHpcVWpVZp1,             & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZp1,cplHpcHpVPVZp1,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,     & 
& cplcVWpVPVWpVZp1Q,AmpVertexhhToVPVZp)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_U1T3R_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,           & 
& Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZp,ZfVZVZp,          & 
& AmpWavehhToVPVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_U1T3R_hhToVPVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,        & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,     & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVP,         & 
& cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,       & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZp,      & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1,        & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVP1,   & 
& cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZp1,cplHpcHpVPVZp1,cplcVWpVPVWpVZp3Q,       & 
& cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,AmpVertexhhToVPVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZp = 0._dp 
 AmpSum2hhToVPVZp = 0._dp  
Else 
 AmpSumhhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp
 AmpSum2hhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZpOS,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZp,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
End if  
Else  
  AmpSqhhToVPVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZpOS,helfactor*AmpSqhhToVPVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZp,helfactor*AmpSqhhToVPVZp(gt1))
End if 
If ((Abs(MRPhhToVPVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_U1T3R
