! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecays_U1T3R 
Use Couplings_U1T3R 
Use CouplingsCT_U1T3R 
Use Model_Data_U1T3R 
Use LoopCouplings_U1T3R 
Use LoopMasses_U1T3R 
Use RGEs_U1T3R 
Use Tadpoles_U1T3R 
Use Kinematics 
Use CouplingsForDecays_U1T3R 
 
Use Wrapper_OneLoopDecay_Fu_U1T3R 
Use Wrapper_OneLoopDecay_Fe_U1T3R 
Use Wrapper_OneLoopDecay_Fd_U1T3R 
Use Wrapper_OneLoopDecay_hh_U1T3R 

 
Contains 
 
Subroutine getZCouplings(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,              & 
& gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,              & 
& cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,       & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,     & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,             & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,cplAhHpcVWpVZ,     & 
& cplAhHpcVWpVZp,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,cplhhhhVPVP,cplhhhhVPVZ,     & 
& cplhhhhVPVZp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpcVWpVP,      & 
& cplhhHpcVWpVZ,cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplhhcHpVWpVZp,               & 
& cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZVZp,    & 
& cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,            & 
& cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,     & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,& 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,   & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,& 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,     & 
& cplcgZpgWCVWp,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,     & 
& cplcgWCgZpcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,           & 
& cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,         & 
& cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,              & 
& cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,           & 
& ZRUVe,ZRUUe,ZRUUV,ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,ZcplAhAhhhhh,         & 
& ZcplAhAhHpcHp,Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVP,ZcplAhhhVZ,         & 
& ZcplAhhhVZp,ZcplAhHpcVWp,ZcplAhcHpVWp,ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,           & 
& ZcplHpcHpVZ,ZcplHpcHpVZp,ZcplhhVPVZ,ZcplhhVPVZp,ZcplhhcVWpVWp,ZcplhhVZVZ,              & 
& ZcplhhVZVZp,ZcplhhVZpVZp,ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplHpcVWpVZp,ZcplcHpVPVWp,         & 
& ZcplcHpVWpVZ,ZcplcHpVWpVZp,ZcplAhAhVPVP,ZcplAhAhVPVZ,ZcplAhAhVPVZp,ZcplAhAhcVWpVWp,    & 
& ZcplAhAhVZVZ,ZcplAhAhVZVZp,ZcplAhAhVZpVZp,ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,               & 
& ZcplAhHpcVWpVZp,ZcplAhcHpVPVWp,ZcplAhcHpVWpVZ,ZcplAhcHpVWpVZp,ZcplhhhhVPVP,            & 
& ZcplhhhhVPVZ,ZcplhhhhVPVZp,ZcplhhhhcVWpVWp,ZcplhhhhVZVZ,ZcplhhhhVZVZp,ZcplhhhhVZpVZp,  & 
& ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,ZcplhhHpcVWpVZp,ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,           & 
& ZcplhhcHpVWpVZp,ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpVPVZp,ZcplHpcHpcVWpVWp,           & 
& ZcplHpcHpVZVZ,ZcplHpcHpVZVZp,ZcplHpcHpVZpVZp,ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,   & 
& ZcplcVWpVWpVZp,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,       & 
& ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHpL,           & 
& ZcplcFuFdHpR,ZcplFvFeHpL,ZcplFvFeHpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,           & 
& ZcplcFuFuhhR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvcHpL,        & 
& ZcplcFeFvcHpR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdVWpL,       & 
& ZcplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,ZcplFvFeVWpL,      & 
& ZcplFvFeVWpR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFeVZpL,        & 
& ZcplcFeFeVZpR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,        & 
& ZcplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplFvFvVPL,    & 
& ZcplFvFvVPR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ZcplcFeFvcVWpL,          & 
& ZcplcFeFvcVWpR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWpVPVPVWp1,             & 
& ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,ZcplcVWpVPVWpVZ3,  & 
& ZcplcVWpVPVWpVZp1,ZcplcVWpVPVWpVZp2,ZcplcVWpVPVWpVZp3,ZcplcVWpcVWpVWpVWp1,             & 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcVWpVWpVZVZp1,ZcplcVWpVWpVZVZp2,ZcplcVWpVWpVZVZp3,ZcplcVWpVWpVZpVZp1,& 
& ZcplcVWpVWpVZpVZp2,ZcplcVWpVWpVZpVZp3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,        & 
& ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgWpgWpVZp,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgZpgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgZpgWCVWp,              & 
& ZcplcgWCgWCVZ,ZcplcgWCgWCVZp,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgZpVWp,              & 
& ZcplcgWCgZpcVWp,ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgZpgAhh,ZcplcgWpgAHp,     & 
& ZcplcgWCgAcHp,ZcplcgWpgWphh,ZcplcgZgWpcHp,ZcplcgZpgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,   & 
& ZcplcgZpgWCHp,ZcplcgZgZhh,ZcplcgZpgZhh,ZcplcgWpgZHp,ZcplcgWCgZcHp,ZcplcgZgZphh,        & 
& ZcplcgZpgZphh,ZcplcgWpgZpHp,ZcplcgWCgZpcHp)

Implicit None

Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplAhhhVP(2,2), & 
& cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplhhHpcVWp(2),           & 
& cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ(2),cplhhVPVZp(2),           & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),   & 
& cplAhAhVPVZp(2,2),cplAhAhcVWpVWp(2,2),cplAhAhVZVZ(2,2),cplAhAhVZVZp(2,2),              & 
& cplAhAhVZpVZp(2,2),cplAhHpcVWpVP(2),cplAhHpcVWpVZ(2),cplAhHpcVWpVZp(2),cplAhcHpVPVWp(2),& 
& cplAhcHpVWpVZ(2),cplAhcHpVWpVZp(2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),& 
& cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhhhVZVZp(2,2),cplhhhhVZpVZp(2,2),             & 
& cplhhHpcVWpVP(2),cplhhHpcVWpVZ(2),cplhhHpcVWpVZp(2),cplhhcHpVPVWp(2),cplhhcHpVWpVZ(2), & 
& cplhhcHpVWpVZp(2),cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,             & 
& cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,         & 
& cplcVWpVWpVZp,cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),& 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),             & 
& cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),               & 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),& 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6), & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucVWpL(6,6),& 
& cplcFdFucVWpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),    & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,     & 
& cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,             & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,     & 
& cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcgGgGVG,     & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgAgWpcVWp,      & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,cplcgWCgZpcVWp,    & 
& cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAHp,              & 
& cplcgWCgAcHp,cplcgWpgWphh(2),cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh(2),               & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZHp,cplcgWCgZcHp

Complex(dp), Intent(in) :: cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp

Complex(dp), Intent(in) :: ZRUZh(2,2),ZRUZA(2,2),ZRUVd(6,6),ZRUUd(6,6),ZRUVu(6,6),ZRUUu(6,6),ZRUVe(6,6),         & 
& ZRUUe(6,6),ZRUUV(9,9)

Integer :: gt1, gt2
Complex(dp) :: TempcplAhAhhh(2,2,2),Tempcplhhhhhh(2,2,2),TempcplhhHpcHp(2),TempcplAhAhAhAh(2,2,2,2), & 
& TempcplAhAhhhhh(2,2,2,2),TempcplAhAhHpcHp(2,2),Tempcplhhhhhhhh(2,2,2,2),               & 
& TempcplhhhhHpcHp(2,2),TempcplHpHpcHpcHp,TempcplAhhhVP(2,2),TempcplAhhhVZ(2,2),         & 
& TempcplAhhhVZp(2,2),TempcplAhHpcVWp(2),TempcplAhcHpVWp(2),TempcplhhHpcVWp(2),          & 
& TempcplhhcHpVWp(2),TempcplHpcHpVP,TempcplHpcHpVZ,TempcplHpcHpVZp,TempcplhhVPVZ(2),     & 
& TempcplhhVPVZp(2),TempcplhhcVWpVWp(2),TempcplhhVZVZ(2),TempcplhhVZVZp(2),              & 
& TempcplhhVZpVZp(2),TempcplHpcVWpVP,TempcplHpcVWpVZ,TempcplHpcVWpVZp,TempcplcHpVPVWp,   & 
& TempcplcHpVWpVZ,TempcplcHpVWpVZp,TempcplAhAhVPVP(2,2),TempcplAhAhVPVZ(2,2),            & 
& TempcplAhAhVPVZp(2,2),TempcplAhAhcVWpVWp(2,2),TempcplAhAhVZVZ(2,2),TempcplAhAhVZVZp(2,2),& 
& TempcplAhAhVZpVZp(2,2),TempcplAhHpcVWpVP(2),TempcplAhHpcVWpVZ(2),TempcplAhHpcVWpVZp(2),& 
& TempcplAhcHpVPVWp(2),TempcplAhcHpVWpVZ(2),TempcplAhcHpVWpVZp(2),TempcplhhhhVPVP(2,2),  & 
& TempcplhhhhVPVZ(2,2),TempcplhhhhVPVZp(2,2),TempcplhhhhcVWpVWp(2,2),TempcplhhhhVZVZ(2,2),& 
& TempcplhhhhVZVZp(2,2),TempcplhhhhVZpVZp(2,2),TempcplhhHpcVWpVP(2),TempcplhhHpcVWpVZ(2),& 
& TempcplhhHpcVWpVZp(2),TempcplhhcHpVPVWp(2),TempcplhhcHpVWpVZ(2),TempcplhhcHpVWpVZp(2), & 
& TempcplHpcHpVPVP,TempcplHpcHpVPVZ,TempcplHpcHpVPVZp,TempcplHpcHpcVWpVWp,               & 
& TempcplHpcHpVZVZ,TempcplHpcHpVZVZp,TempcplHpcHpVZpVZp,TempcplVGVGVG,TempcplcVWpVPVWp,  & 
& TempcplcVWpVWpVZ,TempcplcVWpVWpVZp,TempcplcFdFdAhL(6,6,2),TempcplcFdFdAhR(6,6,2),      & 
& TempcplcFeFeAhL(6,6,2),TempcplcFeFeAhR(6,6,2),TempcplcFuFuAhL(6,6,2),TempcplcFuFuAhR(6,6,2),& 
& TempcplFvFvAhL(9,9,2),TempcplFvFvAhR(9,9,2),TempcplcFdFdhhL(6,6,2),TempcplcFdFdhhR(6,6,2),& 
& TempcplcFuFdHpL(6,6),TempcplcFuFdHpR(6,6),TempcplFvFeHpL(9,6),TempcplFvFeHpR(9,6),     & 
& TempcplcFeFehhL(6,6,2),TempcplcFeFehhR(6,6,2),TempcplcFuFuhhL(6,6,2),TempcplcFuFuhhR(6,6,2),& 
& TempcplcFdFucHpL(6,6),TempcplcFdFucHpR(6,6),TempcplFvFvhhL(9,9,2),TempcplFvFvhhR(9,9,2),& 
& TempcplcFeFvcHpL(6,9),TempcplcFeFvcHpR(6,9),TempcplcFdFdVGL(6,6),TempcplcFdFdVGR(6,6), & 
& TempcplcFdFdVPL(6,6),TempcplcFdFdVPR(6,6),TempcplcFuFdVWpL(6,6),TempcplcFuFdVWpR(6,6), & 
& TempcplcFdFdVZL(6,6),TempcplcFdFdVZR(6,6),TempcplcFdFdVZpL(6,6),TempcplcFdFdVZpR(6,6), & 
& TempcplFvFeVWpL(9,6),TempcplFvFeVWpR(9,6),TempcplcFeFeVPL(6,6),TempcplcFeFeVPR(6,6),   & 
& TempcplcFeFeVZL(6,6),TempcplcFeFeVZR(6,6),TempcplcFeFeVZpL(6,6),TempcplcFeFeVZpR(6,6), & 
& TempcplcFuFuVGL(6,6),TempcplcFuFuVGR(6,6),TempcplcFuFuVPL(6,6),TempcplcFuFuVPR(6,6),   & 
& TempcplcFuFuVZL(6,6),TempcplcFuFuVZR(6,6),TempcplcFuFuVZpL(6,6),TempcplcFuFuVZpR(6,6), & 
& TempcplcFdFucVWpL(6,6),TempcplcFdFucVWpR(6,6),TempcplFvFvVPL(9,9),TempcplFvFvVPR(9,9), & 
& TempcplFvFvVZL(9,9),TempcplFvFvVZR(9,9),TempcplFvFvVZpL(9,9),TempcplFvFvVZpR(9,9),     & 
& TempcplcFeFvcVWpL(6,9),TempcplcFeFvcVWpR(6,9),TempcplVGVGVGVG1,TempcplVGVGVGVG2,       & 
& TempcplVGVGVGVG3,TempcplcVWpVPVPVWp1,TempcplcVWpVPVPVWp2,TempcplcVWpVPVPVWp3,          & 
& TempcplcVWpVPVWpVZ1,TempcplcVWpVPVWpVZ2,TempcplcVWpVPVWpVZ3,TempcplcVWpVPVWpVZp1,      & 
& TempcplcVWpVPVWpVZp2,TempcplcVWpVPVWpVZp3,TempcplcVWpcVWpVWpVWp1,TempcplcVWpcVWpVWpVWp2,& 
& TempcplcVWpcVWpVWpVWp3,TempcplcVWpVWpVZVZ1,TempcplcVWpVWpVZVZ2,TempcplcVWpVWpVZVZ3,    & 
& TempcplcVWpVWpVZVZp1,TempcplcVWpVWpVZVZp2,TempcplcVWpVWpVZVZp3,TempcplcVWpVWpVZpVZp1

Complex(dp) :: TempcplcVWpVWpVZpVZp2,TempcplcVWpVWpVZpVZp3,TempcplcgGgGVG,TempcplcgWpgAVWp,           & 
& TempcplcgWCgAcVWp,TempcplcgWpgWpVP,TempcplcgWpgWpVZ,TempcplcgWpgWpVZp,TempcplcgAgWpcVWp,& 
& TempcplcgZgWpcVWp,TempcplcgZpgWpcVWp,TempcplcgWCgWCVP,TempcplcgAgWCVWp,TempcplcgZgWCVWp,& 
& TempcplcgZpgWCVWp,TempcplcgWCgWCVZ,TempcplcgWCgWCVZp,TempcplcgWpgZVWp,TempcplcgWCgZcVWp,& 
& TempcplcgWpgZpVWp,TempcplcgWCgZpcVWp,TempcplcgWpgWpAh(2),TempcplcgWCgWCAh(2),          & 
& TempcplcgZgAhh(2),TempcplcgZpgAhh(2),TempcplcgWpgAHp,TempcplcgWCgAcHp,TempcplcgWpgWphh(2),& 
& TempcplcgZgWpcHp,TempcplcgZpgWpcHp,TempcplcgWCgWChh(2),TempcplcgZgWCHp,TempcplcgZpgWCHp,& 
& TempcplcgZgZhh(2),TempcplcgZpgZhh(2),TempcplcgWpgZHp,TempcplcgWCgZcHp,TempcplcgZgZphh(2),& 
& TempcplcgZpgZphh(2),TempcplcgWpgZpHp,TempcplcgWCgZpcHp

Complex(dp), Intent(out) :: ZcplAhAhhh(2,2,2),Zcplhhhhhh(2,2,2),ZcplhhHpcHp(2),ZcplAhAhAhAh(2,2,2,2),             & 
& ZcplAhAhhhhh(2,2,2,2),ZcplAhAhHpcHp(2,2),Zcplhhhhhhhh(2,2,2,2),ZcplhhhhHpcHp(2,2),     & 
& ZcplHpHpcHpcHp,ZcplAhhhVP(2,2),ZcplAhhhVZ(2,2),ZcplAhhhVZp(2,2),ZcplAhHpcVWp(2),       & 
& ZcplAhcHpVWp(2),ZcplhhHpcVWp(2),ZcplhhcHpVWp(2),ZcplHpcHpVP,ZcplHpcHpVZ,               & 
& ZcplHpcHpVZp,ZcplhhVPVZ(2),ZcplhhVPVZp(2),ZcplhhcVWpVWp(2),ZcplhhVZVZ(2),              & 
& ZcplhhVZVZp(2),ZcplhhVZpVZp(2),ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplHpcVWpVZp,ZcplcHpVPVWp,   & 
& ZcplcHpVWpVZ,ZcplcHpVWpVZp,ZcplAhAhVPVP(2,2),ZcplAhAhVPVZ(2,2),ZcplAhAhVPVZp(2,2),     & 
& ZcplAhAhcVWpVWp(2,2),ZcplAhAhVZVZ(2,2),ZcplAhAhVZVZp(2,2),ZcplAhAhVZpVZp(2,2),         & 
& ZcplAhHpcVWpVP(2),ZcplAhHpcVWpVZ(2),ZcplAhHpcVWpVZp(2),ZcplAhcHpVPVWp(2),              & 
& ZcplAhcHpVWpVZ(2),ZcplAhcHpVWpVZp(2),ZcplhhhhVPVP(2,2),ZcplhhhhVPVZ(2,2),              & 
& ZcplhhhhVPVZp(2,2),ZcplhhhhcVWpVWp(2,2),ZcplhhhhVZVZ(2,2),ZcplhhhhVZVZp(2,2),          & 
& ZcplhhhhVZpVZp(2,2),ZcplhhHpcVWpVP(2),ZcplhhHpcVWpVZ(2),ZcplhhHpcVWpVZp(2),            & 
& ZcplhhcHpVPVWp(2),ZcplhhcHpVWpVZ(2),ZcplhhcHpVWpVZp(2),ZcplHpcHpVPVP,ZcplHpcHpVPVZ,    & 
& ZcplHpcHpVPVZp,ZcplHpcHpcVWpVWp,ZcplHpcHpVZVZ,ZcplHpcHpVZVZp,ZcplHpcHpVZpVZp,          & 
& ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcVWpVWpVZp,ZcplcFdFdAhL(6,6,2),             & 
& ZcplcFdFdAhR(6,6,2),ZcplcFeFeAhL(6,6,2),ZcplcFeFeAhR(6,6,2),ZcplcFuFuAhL(6,6,2),       & 
& ZcplcFuFuAhR(6,6,2),ZcplFvFvAhL(9,9,2),ZcplFvFvAhR(9,9,2),ZcplcFdFdhhL(6,6,2),         & 
& ZcplcFdFdhhR(6,6,2),ZcplcFuFdHpL(6,6),ZcplcFuFdHpR(6,6),ZcplFvFeHpL(9,6),              & 
& ZcplFvFeHpR(9,6),ZcplcFeFehhL(6,6,2),ZcplcFeFehhR(6,6,2),ZcplcFuFuhhL(6,6,2),          & 
& ZcplcFuFuhhR(6,6,2),ZcplcFdFucHpL(6,6),ZcplcFdFucHpR(6,6),ZcplFvFvhhL(9,9,2),          & 
& ZcplFvFvhhR(9,9,2),ZcplcFeFvcHpL(6,9),ZcplcFeFvcHpR(6,9),ZcplcFdFdVGL(6,6),            & 
& ZcplcFdFdVGR(6,6),ZcplcFdFdVPL(6,6),ZcplcFdFdVPR(6,6),ZcplcFuFdVWpL(6,6),              & 
& ZcplcFuFdVWpR(6,6),ZcplcFdFdVZL(6,6),ZcplcFdFdVZR(6,6),ZcplcFdFdVZpL(6,6),             & 
& ZcplcFdFdVZpR(6,6),ZcplFvFeVWpL(9,6),ZcplFvFeVWpR(9,6),ZcplcFeFeVPL(6,6),              & 
& ZcplcFeFeVPR(6,6),ZcplcFeFeVZL(6,6),ZcplcFeFeVZR(6,6),ZcplcFeFeVZpL(6,6),              & 
& ZcplcFeFeVZpR(6,6),ZcplcFuFuVGL(6,6),ZcplcFuFuVGR(6,6),ZcplcFuFuVPL(6,6),              & 
& ZcplcFuFuVPR(6,6),ZcplcFuFuVZL(6,6),ZcplcFuFuVZR(6,6),ZcplcFuFuVZpL(6,6),              & 
& ZcplcFuFuVZpR(6,6),ZcplcFdFucVWpL(6,6),ZcplcFdFucVWpR(6,6),ZcplFvFvVPL(9,9),           & 
& ZcplFvFvVPR(9,9),ZcplFvFvVZL(9,9),ZcplFvFvVZR(9,9),ZcplFvFvVZpL(9,9),ZcplFvFvVZpR(9,9),& 
& ZcplcFeFvcVWpL(6,9),ZcplcFeFvcVWpR(6,9),ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpVPVWpVZp1,ZcplcVWpVPVWpVZp2,ZcplcVWpVPVWpVZp3,ZcplcVWpcVWpVWpVWp1,& 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcVWpVWpVZVZp1,ZcplcVWpVWpVZVZp2,ZcplcVWpVWpVZVZp3,ZcplcVWpVWpVZpVZp1,& 
& ZcplcVWpVWpVZpVZp2,ZcplcVWpVWpVZpVZp3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,        & 
& ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgWpgWpVZp,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgZpgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgZpgWCVWp

Complex(dp), Intent(out) :: ZcplcgWCgWCVZ,ZcplcgWCgWCVZp,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgZpVWp,              & 
& ZcplcgWCgZpcVWp,ZcplcgWpgWpAh(2),ZcplcgWCgWCAh(2),ZcplcgZgAhh(2),ZcplcgZpgAhh(2),      & 
& ZcplcgWpgAHp,ZcplcgWCgAcHp,ZcplcgWpgWphh(2),ZcplcgZgWpcHp,ZcplcgZpgWpcHp,              & 
& ZcplcgWCgWChh(2),ZcplcgZgWCHp,ZcplcgZpgWCHp,ZcplcgZgZhh(2),ZcplcgZpgZhh(2),            & 
& ZcplcgWpgZHp,ZcplcgWCgZcHp,ZcplcgZgZphh(2),ZcplcgZpgZphh(2),ZcplcgWpgZpHp,             & 
& ZcplcgWCgZpcHp

Complex(dp) :: ZRUZhc(2, 2) 
Complex(dp) :: ZRUZAc(2, 2) 
Complex(dp) :: ZRUVdc(6, 6) 
Complex(dp) :: ZRUUdc(6, 6) 
Complex(dp) :: ZRUVuc(6, 6) 
Complex(dp) :: ZRUUuc(6, 6) 
Complex(dp) :: ZRUVec(6, 6) 
Complex(dp) :: ZRUUec(6, 6) 
Complex(dp) :: ZRUUVc(9, 9) 
ZRUZhc = Conjg(ZRUZh)
ZRUZAc = Conjg(ZRUZA)
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)
ZRUUVc = Conjg(ZRUUV)


 ! ## ZcplAhAhhh ## 
ZcplAhAhhh = 0._dp 
TempcplAhAhhh = cplAhAhhh 
Do gt1=1,2
  Do gt2=1,2
ZcplAhAhhh(gt2,:,:) = ZcplAhAhhh(gt2,:,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(gt1,:,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhAhhh(:,gt2,:) = ZcplAhAhhh(:,gt2,:) + ZRUZA(gt2,gt1)*TempcplAhAhhh(:,gt1,:) 
 End Do 
End Do 
TempcplAhAhhh = ZcplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhAhhh(:,:,gt2) = ZcplAhAhhh(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplAhAhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## Zcplhhhhhh ## 
Zcplhhhhhh = 0._dp 
Tempcplhhhhhh = cplhhhhhh 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(gt2,:,:) = Zcplhhhhhh(gt2,:,:) + ZRUZh(gt2,gt1)*Tempcplhhhhhh(gt1,:,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(:,gt2,:) = Zcplhhhhhh(:,gt2,:) + ZRUZh(gt2,gt1)*Tempcplhhhhhh(:,gt1,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(:,:,gt2) = Zcplhhhhhh(:,:,gt2) + ZRUZh(gt2,gt1)*Tempcplhhhhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhHpcHp ## 
ZcplhhHpcHp = 0._dp 
TempcplhhHpcHp = cplhhHpcHp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpcHp(gt2) = ZcplhhHpcHp(gt2) + ZRUZh(gt2,gt1)*TempcplhhHpcHp(gt1) 
 End Do 
End Do 
TempcplhhHpcHp = ZcplhhHpcHp 


 ! ## ZcplAhAhAhAh ## 
ZcplAhAhAhAh = 0._dp 


 ! ## ZcplAhAhhhhh ## 
ZcplAhAhhhhh = 0._dp 


 ! ## ZcplAhAhHpcHp ## 
ZcplAhAhHpcHp = 0._dp 


 ! ## Zcplhhhhhhhh ## 
Zcplhhhhhhhh = 0._dp 


 ! ## ZcplhhhhHpcHp ## 
ZcplhhhhHpcHp = 0._dp 


 ! ## ZcplHpHpcHpcHp ## 
ZcplHpHpcHpcHp = 0._dp 


 ! ## ZcplAhhhVP ## 
ZcplAhhhVP = 0._dp 
TempcplAhhhVP = cplAhhhVP 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVP(gt2,:) = ZcplAhhhVP(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVP(gt1,:) 
 End Do 
End Do 
TempcplAhhhVP = ZcplAhhhVP 
ZcplAhhhVP = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVP(:,gt2) = ZcplAhhhVP(:,gt2) + ZRUZh(gt2,gt1)*TempcplAhhhVP(:,gt1) 
 End Do 
End Do 
TempcplAhhhVP = ZcplAhhhVP 


 ! ## ZcplAhhhVZ ## 
ZcplAhhhVZ = 0._dp 
TempcplAhhhVZ = cplAhhhVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVZ(gt2,:) = ZcplAhhhVZ(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVZ(gt1,:) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 
ZcplAhhhVZ = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVZ(:,gt2) = ZcplAhhhVZ(:,gt2) + ZRUZh(gt2,gt1)*TempcplAhhhVZ(:,gt1) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 


 ! ## ZcplAhhhVZp ## 
ZcplAhhhVZp = 0._dp 
TempcplAhhhVZp = cplAhhhVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVZp(gt2,:) = ZcplAhhhVZp(gt2,:) + ZRUZA(gt2,gt1)*TempcplAhhhVZp(gt1,:) 
 End Do 
End Do 
TempcplAhhhVZp = ZcplAhhhVZp 
ZcplAhhhVZp = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVZp(:,gt2) = ZcplAhhhVZp(:,gt2) + ZRUZh(gt2,gt1)*TempcplAhhhVZp(:,gt1) 
 End Do 
End Do 
TempcplAhhhVZp = ZcplAhhhVZp 


 ! ## ZcplAhHpcVWp ## 
ZcplAhHpcVWp = 0._dp 
TempcplAhHpcVWp = cplAhHpcVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhHpcVWp(gt2) = ZcplAhHpcVWp(gt2) + ZRUZA(gt2,gt1)*TempcplAhHpcVWp(gt1) 
 End Do 
End Do 
TempcplAhHpcVWp = ZcplAhHpcVWp 


 ! ## ZcplAhcHpVWp ## 
ZcplAhcHpVWp = 0._dp 
TempcplAhcHpVWp = cplAhcHpVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhcHpVWp(gt2) = ZcplAhcHpVWp(gt2) + ZRUZA(gt2,gt1)*TempcplAhcHpVWp(gt1) 
 End Do 
End Do 
TempcplAhcHpVWp = ZcplAhcHpVWp 


 ! ## ZcplhhHpcVWp ## 
ZcplhhHpcVWp = 0._dp 
TempcplhhHpcVWp = cplhhHpcVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHpcVWp(gt2) = ZcplhhHpcVWp(gt2) + ZRUZh(gt2,gt1)*TempcplhhHpcVWp(gt1) 
 End Do 
End Do 
TempcplhhHpcVWp = ZcplhhHpcVWp 


 ! ## ZcplhhcHpVWp ## 
ZcplhhcHpVWp = 0._dp 
TempcplhhcHpVWp = cplhhcHpVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcHpVWp(gt2) = ZcplhhcHpVWp(gt2) + ZRUZh(gt2,gt1)*TempcplhhcHpVWp(gt1) 
 End Do 
End Do 
TempcplhhcHpVWp = ZcplhhcHpVWp 


 ! ## ZcplHpcHpVP ## 
ZcplHpcHpVP = 0._dp 
TempcplHpcHpVP = cplHpcHpVP 
ZcplHpcHpVP = TempcplHpcHpVP 


 ! ## ZcplHpcHpVZ ## 
ZcplHpcHpVZ = 0._dp 
TempcplHpcHpVZ = cplHpcHpVZ 
ZcplHpcHpVZ = TempcplHpcHpVZ 


 ! ## ZcplHpcHpVZp ## 
ZcplHpcHpVZp = 0._dp 
TempcplHpcHpVZp = cplHpcHpVZp 
ZcplHpcHpVZp = TempcplHpcHpVZp 


 ! ## ZcplhhVPVZ ## 
ZcplhhVPVZ = 0._dp 
TempcplhhVPVZ = cplhhVPVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVPVZ(gt2) = ZcplhhVPVZ(gt2) + ZRUZh(gt2,gt1)*TempcplhhVPVZ(gt1) 
 End Do 
End Do 
TempcplhhVPVZ = ZcplhhVPVZ 


 ! ## ZcplhhVPVZp ## 
ZcplhhVPVZp = 0._dp 
TempcplhhVPVZp = cplhhVPVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVPVZp(gt2) = ZcplhhVPVZp(gt2) + ZRUZh(gt2,gt1)*TempcplhhVPVZp(gt1) 
 End Do 
End Do 
TempcplhhVPVZp = ZcplhhVPVZp 


 ! ## ZcplhhcVWpVWp ## 
ZcplhhcVWpVWp = 0._dp 
TempcplhhcVWpVWp = cplhhcVWpVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcVWpVWp(gt2) = ZcplhhcVWpVWp(gt2) + ZRUZh(gt2,gt1)*TempcplhhcVWpVWp(gt1) 
 End Do 
End Do 
TempcplhhcVWpVWp = ZcplhhcVWpVWp 


 ! ## ZcplhhVZVZ ## 
ZcplhhVZVZ = 0._dp 
TempcplhhVZVZ = cplhhVZVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVZVZ(gt2) = ZcplhhVZVZ(gt2) + ZRUZh(gt2,gt1)*TempcplhhVZVZ(gt1) 
 End Do 
End Do 
TempcplhhVZVZ = ZcplhhVZVZ 


 ! ## ZcplhhVZVZp ## 
ZcplhhVZVZp = 0._dp 
TempcplhhVZVZp = cplhhVZVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVZVZp(gt2) = ZcplhhVZVZp(gt2) + ZRUZh(gt2,gt1)*TempcplhhVZVZp(gt1) 
 End Do 
End Do 
TempcplhhVZVZp = ZcplhhVZVZp 


 ! ## ZcplhhVZpVZp ## 
ZcplhhVZpVZp = 0._dp 
TempcplhhVZpVZp = cplhhVZpVZp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVZpVZp(gt2) = ZcplhhVZpVZp(gt2) + ZRUZh(gt2,gt1)*TempcplhhVZpVZp(gt1) 
 End Do 
End Do 
TempcplhhVZpVZp = ZcplhhVZpVZp 


 ! ## ZcplHpcVWpVP ## 
ZcplHpcVWpVP = 0._dp 
TempcplHpcVWpVP = cplHpcVWpVP 
ZcplHpcVWpVP = TempcplHpcVWpVP 


 ! ## ZcplHpcVWpVZ ## 
ZcplHpcVWpVZ = 0._dp 
TempcplHpcVWpVZ = cplHpcVWpVZ 
ZcplHpcVWpVZ = TempcplHpcVWpVZ 


 ! ## ZcplHpcVWpVZp ## 
ZcplHpcVWpVZp = 0._dp 
TempcplHpcVWpVZp = cplHpcVWpVZp 
ZcplHpcVWpVZp = TempcplHpcVWpVZp 


 ! ## ZcplcHpVPVWp ## 
ZcplcHpVPVWp = 0._dp 
TempcplcHpVPVWp = cplcHpVPVWp 
ZcplcHpVPVWp = TempcplcHpVPVWp 


 ! ## ZcplcHpVWpVZ ## 
ZcplcHpVWpVZ = 0._dp 
TempcplcHpVWpVZ = cplcHpVWpVZ 
ZcplcHpVWpVZ = TempcplcHpVWpVZ 


 ! ## ZcplcHpVWpVZp ## 
ZcplcHpVWpVZp = 0._dp 
TempcplcHpVWpVZp = cplcHpVWpVZp 
ZcplcHpVWpVZp = TempcplcHpVWpVZp 


 ! ## ZcplAhAhVPVP ## 
ZcplAhAhVPVP = 0._dp 


 ! ## ZcplAhAhVPVZ ## 
ZcplAhAhVPVZ = 0._dp 


 ! ## ZcplAhAhVPVZp ## 
ZcplAhAhVPVZp = 0._dp 


 ! ## ZcplAhAhcVWpVWp ## 
ZcplAhAhcVWpVWp = 0._dp 


 ! ## ZcplAhAhVZVZ ## 
ZcplAhAhVZVZ = 0._dp 


 ! ## ZcplAhAhVZVZp ## 
ZcplAhAhVZVZp = 0._dp 


 ! ## ZcplAhAhVZpVZp ## 
ZcplAhAhVZpVZp = 0._dp 


 ! ## ZcplAhHpcVWpVP ## 
ZcplAhHpcVWpVP = 0._dp 


 ! ## ZcplAhHpcVWpVZ ## 
ZcplAhHpcVWpVZ = 0._dp 


 ! ## ZcplAhHpcVWpVZp ## 
ZcplAhHpcVWpVZp = 0._dp 


 ! ## ZcplAhcHpVPVWp ## 
ZcplAhcHpVPVWp = 0._dp 


 ! ## ZcplAhcHpVWpVZ ## 
ZcplAhcHpVWpVZ = 0._dp 


 ! ## ZcplAhcHpVWpVZp ## 
ZcplAhcHpVWpVZp = 0._dp 


 ! ## ZcplhhhhVPVP ## 
ZcplhhhhVPVP = 0._dp 


 ! ## ZcplhhhhVPVZ ## 
ZcplhhhhVPVZ = 0._dp 


 ! ## ZcplhhhhVPVZp ## 
ZcplhhhhVPVZp = 0._dp 


 ! ## ZcplhhhhcVWpVWp ## 
ZcplhhhhcVWpVWp = 0._dp 


 ! ## ZcplhhhhVZVZ ## 
ZcplhhhhVZVZ = 0._dp 


 ! ## ZcplhhhhVZVZp ## 
ZcplhhhhVZVZp = 0._dp 


 ! ## ZcplhhhhVZpVZp ## 
ZcplhhhhVZpVZp = 0._dp 


 ! ## ZcplhhHpcVWpVP ## 
ZcplhhHpcVWpVP = 0._dp 


 ! ## ZcplhhHpcVWpVZ ## 
ZcplhhHpcVWpVZ = 0._dp 


 ! ## ZcplhhHpcVWpVZp ## 
ZcplhhHpcVWpVZp = 0._dp 


 ! ## ZcplhhcHpVPVWp ## 
ZcplhhcHpVPVWp = 0._dp 


 ! ## ZcplhhcHpVWpVZ ## 
ZcplhhcHpVWpVZ = 0._dp 


 ! ## ZcplhhcHpVWpVZp ## 
ZcplhhcHpVWpVZp = 0._dp 


 ! ## ZcplHpcHpVPVP ## 
ZcplHpcHpVPVP = 0._dp 


 ! ## ZcplHpcHpVPVZ ## 
ZcplHpcHpVPVZ = 0._dp 


 ! ## ZcplHpcHpVPVZp ## 
ZcplHpcHpVPVZp = 0._dp 


 ! ## ZcplHpcHpcVWpVWp ## 
ZcplHpcHpcVWpVWp = 0._dp 


 ! ## ZcplHpcHpVZVZ ## 
ZcplHpcHpVZVZ = 0._dp 


 ! ## ZcplHpcHpVZVZp ## 
ZcplHpcHpVZVZp = 0._dp 


 ! ## ZcplHpcHpVZpVZp ## 
ZcplHpcHpVZpVZp = 0._dp 


 ! ## ZcplVGVGVG ## 
ZcplVGVGVG = 0._dp 
TempcplVGVGVG = cplVGVGVG 
ZcplVGVGVG = TempcplVGVGVG 


 ! ## ZcplcVWpVPVWp ## 
ZcplcVWpVPVWp = 0._dp 
TempcplcVWpVPVWp = cplcVWpVPVWp 
ZcplcVWpVPVWp = TempcplcVWpVPVWp 


 ! ## ZcplcVWpVWpVZ ## 
ZcplcVWpVWpVZ = 0._dp 
TempcplcVWpVWpVZ = cplcVWpVWpVZ 
ZcplcVWpVWpVZ = TempcplcVWpVWpVZ 


 ! ## ZcplcVWpVWpVZp ## 
ZcplcVWpVWpVZp = 0._dp 
TempcplcVWpVWpVZp = cplcVWpVWpVZp 
ZcplcVWpVWpVZp = TempcplcVWpVWpVZp 


 ! ## ZcplcFdFdAhL ## 
ZcplcFdFdAhL = 0._dp 
TempcplcFdFdAhL = cplcFdFdAhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdAhL(gt2,:,:) = ZcplcFdFdAhL(gt2,:,:) + ZRUUd(gt2,gt1)*TempcplcFdFdAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdAhL(:,gt2,:) = ZcplcFdFdAhL(:,gt2,:) + ZRUVd(gt2,gt1)*TempcplcFdFdAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdAhL(:,:,gt2) = ZcplcFdFdAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdAhR ## 
ZcplcFdFdAhR = 0._dp 
TempcplcFdFdAhR = cplcFdFdAhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdAhR(gt2,:,:) = ZcplcFdFdAhR(gt2,:,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdAhR(:,gt2,:) = ZcplcFdFdAhR(:,gt2,:) + ZRUUdc(gt2,gt1)*TempcplcFdFdAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdAhR(:,:,gt2) = ZcplcFdFdAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFdFdAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhL ## 
ZcplcFeFeAhL = 0._dp 
TempcplcFeFeAhL = cplcFeFeAhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeAhL(gt2,:,:) = ZcplcFeFeAhL(gt2,:,:) + ZRUUe(gt2,gt1)*TempcplcFeFeAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeAhL(:,gt2,:) = ZcplcFeFeAhL(:,gt2,:) + ZRUVe(gt2,gt1)*TempcplcFeFeAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFeAhL(:,:,gt2) = ZcplcFeFeAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFeAhR ## 
ZcplcFeFeAhR = 0._dp 
TempcplcFeFeAhR = cplcFeFeAhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeAhR(gt2,:,:) = ZcplcFeFeAhR(gt2,:,:) + ZRUVec(gt2,gt1)*TempcplcFeFeAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeAhR(:,gt2,:) = ZcplcFeFeAhR(:,gt2,:) + ZRUUec(gt2,gt1)*TempcplcFeFeAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFeAhR(:,:,gt2) = ZcplcFeFeAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFeFeAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhL ## 
ZcplcFuFuAhL = 0._dp 
TempcplcFuFuAhL = cplcFuFuAhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuAhL(gt2,:,:) = ZcplcFuFuAhL(gt2,:,:) + ZRUUu(gt2,gt1)*TempcplcFuFuAhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuAhL(:,gt2,:) = ZcplcFuFuAhL(:,gt2,:) + ZRUVu(gt2,gt1)*TempcplcFuFuAhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuAhL(:,:,gt2) = ZcplcFuFuAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuAhR ## 
ZcplcFuFuAhR = 0._dp 
TempcplcFuFuAhR = cplcFuFuAhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuAhR(gt2,:,:) = ZcplcFuFuAhR(gt2,:,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuAhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuAhR(:,gt2,:) = ZcplcFuFuAhR(:,gt2,:) + ZRUUuc(gt2,gt1)*TempcplcFuFuAhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuAhR(:,:,gt2) = ZcplcFuFuAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplcFuFuAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhL ## 
ZcplFvFvAhL = 0._dp 
TempcplFvFvAhL = cplFvFvAhL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvAhL(gt2,:,:) = ZcplFvFvAhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvAhL(:,gt2,:) = ZcplFvFvAhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvAhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhL = ZcplFvFvAhL 
ZcplFvFvAhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFvAhL(:,:,gt2) = ZcplFvFvAhL(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvAhR ## 
ZcplFvFvAhR = 0._dp 
TempcplFvFvAhR = cplFvFvAhR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvAhR(gt2,:,:) = ZcplFvFvAhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvAhR(:,gt2,:) = ZcplFvFvAhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvAhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvAhR = ZcplFvFvAhR 
ZcplFvFvAhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFvAhR(:,:,gt2) = ZcplFvFvAhR(:,:,gt2) + ZRUZA(gt2,gt1)*TempcplFvFvAhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhL ## 
ZcplcFdFdhhL = 0._dp 
TempcplcFdFdhhL = cplcFdFdhhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdhhL(gt2,:,:) = ZcplcFdFdhhL(gt2,:,:) + ZRUUd(gt2,gt1)*TempcplcFdFdhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdhhL(:,gt2,:) = ZcplcFdFdhhL(:,gt2,:) + ZRUVd(gt2,gt1)*TempcplcFdFdhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdhhL(:,:,gt2) = ZcplcFdFdhhL(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFdFdhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhR ## 
ZcplcFdFdhhR = 0._dp 
TempcplcFdFdhhR = cplcFdFdhhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdhhR(gt2,:,:) = ZcplcFdFdhhR(gt2,:,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdhhR(:,gt2,:) = ZcplcFdFdhhR(:,gt2,:) + ZRUUdc(gt2,gt1)*TempcplcFdFdhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdhhR(:,:,gt2) = ZcplcFdFdhhR(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFdFdhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdHpL ## 
ZcplcFuFdHpL = 0._dp 
TempcplcFuFdHpL = cplcFuFdHpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdHpL(gt2,:) = ZcplcFuFdHpL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFdHpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdHpL = ZcplcFuFdHpL 
ZcplcFuFdHpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdHpL(:,gt2) = ZcplcFuFdHpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFuFdHpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdHpL = ZcplcFuFdHpL 


 ! ## ZcplcFuFdHpR ## 
ZcplcFuFdHpR = 0._dp 
TempcplcFuFdHpR = cplcFuFdHpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdHpR(gt2,:) = ZcplcFuFdHpR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdHpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdHpR = ZcplcFuFdHpR 
ZcplcFuFdHpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdHpR(:,gt2) = ZcplcFuFdHpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFuFdHpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdHpR = ZcplcFuFdHpR 


 ! ## ZcplFvFeHpL ## 
ZcplFvFeHpL = 0._dp 
TempcplFvFeHpL = cplFvFeHpL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFeHpL(gt2,:) = ZcplFvFeHpL(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFeHpL(gt1,:) 
 End Do 
End Do 
TempcplFvFeHpL = ZcplFvFeHpL 
ZcplFvFeHpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFeHpL(:,gt2) = ZcplFvFeHpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplFvFeHpL(:,gt1) 
 End Do 
End Do 
TempcplFvFeHpL = ZcplFvFeHpL 


 ! ## ZcplFvFeHpR ## 
ZcplFvFeHpR = 0._dp 
TempcplFvFeHpR = cplFvFeHpR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFeHpR(gt2,:) = ZcplFvFeHpR(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFeHpR(gt1,:) 
 End Do 
End Do 
TempcplFvFeHpR = ZcplFvFeHpR 
ZcplFvFeHpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFeHpR(:,gt2) = ZcplFvFeHpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplFvFeHpR(:,gt1) 
 End Do 
End Do 
TempcplFvFeHpR = ZcplFvFeHpR 


 ! ## ZcplcFeFehhL ## 
ZcplcFeFehhL = 0._dp 
TempcplcFeFehhL = cplcFeFehhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFehhL(gt2,:,:) = ZcplcFeFehhL(gt2,:,:) + ZRUUe(gt2,gt1)*TempcplcFeFehhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFehhL(:,gt2,:) = ZcplcFeFehhL(:,gt2,:) + ZRUVe(gt2,gt1)*TempcplcFeFehhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFehhL(:,:,gt2) = ZcplcFeFehhL(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFeFehhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhR ## 
ZcplcFeFehhR = 0._dp 
TempcplcFeFehhR = cplcFeFehhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFehhR(gt2,:,:) = ZcplcFeFehhR(gt2,:,:) + ZRUVec(gt2,gt1)*TempcplcFeFehhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFehhR(:,gt2,:) = ZcplcFeFehhR(:,gt2,:) + ZRUUec(gt2,gt1)*TempcplcFeFehhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFehhR(:,:,gt2) = ZcplcFeFehhR(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFeFehhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhL ## 
ZcplcFuFuhhL = 0._dp 
TempcplcFuFuhhL = cplcFuFuhhL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuhhL(gt2,:,:) = ZcplcFuFuhhL(gt2,:,:) + ZRUUu(gt2,gt1)*TempcplcFuFuhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuhhL(:,gt2,:) = ZcplcFuFuhhL(:,gt2,:) + ZRUVu(gt2,gt1)*TempcplcFuFuhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuhhL(:,:,gt2) = ZcplcFuFuhhL(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFuFuhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhR ## 
ZcplcFuFuhhR = 0._dp 
TempcplcFuFuhhR = cplcFuFuhhR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuhhR(gt2,:,:) = ZcplcFuFuhhR(gt2,:,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuhhR(:,gt2,:) = ZcplcFuFuhhR(:,gt2,:) + ZRUUuc(gt2,gt1)*TempcplcFuFuhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuhhR(:,:,gt2) = ZcplcFuFuhhR(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplcFuFuhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFucHpL ## 
ZcplcFdFucHpL = 0._dp 
TempcplcFdFucHpL = cplcFdFucHpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucHpL(gt2,:) = ZcplcFdFucHpL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFucHpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFucHpL = ZcplcFdFucHpL 
ZcplcFdFucHpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucHpL(:,gt2) = ZcplcFdFucHpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFdFucHpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFucHpL = ZcplcFdFucHpL 


 ! ## ZcplcFdFucHpR ## 
ZcplcFdFucHpR = 0._dp 
TempcplcFdFucHpR = cplcFdFucHpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucHpR(gt2,:) = ZcplcFdFucHpR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFucHpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFucHpR = ZcplcFdFucHpR 
ZcplcFdFucHpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucHpR(:,gt2) = ZcplcFdFucHpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFdFucHpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFucHpR = ZcplcFdFucHpR 


 ! ## ZcplFvFvhhL ## 
ZcplFvFvhhL = 0._dp 
TempcplFvFvhhL = cplFvFvhhL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvhhL(gt2,:,:) = ZcplFvFvhhL(gt2,:,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvhhL(:,gt2,:) = ZcplFvFvhhL(:,gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvhhL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhL = ZcplFvFvhhL 
ZcplFvFvhhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFvhhL(:,:,gt2) = ZcplFvFvhhL(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplFvFvhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFvhhR ## 
ZcplFvFvhhR = 0._dp 
TempcplFvFvhhR = cplFvFvhhR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvhhR(gt2,:,:) = ZcplFvFvhhR(gt2,:,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvhhR(:,gt2,:) = ZcplFvFvhhR(:,gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvhhR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFvhhR = ZcplFvFvhhR 
ZcplFvFvhhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplFvFvhhR(:,:,gt2) = ZcplFvFvhhR(:,:,gt2) + ZRUZh(gt2,gt1)*TempcplFvFvhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvcHpL ## 
ZcplcFeFvcHpL = 0._dp 
TempcplcFeFvcHpL = cplcFeFvcHpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvcHpL(gt2,:) = ZcplcFeFvcHpL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFvcHpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHpL = ZcplcFeFvcHpL 
ZcplcFeFvcHpL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplcFeFvcHpL(:,gt2) = ZcplcFeFvcHpL(:,gt2) + ZRUUV(gt2,gt1)*TempcplcFeFvcHpL(:,gt1) 
 End Do 
End Do 
TempcplcFeFvcHpL = ZcplcFeFvcHpL 


 ! ## ZcplcFeFvcHpR ## 
ZcplcFeFvcHpR = 0._dp 
TempcplcFeFvcHpR = cplcFeFvcHpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvcHpR(gt2,:) = ZcplcFeFvcHpR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFvcHpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHpR = ZcplcFeFvcHpR 
ZcplcFeFvcHpR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplcFeFvcHpR(:,gt2) = ZcplcFeFvcHpR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplcFeFvcHpR(:,gt1) 
 End Do 
End Do 
TempcplcFeFvcHpR = ZcplcFeFvcHpR 


 ! ## ZcplcFdFdVGL ## 
ZcplcFdFdVGL = 0._dp 
TempcplcFdFdVGL = cplcFdFdVGL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVGL(gt2,:) = ZcplcFdFdVGL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVGL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 
ZcplcFdFdVGL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVGL(:,gt2) = ZcplcFdFdVGL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVGL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 


 ! ## ZcplcFdFdVGR ## 
ZcplcFdFdVGR = 0._dp 
TempcplcFdFdVGR = cplcFdFdVGR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVGR(gt2,:) = ZcplcFdFdVGR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVGR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 
ZcplcFdFdVGR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVGR(:,gt2) = ZcplcFdFdVGR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVGR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 


 ! ## ZcplcFdFdVPL ## 
ZcplcFdFdVPL = 0._dp 
TempcplcFdFdVPL = cplcFdFdVPL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVPL(gt2,:) = ZcplcFdFdVPL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVPL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 
ZcplcFdFdVPL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVPL(:,gt2) = ZcplcFdFdVPL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVPL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 


 ! ## ZcplcFdFdVPR ## 
ZcplcFdFdVPR = 0._dp 
TempcplcFdFdVPR = cplcFdFdVPR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVPR(gt2,:) = ZcplcFdFdVPR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVPR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 
ZcplcFdFdVPR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVPR(:,gt2) = ZcplcFdFdVPR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVPR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 


 ! ## ZcplcFuFdVWpL ## 
ZcplcFuFdVWpL = 0._dp 
TempcplcFuFdVWpL = cplcFuFdVWpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdVWpL(gt2,:) = ZcplcFuFdVWpL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdVWpL = ZcplcFuFdVWpL 
ZcplcFuFdVWpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdVWpL(:,gt2) = ZcplcFuFdVWpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFuFdVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdVWpL = ZcplcFuFdVWpL 


 ! ## ZcplcFuFdVWpR ## 
ZcplcFuFdVWpR = 0._dp 
TempcplcFuFdVWpR = cplcFuFdVWpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdVWpR(gt2,:) = ZcplcFuFdVWpR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFdVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdVWpR = ZcplcFuFdVWpR 
ZcplcFuFdVWpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFdVWpR(:,gt2) = ZcplcFuFdVWpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFuFdVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdVWpR = ZcplcFuFdVWpR 


 ! ## ZcplcFdFdVZL ## 
ZcplcFdFdVZL = 0._dp 
TempcplcFdFdVZL = cplcFdFdVZL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZL(gt2,:) = ZcplcFdFdVZL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVZL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 
ZcplcFdFdVZL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZL(:,gt2) = ZcplcFdFdVZL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVZL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 


 ! ## ZcplcFdFdVZR ## 
ZcplcFdFdVZR = 0._dp 
TempcplcFdFdVZR = cplcFdFdVZR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZR(gt2,:) = ZcplcFdFdVZR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVZR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 
ZcplcFdFdVZR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZR(:,gt2) = ZcplcFdFdVZR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVZR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 


 ! ## ZcplcFdFdVZpL ## 
ZcplcFdFdVZpL = 0._dp 
TempcplcFdFdVZpL = cplcFdFdVZpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZpL(gt2,:) = ZcplcFdFdVZpL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZpL = ZcplcFdFdVZpL 
ZcplcFdFdVZpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZpL(:,gt2) = ZcplcFdFdVZpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZpL = ZcplcFdFdVZpL 


 ! ## ZcplcFdFdVZpR ## 
ZcplcFdFdVZpR = 0._dp 
TempcplcFdFdVZpR = cplcFdFdVZpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZpR(gt2,:) = ZcplcFdFdVZpR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZpR = ZcplcFdFdVZpR 
ZcplcFdFdVZpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFdVZpR(:,gt2) = ZcplcFdFdVZpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZpR = ZcplcFdFdVZpR 


 ! ## ZcplFvFeVWpL ## 
ZcplFvFeVWpL = 0._dp 
TempcplFvFeVWpL = cplFvFeVWpL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFeVWpL(gt2,:) = ZcplFvFeVWpL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFeVWpL(gt1,:) 
 End Do 
End Do 
TempcplFvFeVWpL = ZcplFvFeVWpL 
ZcplFvFeVWpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFeVWpL(:,gt2) = ZcplFvFeVWpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplFvFeVWpL(:,gt1) 
 End Do 
End Do 
TempcplFvFeVWpL = ZcplFvFeVWpL 


 ! ## ZcplFvFeVWpR ## 
ZcplFvFeVWpR = 0._dp 
TempcplFvFeVWpR = cplFvFeVWpR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFeVWpR(gt2,:) = ZcplFvFeVWpR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFeVWpR(gt1,:) 
 End Do 
End Do 
TempcplFvFeVWpR = ZcplFvFeVWpR 
ZcplFvFeVWpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplFvFeVWpR(:,gt2) = ZcplFvFeVWpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplFvFeVWpR(:,gt1) 
 End Do 
End Do 
TempcplFvFeVWpR = ZcplFvFeVWpR 


 ! ## ZcplcFeFeVPL ## 
ZcplcFeFeVPL = 0._dp 
TempcplcFeFeVPL = cplcFeFeVPL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVPL(gt2,:) = ZcplcFeFeVPL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVPL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 
ZcplcFeFeVPL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVPL(:,gt2) = ZcplcFeFeVPL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVPL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 


 ! ## ZcplcFeFeVPR ## 
ZcplcFeFeVPR = 0._dp 
TempcplcFeFeVPR = cplcFeFeVPR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVPR(gt2,:) = ZcplcFeFeVPR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVPR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 
ZcplcFeFeVPR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVPR(:,gt2) = ZcplcFeFeVPR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVPR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 


 ! ## ZcplcFeFeVZL ## 
ZcplcFeFeVZL = 0._dp 
TempcplcFeFeVZL = cplcFeFeVZL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZL(gt2,:) = ZcplcFeFeVZL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVZL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 
ZcplcFeFeVZL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZL(:,gt2) = ZcplcFeFeVZL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVZL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 


 ! ## ZcplcFeFeVZR ## 
ZcplcFeFeVZR = 0._dp 
TempcplcFeFeVZR = cplcFeFeVZR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZR(gt2,:) = ZcplcFeFeVZR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVZR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 
ZcplcFeFeVZR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZR(:,gt2) = ZcplcFeFeVZR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVZR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 


 ! ## ZcplcFeFeVZpL ## 
ZcplcFeFeVZpL = 0._dp 
TempcplcFeFeVZpL = cplcFeFeVZpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZpL(gt2,:) = ZcplcFeFeVZpL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZpL = ZcplcFeFeVZpL 
ZcplcFeFeVZpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZpL(:,gt2) = ZcplcFeFeVZpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZpL = ZcplcFeFeVZpL 


 ! ## ZcplcFeFeVZpR ## 
ZcplcFeFeVZpR = 0._dp 
TempcplcFeFeVZpR = cplcFeFeVZpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZpR(gt2,:) = ZcplcFeFeVZpR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZpR = ZcplcFeFeVZpR 
ZcplcFeFeVZpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFeVZpR(:,gt2) = ZcplcFeFeVZpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZpR = ZcplcFeFeVZpR 


 ! ## ZcplcFuFuVGL ## 
ZcplcFuFuVGL = 0._dp 
TempcplcFuFuVGL = cplcFuFuVGL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVGL(gt2,:) = ZcplcFuFuVGL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVGL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 
ZcplcFuFuVGL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVGL(:,gt2) = ZcplcFuFuVGL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVGL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 


 ! ## ZcplcFuFuVGR ## 
ZcplcFuFuVGR = 0._dp 
TempcplcFuFuVGR = cplcFuFuVGR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVGR(gt2,:) = ZcplcFuFuVGR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVGR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 
ZcplcFuFuVGR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVGR(:,gt2) = ZcplcFuFuVGR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVGR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 


 ! ## ZcplcFuFuVPL ## 
ZcplcFuFuVPL = 0._dp 
TempcplcFuFuVPL = cplcFuFuVPL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVPL(gt2,:) = ZcplcFuFuVPL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVPL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 
ZcplcFuFuVPL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVPL(:,gt2) = ZcplcFuFuVPL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVPL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 


 ! ## ZcplcFuFuVPR ## 
ZcplcFuFuVPR = 0._dp 
TempcplcFuFuVPR = cplcFuFuVPR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVPR(gt2,:) = ZcplcFuFuVPR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVPR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 
ZcplcFuFuVPR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVPR(:,gt2) = ZcplcFuFuVPR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVPR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 


 ! ## ZcplcFuFuVZL ## 
ZcplcFuFuVZL = 0._dp 
TempcplcFuFuVZL = cplcFuFuVZL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZL(gt2,:) = ZcplcFuFuVZL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVZL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 
ZcplcFuFuVZL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZL(:,gt2) = ZcplcFuFuVZL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVZL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 


 ! ## ZcplcFuFuVZR ## 
ZcplcFuFuVZR = 0._dp 
TempcplcFuFuVZR = cplcFuFuVZR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZR(gt2,:) = ZcplcFuFuVZR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVZR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 
ZcplcFuFuVZR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZR(:,gt2) = ZcplcFuFuVZR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVZR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 


 ! ## ZcplcFuFuVZpL ## 
ZcplcFuFuVZpL = 0._dp 
TempcplcFuFuVZpL = cplcFuFuVZpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZpL(gt2,:) = ZcplcFuFuVZpL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVZpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZpL = ZcplcFuFuVZpL 
ZcplcFuFuVZpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZpL(:,gt2) = ZcplcFuFuVZpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVZpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZpL = ZcplcFuFuVZpL 


 ! ## ZcplcFuFuVZpR ## 
ZcplcFuFuVZpR = 0._dp 
TempcplcFuFuVZpR = cplcFuFuVZpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZpR(gt2,:) = ZcplcFuFuVZpR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVZpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZpR = ZcplcFuFuVZpR 
ZcplcFuFuVZpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFuFuVZpR(:,gt2) = ZcplcFuFuVZpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVZpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZpR = ZcplcFuFuVZpR 


 ! ## ZcplcFdFucVWpL ## 
ZcplcFdFucVWpL = 0._dp 
TempcplcFdFucVWpL = cplcFdFucVWpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucVWpL(gt2,:) = ZcplcFdFucVWpL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFucVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFucVWpL = ZcplcFdFucVWpL 
ZcplcFdFucVWpL = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucVWpL(:,gt2) = ZcplcFdFucVWpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFdFucVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFucVWpL = ZcplcFdFucVWpL 


 ! ## ZcplcFdFucVWpR ## 
ZcplcFdFucVWpR = 0._dp 
TempcplcFdFucVWpR = cplcFdFucVWpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucVWpR(gt2,:) = ZcplcFdFucVWpR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFucVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFucVWpR = ZcplcFdFucVWpR 
ZcplcFdFucVWpR = 0._dp 
Do gt1=1,6
  Do gt2=1,6
ZcplcFdFucVWpR(:,gt2) = ZcplcFdFucVWpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFdFucVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFucVWpR = ZcplcFdFucVWpR 


 ! ## ZcplFvFvVPL ## 
ZcplFvFvVPL = 0._dp 
TempcplFvFvVPL = cplFvFvVPL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVPL(gt2,:) = ZcplFvFvVPL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVPL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVPL = ZcplFvFvVPL 
ZcplFvFvVPL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVPL(:,gt2) = ZcplFvFvVPL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVPL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVPL = ZcplFvFvVPL 


 ! ## ZcplFvFvVPR ## 
ZcplFvFvVPR = 0._dp 
TempcplFvFvVPR = cplFvFvVPR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVPR(gt2,:) = ZcplFvFvVPR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVPR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVPR = ZcplFvFvVPR 
ZcplFvFvVPR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVPR(:,gt2) = ZcplFvFvVPR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVPR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVPR = ZcplFvFvVPR 


 ! ## ZcplFvFvVZL ## 
ZcplFvFvVZL = 0._dp 
TempcplFvFvVZL = cplFvFvVZL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZL(gt2,:) = ZcplFvFvVZL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVZL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 
ZcplFvFvVZL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZL(:,gt2) = ZcplFvFvVZL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVZL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 


 ! ## ZcplFvFvVZR ## 
ZcplFvFvVZR = 0._dp 
TempcplFvFvVZR = cplFvFvVZR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZR(gt2,:) = ZcplFvFvVZR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVZR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 
ZcplFvFvVZR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZR(:,gt2) = ZcplFvFvVZR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVZR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 


 ! ## ZcplFvFvVZpL ## 
ZcplFvFvVZpL = 0._dp 
TempcplFvFvVZpL = cplFvFvVZpL 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZpL(gt2,:) = ZcplFvFvVZpL(gt2,:) + ZRUUVc(gt2,gt1)*TempcplFvFvVZpL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZpL = ZcplFvFvVZpL 
ZcplFvFvVZpL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZpL(:,gt2) = ZcplFvFvVZpL(:,gt2) + ZRUUV(gt2,gt1)*TempcplFvFvVZpL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZpL = ZcplFvFvVZpL 


 ! ## ZcplFvFvVZpR ## 
ZcplFvFvVZpR = 0._dp 
TempcplFvFvVZpR = cplFvFvVZpR 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZpR(gt2,:) = ZcplFvFvVZpR(gt2,:) + ZRUUV(gt2,gt1)*TempcplFvFvVZpR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZpR = ZcplFvFvVZpR 
ZcplFvFvVZpR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplFvFvVZpR(:,gt2) = ZcplFvFvVZpR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplFvFvVZpR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZpR = ZcplFvFvVZpR 


 ! ## ZcplcFeFvcVWpL ## 
ZcplcFeFvcVWpL = 0._dp 
TempcplcFeFvcVWpL = cplcFeFvcVWpL 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvcVWpL(gt2,:) = ZcplcFeFvcVWpL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFvcVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcVWpL = ZcplcFeFvcVWpL 
ZcplcFeFvcVWpL = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplcFeFvcVWpL(:,gt2) = ZcplcFeFvcVWpL(:,gt2) + ZRUUV(gt2,gt1)*TempcplcFeFvcVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFeFvcVWpL = ZcplcFeFvcVWpL 


 ! ## ZcplcFeFvcVWpR ## 
ZcplcFeFvcVWpR = 0._dp 
TempcplcFeFvcVWpR = cplcFeFvcVWpR 
Do gt1=1,6
  Do gt2=1,6
ZcplcFeFvcVWpR(gt2,:) = ZcplcFeFvcVWpR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFvcVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvcVWpR = ZcplcFeFvcVWpR 
ZcplcFeFvcVWpR = 0._dp 
Do gt1=1,9
  Do gt2=1,9
ZcplcFeFvcVWpR(:,gt2) = ZcplcFeFvcVWpR(:,gt2) + ZRUUVc(gt2,gt1)*TempcplcFeFvcVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFeFvcVWpR = ZcplcFeFvcVWpR 


 ! ## ZcplVGVGVGVG1 ## 
ZcplVGVGVGVG1 = 0._dp 


 ! ## ZcplVGVGVGVG2 ## 
ZcplVGVGVGVG2 = 0._dp 


 ! ## ZcplVGVGVGVG3 ## 
ZcplVGVGVGVG3 = 0._dp 


 ! ## ZcplcVWpVPVPVWp1 ## 
ZcplcVWpVPVPVWp1 = 0._dp 


 ! ## ZcplcVWpVPVPVWp2 ## 
ZcplcVWpVPVPVWp2 = 0._dp 


 ! ## ZcplcVWpVPVPVWp3 ## 
ZcplcVWpVPVPVWp3 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ1 ## 
ZcplcVWpVPVWpVZ1 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ2 ## 
ZcplcVWpVPVWpVZ2 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ3 ## 
ZcplcVWpVPVWpVZ3 = 0._dp 


 ! ## ZcplcVWpVPVWpVZp1 ## 
ZcplcVWpVPVWpVZp1 = 0._dp 


 ! ## ZcplcVWpVPVWpVZp2 ## 
ZcplcVWpVPVWpVZp2 = 0._dp 


 ! ## ZcplcVWpVPVWpVZp3 ## 
ZcplcVWpVPVWpVZp3 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp1 ## 
ZcplcVWpcVWpVWpVWp1 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp2 ## 
ZcplcVWpcVWpVWpVWp2 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp3 ## 
ZcplcVWpcVWpVWpVWp3 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ1 ## 
ZcplcVWpVWpVZVZ1 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ2 ## 
ZcplcVWpVWpVZVZ2 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ3 ## 
ZcplcVWpVWpVZVZ3 = 0._dp 


 ! ## ZcplcVWpVWpVZVZp1 ## 
ZcplcVWpVWpVZVZp1 = 0._dp 


 ! ## ZcplcVWpVWpVZVZp2 ## 
ZcplcVWpVWpVZVZp2 = 0._dp 


 ! ## ZcplcVWpVWpVZVZp3 ## 
ZcplcVWpVWpVZVZp3 = 0._dp 


 ! ## ZcplcVWpVWpVZpVZp1 ## 
ZcplcVWpVWpVZpVZp1 = 0._dp 


 ! ## ZcplcVWpVWpVZpVZp2 ## 
ZcplcVWpVWpVZpVZp2 = 0._dp 


 ! ## ZcplcVWpVWpVZpVZp3 ## 
ZcplcVWpVWpVZpVZp3 = 0._dp 


 ! ## ZcplcgGgGVG ## 
ZcplcgGgGVG = 0._dp 
TempcplcgGgGVG = cplcgGgGVG 
ZcplcgGgGVG = TempcplcgGgGVG 


 ! ## ZcplcgWpgAVWp ## 
ZcplcgWpgAVWp = 0._dp 
TempcplcgWpgAVWp = cplcgWpgAVWp 
ZcplcgWpgAVWp = TempcplcgWpgAVWp 


 ! ## ZcplcgWCgAcVWp ## 
ZcplcgWCgAcVWp = 0._dp 
TempcplcgWCgAcVWp = cplcgWCgAcVWp 
ZcplcgWCgAcVWp = TempcplcgWCgAcVWp 


 ! ## ZcplcgWpgWpVP ## 
ZcplcgWpgWpVP = 0._dp 
TempcplcgWpgWpVP = cplcgWpgWpVP 
ZcplcgWpgWpVP = TempcplcgWpgWpVP 


 ! ## ZcplcgWpgWpVZ ## 
ZcplcgWpgWpVZ = 0._dp 
TempcplcgWpgWpVZ = cplcgWpgWpVZ 
ZcplcgWpgWpVZ = TempcplcgWpgWpVZ 


 ! ## ZcplcgWpgWpVZp ## 
ZcplcgWpgWpVZp = 0._dp 
TempcplcgWpgWpVZp = cplcgWpgWpVZp 
ZcplcgWpgWpVZp = TempcplcgWpgWpVZp 


 ! ## ZcplcgAgWpcVWp ## 
ZcplcgAgWpcVWp = 0._dp 
TempcplcgAgWpcVWp = cplcgAgWpcVWp 
ZcplcgAgWpcVWp = TempcplcgAgWpcVWp 


 ! ## ZcplcgZgWpcVWp ## 
ZcplcgZgWpcVWp = 0._dp 
TempcplcgZgWpcVWp = cplcgZgWpcVWp 
ZcplcgZgWpcVWp = TempcplcgZgWpcVWp 


 ! ## ZcplcgZpgWpcVWp ## 
ZcplcgZpgWpcVWp = 0._dp 
TempcplcgZpgWpcVWp = cplcgZpgWpcVWp 
ZcplcgZpgWpcVWp = TempcplcgZpgWpcVWp 


 ! ## ZcplcgWCgWCVP ## 
ZcplcgWCgWCVP = 0._dp 
TempcplcgWCgWCVP = cplcgWCgWCVP 
ZcplcgWCgWCVP = TempcplcgWCgWCVP 


 ! ## ZcplcgAgWCVWp ## 
ZcplcgAgWCVWp = 0._dp 
TempcplcgAgWCVWp = cplcgAgWCVWp 
ZcplcgAgWCVWp = TempcplcgAgWCVWp 


 ! ## ZcplcgZgWCVWp ## 
ZcplcgZgWCVWp = 0._dp 
TempcplcgZgWCVWp = cplcgZgWCVWp 
ZcplcgZgWCVWp = TempcplcgZgWCVWp 


 ! ## ZcplcgZpgWCVWp ## 
ZcplcgZpgWCVWp = 0._dp 
TempcplcgZpgWCVWp = cplcgZpgWCVWp 
ZcplcgZpgWCVWp = TempcplcgZpgWCVWp 


 ! ## ZcplcgWCgWCVZ ## 
ZcplcgWCgWCVZ = 0._dp 
TempcplcgWCgWCVZ = cplcgWCgWCVZ 
ZcplcgWCgWCVZ = TempcplcgWCgWCVZ 


 ! ## ZcplcgWCgWCVZp ## 
ZcplcgWCgWCVZp = 0._dp 
TempcplcgWCgWCVZp = cplcgWCgWCVZp 
ZcplcgWCgWCVZp = TempcplcgWCgWCVZp 


 ! ## ZcplcgWpgZVWp ## 
ZcplcgWpgZVWp = 0._dp 
TempcplcgWpgZVWp = cplcgWpgZVWp 
ZcplcgWpgZVWp = TempcplcgWpgZVWp 


 ! ## ZcplcgWCgZcVWp ## 
ZcplcgWCgZcVWp = 0._dp 
TempcplcgWCgZcVWp = cplcgWCgZcVWp 
ZcplcgWCgZcVWp = TempcplcgWCgZcVWp 


 ! ## ZcplcgWpgZpVWp ## 
ZcplcgWpgZpVWp = 0._dp 
TempcplcgWpgZpVWp = cplcgWpgZpVWp 
ZcplcgWpgZpVWp = TempcplcgWpgZpVWp 


 ! ## ZcplcgWCgZpcVWp ## 
ZcplcgWCgZpcVWp = 0._dp 
TempcplcgWCgZpcVWp = cplcgWCgZpcVWp 
ZcplcgWCgZpcVWp = TempcplcgWCgZpcVWp 


 ! ## ZcplcgWpgWpAh ## 
ZcplcgWpgWpAh = 0._dp 
TempcplcgWpgWpAh = cplcgWpgWpAh 
ZcplcgWpgWpAh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpgWpAh(gt2) = ZcplcgWpgWpAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWpgWpAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWCgWCAh ## 
ZcplcgWCgWCAh = 0._dp 
TempcplcgWCgWCAh = cplcgWCgWCAh 
ZcplcgWCgWCAh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWCgWCAh(gt2) = ZcplcgWCgWCAh(gt2) + ZRUZA(gt2,gt1)*TempcplcgWCgWCAh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgAhh ## 
ZcplcgZgAhh = 0._dp 
TempcplcgZgAhh = cplcgZgAhh 
ZcplcgZgAhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgAhh(gt2) = ZcplcgZgAhh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgAhh ## 
ZcplcgZpgAhh = 0._dp 
TempcplcgZpgAhh = cplcgZpgAhh 
ZcplcgZpgAhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZpgAhh(gt2) = ZcplcgZpgAhh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZpgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgAHp ## 
ZcplcgWpgAHp = 0._dp 
TempcplcgWpgAHp = cplcgWpgAHp 
ZcplcgWpgAHp = TempcplcgWpgAHp 


 ! ## ZcplcgWCgAcHp ## 
ZcplcgWCgAcHp = 0._dp 
TempcplcgWCgAcHp = cplcgWCgAcHp 
ZcplcgWCgAcHp = TempcplcgWCgAcHp 


 ! ## ZcplcgWpgWphh ## 
ZcplcgWpgWphh = 0._dp 
TempcplcgWpgWphh = cplcgWpgWphh 
ZcplcgWpgWphh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpgWphh(gt2) = ZcplcgWpgWphh(gt2) + ZRUZh(gt2,gt1)*TempcplcgWpgWphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWpcHp ## 
ZcplcgZgWpcHp = 0._dp 
TempcplcgZgWpcHp = cplcgZgWpcHp 
ZcplcgZgWpcHp = TempcplcgZgWpcHp 


 ! ## ZcplcgZpgWpcHp ## 
ZcplcgZpgWpcHp = 0._dp 
TempcplcgZpgWpcHp = cplcgZpgWpcHp 
ZcplcgZpgWpcHp = TempcplcgZpgWpcHp 


 ! ## ZcplcgWCgWChh ## 
ZcplcgWCgWChh = 0._dp 
TempcplcgWCgWChh = cplcgWCgWChh 
ZcplcgWCgWChh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWCgWChh(gt2) = ZcplcgWCgWChh(gt2) + ZRUZh(gt2,gt1)*TempcplcgWCgWChh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWCHp ## 
ZcplcgZgWCHp = 0._dp 
TempcplcgZgWCHp = cplcgZgWCHp 
ZcplcgZgWCHp = TempcplcgZgWCHp 


 ! ## ZcplcgZpgWCHp ## 
ZcplcgZpgWCHp = 0._dp 
TempcplcgZpgWCHp = cplcgZpgWCHp 
ZcplcgZpgWCHp = TempcplcgZpgWCHp 


 ! ## ZcplcgZgZhh ## 
ZcplcgZgZhh = 0._dp 
TempcplcgZgZhh = cplcgZgZhh 
ZcplcgZgZhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgZhh(gt2) = ZcplcgZgZhh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgZhh ## 
ZcplcgZpgZhh = 0._dp 
TempcplcgZpgZhh = cplcgZpgZhh 
ZcplcgZpgZhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZpgZhh(gt2) = ZcplcgZpgZhh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZpgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgZHp ## 
ZcplcgWpgZHp = 0._dp 
TempcplcgWpgZHp = cplcgWpgZHp 
ZcplcgWpgZHp = TempcplcgWpgZHp 


 ! ## ZcplcgWCgZcHp ## 
ZcplcgWCgZcHp = 0._dp 
TempcplcgWCgZcHp = cplcgWCgZcHp 
ZcplcgWCgZcHp = TempcplcgWCgZcHp 


 ! ## ZcplcgZgZphh ## 
ZcplcgZgZphh = 0._dp 
TempcplcgZgZphh = cplcgZgZphh 
ZcplcgZgZphh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgZphh(gt2) = ZcplcgZgZphh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZgZphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZpgZphh ## 
ZcplcgZpgZphh = 0._dp 
TempcplcgZpgZphh = cplcgZpgZphh 
ZcplcgZpgZphh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZpgZphh(gt2) = ZcplcgZpgZphh(gt2) + ZRUZh(gt2,gt1)*TempcplcgZpgZphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgZpHp ## 
ZcplcgWpgZpHp = 0._dp 
TempcplcgWpgZpHp = cplcgWpgZpHp 
ZcplcgWpgZpHp = TempcplcgWpgZpHp 


 ! ## ZcplcgWCgZpcHp ## 
ZcplcgWCgZpcHp = 0._dp 
TempcplcgWCgZpcHp = cplcgWCgZpcHp 
ZcplcgWCgZpcHp = TempcplcgWCgZpcHp 
End Subroutine  getZCouplings 

Subroutine getGBCouplings(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,               & 
& MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,              & 
& MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,cplcFdFucVWpL,       & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcHpVPVWp,       & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFeFvcVWpL,     & 
& ZcplcFeFvcVWpR,ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplcHpVWpVZp,    & 
& ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcVWpVWpVZp,ZcplFvFeVWpL,ZcplFvFeVWpR,ZcplhhcHpVWp,     & 
& ZcplhhcVWpVWp,GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,         & 
& GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,          & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL,GcplcFuFdHpR,GcplFvFeHpL,         & 
& GcplFvFeHpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GZcplhhHpcHp,      & 
& GZcplAhHpcVWp,GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,GZcplHpcHpVZ,     & 
& GZcplHpcHpVZp,GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplHpcVWpVZp,GZcplcHpVPVWp,GZcplcHpVWpVZ,  & 
& GZcplcHpVWpVZp,GZcplcFuFdHpL,GZcplcFuFdHpR,GZcplFvFeHpL,GZcplFvFeHpR,GZcplcFdFucHpL,   & 
& GZcplcFdFucHpR,GZcplcFeFvcHpL,GZcplcFeFvcHpR,GosZcplhhHpcHp,GosZcplAhHpcVWp,           & 
& GosZcplAhcHpVWp,GosZcplhhHpcVWp,GosZcplhhcHpVWp,GosZcplHpcHpVP,GosZcplHpcHpVZ,         & 
& GosZcplHpcHpVZp,GosZcplHpcVWpVP,GosZcplHpcVWpVZ,GosZcplHpcVWpVZp,GosZcplcHpVPVWp,      & 
& GosZcplcHpVWpVZ,GosZcplcHpVWpVZp,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplFvFeHpL,       & 
& GosZcplFvFeHpR,GosZcplcFdFucHpL,GosZcplcFdFucHpR,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR)

Implicit None

Real(dp), Intent(in) :: MhhOS(2),Mhh2OS(2),MAhOS(2),MAh2OS(2),MFdOS(6),MFd2OS(6),MFuOS(6),MFu2OS(6),          & 
& MFeOS(6),MFe2OS(6),MFvOS(9),MFv2OS(9),MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,        & 
& MVWpOS,MVWp2OS,ZHOS(2,2),ZAOS(2,2)

Complex(dp), Intent(in) :: ZDLOS(6,6),ZDROS(6,6),ZULOS(6,6),ZUROS(6,6),ZELOS(6,6),ZEROS(6,6),UVOS(9,9)

Real(dp), Intent(in) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp), Intent(in) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Complex(dp), Intent(in) :: cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),          & 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,              & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),             & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),ZcplcFdFucVWpL(6,6),ZcplcFdFucVWpR(6,6),ZcplcFeFvcVWpL(6,9),& 
& ZcplcFeFvcVWpR(6,9),ZcplcFuFdVWpL(6,6),ZcplcFuFdVWpR(6,6),ZcplcHpVPVWp,ZcplcHpVWpVZ,   & 
& ZcplcHpVWpVZp,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcVWpVWpVZp,ZcplFvFeVWpL(9,6),            & 
& ZcplFvFeVWpR(9,6),ZcplhhcHpVWp(2),ZcplhhcVWpVWp(2)

Integer :: gt1, gt2, gt3, i1, i2
Complex(dp), Intent(out) :: GcplhhHpcHp(2),GcplAhHpcVWp(2),GcplAhcHpVWp(2),GcplhhHpcVWp(2),GcplhhcHpVWp(2),       & 
& GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,          & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL(6,6),GcplcFuFdHpR(6,6),           & 
& GcplFvFeHpL(9,6),GcplFvFeHpR(9,6),GcplcFdFucHpL(6,6),GcplcFdFucHpR(6,6),               & 
& GcplcFeFvcHpL(6,9),GcplcFeFvcHpR(6,9)

Complex(dp), Intent(out) :: GZcplhhHpcHp(2),GZcplAhHpcVWp(2),GZcplAhcHpVWp(2),GZcplhhHpcVWp(2),GZcplhhcHpVWp(2),  & 
& GZcplHpcHpVP,GZcplHpcHpVZ,GZcplHpcHpVZp,GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplHpcVWpVZp,    & 
& GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcHpVWpVZp,GZcplcFuFdHpL(6,6),GZcplcFuFdHpR(6,6),      & 
& GZcplFvFeHpL(9,6),GZcplFvFeHpR(9,6),GZcplcFdFucHpL(6,6),GZcplcFdFucHpR(6,6),           & 
& GZcplcFeFvcHpL(6,9),GZcplcFeFvcHpR(6,9)

Complex(dp), Intent(out) :: GosZcplhhHpcHp(2),GosZcplAhHpcVWp(2),GosZcplAhcHpVWp(2),GosZcplhhHpcVWp(2),           & 
& GosZcplhhcHpVWp(2),GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcHpVZp,GosZcplHpcVWpVP,      & 
& GosZcplHpcVWpVZ,GosZcplHpcVWpVZp,GosZcplcHpVPVWp,GosZcplcHpVWpVZ,GosZcplcHpVWpVZp,     & 
& GosZcplcFuFdHpL(6,6),GosZcplcFuFdHpR(6,6),GosZcplFvFeHpL(9,6),GosZcplFvFeHpR(9,6),     & 
& GosZcplcFdFucHpL(6,6),GosZcplcFdFucHpR(6,6),GosZcplcFeFvcHpL(6,9),GosZcplcFeFvcHpR(6,9)

Do i1=1,2
GcplhhHpcHp(i1) = (1)*(Mhh2OS(i1) - MHp2OS)/MVWpOS*cplhhcHpVWp(i1)
GosZcplhhHpcHp(i1) = (1)*(Mhh2OS(i1) - MHp2OS)/MVWpOS*ZcplhhcHpVWp(i1)
GZcplhhHpcHp(i1) = (1)*(Mhh2(i1) - MHp2)/MVWp*ZcplhhcHpVWp(i1)
End Do 
Do i1=1,2
GcplAhHpcVWp(i1) = 0._dp 
GosZcplAhHpcVWp(i1) = 0._dp
GZcplAhHpcVWp(i1) = 0._dp
End Do 
Do i1=1,2
GcplAhcHpVWp(i1) = 0._dp 
GosZcplAhcHpVWp(i1) = 0._dp
GZcplAhcHpVWp(i1) = 0._dp
End Do 
Do i1=1,2
GcplhhHpcVWp(i1) = 0.5_dp*(1)/MVWpOS*cplhhcVWpVWp(i1)
GosZcplhhHpcVWp(i1) = 0.5_dp*(1)/MVWpOS*ZcplhhcVWpVWp(i1)
GZcplhhHpcVWp(i1) = 0.5_dp*(1)/MVWp*ZcplhhcVWpVWp(i1)
End Do 
Do i1=1,2
GcplhhcHpVWp(i1) = 0.5_dp*(1)/MVWpOS*cplhhcVWpVWp(i1)
GosZcplhhcHpVWp(i1) = 0.5_dp*(1)/MVWpOS*ZcplhhcVWpVWp(i1)
GZcplhhcHpVWp(i1) = 0.5_dp*(1)/MVWp*ZcplhhcVWpVWp(i1)
End Do 
GcplHpcHpVP = 0.5_dp*(1)/MVWpOS*cplcHpVPVWp
GosZcplHpcHpVP = 0.5_dp*(1)/MVWpOS*ZcplcHpVPVWp
GZcplHpcHpVP = 0.5_dp*(1)/MVWp*ZcplcHpVPVWp
GcplHpcHpVZ = 0.5_dp*(1)/MVWpOS*cplcHpVWpVZ
GosZcplHpcHpVZ = 0.5_dp*(1)/MVWpOS*ZcplcHpVWpVZ
GZcplHpcHpVZ = 0.5_dp*(1)/MVWp*ZcplcHpVWpVZ
GcplHpcHpVZp = 0.5_dp*(1)/MVWpOS*cplcHpVWpVZp
GosZcplHpcHpVZp = 0.5_dp*(1)/MVWpOS*ZcplcHpVWpVZp
GZcplHpcHpVZp = 0.5_dp*(1)/MVWp*ZcplcHpVWpVZp
GcplHpcVWpVP = (-1)*(MVWp2OS - 0._dp)/MVWpOS*cplcVWpVPVWp
GosZcplHpcVWpVP = (-1)*(MVWp2OS - 0._dp)/MVWpOS*ZcplcVWpVPVWp
GZcplHpcVWpVP = (-1)*(MVWp2 - 0._dp)/MVWpOS*ZcplcVWpVPVWp 
GcplHpcVWpVZ = (1)*(MVWp2OS - MVZ2OS)/MVWpOS*cplcVWpVWpVZ
GosZcplHpcVWpVZ = (1)*(MVWp2OS - MVZ2OS)/MVWpOS*ZcplcVWpVWpVZ
GZcplHpcVWpVZ = (1)*(MVWp2 - MVZ2)/MVWpOS*ZcplcVWpVWpVZ 
GcplHpcVWpVZp = (1)*(MVWp2OS - MVZp2OS)/MVWpOS*cplcVWpVWpVZp
GosZcplHpcVWpVZp = (1)*(MVWp2OS - MVZp2OS)/MVWpOS*ZcplcVWpVWpVZp
GZcplHpcVWpVZp = (1)*(MVWp2 - MVZp2)/MVWpOS*ZcplcVWpVWpVZp 
GcplcHpVPVWp = (-1)*(0._dp - MVWp2OS)/MVWpOS*cplcVWpVPVWp
GosZcplcHpVPVWp = (-1)*(0._dp - MVWp2OS)/MVWpOS*ZcplcVWpVPVWp
GZcplcHpVPVWp = (-1)*(0._dp - MVWp2)/MVWpOS*ZcplcVWpVPVWp 
GcplcHpVWpVZ = (-1)*(MVWp2OS - MVZ2OS)/MVWpOS*cplcVWpVWpVZ
GosZcplcHpVWpVZ = (-1)*(MVWp2OS - MVZ2OS)/MVWpOS*ZcplcVWpVWpVZ
GZcplcHpVWpVZ = (-1)*(MVWp2 - MVZ2)/MVWpOS*ZcplcVWpVWpVZ 
GcplcHpVWpVZp = (-1)*(MVWp2OS - MVZp2OS)/MVWpOS*cplcVWpVWpVZp
GosZcplcHpVWpVZp = (-1)*(MVWp2OS - MVZp2OS)/MVWpOS*ZcplcVWpVWpVZp
GZcplcHpVWpVZp = (-1)*(MVWp2 - MVZp2)/MVWpOS*ZcplcVWpVWpVZp 
Do i1=1,6
 Do i2=1,6
GcplcFuFdHpL(i1,i2) = (MFuOS(i1)*cplcFuFdVWpL(i1,i2) - MFdOS(i2)*cplcFuFdVWpR(i1,i2))/MVWpOS
GcplcFuFdHpR(i1,i2) = -(MFdOS(i2)*cplcFuFdVWpL(i1,i2) - MFuOS(i1)*cplcFuFdVWpR(i1,i2))/MVWpOS
GosZcplcFuFdHpL(i1,i2) = (MFuOS(i1)*ZcplcFuFdVWpL(i1,i2) - MFdOS(i2)*ZcplcFuFdVWpR(i1,i2))/MVWpOS
GosZcplcFuFdHpR(i1,i2) = -(MFdOS(i2)*ZcplcFuFdVWpL(i1,i2) - MFuOS(i1)*ZcplcFuFdVWpR(i1,i2))/MVWpOS
GZcplcFuFdHpL(i1,i2) = (MFu(i1)*ZcplcFuFdVWpL(i1,i2) - MFd(i2)*ZcplcFuFdVWpR(i1,i2))/MVWp
GZcplcFuFdHpR(i1,i2) = -(MFd(i2)*ZcplcFuFdVWpL(i1,i2) - MFu(i1)*ZcplcFuFdVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,9
 Do i2=1,6
GcplFvFeHpL(i1,i2) = (MFvOS(i1)*cplFvFeVWpL(i1,i2) - MFeOS(i2)*cplFvFeVWpR(i1,i2))/MVWpOS
GcplFvFeHpR(i1,i2) = -(MFeOS(i2)*cplFvFeVWpL(i1,i2) - MFvOS(i1)*cplFvFeVWpR(i1,i2))/MVWpOS
GosZcplFvFeHpL(i1,i2) = (MFvOS(i1)*ZcplFvFeVWpL(i1,i2) - MFeOS(i2)*ZcplFvFeVWpR(i1,i2))/MVWpOS
GosZcplFvFeHpR(i1,i2) = -(MFeOS(i2)*ZcplFvFeVWpL(i1,i2) - MFvOS(i1)*ZcplFvFeVWpR(i1,i2))/MVWpOS
GZcplFvFeHpL(i1,i2) = (MFv(i1)*ZcplFvFeVWpL(i1,i2) - MFe(i2)*ZcplFvFeVWpR(i1,i2))/MVWp
GZcplFvFeHpR(i1,i2) = -(MFe(i2)*ZcplFvFeVWpL(i1,i2) - MFv(i1)*ZcplFvFeVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,6
 Do i2=1,6
GcplcFdFucHpL(i1,i2) = (MFdOS(i1)*cplcFdFucVWpL(i1,i2) - MFuOS(i2)*cplcFdFucVWpR(i1,i2))/MVWpOS
GcplcFdFucHpR(i1,i2) = -(MFuOS(i2)*cplcFdFucVWpL(i1,i2) - MFdOS(i1)*cplcFdFucVWpR(i1,i2))/MVWpOS
GosZcplcFdFucHpL(i1,i2) = (MFdOS(i1)*ZcplcFdFucVWpL(i1,i2) - MFuOS(i2)*ZcplcFdFucVWpR(i1,i2))/MVWpOS
GosZcplcFdFucHpR(i1,i2) = -(MFuOS(i2)*ZcplcFdFucVWpL(i1,i2) - MFdOS(i1)*ZcplcFdFucVWpR(i1,i2))/MVWpOS
GZcplcFdFucHpL(i1,i2) = (MFd(i1)*ZcplcFdFucVWpL(i1,i2) - MFu(i2)*ZcplcFdFucVWpR(i1,i2))/MVWp
GZcplcFdFucHpR(i1,i2) = -(MFu(i2)*ZcplcFdFucVWpL(i1,i2) - MFd(i1)*ZcplcFdFucVWpR(i1,i2))/MVWp
 End Do
End Do 
Do i1=1,6
 Do i2=1,9
GcplcFeFvcHpL(i1,i2) = (MFeOS(i1)*cplcFeFvcVWpL(i1,i2) - MFvOS(i2)*cplcFeFvcVWpR(i1,i2))/MVWpOS
GcplcFeFvcHpR(i1,i2) = -(MFvOS(i2)*cplcFeFvcVWpL(i1,i2) - MFeOS(i1)*cplcFeFvcVWpR(i1,i2))/MVWpOS
GosZcplcFeFvcHpL(i1,i2) = (MFeOS(i1)*ZcplcFeFvcVWpL(i1,i2) - MFvOS(i2)*ZcplcFeFvcVWpR(i1,i2))/MVWpOS
GosZcplcFeFvcHpR(i1,i2) = -(MFvOS(i2)*ZcplcFeFvcVWpL(i1,i2) - MFeOS(i1)*ZcplcFeFvcVWpR(i1,i2))/MVWpOS
GZcplcFeFvcHpL(i1,i2) = (MFe(i1)*ZcplcFeFvcVWpL(i1,i2) - MFv(i2)*ZcplcFeFvcVWpR(i1,i2))/MVWp
GZcplcFeFvcHpR(i1,i2) = -(MFv(i2)*ZcplcFeFvcVWpL(i1,i2) - MFe(i1)*ZcplcFeFvcVWpR(i1,i2))/MVWp
 End Do
End Do 
End Subroutine  getGBCouplings 

Subroutine WaveFunctionRenormalisation(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,               & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,               & 
& MVZ2OS,MVZp2OS,MVWpOS,MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,           & 
& UVOS,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,            & 
& MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,             & 
& ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,            & 
& mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,cplAhAhhh,cplhhhhhh,cplhhHpcHp,           & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,        & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,               & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWpVWp,          & 
& cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhHpcVWpVZp,     & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,       & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpcVWpVP,cplhhHpcVWpVZ,     & 
& cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplhhcHpVWpVZp,cplHpcHpVPVP,cplHpcHpVPVZ,   & 
& cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,               & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,     & 
& cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,  & 
& cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,      & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,               & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,   & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,& 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,     & 
& cplcgZpgWCVWp,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,     & 
& cplcgWCgZpcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,           & 
& cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,         & 
& cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,              & 
& cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,         & 
& GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,           & 
& GcplHpcVWpVZ,GcplHpcVWpVZp,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL,       & 
& GcplcFuFdHpR,GcplFvFeHpL,GcplFvFeHpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,        & 
& GcplcFeFvcHpR,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,dmChiU,dYvL,             & 
& dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,dLamPhi,               & 
& dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,dTanTW,              & 
& dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,ZfDL,ZfDR,           & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ,ctcplAhAhhh,    & 
& ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpcVWp,           & 
& ctcplAhcHpVWp,ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplHpcHpVZp,     & 
& ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,        & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplHpcVWpVZp,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplcHpVWpVZp, & 
& ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcVWpVWpVZp,ctcplcFdFdAhL,               & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,    & 
& ctcplFvFvAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHpL,ctcplcFuFdHpR,ctcplFvFeHpL,     & 
& ctcplFvFeHpR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHpL,   & 
& ctcplcFdFucHpR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,ctcplcFdFdVGL,  & 
& ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,               & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,ctcplFvFeVWpL,               & 
& ctcplFvFeVWpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,  & 
& ctcplcFeFeVZpR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,  & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,           & 
& ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,       & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,MLambda,deltaM,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: vH,vPhi

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplAhhhVP(2,2), & 
& cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplhhHpcVWp(2),           & 
& cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ(2),cplhhVPVZp(2),           & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),   & 
& cplAhAhVPVZp(2,2),cplAhAhcVWpVWp(2,2),cplAhAhVZVZ(2,2),cplAhAhVZVZp(2,2),              & 
& cplAhAhVZpVZp(2,2),cplAhHpcVWpVP(2),cplAhHpcVWpVZ(2),cplAhHpcVWpVZp(2),cplAhcHpVPVWp(2),& 
& cplAhcHpVWpVZ(2),cplAhcHpVWpVZp(2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),& 
& cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhhhVZVZp(2,2),cplhhhhVZpVZp(2,2),             & 
& cplhhHpcVWpVP(2),cplhhHpcVWpVZ(2),cplhhHpcVWpVZp(2),cplhhcHpVPVWp(2),cplhhcHpVWpVZ(2), & 
& cplhhcHpVWpVZp(2),cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,             & 
& cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,         & 
& cplcVWpVWpVZp,cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),& 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),             & 
& cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),               & 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),& 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6), & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucVWpL(6,6),& 
& cplcFdFucVWpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),    & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,     & 
& cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,             & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,     & 
& cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcgGgGVG,     & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgAgWpcVWp,      & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,cplcgWCgZpcVWp,    & 
& cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAHp,              & 
& cplcgWCgAcHp,cplcgWpgWphh(2),cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh(2),               & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZHp,cplcgWCgZcHp

Complex(dp),Intent(in) :: cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp

Real(dp),Intent(in) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MAhOS(2),MAh2OS(2),MFdOS(6),MFd2OS(6),MFuOS(6),MFu2OS(6),          & 
& MFeOS(6),MFe2OS(6),MFvOS(9),MFv2OS(9),MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,        & 
& MVWpOS,MVWp2OS,ZHOS(2,2),ZAOS(2,2)

Complex(dp),Intent(in) :: ZDLOS(6,6),ZDROS(6,6),ZULOS(6,6),ZUROS(6,6),ZELOS(6,6),ZEROS(6,6),UVOS(9,9)

Complex(dp) :: Pihh(2,2,2),DerPihh(2,2,2),PiAh(2,2,2),DerPiAh(2,2,2),SigmaLFd(6,6,6),SigmaSLFd(6,6,6),& 
& SigmaSRFd(6,6,6),SigmaRFd(6,6,6),DerSigmaLFd(6,6,6),DerSigmaSLFd(6,6,6),               & 
& DerSigmaSRFd(6,6,6),DerSigmaRFd(6,6,6),DerSigmaLirFd(6,6,6),DerSigmaSLirFd(6,6,6),     & 
& DerSigmaSRirFd(6,6,6),DerSigmaRirFd(6,6,6),SigmaLFu(6,6,6),SigmaSLFu(6,6,6),           & 
& SigmaSRFu(6,6,6),SigmaRFu(6,6,6),DerSigmaLFu(6,6,6),DerSigmaSLFu(6,6,6),               & 
& DerSigmaSRFu(6,6,6),DerSigmaRFu(6,6,6),DerSigmaLirFu(6,6,6),DerSigmaSLirFu(6,6,6),     & 
& DerSigmaSRirFu(6,6,6),DerSigmaRirFu(6,6,6),SigmaLFe(6,6,6),SigmaSLFe(6,6,6),           & 
& SigmaSRFe(6,6,6),SigmaRFe(6,6,6),DerSigmaLFe(6,6,6),DerSigmaSLFe(6,6,6),               & 
& DerSigmaSRFe(6,6,6),DerSigmaRFe(6,6,6),DerSigmaLirFe(6,6,6),DerSigmaSLirFe(6,6,6),     & 
& DerSigmaSRirFe(6,6,6),DerSigmaRirFe(6,6,6),SigmaLFv(9,9,9),SigmaSLFv(9,9,9),           & 
& SigmaSRFv(9,9,9),SigmaRFv(9,9,9),DerSigmaLFv(9,9,9),DerSigmaSLFv(9,9,9),               & 
& DerSigmaSRFv(9,9,9),DerSigmaRFv(9,9,9),DerSigmaLirFv(9,9,9),DerSigmaSLirFv(9,9,9),     & 
& DerSigmaSRirFv(9,9,9),DerSigmaRirFv(9,9,9),PiHp,DerPiHp,PiVG,DerPiVG,PiVP,             & 
& DerPiVP,PiVZ,DerPiVZ,PiVZp,DerPiVZp,PiVWp,DerPiVWp,PiVPlight0,DerPiVPlight0,           & 
& PiVPheavy0,DerPiVPheavy0,PiVPlightMZ,DerPiVPlightMZ,PiVPheavyMZ,DerPiVPheavyMZ,        & 
& PiVPVZ,DerPiVPVZ,PiVZVP,DerPiVZVP,PiVPVZp,DerPiVPVZp,PiVZpVP,DerPiVZpVP,               & 
& PiVZVZp,DerPiVZVZp,PiVZpVZ,DerPiVZpVZ,PiVZhh(2,2,2),DerPiVZhh(2,2,2),PihhVZ(2,2,2),    & 
& DerPihhVZ(2,2,2),PiVZAh(2,2,2),DerPiVZAh(2,2,2),PiAhVZ(2,2,2),DerPiAhVZ(2,2,2),        & 
& PiVZphh(2,2,2),DerPiVZphh(2,2,2),PihhVZp(2,2,2),DerPihhVZp(2,2,2),PiVZpAh(2,2,2),      & 
& DerPiVZpAh(2,2,2),PiAhVZp(2,2,2),DerPiAhVZp(2,2,2),PiVWpHp,DerPiVWpHp,PiHpVWp,         & 
& DerPiHpVWp

Complex(dp) :: PihhDR(2,2,2),DerPihhDR(2,2,2),PiAhDR(2,2,2),DerPiAhDR(2,2,2),SigmaLFdDR(6,6,6),      & 
& SigmaSLFdDR(6,6,6),SigmaSRFdDR(6,6,6),SigmaRFdDR(6,6,6),DerSigmaLFdDR(6,6,6),          & 
& DerSigmaSLFdDR(6,6,6),DerSigmaSRFdDR(6,6,6),DerSigmaRFdDR(6,6,6),DerSigmaLirFdDR(6,6,6),& 
& DerSigmaSLirFdDR(6,6,6),DerSigmaSRirFdDR(6,6,6),DerSigmaRirFdDR(6,6,6),SigmaLFuDR(6,6,6),& 
& SigmaSLFuDR(6,6,6),SigmaSRFuDR(6,6,6),SigmaRFuDR(6,6,6),DerSigmaLFuDR(6,6,6),          & 
& DerSigmaSLFuDR(6,6,6),DerSigmaSRFuDR(6,6,6),DerSigmaRFuDR(6,6,6),DerSigmaLirFuDR(6,6,6),& 
& DerSigmaSLirFuDR(6,6,6),DerSigmaSRirFuDR(6,6,6),DerSigmaRirFuDR(6,6,6),SigmaLFeDR(6,6,6),& 
& SigmaSLFeDR(6,6,6),SigmaSRFeDR(6,6,6),SigmaRFeDR(6,6,6),DerSigmaLFeDR(6,6,6),          & 
& DerSigmaSLFeDR(6,6,6),DerSigmaSRFeDR(6,6,6),DerSigmaRFeDR(6,6,6),DerSigmaLirFeDR(6,6,6),& 
& DerSigmaSLirFeDR(6,6,6),DerSigmaSRirFeDR(6,6,6),DerSigmaRirFeDR(6,6,6),SigmaLFvDR(9,9,9),& 
& SigmaSLFvDR(9,9,9),SigmaSRFvDR(9,9,9),SigmaRFvDR(9,9,9),DerSigmaLFvDR(9,9,9),          & 
& DerSigmaSLFvDR(9,9,9),DerSigmaSRFvDR(9,9,9),DerSigmaRFvDR(9,9,9),DerSigmaLirFvDR(9,9,9),& 
& DerSigmaSLirFvDR(9,9,9),DerSigmaSRirFvDR(9,9,9),DerSigmaRirFvDR(9,9,9),PiHpDR,         & 
& DerPiHpDR,PiVGDR,DerPiVGDR,PiVPDR,DerPiVPDR,PiVZDR,DerPiVZDR,PiVZpDR,DerPiVZpDR,       & 
& PiVWpDR,DerPiVWpDR,PiVPlight0DR,DerPiVPlight0DR,PiVPheavy0DR,DerPiVPheavy0DR,          & 
& PiVPlightMZDR,DerPiVPlightMZDR,PiVPheavyMZDR,DerPiVPheavyMZDR,PiVPVZDR,DerPiVPVZDR,    & 
& PiVZVPDR,DerPiVZVPDR,PiVPVZpDR,DerPiVPVZpDR,PiVZpVPDR,DerPiVZpVPDR,PiVZVZpDR,          & 
& DerPiVZVZpDR,PiVZpVZDR,DerPiVZpVZDR,PiVZhhDR(2,2,2),DerPiVZhhDR(2,2,2),PihhVZDR(2,2,2),& 
& DerPihhVZDR(2,2,2),PiVZAhDR(2,2,2),DerPiVZAhDR(2,2,2),PiAhVZDR(2,2,2),DerPiAhVZDR(2,2,2),& 
& PiVZphhDR(2,2,2),DerPiVZphhDR(2,2,2),PihhVZpDR(2,2,2),DerPihhVZpDR(2,2,2),             & 
& PiVZpAhDR(2,2,2),DerPiVZpAhDR(2,2,2),PiAhVZpDR(2,2,2),DerPiAhVZpDR(2,2,2),             & 
& PiVWpHpDR,DerPiVWpHpDR,PiHpVWpDR,DerPiHpVWpDR

Complex(dp) :: PihhOS(2,2,2),DerPihhOS(2,2,2),PiAhOS(2,2,2),DerPiAhOS(2,2,2),SigmaLFdOS(6,6,6),      & 
& SigmaSLFdOS(6,6,6),SigmaSRFdOS(6,6,6),SigmaRFdOS(6,6,6),DerSigmaLFdOS(6,6,6),          & 
& DerSigmaSLFdOS(6,6,6),DerSigmaSRFdOS(6,6,6),DerSigmaRFdOS(6,6,6),DerSigmaLirFdOS(6,6,6),& 
& DerSigmaSLirFdOS(6,6,6),DerSigmaSRirFdOS(6,6,6),DerSigmaRirFdOS(6,6,6),SigmaLFuOS(6,6,6),& 
& SigmaSLFuOS(6,6,6),SigmaSRFuOS(6,6,6),SigmaRFuOS(6,6,6),DerSigmaLFuOS(6,6,6),          & 
& DerSigmaSLFuOS(6,6,6),DerSigmaSRFuOS(6,6,6),DerSigmaRFuOS(6,6,6),DerSigmaLirFuOS(6,6,6),& 
& DerSigmaSLirFuOS(6,6,6),DerSigmaSRirFuOS(6,6,6),DerSigmaRirFuOS(6,6,6),SigmaLFeOS(6,6,6),& 
& SigmaSLFeOS(6,6,6),SigmaSRFeOS(6,6,6),SigmaRFeOS(6,6,6),DerSigmaLFeOS(6,6,6),          & 
& DerSigmaSLFeOS(6,6,6),DerSigmaSRFeOS(6,6,6),DerSigmaRFeOS(6,6,6),DerSigmaLirFeOS(6,6,6),& 
& DerSigmaSLirFeOS(6,6,6),DerSigmaSRirFeOS(6,6,6),DerSigmaRirFeOS(6,6,6),SigmaLFvOS(9,9,9),& 
& SigmaSLFvOS(9,9,9),SigmaSRFvOS(9,9,9),SigmaRFvOS(9,9,9),DerSigmaLFvOS(9,9,9),          & 
& DerSigmaSLFvOS(9,9,9),DerSigmaSRFvOS(9,9,9),DerSigmaRFvOS(9,9,9),DerSigmaLirFvOS(9,9,9),& 
& DerSigmaSLirFvOS(9,9,9),DerSigmaSRirFvOS(9,9,9),DerSigmaRirFvOS(9,9,9),PiHpOS,         & 
& DerPiHpOS,PiVGOS,DerPiVGOS,PiVPOS,DerPiVPOS,PiVZOS,DerPiVZOS,PiVZpOS,DerPiVZpOS,       & 
& PiVWpOS,DerPiVWpOS,PiVPlight0OS,DerPiVPlight0OS,PiVPheavy0OS,DerPiVPheavy0OS,          & 
& PiVPlightMZOS,DerPiVPlightMZOS,PiVPheavyMZOS,DerPiVPheavyMZOS,PiVPVZOS,DerPiVPVZOS,    & 
& PiVZVPOS,DerPiVZVPOS,PiVPVZpOS,DerPiVPVZpOS,PiVZpVPOS,DerPiVZpVPOS,PiVZVZpOS,          & 
& DerPiVZVZpOS,PiVZpVZOS,DerPiVZpVZOS,PiVZhhOS(2,2,2),DerPiVZhhOS(2,2,2),PihhVZOS(2,2,2),& 
& DerPihhVZOS(2,2,2),PiVZAhOS(2,2,2),DerPiVZAhOS(2,2,2),PiAhVZOS(2,2,2),DerPiAhVZOS(2,2,2),& 
& PiVZphhOS(2,2,2),DerPiVZphhOS(2,2,2),PihhVZpOS(2,2,2),DerPihhVZpOS(2,2,2),             & 
& PiVZpAhOS(2,2,2),DerPiVZpAhOS(2,2,2),PiAhVZpOS(2,2,2),DerPiAhVZpOS(2,2,2),             & 
& PiVWpHpOS,DerPiVWpHpOS,PiHpVWpOS,DerPiHpVWpOS

Real(dp), Intent(in) :: MLambda, deltaM 

Integer, Intent(out) :: kont 
Real(dp),Intent(out) :: dg1,dg2,dg3,dgX,dg1X,dgX1,dmu2H,dmu2Phi,dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,             & 
& dZH(2,2),dZA(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp),Intent(out) :: dmChiD(3,3),dmChiE(3,3),dmChiNu(3,3),dmChiU(3,3),dYvL(3,3),dYuL(3,3),dYvR(3,3),       & 
& dYuR(3,3),dYdL(3,3),dYeL(3,3),dYdR(3,3),dYeR(3,3),dZDL(6,6),dZDR(6,6),dZUL(6,6),       & 
& dZUR(6,6),dZEL(6,6),dZER(6,6),dUV(9,9)

Complex(dp),Intent(out) :: ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh(2,2),ZfAh(2,2),ZfDL(6,6),ZfDR(6,6),              & 
& ZfUL(6,6),ZfUR(6,6),ZfEL(6,6),ZfER(6,6),ZfFV(9,9),ZfVPVZ,ZfVZVP,ZfVPVZp,               & 
& ZfVZpVP,ZfVZVZp,ZfVZpVZ

Complex(dp),Intent(out) :: ctcplAhAhhh(2,2,2),ctcplhhhhhh(2,2,2),ctcplhhHpcHp(2),ctcplAhhhVP(2,2),               & 
& ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2),ctcplAhHpcVWp(2),ctcplAhcHpVWp(2),ctcplhhHpcVWp(2), & 
& ctcplhhcHpVWp(2),ctcplHpcHpVP,ctcplHpcHpVZ,ctcplHpcHpVZp,ctcplhhVPVZ(2),               & 
& ctcplhhVPVZp(2),ctcplhhcVWpVWp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2),     & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplHpcVWpVZp,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplcHpVWpVZp, & 
& ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcVWpVWpVZp,ctcplcFdFdAhL(6,6,2),        & 
& ctcplcFdFdAhR(6,6,2),ctcplcFeFeAhL(6,6,2),ctcplcFeFeAhR(6,6,2),ctcplcFuFuAhL(6,6,2),   & 
& ctcplcFuFuAhR(6,6,2),ctcplFvFvAhL(9,9,2),ctcplFvFvAhR(9,9,2),ctcplcFdFdhhL(6,6,2),     & 
& ctcplcFdFdhhR(6,6,2),ctcplcFuFdHpL(6,6),ctcplcFuFdHpR(6,6),ctcplFvFeHpL(9,6),          & 
& ctcplFvFeHpR(9,6),ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2),ctcplcFuFuhhL(6,6,2),      & 
& ctcplcFuFuhhR(6,6,2),ctcplcFdFucHpL(6,6),ctcplcFdFucHpR(6,6),ctcplFvFvhhL(9,9,2),      & 
& ctcplFvFvhhR(9,9,2),ctcplcFeFvcHpL(6,9),ctcplcFeFvcHpR(6,9),ctcplcFdFdVGL(6,6),        & 
& ctcplcFdFdVGR(6,6),ctcplcFdFdVPL(6,6),ctcplcFdFdVPR(6,6),ctcplcFuFdVWpL(6,6),          & 
& ctcplcFuFdVWpR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZR(6,6),ctcplcFdFdVZpL(6,6),         & 
& ctcplcFdFdVZpR(6,6),ctcplFvFeVWpL(9,6),ctcplFvFeVWpR(9,6),ctcplcFeFeVPL(6,6),          & 
& ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZR(6,6),ctcplcFeFeVZpL(6,6),          & 
& ctcplcFeFeVZpR(6,6),ctcplcFuFuVGL(6,6),ctcplcFuFuVGR(6,6),ctcplcFuFuVPL(6,6),          & 
& ctcplcFuFuVPR(6,6),ctcplcFuFuVZL(6,6),ctcplcFuFuVZR(6,6),ctcplcFuFuVZpL(6,6),          & 
& ctcplcFuFuVZpR(6,6),ctcplcFdFucVWpL(6,6),ctcplcFdFucVWpR(6,6),ctcplFvFvVPL(9,9),       & 
& ctcplFvFvVPR(9,9),ctcplFvFvVZL(9,9),ctcplFvFvVZR(9,9),ctcplFvFvVZpL(9,9),              & 
& ctcplFvFvVZpR(9,9),ctcplcFeFvcVWpL(6,9),ctcplcFeFvcVWpR(6,9)

Complex(dp),Intent(in) :: GcplhhHpcHp(2),GcplAhHpcVWp(2),GcplAhcHpVWp(2),GcplhhHpcVWp(2),GcplhhcHpVWp(2),       & 
& GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,          & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL(6,6),GcplcFuFdHpR(6,6),           & 
& GcplFvFeHpL(9,6),GcplFvFeHpR(9,6),GcplcFdFucHpL(6,6),GcplcFdFucHpR(6,6),               & 
& GcplcFeFvcHpL(6,9),GcplcFeFvcHpR(6,9)

Real(dp) ::  g1D(229) 
Real(dp) :: p2 
Logical :: TwoLoopRGEsave 
Real(dp) ::MVG,MVP,MVG2,MVP2
Complex(dp) ::  Tad1Loop(2)
Complex(dp) :: MatTad_hh(2,2)=0._dp 
Integer :: i1,i2,i3 

MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

Call OneLoopTadpoleshh(vH,vPhi,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplcFdFdhhL,           & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhVZpVZp,Tad1Loop(1:2))

Tad1Loop(1:2) = MatMul(ZH,Tad1Loop(1:2)) 
Tad1Loop(1) = Tad1Loop(1)/vH 
Tad1Loop(2) = Tad1Loop(2)/vPhi 
Do i1=1,2
MatTad_hh(i1,i1) = Tad1Loop(0+ i1) 
End Do 
MatTad_hh = MatMul(MatMul(ZH,MatTad_hh),Transpose(ZH)) 
! Not working!! 
MatTad_hh= 0._dp
!--------------------------
!hh
!--------------------------
Do i1=1,2
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,    & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,       & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhVPVP,     & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZpVZp,kont,Pihh(i1,:,:))

Pihh(i1,:,:) = Pihh(i1,:,:) + MatTad_hh
Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,              & 
& cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,    & 
& cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,    & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,       & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhVPVP,     & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZpVZp,kont,DerPihh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZp,MVZp2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,              & 
& cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,    & 
& cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,    & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,       & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhVPVP,     & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZpVZp,kont,DerPihhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1Loophh(p2,MAhOS,MAh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MFdOS,MFd2OS,           & 
& MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,               & 
& MVWp2OS,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,    & 
& cplcgWCgWChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,     & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhVPVP,cplhhhhcVWpVWp,cplhhhhVZVZ,           & 
& cplhhhhVZpVZp,kont,DerPihhOS(i1,:,:))

DerPihh(i1,:,:) = DerPihh(i1,:,:)- DerPihhDR(i1,:,:) + DerPihhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Ah
!--------------------------
Do i1=1,2
p2 = MAh2(i1)
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,    & 
& cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhAhAhAh,cplAhAhhhhh,       & 
& cplAhAhHpcHp,cplAhAhVPVP,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZpVZp,kont,PiAh(i1,:,:))

Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,    & 
& cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhAhAhAh,cplAhAhhhhh,       & 
& cplAhAhHpcHp,cplAhAhVPVP,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MVWp,MVWp2,MHp,MHp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,    & 
& cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhAhAhAh,cplAhAhhhhh,       & 
& cplAhAhHpcHp,cplAhAhVPVP,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopAh(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MVWpOS,MVWp2OS,MHpOS,            & 
& MHp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpcVWp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhVPVP,               & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZpVZp,kont,DerPiAhOS(i1,:,:))

DerPiAh(i1,:,:) = DerPiAh(i1,:,:)- DerPiAhDR(i1,:,:) + DerPiAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Fd
!--------------------------
Do i1=1,6
p2 =MFd2(i1)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& SigmaLFd(i1,:,:),SigmaRFd(i1,:,:),SigmaSLFd(i1,:,:),SigmaSRFd(i1,:,:))

Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& DerSigmaLFd(i1,:,:),DerSigmaRFd(i1,:,:),DerSigmaSLFd(i1,:,:),DerSigmaSRFd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHp,MHp2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& DerSigmaLFdDR(i1,:,:),DerSigmaRFdDR(i1,:,:),DerSigmaSLFdDR(i1,:,:),DerSigmaSRFdDR(i1,:,:))

p2 =MFd2OS(i1)
Call DerSigma1LoopFd(p2,MFdOS,MFd2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,          & 
& MVZpOS,MVZp2OS,MHpOS,MHp2OS,MFuOS,MFu2OS,MVWpOS,MVWp2OS,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,DerSigmaLFdOS(i1,:,:),DerSigmaRFdOS(i1,:,:),               & 
& DerSigmaSLFdOS(i1,:,:),DerSigmaSRFdOS(i1,:,:))

DerSigmaLFd(i1,:,:) = DerSigmaLFd(i1,:,:) - DerSigmaLFdDR(i1,:,:)! + DerSigmaLFdOS(i1,:,:)
DerSigmaRFd(i1,:,:) = DerSigmaRFd(i1,:,:) - DerSigmaRFdDR(i1,:,:)! + DerSigmaRFdOS(i1,:,:)
DerSigmaSLFd(i1,:,:) = DerSigmaSLFd(i1,:,:) - DerSigmaSLFdDR(i1,:,:)! + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRFd(i1,:,:) = DerSigmaSRFd(i1,:,:) - DerSigmaSRFdDR(i1,:,:)! + DerSigmaSRFdOS(i1,:,:)
DerSigmaLirFd(i1,:,:) = + DerSigmaLFdOS(i1,:,:)
DerSigmaRirFd(i1,:,:) = + DerSigmaRFdOS(i1,:,:)
DerSigmaSLirFd(i1,:,:) = + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRirFd(i1,:,:) = + DerSigmaSRFdOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFd(i1,:,:) = 0._dp
DerSigmaRirFd(i1,:,:) = 0._dp
DerSigmaSLirFd(i1,:,:) = 0._dp
DerSigmaSRirFd(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fu
!--------------------------
Do i1=1,6
p2 =MFu2(i1)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,              & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& SigmaLFu(i1,:,:),SigmaRFu(i1,:,:),SigmaSLFu(i1,:,:),SigmaSRFu(i1,:,:))

Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,          & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& DerSigmaLFu(i1,:,:),DerSigmaRFu(i1,:,:),DerSigmaSLFu(i1,:,:),DerSigmaSRFu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdHpL,cplcFuFdHpR,          & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& DerSigmaLFuDR(i1,:,:),DerSigmaRFuDR(i1,:,:),DerSigmaSLFuDR(i1,:,:),DerSigmaSRFuDR(i1,:,:))

p2 =MFu2OS(i1)
Call DerSigma1LoopFu(p2,MFuOS,MFu2OS,MAhOS,MAh2OS,MHpOS,MHp2OS,MFdOS,MFd2OS,          & 
& MVWpOS,MVWp2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,DerSigmaLFuOS(i1,:,:),DerSigmaRFuOS(i1,:,:),DerSigmaSLFuOS(i1,:,:)& 
& ,DerSigmaSRFuOS(i1,:,:))

DerSigmaLFu(i1,:,:) = DerSigmaLFu(i1,:,:) - DerSigmaLFuDR(i1,:,:)! + DerSigmaLFuOS(i1,:,:)
DerSigmaRFu(i1,:,:) = DerSigmaRFu(i1,:,:) - DerSigmaRFuDR(i1,:,:)! + DerSigmaRFuOS(i1,:,:)
DerSigmaSLFu(i1,:,:) = DerSigmaSLFu(i1,:,:) - DerSigmaSLFuDR(i1,:,:)! + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRFu(i1,:,:) = DerSigmaSRFu(i1,:,:) - DerSigmaSRFuDR(i1,:,:)! + DerSigmaSRFuOS(i1,:,:)
DerSigmaLirFu(i1,:,:) = + DerSigmaLFuOS(i1,:,:)
DerSigmaRirFu(i1,:,:) = + DerSigmaRFuOS(i1,:,:)
DerSigmaSLirFu(i1,:,:) = + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRirFu(i1,:,:) = + DerSigmaSRFuOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFu(i1,:,:) = 0._dp
DerSigmaRirFu(i1,:,:) = 0._dp
DerSigmaSLirFu(i1,:,:) = 0._dp
DerSigmaSRirFu(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fe
!--------------------------
Do i1=1,6
p2 =MFe2(i1)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,              & 
& MHp2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,SigmaLFe(i1,:,:),SigmaRFe(i1,:,:)& 
& ,SigmaSLFe(i1,:,:),SigmaSRFe(i1,:,:))

Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,DerSigmaLFe(i1,:,:)              & 
& ,DerSigmaRFe(i1,:,:),DerSigmaSLFe(i1,:,:),DerSigmaSRFe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,               & 
& MHp,MHp2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,DerSigmaLFeDR(i1,:,:)            & 
& ,DerSigmaRFeDR(i1,:,:),DerSigmaSLFeDR(i1,:,:),DerSigmaSRFeDR(i1,:,:))

p2 =MFe2OS(i1)
Call DerSigma1LoopFe(p2,MFeOS,MFe2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,          & 
& MVZpOS,MVZp2OS,MHpOS,MHp2OS,MFvOS,MFv2OS,MVWpOS,MVWp2OS,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,       & 
& DerSigmaLFeOS(i1,:,:),DerSigmaRFeOS(i1,:,:),DerSigmaSLFeOS(i1,:,:),DerSigmaSRFeOS(i1,:,:))

DerSigmaLFe(i1,:,:) = DerSigmaLFe(i1,:,:) - DerSigmaLFeDR(i1,:,:)! + DerSigmaLFeOS(i1,:,:)
DerSigmaRFe(i1,:,:) = DerSigmaRFe(i1,:,:) - DerSigmaRFeDR(i1,:,:)! + DerSigmaRFeOS(i1,:,:)
DerSigmaSLFe(i1,:,:) = DerSigmaSLFe(i1,:,:) - DerSigmaSLFeDR(i1,:,:)! + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRFe(i1,:,:) = DerSigmaSRFe(i1,:,:) - DerSigmaSRFeDR(i1,:,:)! + DerSigmaSRFeOS(i1,:,:)
DerSigmaLirFe(i1,:,:) = + DerSigmaLFeOS(i1,:,:)
DerSigmaRirFe(i1,:,:) = + DerSigmaRFeOS(i1,:,:)
DerSigmaSLirFe(i1,:,:) = + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRirFe(i1,:,:) = + DerSigmaSRFeOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFe(i1,:,:) = 0._dp
DerSigmaRirFe(i1,:,:) = 0._dp
DerSigmaSLirFe(i1,:,:) = 0._dp
DerSigmaSRirFe(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fv
!--------------------------
Do i1=1,9
p2 = MFv2(i1)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,      & 
& cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,         & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& SigmaLFv(i1,:,:),SigmaRFv(i1,:,:),SigmaSLFv(i1,:,:),SigmaSRFv(i1,:,:))

Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvFeHpL,cplFvFeHpR,              & 
& cplFvFeVWpL,cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,DerSigmaLFv(i1,:,:),DerSigmaRFv(i1,:,:),DerSigmaSLFv(i1,:,:)             & 
& ,DerSigmaSRFv(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHp,MHp2,MFe,MFe2,MVWp,MVWp2,               & 
& Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplFvFvAhL,cplFvFvAhR,cplFvFeHpL,cplFvFeHpR,              & 
& cplFvFeVWpL,cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,        & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,DerSigmaLFvDR(i1,:,:),DerSigmaRFvDR(i1,:,:),DerSigmaSLFvDR(i1,:,:)       & 
& ,DerSigmaSRFvDR(i1,:,:))

p2 =MFv2OS(i1)
Call DerSigma1LoopFv(p2,MFvOS,MFv2OS,MAhOS,MAh2OS,MHpOS,MHp2OS,MFeOS,MFe2OS,          & 
& MVWpOS,MVWp2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,cplFvFvAhL,cplFvFvAhR,         & 
& cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,        & 
& cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,    & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,DerSigmaLFvOS(i1,:,:),DerSigmaRFvOS(i1,:,:),               & 
& DerSigmaSLFvOS(i1,:,:),DerSigmaSRFvOS(i1,:,:))

DerSigmaLFv(i1,:,:) = DerSigmaLFv(i1,:,:) - DerSigmaLFvDR(i1,:,:)! + DerSigmaLFvOS(i1,:,:)
DerSigmaRFv(i1,:,:) = DerSigmaRFv(i1,:,:) - DerSigmaRFvDR(i1,:,:)! + DerSigmaRFvOS(i1,:,:)
DerSigmaSLFv(i1,:,:) = DerSigmaSLFv(i1,:,:) - DerSigmaSLFvDR(i1,:,:)! + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRFv(i1,:,:) = DerSigmaSRFv(i1,:,:) - DerSigmaSRFvDR(i1,:,:)! + DerSigmaSRFvOS(i1,:,:)
DerSigmaLirFv(i1,:,:) =  + DerSigmaLFvOS(i1,:,:)
DerSigmaRirFv(i1,:,:) =  + DerSigmaRFvOS(i1,:,:)
DerSigmaSLirFv(i1,:,:) = + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRirFv(i1,:,:) = + DerSigmaSRFvOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFv(i1,:,:) =  0._dp
DerSigmaRirFv(i1,:,:) =  0._dp
DerSigmaSLirFv(i1,:,:) = 0._dp
DerSigmaSRirFv(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Hp
!--------------------------
p2 = MHp2
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,            & 
& MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,         & 
& cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,            & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,   & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& kont,PiHp)

Call DerPi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,              & 
& MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,      & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,         & 
& cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,            & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,   & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& kont,DerPiHp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,              & 
& MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplAhcHpVWp,cplcFdFucHpL,cplcFdFucHpR,      & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,         & 
& cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,cplhhHpcHp,cplhhcHpVWp,            & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp,   & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,   & 
& kont,DerPiHpDR)

p2 = MHp2OS
Call DerPi1LoopHp(p2,MVWpOS,MVWp2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,           & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVZpOS,               & 
& MVZp2OS,GcplAhcHpVWp,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,          & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,          & 
& cplcgWCgZpcHp,cplcgZpgWCHp,GcplhhHpcHp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,           & 
& GcplHpcHpVZp,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,cplAhAhHpcHp,cplhhhhHpcHp,        & 
& cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,kont,           & 
& DerPiHpOS)

DerPiHp = DerPiHp-DerPiHpDR + DerPiHpOS
IRdivonly=.False. 
End if 
!--------------------------
!VG
!--------------------------
p2 = MVG2
Call Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,PiVG)

Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVG)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVGDR)

p2 = 0.
Call DerPi1LoopVG(p2,MFdOS,MFd2OS,MFuOS,MFu2OS,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,   & 
& kont,DerPiVGOS)

DerPiVG = DerPiVG-DerPiVGDR + DerPiVGOS
IRdivonly=.False. 
End if 
!--------------------------
!VP
!--------------------------
p2 = MVP2
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,PiVP)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVPDR)

p2 = 0.
Call DerPi1LoopVP(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MHpOS,MHp2OS,MVWpOS,             & 
& MVWp2OS,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,         & 
& cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,      & 
& GcplHpcHpVP,GcplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplHpcHpVPVP,            & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPOS)

DerPiVP = DerPiVP-DerPiVPDR + DerPiVPOS
IRdivonly=.False. 
End if 
!--------------------------
!VZ
!--------------------------
p2 = MVZ2
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,PiVZ)

Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,DerPiVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,DerPiVZDR)

p2 = MVZ2OS
Call DerPi1LoopVZ(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,             & 
& MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MHpOS,MHp2OS,MVWpOS,             & 
& MVWp2OS,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZp,GcplHpcHpVZ,GcplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,              & 
& cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVZOS)

DerPiVZ = DerPiVZ-DerPiVZDR + DerPiVZOS
IRdivonly=.False. 
End if 
!--------------------------
!VZp
!--------------------------
p2 = MVZp2
Call Pi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,          & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiVZp)

Call DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,     & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,DerPiVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZp(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,     & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,           & 
& cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,             & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,& 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,DerPiVZpDR)

p2 = MVZp2OS
Call DerPi1LoopVZp(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,            & 
& MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,MHpOS,MHp2OS,MVWpOS,             & 
& MVWp2OS,cplAhhhVZp,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,   & 
& cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWpVZp,cplcgWCgWCVZp,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,GcplHpcHpVZp,GcplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp,         & 
& cplhhhhVZpVZp,cplHpcHpVZpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,    & 
& kont,DerPiVZpOS)

DerPiVZp = DerPiVZp-DerPiVZpDR + DerPiVZpOS
IRdivonly=.False. 
End if 
!--------------------------
!VWp
!--------------------------
p2 = MVWp2
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,             & 
& Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiVWp)

Call DerPi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,DerPiVWp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,DerPiVWpDR)

p2 = MVWp2OS
Call DerPi1LoopVWp(p2,MHpOS,MHp2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,            & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,GcplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp, & 
& GcplhhHpcVWp,cplhhcVWpVWp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,cplcVWpVPVWp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,              & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZpVZp1,  & 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,DerPiVWpOS)

DerPiVWp = DerPiVWp-DerPiVWpDR + DerPiVWpOS
IRdivonly=.False. 
End if 
!--------------------------
! Additional Self-Energies for Photon
!--------------------------
p2 = 0._dp
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,PiVPlight0)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVPlight0)

OnlyLightStates = .False. 
p2 = 0._dp
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,PiVPheavy0)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVPheavy0)

OnlyHeavyStates = .False. 
p2 = MVZ2
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,PiVPlightMZ)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVPlightMZ)

OnlyLightStates = .False. 
p2 = MVZ2
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,PiVPheavyMZ)

Call DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,DerPiVPheavyMZ)

OnlyHeavyStates = .False. 
!--------------------------
!VP
!--------------------------
p2 = MVZ2
Call Pi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,PiVPVZ)

Call DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,DerPiVPVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,DerPiVPVZDR)

p2 =MVZ2OS
Call DerPi1LoopVPVZ(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,            & 
& cplcgWpgWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,   & 
& cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,              & 
& cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,GcplHpcHpVP,cplHpcHpVPVZ,        & 
& GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,PiVZVP)

Call DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,DerPiVZVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,DerPiVPVZDR)

p2 = 0._dp 
Call DerPi1LoopVPVZ(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,            & 
& cplcgWpgWpVZ,GcplcHpVPVWp,GcplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,   & 
& cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,              & 
& cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,cplhhVZVZp,GcplHpcHpVP,cplHpcHpVPVZ,        & 
& GcplHpcHpVZ,GcplHpcVWpVP,GcplHpcVWpVZ,kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
!--------------------------
!VP
!--------------------------
p2 = MVZp2
Call Pi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,PiVPVZp)

Call DerPi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,        & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,DerPiVPVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,        & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,DerPiVPVZpDR)

p2 =MVZp2OS
Call DerPi1LoopVPVZp(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,        & 
& cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,         & 
& cplcgWpgWpVZp,GcplcHpVPVWp,GcplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,& 
& cplcVWpVPVWpVZp3,cplcVWpVWpVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpcHpVP,cplHpcHpVPVZp,    & 
& GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZp,kont,DerPiVPVZpOS)

DerPiVPVZp = DerPiVPVZp- DerPiVPVZpDR + DerPiVPVZpOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,PiVZpVP)

Call DerPi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,        & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,DerPiVZpVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,        & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,cplcgWpgWpVZp,cplcHpVPVWp,cplcHpVWpVZp,        & 
& cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZp,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZp,cplHpcHpVZp,cplHpcVWpVP,               & 
& cplHpcVWpVZp,kont,DerPiVPVZpDR)

p2 = 0._dp 
Call DerPi1LoopVPVZp(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVPVZp,cplAhhhVP,cplAhhhVZp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,        & 
& cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCVP,cplcgWCgWCVZp,cplcgWpgWpVP,         & 
& cplcgWpgWpVZp,GcplcHpVPVWp,GcplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,& 
& cplcVWpVPVWpVZp3,cplcVWpVWpVZp,cplFvFvVPL,cplFvFvVPR,cplFvFvVZpL,cplFvFvVZpR,          & 
& cplhhhhVPVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpcHpVP,cplHpcHpVPVZp,    & 
& GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZp,kont,DerPiVPVZpOS)

DerPiVPVZp = DerPiVPVZp- DerPiVPVZpDR + DerPiVPVZpOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = MVZp2
Call Pi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,             & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,PiVZVZp)

Call DerPi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,        & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,DerPiVZVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,        & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,DerPiVZVZpDR)

p2 =MVZp2OS
Call DerPi1LoopVZVZp(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,       & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,         & 
& cplcgWpgWpVZp,GcplcHpVWpVZ,GcplcHpVWpVZp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,  & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,GcplHpcHpVZ,        & 
& GcplHpcHpVZp,cplHpcHpVZVZp,GcplHpcVWpVZ,GcplHpcVWpVZp,kont,DerPiVZVZpOS)

DerPiVZVZp = DerPiVZVZp- DerPiVZVZpDR + DerPiVZVZpOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,             & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,PiVZpVZ)

Call DerPi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,        & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,DerPiVZpVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZVZp(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,        & 
& cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,            & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcHpVWpVZ,cplcHpVWpVZp,        & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZp,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,kont,DerPiVZVZpDR)

p2 =MVZ2OS
Call DerPi1LoopVZVZp(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhVZVZp,cplAhhhVZ,cplAhhhVZp,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,       & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuFuVZL,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgWpVZ,         & 
& cplcgWpgWpVZp,GcplcHpVWpVZ,GcplcHpVWpVZp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZVZp1,  & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,       & 
& cplhhhhVZVZp,cplhhVPVZ,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,GcplHpcHpVZ,        & 
& GcplHpcHpVZp,cplHpcHpVZVZp,GcplHpcVWpVZ,GcplHpcVWpVZp,kont,DerPiVZVZpOS)

DerPiVZVZp = DerPiVZVZp- DerPiVZVZpDR + DerPiVZVZpOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,2
p2 = Mhh2(i1)
Call Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,MVWp2,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,PiVZhh(i1,:,:))

Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,             & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,             & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZhh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,           & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,           & 
& GcplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpVWp,    & 
& cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZ,GcplHpcVWpVZ,kont,DerPiVZhhOS(i1,:,:))

DerPiVZhh(i1,:,:) = DerPiVZhh(i1,:,:)- DerPiVZhhDR(i1,:,:) + DerPiVZhhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,MVWp2,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,PihhVZ)

Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,             & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPihhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,             & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,          & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,       & 
& cplhhHpcVWp,cplHpcHpVZ,cplHpcVWpVZ,kont,DerPiVZhhDR)

p2 =MVZ2OS
Call DerPi1LoopVZhh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,           & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,           & 
& GcplcHpVWpVZ,cplcVWpVWpVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,GcplhhcHpVWp,    & 
& cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZ,GcplHpcVWpVZ,kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,2
p2 = MAh2(i1)
Call Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,               & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,PiVZAh(i1,:,:))

Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,DerPiVZAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,DerPiVZAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhhh,GcplAhcHpVWp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GcplAhHpcVWp,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHpVWpVZ,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,GcplHpcVWpVZ,          & 
& kont,DerPiVZAhOS(i1,:,:))

DerPiVZAh(i1,:,:) = DerPiVZAh(i1,:,:)- DerPiVZAhDR(i1,:,:) + DerPiVZAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,               & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,PiAhVZ)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,DerPiAhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHpVWpVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,           & 
& cplhhVZVZp,cplHpcVWpVZ,kont,DerPiVZAhDR)

p2 =MVZ2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,           & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhhh,GcplAhcHpVWp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GcplAhHpcVWp,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHpVWpVZ,cplFvFvAhL,           & 
& cplFvFvAhR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,GcplHpcVWpVZ,          & 
& kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
!--------------------------
!VZp
!--------------------------
Do i1=1,2
p2 = Mhh2(i1)
Call Pi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,               & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,PiVZphh(i1,:,:))

Call DerPi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,DerPiVZphh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,DerPiVZphhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZphh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,          & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,       & 
& GcplcHpVWpVZp,cplcVWpVWpVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,             & 
& GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZp,GcplHpcVWpVZp,         & 
& kont,DerPiVZphhOS(i1,:,:))

DerPiVZphh(i1,:,:) = DerPiVZphh(i1,:,:)- DerPiVZphhDR(i1,:,:) + DerPiVZphhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZp2
Call Pi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,               & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,PihhVZp)

Call DerPi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,DerPihhVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZphh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHp,MHp2,MVWp,            & 
& MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,      & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,     & 
& cplhhHpcVWp,cplHpcHpVZp,cplHpcVWpVZp,kont,DerPiVZphhDR)

p2 =MVZp2OS
Call DerPi1LoopVZphh(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,          & 
& MHpOS,MHp2OS,MVWpOS,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWChh,cplcgWCgWCVZp,cplcgWpgWphh,cplcgWpgWpVZp,       & 
& GcplcHpVWpVZp,cplcVWpVWpVZp,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,             & 
& GcplhhcHpVWp,cplhhcVWpVWp,GcplhhHpcHp,GcplhhHpcVWp,GcplHpcHpVZp,GcplHpcVWpVZp,         & 
& kont,DerPiVZphhOS)

DerPiVZphh = DerPiVZphh- DerPiVZphhDR + DerPiVZphhOS
IRdivonly=.False. 
End if
!--------------------------
!VZp
!--------------------------
Do i1=1,2
p2 = MAh2(i1)
Call Pi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,               & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,PiVZpAh(i1,:,:))

Call DerPi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,DerPiVZpAh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,DerPiVZpAhDR(i1,:,:))

p2 =MAh2OS(i1)
Call DerPi1LoopVZpAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhhh,GcplAhcHpVWp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GcplAhHpcVWp,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,GcplcHpVWpVZp,cplFvFvAhL,        & 
& cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpcVWpVZp,    & 
& kont,DerPiVZpAhOS(i1,:,:))

DerPiVZpAh(i1,:,:) = DerPiVZpAh(i1,:,:)- DerPiVZpAhDR(i1,:,:) + DerPiVZpAhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZp2
Call Pi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,           & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,               & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,PiAhVZp)

Call DerPi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,DerPiAhVZp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZpAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhhh,cplAhcHpVWp,cplAhhhVP,          & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,       & 
& cplcHpVWpVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,     & 
& cplhhVZVZp,cplHpcVWpVZp,kont,DerPiVZpAhDR)

p2 =MVZp2OS
Call DerPi1LoopVZpAh(p2,MAhOS,MAh2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,          & 
& MFvOS,MFv2OS,MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,             & 
& MVZp2OS,cplAhAhhh,GcplAhcHpVWp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,GcplAhHpcVWp,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWCgWCAh,cplcgWCgWCVZp,cplcgWpgWpAh,cplcgWpgWpVZp,GcplcHpVWpVZp,cplFvFvAhL,        & 
& cplFvFvAhR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,cplhhVZpVZp,cplhhVZVZp,GcplHpcVWpVZp,    & 
& kont,DerPiVZpAhOS)

DerPiVZpAh = DerPiVZpAh- DerPiVZpAhDR + DerPiVZpAhOS
IRdivonly=.False. 
End if
!--------------------------
!VWp
!--------------------------
p2 = MHp2
Call Pi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,    & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,cplcgWCgZpcHp,        & 
& cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,cplcgZpgWpcHp,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,     & 
& cplHpcHpVZp,kont,PiVWpHp)

Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,             & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,DerPiVWpHp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,             & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,DerPiVWpHpDR)

p2 =MHp2OS
Call DerPi1LoopVWpHp(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,          & 
& MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,GcplcFdFucHpL,    & 
& GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,      & 
& cplcgWCgAcHp,cplcgWCgZcHp,cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,       & 
& cplcgZgWpcHp,cplcgZpgWCVWp,cplcgZpgWpcHp,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,      & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,GcplhhcHpVWp,          & 
& cplhhcVWpVWp,GcplhhHpcHp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,kont,DerPiVWpHpOS)

DerPiVWpHp = DerPiVWpHp- DerPiVWpHpDR + DerPiVWpHpOS
IRdivonly=.False. 
End if
p2 = MVWp2
Call Pi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,    & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,cplcgWCgZpcHp,        & 
& cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,cplcgZpgWpcHp,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,     & 
& cplHpcHpVZp,kont,PiHpVWp)

Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,             & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,DerPiHpVWp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWpHp(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,             & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,cplcgWCgAcHp,cplcgWCgZcHp,         & 
& cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,cplcgZgWpcHp,cplcgZpgWCVWp,      & 
& cplcgZpgWpcHp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,             & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,kont,DerPiVWpHpDR)

p2 =MVWp2OS
Call DerPi1LoopVWpHp(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,          & 
& MhhOS,Mhh2OS,MHpOS,MHp2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,MVZpOS,MVZp2OS,GcplcFdFucHpL,    & 
& GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcgAgWCVWp,      & 
& cplcgWCgAcHp,cplcgWCgZcHp,cplcgWCgZpcHp,cplcgWpgZpVWp,cplcgWpgZVWp,cplcgZgWCVWp,       & 
& cplcgZgWpcHp,cplcgZpgWCVWp,cplcgZpgWpcHp,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,      & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,GcplhhcHpVWp,          & 
& cplhhcVWpVWp,GcplhhHpcHp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,kont,DerPiVWpHpOS)

DerPiVWpHp = DerPiVWpHp- DerPiVWpHpDR + DerPiVWpHpOS
IRdivonly=.False. 
End if
! -----------------------------------------------------------
! Calculate now all wave-function renormalisation constants 
! -----------------------------------------------------------


!  ######    VG    ###### 
ZfVG = -DerPiVG


!  ######    Hp    ###### 
ZfHp = -DerPiHp


!  ######    VP    ###### 
ZfVP = -DerPiVP


!  ######    VZ    ###### 
ZfVZ = -DerPiVZ


!  ######    VZp    ###### 
ZfVZp = -DerPiVZp


!  ######    VWp    ###### 
ZfVWp = -DerPiVWp


!  ######    hh    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(Mhh(i1).eq.Mhh(i2))) Then 
       Zfhh(i1,i2) = -DerPihh(i1,i1,i2)
   Else 
       Zfhh(i1,i2) = 2._dp/(Mhh2(i1)-Mhh2(i2))*Pihh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Ah    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(MAh(i1).eq.MAh(i2))) Then 
       ZfAh(i1,i2) = -DerPiAh(i1,i1,i2)
   Else 
       ZfAh(i1,i2) = 2._dp/(MAh2(i1)-MAh2(i2))*PiAh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    DL    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDL(i1,i2) = -SigmaRFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaRFd(i2,i1,i2) + DerSigmaLFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRFd(i2,i1,i2)+DerSigmaSLFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     Else 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     End if 
   Else 
     ZfDL(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*SigmaSRFd(i2,i1,i2) + MFd(i2)*SigmaSLFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    DR    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDR(i1,i2) = -SigmaLFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaLFd(i2,i1,i2) + DerSigmaRFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLFd(i2,i1,i2)+DerSigmaSRFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     Else 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     End if 
   Else 
     ZfDR(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*SigmaSLFd(i2,i1,i2) + MFd(i2)*SigmaSRFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UL    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUL(i1,i2) = -SigmaRFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaRFu(i2,i1,i2) + DerSigmaLFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRFu(i2,i1,i2)+DerSigmaSLFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     Else 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     End if 
   Else 
     ZfUL(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*SigmaSRFu(i2,i1,i2) + MFu(i2)*SigmaSLFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UR    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUR(i1,i2) = -SigmaLFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaLFu(i2,i1,i2) + DerSigmaRFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLFu(i2,i1,i2)+DerSigmaSRFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     Else 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     End if 
   Else 
     ZfUR(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*SigmaSLFu(i2,i1,i2) + MFu(i2)*SigmaSRFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    EL    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfEL(i1,i2) = -SigmaRFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaRFe(i2,i1,i2) + DerSigmaLFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRFe(i2,i1,i2)+DerSigmaSLFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     Else 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     End if 
   Else 
     ZfEL(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*SigmaSRFe(i2,i1,i2) + MFe(i2)*SigmaSLFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    ER    ###### 
Do i1=1,6
  Do i2=1,6
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfER(i1,i2) = -SigmaLFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaLFe(i2,i1,i2) + DerSigmaRFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLFe(i2,i1,i2)+DerSigmaSRFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     Else 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     End if 
   Else 
     ZfER(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*SigmaSLFe(i2,i1,i2) + MFe(i2)*SigmaSRFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    FV    ###### 
Do i1=1,9
  Do i2=1,9
   If ((i1.eq.i2).or.(MFv(i1).eq.MFv(i2))) Then 
     ZfFV(i1,i2) = -SigmaRFv(i2,i1,i2) &
      & -MFv2(i1)*(DerSigmaRFv(i2,i1,i2) + DerSigmaLFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRFv(i2,i1,i2)+DerSigmaSLFv(i2,i1,i2))
     If (OSkinematics) Then 
     ZfFV(i1,i2) = ZfFV(i1,i2) &
      & -MFv2OS(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFvOS(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     Else 
     ZfFV(i1,i2) = ZfFV(i1,i2) &
      & -MFv2(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     End if 
   Else 
     ZfFV(i1,i2) = 2._dp/(MFv2(i1) - MFv2(i2))* &
      & (MFv2(i2)*SigmaRFv(i2,i1,i2) + MFv(i1)*MFv(i2)*SigmaLFv(i2,i1,i2) + MFv(i1)*SigmaSRFv(i2,i1,i2) + MFv(i2)*SigmaSLFv(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    VPVZ    ###### 
ZfVPVZ = 2._dp*PiVPVZ/(MVP2-MVZ2 )
ZfVZVP = 2._dp*PiVZVP/(MVZ2-MVP2 )


!  ######    VPVZp    ###### 
ZfVPVZp = 2._dp*PiVPVZp/(MVP2-MVZp2 )
ZfVZpVP = 2._dp*PiVZpVP/(MVZp2-MVP2 )


!  ######    VZVZp    ###### 
ZfVZVZp = 2._dp*PiVZVZp/(MVZ2-MVZp2 )
ZfVZpVZ = 2._dp*PiVZpVZ/(MVZp2-MVZ2 )
! -----------------------------------------------------------
! Setting the Counter-Terms 
! -----------------------------------------------------------
! ----------- getting the divergent pieces ---------

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gX = 1*gX 
g1X = Sqrt(5._dp/3._dp)*g1X 
gX1 = 1*gX1 
! ----------------------- 
 
Call ParametersToG229(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,            & 
& YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,g1D)

TwoLoopRGEsave=TwoLoopRGE 
TwoLoopRGE=.False. 
Call rge229(229,0._dp,g1D,g1D) 
TwoLoopRGE=TwoLoopRGEsave 
Call GToParameters229(g1D,dg1,dg1X,dg2,dg3,dgX,dgX1,dLamH,dLamPhiH,dLamPhi,           & 
& dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmChiD,dmChiE,dmChiNu,dmChiU,dmu2H,            & 
& dmu2Phi,dvH,dvPhi)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
dg1 = Sqrt(3._dp/5._dp)*dg1 
dgX = 1*dgX 
dg1X = Sqrt(3._dp/5._dp)*dg1X 
dgX1 = 1*dgX1 
! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gX = 1*gX 
g1X = Sqrt(3._dp/5._dp)*g1X 
gX1 = 1*gX1 
! ----------------------- 
 
dg1 = 0.5_dp*divergence*dg1 
dg2 = 0.5_dp*divergence*dg2 
dg3 = 0.5_dp*divergence*dg3 
dgX = 0.5_dp*divergence*dgX 
dg1X = 0.5_dp*divergence*dg1X 
dgX1 = 0.5_dp*divergence*dgX1 
dmChiD = 0.5_dp*divergence*dmChiD 
dmChiE = 0.5_dp*divergence*dmChiE 
dmChiNu = 0.5_dp*divergence*dmChiNu 
dmChiU = 0.5_dp*divergence*dmChiU 
dYvL = 0.5_dp*divergence*dYvL 
dYuL = 0.5_dp*divergence*dYuL 
dYvR = 0.5_dp*divergence*dYvR 
dYuR = 0.5_dp*divergence*dYuR 
dYdL = 0.5_dp*divergence*dYdL 
dYeL = 0.5_dp*divergence*dYeL 
dYdR = 0.5_dp*divergence*dYdR 
dYeR = 0.5_dp*divergence*dYeR 
dmu2H = 0.5_dp*divergence*dmu2H 
dmu2Phi = 0.5_dp*divergence*dmu2Phi 
dLamH = 0.5_dp*divergence*dLamH 
dLamPhiH = 0.5_dp*divergence*dLamPhiH 
dLamPhi = 0.5_dp*divergence*dLamPhi 
dvH = 0.5_dp*divergence*dvH 
dvPhi = 0.5_dp*divergence*dvPhi 
dZH = 0._dp 
dZA = 0._dp 
dZDL = 0._dp 
dZDR = 0._dp 
dZUL = 0._dp 
dZUR = 0._dp 
dZEL = 0._dp 
dZER = 0._dp 
dUV = 0._dp 
dSinTW = 0._dp 
dCosTW = 0._dp 
dTanTW = 0._dp 
dSinTWp = 0._dp 
dCosTWp = 0._dp 
dTanTWp = 0._dp 
If (CTinLoopDecays) Then 
End if 
 
dZDR = 0.25_dp*MatMul(ZfDR- Conjg(Transpose(ZfDR)),ZDR)
dZER = 0.25_dp*MatMul(ZfER- Conjg(Transpose(ZfER)),ZER)
dZUR = 0.25_dp*MatMul(ZfUR- Conjg(Transpose(ZfUR)),ZUR)
dUV = 0.25_dp*MatMul(ZfFV- Conjg(Transpose(ZfFV)),UV)
dZDL = 0.25_dp*MatMul(ZfDL- Conjg(Transpose(ZfDL)),ZDL)
dZEL = 0.25_dp*MatMul(ZfEL- Conjg(Transpose(ZfEL)),ZEL)
dZUL = 0.25_dp*MatMul(ZfUL- Conjg(Transpose(ZfUL)),ZUL)
dZA = 0.25_dp*MatMul(ZfAh- Conjg(Transpose(ZfAh)),ZA)
dZH = 0.25_dp*MatMul(Zfhh- Conjg(Transpose(Zfhh)),ZH)


! -----------------------------------------------------------
! Calculating the CT vertices 
! -----------------------------------------------------------
Call CalculateCouplingCT(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,              & 
& gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,              & 
& dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH,dZA,dg1,dg2,dgX1,dSinTW,dCosTW,dTanTW,            & 
& dgX,dg1X,dSinTWp,dCosTWp,dTanTWp,dg3,dYdL,dYdR,dZDL,dZDR,dYeL,dYeR,dZEL,               & 
& dZER,dYuL,dYuR,dZUL,dZUR,dYvL,dYvR,dUV,ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,           & 
& ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpcVWp,ctcplAhcHpVWp,ctcplhhHpcVWp,        & 
& ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplHpcHpVZp,ctcplhhVPVZ,ctcplhhVPVZp,        & 
& ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,ctcplHpcVWpVP,ctcplHpcVWpVZ,     & 
& ctcplHpcVWpVZp,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplcHpVWpVZp,ctcplVGVGVG,ctcplcVWpVPVWp,  & 
& ctcplcVWpVWpVZ,ctcplcVWpVWpVZp,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,              & 
& ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,ctcplFvFvAhR,ctcplcFdFdhhL,     & 
& ctcplcFdFdhhR,ctcplcFuFdHpL,ctcplcFuFdHpR,ctcplFvFeHpL,ctcplFvFeHpR,ctcplcFeFehhL,     & 
& ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHpL,ctcplcFdFucHpR,               & 
& ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,ctcplcFdFdVGL,ctcplcFdFdVGR,   & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,ctcplcFdFdVZL,               & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,ctcplFvFeVWpL,ctcplFvFeVWpR,               & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR, & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,   & 
& ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,ctcplFvFvVPL,            & 
& ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,ctcplcFeFvcVWpL,    & 
& ctcplcFeFvcVWpR)

End Subroutine WaveFunctionRenormalisation 
Subroutine CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1Lhh,MhhOS,Mhh2OS,           & 
& MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,         & 
& MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,          & 
& ZELOS,ZEROS,UVOS,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,              & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,epsI,deltaM,kont)

Implicit None 
Real(dp), Intent(in) :: epsI, deltaM 
Integer, Intent(inout) :: kont 
Real(dp) :: MLambda, em, gs, vSM, sinW2, g1SM, g2SM 
Integer :: divset, i1 
Complex(dp) :: divvalue, YuSM(3,3), YdSM(3,3), YeSM(3,3) 
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: vH,vPhi

Real(dp) :: dg1,dg2,dg3,dgX,dg1X,dgX1,dmu2H,dmu2Phi,dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,             & 
& dZH(2,2),dZA(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp) :: dmChiD(3,3),dmChiE(3,3),dmChiNu(3,3),dmChiU(3,3),dYvL(3,3),dYuL(3,3),dYvR(3,3),       & 
& dYuR(3,3),dYdL(3,3),dYeL(3,3),dYdR(3,3),dYeR(3,3),dZDL(6,6),dZDR(6,6),dZUL(6,6),       & 
& dZUR(6,6),dZEL(6,6),dZER(6,6),dUV(9,9)

Complex(dp) :: ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh(2,2),ZfAh(2,2),ZfDL(6,6),ZfDR(6,6),              & 
& ZfUL(6,6),ZfUR(6,6),ZfEL(6,6),ZfER(6,6),ZfFV(9,9),ZfVPVZ,ZfVZVP,ZfVPVZp,               & 
& ZfVZpVP,ZfVZVZp,ZfVZpVZ

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MAhOS(2),MAh2OS(2),MFdOS(6),MFd2OS(6),MFuOS(6),MFu2OS(6),          & 
& MFeOS(6),MFe2OS(6),MFvOS(9),MFv2OS(9),MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,        & 
& MVWpOS,MVWp2OS,ZHOS(2,2),ZAOS(2,2)

Complex(dp),Intent(in) :: ZDLOS(6,6),ZDROS(6,6),ZULOS(6,6),ZUROS(6,6),ZELOS(6,6),ZEROS(6,6),UVOS(9,9)

Real(dp) :: p2, q2, q2_save 
Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Complex(dp) :: cplAhAhAhAh1(2,2,2,2),cplAhAhhhhh1(2,2,2,2),cplAhAhHpcHp1(2,2),cplhhhhhhhh1(2,2,2,2), & 
& cplhhhhHpcHp1(2,2),cplHpHpcHpcHp1,cplAhAhVPVP1(2,2),cplAhAhVPVZ1(2,2),cplAhAhVPVZp1(2,2),& 
& cplAhAhcVWpVWp1(2,2),cplAhAhVZVZ1(2,2),cplAhAhVZVZp1(2,2),cplAhAhVZpVZp1(2,2),         & 
& cplAhHpcVWpVP1(2),cplAhHpcVWpVZ1(2),cplAhHpcVWpVZp1(2),cplAhcHpVPVWp1(2),              & 
& cplAhcHpVWpVZ1(2),cplAhcHpVWpVZp1(2),cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),              & 
& cplhhhhVPVZp1(2,2),cplhhhhcVWpVWp1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),          & 
& cplhhhhVZpVZp1(2,2),cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),            & 
& cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2),cplHpcHpVPVP1,cplHpcHpVPVZ1,    & 
& cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,cplHpcHpVZVZp1,cplHpcHpVZpVZp1,          & 
& cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,           & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZp1Q, & 
& cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp3Q,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,           & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZp1Q,& 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZpVZp1Q,cplcVWpVWpVZpVZp2Q,             & 
& cplcVWpVWpVZpVZp3Q

Complex(dp) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplAhhhVP(2,2), & 
& cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplhhHpcVWp(2),           & 
& cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ(2),cplhhVPVZp(2),           & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,     & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),   & 
& cplAhAhVPVZp(2,2),cplAhAhcVWpVWp(2,2),cplAhAhVZVZ(2,2),cplAhAhVZVZp(2,2),              & 
& cplAhAhVZpVZp(2,2),cplAhHpcVWpVP(2),cplAhHpcVWpVZ(2),cplAhHpcVWpVZp(2),cplAhcHpVPVWp(2),& 
& cplAhcHpVWpVZ(2),cplAhcHpVWpVZp(2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),& 
& cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhhhVZVZp(2,2),cplhhhhVZpVZp(2,2),             & 
& cplhhHpcVWpVP(2),cplhhHpcVWpVZ(2),cplhhHpcVWpVZp(2),cplhhcHpVPVWp(2),cplhhcHpVWpVZ(2), & 
& cplhhcHpVWpVZp(2),cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,             & 
& cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,         & 
& cplcVWpVWpVZp,cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),& 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),             & 
& cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),               & 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),& 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6), & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucVWpL(6,6),& 
& cplcFdFucVWpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),    & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,     & 
& cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,             & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,     & 
& cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcgGgGVG,     & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgAgWpcVWp,      & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,cplcgWCgZpcVWp,    & 
& cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAHp,              & 
& cplcgWCgAcHp,cplcgWpgWphh(2),cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh(2),               & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZHp,cplcgWCgZcHp

Complex(dp) :: cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp

Complex(dp) :: ctcplAhAhhh(2,2,2),ctcplhhhhhh(2,2,2),ctcplhhHpcHp(2),ctcplAhhhVP(2,2),               & 
& ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2),ctcplAhHpcVWp(2),ctcplAhcHpVWp(2),ctcplhhHpcVWp(2), & 
& ctcplhhcHpVWp(2),ctcplHpcHpVP,ctcplHpcHpVZ,ctcplHpcHpVZp,ctcplhhVPVZ(2),               & 
& ctcplhhVPVZp(2),ctcplhhcVWpVWp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2),     & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplHpcVWpVZp,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplcHpVWpVZp, & 
& ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcVWpVWpVZp,ctcplcFdFdAhL(6,6,2),        & 
& ctcplcFdFdAhR(6,6,2),ctcplcFeFeAhL(6,6,2),ctcplcFeFeAhR(6,6,2),ctcplcFuFuAhL(6,6,2),   & 
& ctcplcFuFuAhR(6,6,2),ctcplFvFvAhL(9,9,2),ctcplFvFvAhR(9,9,2),ctcplcFdFdhhL(6,6,2),     & 
& ctcplcFdFdhhR(6,6,2),ctcplcFuFdHpL(6,6),ctcplcFuFdHpR(6,6),ctcplFvFeHpL(9,6),          & 
& ctcplFvFeHpR(9,6),ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2),ctcplcFuFuhhL(6,6,2),      & 
& ctcplcFuFuhhR(6,6,2),ctcplcFdFucHpL(6,6),ctcplcFdFucHpR(6,6),ctcplFvFvhhL(9,9,2),      & 
& ctcplFvFvhhR(9,9,2),ctcplcFeFvcHpL(6,9),ctcplcFeFvcHpR(6,9),ctcplcFdFdVGL(6,6),        & 
& ctcplcFdFdVGR(6,6),ctcplcFdFdVPL(6,6),ctcplcFdFdVPR(6,6),ctcplcFuFdVWpL(6,6),          & 
& ctcplcFuFdVWpR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZR(6,6),ctcplcFdFdVZpL(6,6),         & 
& ctcplcFdFdVZpR(6,6),ctcplFvFeVWpL(9,6),ctcplFvFeVWpR(9,6),ctcplcFeFeVPL(6,6),          & 
& ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZR(6,6),ctcplcFeFeVZpL(6,6),          & 
& ctcplcFeFeVZpR(6,6),ctcplcFuFuVGL(6,6),ctcplcFuFuVGR(6,6),ctcplcFuFuVPL(6,6),          & 
& ctcplcFuFuVPR(6,6),ctcplcFuFuVZL(6,6),ctcplcFuFuVZR(6,6),ctcplcFuFuVZpL(6,6),          & 
& ctcplcFuFuVZpR(6,6),ctcplcFdFucVWpL(6,6),ctcplcFdFucVWpR(6,6),ctcplFvFvVPL(9,9),       & 
& ctcplFvFvVPR(9,9),ctcplFvFvVZL(9,9),ctcplFvFvVZR(9,9),ctcplFvFvVZpL(9,9),              & 
& ctcplFvFvVZpR(9,9),ctcplcFeFvcVWpL(6,9),ctcplcFeFvcVWpR(6,9)

Complex(dp) :: ZRUZh(2,2),ZRUZA(2,2),ZRUVd(6,6),ZRUUd(6,6),ZRUVu(6,6),ZRUUu(6,6),ZRUVe(6,6),         & 
& ZRUUe(6,6),ZRUUV(9,9)

Complex(dp) :: ZcplAhAhhh(2,2,2),Zcplhhhhhh(2,2,2),ZcplhhHpcHp(2),ZcplAhAhAhAh(2,2,2,2),             & 
& ZcplAhAhhhhh(2,2,2,2),ZcplAhAhHpcHp(2,2),Zcplhhhhhhhh(2,2,2,2),ZcplhhhhHpcHp(2,2),     & 
& ZcplHpHpcHpcHp,ZcplAhhhVP(2,2),ZcplAhhhVZ(2,2),ZcplAhhhVZp(2,2),ZcplAhHpcVWp(2),       & 
& ZcplAhcHpVWp(2),ZcplhhHpcVWp(2),ZcplhhcHpVWp(2),ZcplHpcHpVP,ZcplHpcHpVZ,               & 
& ZcplHpcHpVZp,ZcplhhVPVZ(2),ZcplhhVPVZp(2),ZcplhhcVWpVWp(2),ZcplhhVZVZ(2),              & 
& ZcplhhVZVZp(2),ZcplhhVZpVZp(2),ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplHpcVWpVZp,ZcplcHpVPVWp,   & 
& ZcplcHpVWpVZ,ZcplcHpVWpVZp,ZcplAhAhVPVP(2,2),ZcplAhAhVPVZ(2,2),ZcplAhAhVPVZp(2,2),     & 
& ZcplAhAhcVWpVWp(2,2),ZcplAhAhVZVZ(2,2),ZcplAhAhVZVZp(2,2),ZcplAhAhVZpVZp(2,2),         & 
& ZcplAhHpcVWpVP(2),ZcplAhHpcVWpVZ(2),ZcplAhHpcVWpVZp(2),ZcplAhcHpVPVWp(2),              & 
& ZcplAhcHpVWpVZ(2),ZcplAhcHpVWpVZp(2),ZcplhhhhVPVP(2,2),ZcplhhhhVPVZ(2,2),              & 
& ZcplhhhhVPVZp(2,2),ZcplhhhhcVWpVWp(2,2),ZcplhhhhVZVZ(2,2),ZcplhhhhVZVZp(2,2),          & 
& ZcplhhhhVZpVZp(2,2),ZcplhhHpcVWpVP(2),ZcplhhHpcVWpVZ(2),ZcplhhHpcVWpVZp(2),            & 
& ZcplhhcHpVPVWp(2),ZcplhhcHpVWpVZ(2),ZcplhhcHpVWpVZp(2),ZcplHpcHpVPVP,ZcplHpcHpVPVZ,    & 
& ZcplHpcHpVPVZp,ZcplHpcHpcVWpVWp,ZcplHpcHpVZVZ,ZcplHpcHpVZVZp,ZcplHpcHpVZpVZp,          & 
& ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcVWpVWpVZp,ZcplcFdFdAhL(6,6,2),             & 
& ZcplcFdFdAhR(6,6,2),ZcplcFeFeAhL(6,6,2),ZcplcFeFeAhR(6,6,2),ZcplcFuFuAhL(6,6,2),       & 
& ZcplcFuFuAhR(6,6,2),ZcplFvFvAhL(9,9,2),ZcplFvFvAhR(9,9,2),ZcplcFdFdhhL(6,6,2),         & 
& ZcplcFdFdhhR(6,6,2),ZcplcFuFdHpL(6,6),ZcplcFuFdHpR(6,6),ZcplFvFeHpL(9,6),              & 
& ZcplFvFeHpR(9,6),ZcplcFeFehhL(6,6,2),ZcplcFeFehhR(6,6,2),ZcplcFuFuhhL(6,6,2),          & 
& ZcplcFuFuhhR(6,6,2),ZcplcFdFucHpL(6,6),ZcplcFdFucHpR(6,6),ZcplFvFvhhL(9,9,2),          & 
& ZcplFvFvhhR(9,9,2),ZcplcFeFvcHpL(6,9),ZcplcFeFvcHpR(6,9),ZcplcFdFdVGL(6,6),            & 
& ZcplcFdFdVGR(6,6),ZcplcFdFdVPL(6,6),ZcplcFdFdVPR(6,6),ZcplcFuFdVWpL(6,6),              & 
& ZcplcFuFdVWpR(6,6),ZcplcFdFdVZL(6,6),ZcplcFdFdVZR(6,6),ZcplcFdFdVZpL(6,6),             & 
& ZcplcFdFdVZpR(6,6),ZcplFvFeVWpL(9,6),ZcplFvFeVWpR(9,6),ZcplcFeFeVPL(6,6),              & 
& ZcplcFeFeVPR(6,6),ZcplcFeFeVZL(6,6),ZcplcFeFeVZR(6,6),ZcplcFeFeVZpL(6,6),              & 
& ZcplcFeFeVZpR(6,6),ZcplcFuFuVGL(6,6),ZcplcFuFuVGR(6,6),ZcplcFuFuVPL(6,6),              & 
& ZcplcFuFuVPR(6,6),ZcplcFuFuVZL(6,6),ZcplcFuFuVZR(6,6),ZcplcFuFuVZpL(6,6),              & 
& ZcplcFuFuVZpR(6,6),ZcplcFdFucVWpL(6,6),ZcplcFdFucVWpR(6,6),ZcplFvFvVPL(9,9),           & 
& ZcplFvFvVPR(9,9),ZcplFvFvVZL(9,9),ZcplFvFvVZR(9,9),ZcplFvFvVZpL(9,9),ZcplFvFvVZpR(9,9),& 
& ZcplcFeFvcVWpL(6,9),ZcplcFeFvcVWpR(6,9),ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpVPVWpVZp1,ZcplcVWpVPVWpVZp2,ZcplcVWpVPVWpVZp3,ZcplcVWpcVWpVWpVWp1,& 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcVWpVWpVZVZp1,ZcplcVWpVWpVZVZp2,ZcplcVWpVWpVZVZp3,ZcplcVWpVWpVZpVZp1,& 
& ZcplcVWpVWpVZpVZp2,ZcplcVWpVWpVZpVZp3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,        & 
& ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgWpgWpVZp,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgZpgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgZpgWCVWp

Complex(dp) :: ZcplcgWCgWCVZ,ZcplcgWCgWCVZp,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgZpVWp,              & 
& ZcplcgWCgZpcVWp,ZcplcgWpgWpAh(2),ZcplcgWCgWCAh(2),ZcplcgZgAhh(2),ZcplcgZpgAhh(2),      & 
& ZcplcgWpgAHp,ZcplcgWCgAcHp,ZcplcgWpgWphh(2),ZcplcgZgWpcHp,ZcplcgZpgWpcHp,              & 
& ZcplcgWCgWChh(2),ZcplcgZgWCHp,ZcplcgZpgWCHp,ZcplcgZgZhh(2),ZcplcgZpgZhh(2),            & 
& ZcplcgWpgZHp,ZcplcgWCgZcHp,ZcplcgZgZphh(2),ZcplcgZpgZphh(2),ZcplcgWpgZpHp,             & 
& ZcplcgWCgZpcHp

Complex(dp) :: GcplhhHpcHp(2),GcplAhHpcVWp(2),GcplAhcHpVWp(2),GcplhhHpcVWp(2),GcplhhcHpVWp(2),       & 
& GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,          & 
& GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL(6,6),GcplcFuFdHpR(6,6),           & 
& GcplFvFeHpL(9,6),GcplFvFeHpR(9,6),GcplcFdFucHpL(6,6),GcplcFdFucHpR(6,6),               & 
& GcplcFeFvcHpL(6,9),GcplcFeFvcHpR(6,9)

Complex(dp) :: GZcplhhHpcHp(2),GZcplAhHpcVWp(2),GZcplAhcHpVWp(2),GZcplhhHpcVWp(2),GZcplhhcHpVWp(2),  & 
& GZcplHpcHpVP,GZcplHpcHpVZ,GZcplHpcHpVZp,GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplHpcVWpVZp,    & 
& GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcHpVWpVZp,GZcplcFuFdHpL(6,6),GZcplcFuFdHpR(6,6),      & 
& GZcplFvFeHpL(9,6),GZcplFvFeHpR(9,6),GZcplcFdFucHpL(6,6),GZcplcFdFucHpR(6,6),           & 
& GZcplcFeFvcHpL(6,9),GZcplcFeFvcHpR(6,9)

Complex(dp) :: GosZcplhhHpcHp(2),GosZcplAhHpcVWp(2),GosZcplAhcHpVWp(2),GosZcplhhHpcVWp(2),           & 
& GosZcplhhcHpVWp(2),GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcHpVZp,GosZcplHpcVWpVP,      & 
& GosZcplHpcVWpVZ,GosZcplHpcVWpVZp,GosZcplcHpVPVWp,GosZcplcHpVWpVZ,GosZcplcHpVWpVZp,     & 
& GosZcplcFuFdHpL(6,6),GosZcplcFuFdHpR(6,6),GosZcplFvFeHpL(9,6),GosZcplFvFeHpR(9,6),     & 
& GosZcplcFdFucHpL(6,6),GosZcplcFdFucHpR(6,6),GosZcplcFeFvcHpL(6,9),GosZcplcFeFvcHpR(6,9)

Real(dp), Intent(out) :: gP1LFu(6,42) 
Real(dp), Intent(out) :: gP1LFe(6,39) 
Real(dp), Intent(out) :: gP1LFd(6,42) 
Real(dp), Intent(out) :: gP1Lhh(2,174) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateOneLoopDecays'
 
Write(*,*) "Calculating one loop decays" 
! Regulator mass for gluon/photon 
MLambda = Mass_Regulator_PhotonGluon 
divset=SetDivonlyAdd(INT(divonly_save)) 
divvalue=SetDivergenceAdd(divergence_save) 
If (.not.CalculateOneLoopMasses) Then 
 If (OSkinematics) Then 
  Write(*,*) "Loop masses not calculated: tree-level masses used for kinematics" 
  OSkinematics = .false. 
 End if
 If (ExternalZfactors) Then 
  Write(*,*) "Loop masses not calculated: no U-factors are applied" 
  ExternalZfactors = .false. 
 End if
End if

If (Extra_scale_loopDecays) Then 
q2_save = GetRenormalizationScale() 
q2 = SetRenormalizationScale(scale_loopdecays **2) 
End if 
If ((OSkinematics).or.(ExternalZfactors)) ShiftIRdiv = .true. 
If (ewOSinDecays) Then 
sinW2=1._dp-mW2/mZ2 
g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2) 
vSM=sqrt(mz2*4._dp/(g1SM**2+g2SM**2)) 
g1=g1SM 
g2=g2SM 
vH=vSM 
 If (yukOSinDecays) Then !! Allow OS Yukawas only together with vSM 
    YuSM = 0._dp 
    YdSM = 0._dp 
    YuSM = 0._dp 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
   If(GenerationMixing) Then 
    YuSM = Transpose(Matmul(Transpose(CKM),Transpose(YuSM))) 
   End if 
 End if 
End if 
! -------------------------------------------- 
! General information needed in the following 
! -------------------------------------------- 

! DR parameters 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

! Stabilize numerics 
If (Abs(MHp).lt.1.0E-15_dp) MHp=0._dp
If (Abs(MHp2).lt.1.0E-30_dp) MHp2=0._dp
Where (Abs(Mhh).lt.1.0E-15_dp) Mhh=0._dp
Where (Abs(Mhh2).lt.1.0E-30_dp) Mhh2=0._dp
Where (Abs(MAh).lt.1.0E-15_dp) MAh=0._dp
Where (Abs(MAh2).lt.1.0E-30_dp) MAh2=0._dp
Where (Abs(MFd).lt.1.0E-15_dp) MFd=0._dp
Where (Abs(MFd2).lt.1.0E-30_dp) MFd2=0._dp
Where (Abs(MFu).lt.1.0E-15_dp) MFu=0._dp
Where (Abs(MFu2).lt.1.0E-30_dp) MFu2=0._dp
Where (Abs(MFe).lt.1.0E-15_dp) MFe=0._dp
Where (Abs(MFe2).lt.1.0E-30_dp) MFe2=0._dp
Where (Abs(MFv).lt.1.0E-15_dp) MFv=0._dp
Where (Abs(MFv2).lt.1.0E-30_dp) MFv2=0._dp
If (UseZeroRotationMatrices) Then  ! Rotation matrices calculated for p2=0
ZRUZh = MatMul(ZHOS_0, Transpose(ZH))
ZRUZA = MatMul(ZAOS_0, Transpose(ZA))
ZRUVd = MatMul(ZDLOS_0, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_0, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_0, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_0, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_0, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_0, Conjg(Transpose(ZER)))
ZRUUV = MatMul(UVOS_0, Conjg(Transpose(UV)))
Else If (UseP2Matrices) Then   ! p2 dependent matrix 
ZRUZh = MatMul(ZHOS_p2, Transpose(ZH))
ZRUZA = MatMul(ZAOS_p2, Transpose(ZA))
ZRUVd = MatMul(ZDLOS_p2, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_p2, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_p2, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_p2, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_p2, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_p2, Conjg(Transpose(ZER)))
ZRUUV = MatMul(UVOS_p2, Conjg(Transpose(UV)))
Else  ! Rotation matrix for lightest state
ZRUZh = MatMul(ZHOS, Transpose(ZH))
ZRUZA = MatMul(ZAOS, Transpose(ZA))
ZRUVd = MatMul(ZDLOS, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS, Conjg(Transpose(ZER)))
ZRUUV = MatMul(UVOS, Conjg(Transpose(UV)))
End if 
! Couplings 
Call AllCouplingsReallyAll(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,               & 
& TW,gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,              & 
& UV,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,    & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,     & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,             & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,cplAhHpcVWpVZ,     & 
& cplAhHpcVWpVZp,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,cplhhhhVPVP,cplhhhhVPVZ,     & 
& cplhhhhVPVZp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpcVWpVP,      & 
& cplhhHpcVWpVZ,cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplhhcHpVWpVZp,               & 
& cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZVZp,    & 
& cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,            & 
& cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,     & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,& 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,   & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,& 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,     & 
& cplcgZpgWCVWp,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,     & 
& cplcgWCgZpcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,           & 
& cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,         & 
& cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,              & 
& cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp)

em = cplcVWpVPVWp 
gs = cplcFdFdVGL(1,1) 
Call CouplingsColoredQuartics(LamH,LamPhiH,LamPhi,ZA,ZH,g1,g2,gX1,TW,gX,              & 
& g1X,TWp,g3,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,         & 
& cplHpHpcHpcHp1,cplAhAhVPVP1,cplAhAhVPVZ1,cplAhAhVPVZp1,cplAhAhcVWpVWp1,cplAhAhVZVZ1,   & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhHpcVWpVZp1,            & 
& cplAhcHpVPVWp1,cplAhcHpVWpVZ1,cplAhcHpVWpVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,               & 
& cplhhhhVPVZp1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,           & 
& cplhhcHpVWpVZp1,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,           & 
& cplHpcHpVZVZ1,cplHpcHpVZVZp1,cplHpcHpVZpVZp1,cplVGVGVGVG1Q,cplVGVGVGVG2Q,              & 
& cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,     & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZp1Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp3Q,& 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,          & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp3Q,& 
& cplcVWpVWpVZpVZp1Q,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q)

If (externalZfactors) Then 
Call getZCouplings(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,gX,g1X,             & 
& TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,           & 
& cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,    & 
& cplHpHpcHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,      & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,       & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,     & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWpVWp,          & 
& cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhHpcVWpVZp,     & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,       & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpcVWpVP,cplhhHpcVWpVZ,     & 
& cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplhhcHpVWpVZp,cplHpcHpVPVP,cplHpcHpVPVZ,   & 
& cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,               & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,     & 
& cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,  & 
& cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,      & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,               & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,   & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,& 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,     & 
& cplcgZpgWCVWp,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,     & 
& cplcgWCgZpcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,           & 
& cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,         & 
& cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,              & 
& cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,ZRUZh,ZRUZA,ZRUVd,ZRUUd,ZRUVu,ZRUUu,           & 
& ZRUVe,ZRUUe,ZRUUV,ZcplAhAhhh,Zcplhhhhhh,ZcplhhHpcHp,ZcplAhAhAhAh,ZcplAhAhhhhh,         & 
& ZcplAhAhHpcHp,Zcplhhhhhhhh,ZcplhhhhHpcHp,ZcplHpHpcHpcHp,ZcplAhhhVP,ZcplAhhhVZ,         & 
& ZcplAhhhVZp,ZcplAhHpcVWp,ZcplAhcHpVWp,ZcplhhHpcVWp,ZcplhhcHpVWp,ZcplHpcHpVP,           & 
& ZcplHpcHpVZ,ZcplHpcHpVZp,ZcplhhVPVZ,ZcplhhVPVZp,ZcplhhcVWpVWp,ZcplhhVZVZ,              & 
& ZcplhhVZVZp,ZcplhhVZpVZp,ZcplHpcVWpVP,ZcplHpcVWpVZ,ZcplHpcVWpVZp,ZcplcHpVPVWp,         & 
& ZcplcHpVWpVZ,ZcplcHpVWpVZp,ZcplAhAhVPVP,ZcplAhAhVPVZ,ZcplAhAhVPVZp,ZcplAhAhcVWpVWp,    & 
& ZcplAhAhVZVZ,ZcplAhAhVZVZp,ZcplAhAhVZpVZp,ZcplAhHpcVWpVP,ZcplAhHpcVWpVZ,               & 
& ZcplAhHpcVWpVZp,ZcplAhcHpVPVWp,ZcplAhcHpVWpVZ,ZcplAhcHpVWpVZp,ZcplhhhhVPVP,            & 
& ZcplhhhhVPVZ,ZcplhhhhVPVZp,ZcplhhhhcVWpVWp,ZcplhhhhVZVZ,ZcplhhhhVZVZp,ZcplhhhhVZpVZp,  & 
& ZcplhhHpcVWpVP,ZcplhhHpcVWpVZ,ZcplhhHpcVWpVZp,ZcplhhcHpVPVWp,ZcplhhcHpVWpVZ,           & 
& ZcplhhcHpVWpVZp,ZcplHpcHpVPVP,ZcplHpcHpVPVZ,ZcplHpcHpVPVZp,ZcplHpcHpcVWpVWp,           & 
& ZcplHpcHpVZVZ,ZcplHpcHpVZVZp,ZcplHpcHpVZpVZp,ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,   & 
& ZcplcVWpVWpVZp,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,       & 
& ZcplcFuFuAhR,ZcplFvFvAhL,ZcplFvFvAhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHpL,           & 
& ZcplcFuFdHpR,ZcplFvFeHpL,ZcplFvFeHpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,           & 
& ZcplcFuFuhhR,ZcplcFdFucHpL,ZcplcFdFucHpR,ZcplFvFvhhL,ZcplFvFvhhR,ZcplcFeFvcHpL,        & 
& ZcplcFeFvcHpR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdVWpL,       & 
& ZcplcFuFdVWpR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFdVZpL,ZcplcFdFdVZpR,ZcplFvFeVWpL,      & 
& ZcplFvFeVWpR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFeVZpL,        & 
& ZcplcFeFeVZpR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,        & 
& ZcplcFuFuVZR,ZcplcFuFuVZpL,ZcplcFuFuVZpR,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplFvFvVPL,    & 
& ZcplFvFvVPR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplFvFvVZpL,ZcplFvFvVZpR,ZcplcFeFvcVWpL,          & 
& ZcplcFeFvcVWpR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWpVPVPVWp1,             & 
& ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,ZcplcVWpVPVWpVZ3,  & 
& ZcplcVWpVPVWpVZp1,ZcplcVWpVPVWpVZp2,ZcplcVWpVPVWpVZp3,ZcplcVWpcVWpVWpVWp1,             & 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcVWpVWpVZVZp1,ZcplcVWpVWpVZVZp2,ZcplcVWpVWpVZVZp3,ZcplcVWpVWpVZpVZp1,& 
& ZcplcVWpVWpVZpVZp2,ZcplcVWpVWpVZpVZp3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,        & 
& ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgWpgWpVZp,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgZpgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgZpgWCVWp,              & 
& ZcplcgWCgWCVZ,ZcplcgWCgWCVZp,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgZpVWp,              & 
& ZcplcgWCgZpcVWp,ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgZgAhh,ZcplcgZpgAhh,ZcplcgWpgAHp,     & 
& ZcplcgWCgAcHp,ZcplcgWpgWphh,ZcplcgZgWpcHp,ZcplcgZpgWpcHp,ZcplcgWCgWChh,ZcplcgZgWCHp,   & 
& ZcplcgZpgWCHp,ZcplcgZgZhh,ZcplcgZpgZhh,ZcplcgWpgZHp,ZcplcgWCgZcHp,ZcplcgZgZphh,        & 
& ZcplcgZpgZphh,ZcplcgWpgZpHp,ZcplcgWCgZpcHp)

End if 
Call getGBCouplings(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,              & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,MAh,MAh2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcHpVPVWp,cplcHpVWpVZ,         & 
& cplcHpVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplFvFeVWpL,cplFvFeVWpR,          & 
& cplhhcHpVWp,cplhhcVWpVWp,ZcplcFdFucVWpL,ZcplcFdFucVWpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,  & 
& ZcplcFuFdVWpL,ZcplcFuFdVWpR,ZcplcHpVPVWp,ZcplcHpVWpVZ,ZcplcHpVWpVZp,ZcplcVWpVPVWp,     & 
& ZcplcVWpVWpVZ,ZcplcVWpVWpVZp,ZcplFvFeVWpL,ZcplFvFeVWpR,ZcplhhcHpVWp,ZcplhhcVWpVWp,     & 
& GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,           & 
& GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,GcplHpcVWpVZ,GcplHpcVWpVZp,GcplcHpVPVWp,         & 
& GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL,GcplcFuFdHpR,GcplFvFeHpL,GcplFvFeHpR,          & 
& GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GZcplhhHpcHp,GZcplAhHpcVWp,    & 
& GZcplAhcHpVWp,GZcplhhHpcVWp,GZcplhhcHpVWp,GZcplHpcHpVP,GZcplHpcHpVZ,GZcplHpcHpVZp,     & 
& GZcplHpcVWpVP,GZcplHpcVWpVZ,GZcplHpcVWpVZp,GZcplcHpVPVWp,GZcplcHpVWpVZ,GZcplcHpVWpVZp, & 
& GZcplcFuFdHpL,GZcplcFuFdHpR,GZcplFvFeHpL,GZcplFvFeHpR,GZcplcFdFucHpL,GZcplcFdFucHpR,   & 
& GZcplcFeFvcHpL,GZcplcFeFvcHpR,GosZcplhhHpcHp,GosZcplAhHpcVWp,GosZcplAhcHpVWp,          & 
& GosZcplhhHpcVWp,GosZcplhhcHpVWp,GosZcplHpcHpVP,GosZcplHpcHpVZ,GosZcplHpcHpVZp,         & 
& GosZcplHpcVWpVP,GosZcplHpcVWpVZ,GosZcplHpcVWpVZp,GosZcplcHpVPVWp,GosZcplcHpVWpVZ,      & 
& GosZcplcHpVWpVZp,GosZcplcFuFdHpL,GosZcplcFuFdHpR,GosZcplFvFeHpL,GosZcplFvFeHpR,        & 
& GosZcplcFdFucHpL,GosZcplcFdFucHpR,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR)

! Write intilization of all counter terms 
Call WaveFunctionRenormalisation(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,              & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,               & 
& MVZp2OS,MVWpOS,MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,             & 
& alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,               & 
& g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,               & 
& mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,cplAhAhhh,cplhhhhhh,cplhhHpcHp,           & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,           & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,        & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcHpVPVWp,               & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,cplAhAhVPVZp,cplAhAhcVWpVWp,          & 
& cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhHpcVWpVZp,     & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,       & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,cplhhhhVZpVZp,cplhhHpcVWpVP,cplhhHpcVWpVZ,     & 
& cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplhhcHpVWpVZp,cplHpcHpVPVP,cplHpcHpVPVZ,   & 
& cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZVZp,cplHpcHpVZpVZp,               & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,     & 
& cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,  & 
& cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,      & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,               & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,   & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,& 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,         & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,     & 
& cplcgZpgWCVWp,cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,     & 
& cplcgWCgZpcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,           & 
& cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,         & 
& cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,              & 
& cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,GcplhhHpcHp,GcplAhHpcVWp,GcplAhcHpVWp,         & 
& GcplhhHpcVWp,GcplhhcHpVWp,GcplHpcHpVP,GcplHpcHpVZ,GcplHpcHpVZp,GcplHpcVWpVP,           & 
& GcplHpcVWpVZ,GcplHpcVWpVZp,GcplcHpVPVWp,GcplcHpVWpVZ,GcplcHpVWpVZp,GcplcFuFdHpL,       & 
& GcplcFuFdHpR,GcplFvFeHpL,GcplFvFeHpR,GcplcFdFucHpL,GcplcFdFucHpR,GcplcFeFvcHpL,        & 
& GcplcFeFvcHpR,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,dmChiU,dYvL,             & 
& dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,dLamPhi,               & 
& dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,dTanTW,              & 
& dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,ZfDL,ZfDR,           & 
& ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ,ctcplAhAhhh,    & 
& ctcplhhhhhh,ctcplhhHpcHp,ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpcVWp,           & 
& ctcplAhcHpVWp,ctcplhhHpcVWp,ctcplhhcHpVWp,ctcplHpcHpVP,ctcplHpcHpVZ,ctcplHpcHpVZp,     & 
& ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,        & 
& ctcplHpcVWpVP,ctcplHpcVWpVZ,ctcplHpcVWpVZp,ctcplcHpVPVWp,ctcplcHpVWpVZ,ctcplcHpVWpVZp, & 
& ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,ctcplcVWpVWpVZp,ctcplcFdFdAhL,               & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplFvFvAhL,    & 
& ctcplFvFvAhR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHpL,ctcplcFuFdHpR,ctcplFvFeHpL,     & 
& ctcplFvFeHpR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHpL,   & 
& ctcplcFdFucHpR,ctcplFvFvhhL,ctcplFvFvhhR,ctcplcFeFvcHpL,ctcplcFeFvcHpR,ctcplcFdFdVGL,  & 
& ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFuFdVWpL,ctcplcFuFdVWpR,               & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,ctcplFvFeVWpL,               & 
& ctcplFvFeVWpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFeVZpL,  & 
& ctcplcFeFeVZpR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,  & 
& ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFdFucVWpL,ctcplcFdFucVWpR,           & 
& ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,       & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,MLambda,deltaM,kont)

! -------------------------------------------- 
! The decays at one-loop 
! -------------------------------------------- 

! Fu
If (CalcLoopDecay_Fu) Then 
Call OneLoopDecay_Fu(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,             & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,MAh,MAh2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,              & 
& gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,            & 
& mChiU,mu2H,mu2Phi,vH,vPhi,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,             & 
& dmChiU,dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,           & 
& dLamPhi,dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,              & 
& ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,              & 
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

End if 
! Fe
If (CalcLoopDecay_Fe) Then 
Call OneLoopDecay_Fe(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,             & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,MAh,MAh2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,              & 
& gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,            & 
& mChiU,mu2H,mu2Phi,vH,vPhi,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,             & 
& dmChiU,dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,           & 
& dLamPhi,dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,              & 
& ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,              & 
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

End if 
! Fd
If (CalcLoopDecay_Fd) Then 
Call OneLoopDecay_Fd(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,             & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,MAh,MAh2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,              & 
& gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,            & 
& mChiU,mu2H,mu2Phi,vH,vPhi,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,             & 
& dmChiU,dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,           & 
& dLamPhi,dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,              & 
& ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,              & 
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

End if 
! hh
If (CalcLoopDecay_hh) Then 
Call OneLoopDecay_hh(MhhOS,Mhh2OS,MAhOS,MAh2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,             & 
& MFeOS,MFe2OS,MFvOS,MFv2OS,MHpOS,MHp2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZAOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,UVOS,alphaH,MAh,MAh2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,              & 
& gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,            & 
& mChiU,mu2H,mu2Phi,vH,vPhi,dg1,dg2,dg3,dgX,dg1X,dgX1,dmChiD,dmChiE,dmChiNu,             & 
& dmChiU,dYvL,dYuL,dYvR,dYuR,dYdL,dYeL,dYdR,dYeR,dmu2H,dmu2Phi,dLamH,dLamPhiH,           & 
& dLamPhi,dvH,dvPhi,dZH,dZA,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dUV,dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZfHp,ZfVP,ZfVZ,ZfVZp,ZfVWp,Zfhh,ZfAh,              & 
& ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfFV,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,              & 
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

End if 
If (Extra_scale_loopDecays) Then 
q2 = SetRenormalizationScale(q2_save) 
End if 
Iname = Iname - 1 
 
End Subroutine CalculateOneLoopDecays  
 
 
End Module OneLoopDecays_U1T3R 
 