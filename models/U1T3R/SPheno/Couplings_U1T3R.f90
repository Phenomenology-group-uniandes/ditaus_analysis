! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:51 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Couplings_U1T3R
 
Use Control 
Use Settings 
Use Model_Data_U1T3R 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,             & 
& gX1,TW,gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,              & 
& YvR,UV,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,            & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,     & 
& cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,       & 
& cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhVPVP,cplAhAhVPVZ,             & 
& cplAhAhVPVZp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhVZVZp,cplAhAhVZpVZp,cplAhHpcVWpVP,      & 
& cplAhHpcVWpVZ,cplAhHpcVWpVZp,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplAhcHpVWpVZp,               & 
& cplhhhhVPVP,cplhhhhVPVZ,cplhhhhVPVZp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhVZVZp,          & 
& cplhhhhVZpVZp,cplhhHpcVWpVP,cplhhHpcVWpVZ,cplhhHpcVWpVZp,cplhhcHpVPVWp,cplhhcHpVWpVZ,  & 
& cplhhcHpVWpVZp,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpcVWpVWp,cplHpcHpVZVZ,   & 
& cplHpcHpVZVZp,cplHpcHpVZpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,      & 
& cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,               & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,             & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,           & 
& cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,             & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,     & 
& cplcVWpVPVWpVZp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,             & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,     & 
& cplcVWpVWpVZVZp3,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcgGgGVG,     & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgAgWpcVWp,      & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZpgWCVWp,     & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgZpVWp,cplcgWCgZpcVWp,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,cplcgWCgAcHp,             & 
& cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZpgWCHp,         & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh,cplcgZpgZphh,              & 
& cplcgWpgZpHp,cplcgWCgZpcHp)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
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

Complex(dp), Intent(out) :: cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpT(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHpT(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpT(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpT(LamH,cplHpHpcHpcHp)



cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPT(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpT(gt1,g2,ZA,cplAhHpcVWp(gt1))

End Do 


cplAhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpT(gt1,g2,ZA,cplAhcHpVWp(gt1))

End Do 


cplhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpT(gt1,g2,ZH,cplhhHpcVWp(gt1))

End Do 


cplhhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpT(gt1,g2,ZH,cplhhcHpVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,g1X,TW,TWp,cplHpcHpVZ)



cplHpcHpVZp = 0._dp 
Call CouplingHpcHpVZpT(g1,g2,g1X,TW,TWp,cplHpcHpVZp)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZp(gt1))

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


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,vH,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZ)



cplHpcVWpVZp = 0._dp 
Call CouplingHpcVWpVZpT(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZp)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,vH,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZ)



cplcHpVWpVZp = 0._dp 
Call CouplingcHpVWpVZpT(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZp)



cplAhAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVPT(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhAhVPVP(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZ(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZp(gt1,gt2))

 End Do 
End Do 


cplAhAhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWpVWpT(gt1,gt2,g2,ZA,cplAhAhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZp(gt1,gt2))

 End Do 
End Do 


cplAhAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZpVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplAhHpcVWpVP = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVPT(gt1,g1,g2,ZA,TW,cplAhHpcVWpVP(gt1))

End Do 


cplAhHpcVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVZT(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhHpcVWpVZ(gt1))

End Do 


cplAhHpcVWpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVZpT(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhHpcVWpVZp(gt1))

End Do 


cplAhcHpVPVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVPVWpT(gt1,g1,g2,ZA,TW,cplAhcHpVPVWp(gt1))

End Do 


cplAhcHpVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpVZT(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhcHpVWpVZ(gt1))

End Do 


cplAhcHpVWpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpVZpT(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhcHpVWpVZp(gt1))

End Do 


cplhhhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVPT(gt1,gt2,g1,g2,gX1,ZH,TW,cplhhhhVPVP(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZpVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplhhHpcVWpVP = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVPT(gt1,g1,g2,ZH,TW,cplhhHpcVWpVP(gt1))

End Do 


cplhhHpcVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVZT(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhHpcVWpVZ(gt1))

End Do 


cplhhHpcVWpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVZpT(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhHpcVWpVZp(gt1))

End Do 


cplhhcHpVPVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVPVWpT(gt1,g1,g2,ZH,TW,cplhhcHpVPVWp(gt1))

End Do 


cplhhcHpVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpVZT(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhcHpVWpVZ(gt1))

End Do 


cplhhcHpVWpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpVZpT(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhcHpVWpVZp(gt1))

End Do 


cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPT(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZT(g1,g2,g1X,TW,TWp,cplHpcHpVPVZ)



cplHpcHpVPVZp = 0._dp 
Call CouplingHpcHpVPVZpT(g1,g2,g1X,TW,TWp,cplHpcHpVPVZp)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpT(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZT(g1,g2,g1X,TW,TWp,cplHpcHpVZVZ)



cplHpcHpVZVZp = 0._dp 
Call CouplingHpcHpVZVZpT(g1,g2,g1X,TW,TWp,cplHpcHpVZVZp)



cplHpcHpVZpVZp = 0._dp 
Call CouplingHpcHpVZpVZpT(g1,g2,g1X,TW,TWp,cplHpcHpVZpVZp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,TWp,cplcVWpVWpVZ)



cplcVWpVWpVZp = 0._dp 
Call CouplingcVWpVWpVZpT(g2,TW,TWp,cplcVWpVWpVZp)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvAhT(gt1,gt2,gt3,YvL,YvR,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
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


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)            & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

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


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

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


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplcFeFvcHpL(gt1,gt2)               & 
& ,cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcFdFdVPL(gt1,gt2)               & 
& ,cplcFdFdVPR(gt1,gt2))

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


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcFeFeVPL(gt1,gt2)               & 
& ,cplcFeFeVPR(gt1,gt2))

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


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcFuFuVPL(gt1,gt2)               & 
& ,cplcFuFuVPR(gt1,gt2))

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


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVPT(gt1,gt2,g1,g2,gX1,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

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


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpT(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZT(g2,TW,TWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplcVWpVPVWpVZp1 = 0._dp 
cplcVWpVPVWpVZp2 = 0._dp 
cplcVWpVPVWpVZp3 = 0._dp 
Call CouplingcVWpVPVWpVZpT(g2,TW,TWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,               & 
& cplcVWpVPVWpVZp3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpT(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZT(g2,TW,TWp,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcVWpVWpVZVZp1 = 0._dp 
cplcVWpVWpVZVZp2 = 0._dp 
cplcVWpVWpVZVZp3 = 0._dp 
Call CouplingcVWpVWpVZVZpT(g2,TW,TWp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,               & 
& cplcVWpVWpVZVZp3)



cplcVWpVWpVZpVZp1 = 0._dp 
cplcVWpVWpVZpVZp2 = 0._dp 
cplcVWpVWpVZpVZp3 = 0._dp 
Call CouplingcVWpVWpVZpVZpT(g2,TW,TWp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,            & 
& cplcVWpVWpVZpVZp3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWpgAVWp = 0._dp 
Call CouplingcgWpgAVWpT(g2,TW,cplcgWpgAVWp)



cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpT(g2,TW,cplcgWCgAcVWp)



cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPT(g2,TW,cplcgWpgWpVP)



cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZT(g2,TW,TWp,cplcgWpgWpVZ)



cplcgWpgWpVZp = 0._dp 
Call CouplingcgWpgWpVZpT(g2,TW,TWp,cplcgWpgWpVZp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpT(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpT(g2,TW,TWp,cplcgZgWpcVWp)



cplcgZpgWpcVWp = 0._dp 
Call CouplingcgZpgWpcVWpT(g2,TW,TWp,cplcgZpgWpcVWp)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPT(g2,TW,cplcgWCgWCVP)



cplcgAgWCVWp = 0._dp 
Call CouplingcgAgWCVWpT(g2,TW,cplcgAgWCVWp)



cplcgZgWCVWp = 0._dp 
Call CouplingcgZgWCVWpT(g2,TW,TWp,cplcgZgWCVWp)



cplcgZpgWCVWp = 0._dp 
Call CouplingcgZpgWCVWpT(g2,TW,TWp,cplcgZpgWCVWp)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZT(g2,TW,TWp,cplcgWCgWCVZ)



cplcgWCgWCVZp = 0._dp 
Call CouplingcgWCgWCVZpT(g2,TW,TWp,cplcgWCgWCVZp)



cplcgWpgZVWp = 0._dp 
Call CouplingcgWpgZVWpT(g2,TW,TWp,cplcgWpgZVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpT(g2,TW,TWp,cplcgWCgZcVWp)



cplcgWpgZpVWp = 0._dp 
Call CouplingcgWpgZpVWpT(g2,TW,TWp,cplcgWpgZpVWp)



cplcgWCgZpcVWp = 0._dp 
Call CouplingcgWCgZpcVWpT(g2,TW,TWp,cplcgWCgZpcVWp)



cplcgWpgWpAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpAhT(gt3,g2,vH,ZA,cplcgWpgWpAh(gt3))

End Do 


cplcgWCgWCAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCAhT(gt3,g2,vH,ZA,cplcgWCgWCAh(gt3))

End Do 


cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZgAhh(gt3))

End Do 


cplcgZpgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgAhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZpgAhh(gt3))

End Do 


cplcgWpgAHp = 0._dp 
Call CouplingcgWpgAHpT(g1,g2,vH,TW,cplcgWpgAHp)



cplcgWCgAcHp = 0._dp 
Call CouplingcgWCgAcHpT(g1,g2,vH,TW,cplcgWCgAcHp)



cplcgWpgWphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWphhT(gt3,g2,vH,ZH,cplcgWpgWphh(gt3))

End Do 


cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpT(g1,g2,g1X,vH,TW,TWp,cplcgZgWpcHp)



cplcgZpgWpcHp = 0._dp 
Call CouplingcgZpgWpcHpT(g1,g2,g1X,vH,TW,TWp,cplcgZpgWpcHp)



cplcgWCgWChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWChhT(gt3,g2,vH,ZH,cplcgWCgWChh(gt3))

End Do 


cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpT(g1,g2,g1X,vH,TW,TWp,cplcgZgWCHp)



cplcgZpgWCHp = 0._dp 
Call CouplingcgZpgWCHpT(g1,g2,g1X,vH,TW,TWp,cplcgZpgWCHp)



cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZgZhh(gt3))

End Do 


cplcgZpgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZpgZhh(gt3))

End Do 


cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpT(g1,g2,g1X,vH,TW,TWp,cplcgWpgZHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpT(g1,g2,g1X,vH,TW,TWp,cplcgWCgZcHp)



cplcgZgZphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZphhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZgZphh(gt3))

End Do 


cplcgZpgZphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZphhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplcgZpgZphh(gt3))

End Do 


cplcgWpgZpHp = 0._dp 
Call CouplingcgWpgZpHpT(g1,g2,g1X,vH,TW,TWp,cplcgWpgZpHp)



cplcgWCgZpcHp = 0._dp 
Call CouplingcgWCgZpcHpT(g1,g2,g1X,vH,TW,TWp,cplcgWCgZpcHp)



Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,               & 
& gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,              & 
& cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,             & 
& cplAhcHpVWp,cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,       & 
& cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplHpcVWpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplVGVGVG,cplcVWpVPVWp,              & 
& cplcVWpVWpVZ,cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,     & 
& cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,           & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),        & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplhhHpcVWp(2),cplhhcHpVWp(2),           & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ(2),cplhhVPVZp(2),cplhhcVWpVWp(2),          & 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,        & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,              & 
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
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpT(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPT(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpT(gt1,g2,ZA,cplAhHpcVWp(gt1))

End Do 


cplAhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpT(gt1,g2,ZA,cplAhcHpVWp(gt1))

End Do 


cplhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpT(gt1,g2,ZH,cplhhHpcVWp(gt1))

End Do 


cplhhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpT(gt1,g2,ZH,cplhhcHpVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,g1X,TW,TWp,cplHpcHpVZ)



cplHpcHpVZp = 0._dp 
Call CouplingHpcHpVZpT(g1,g2,g1X,TW,TWp,cplHpcHpVZp)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZp(gt1))

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


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,vH,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZ)



cplHpcVWpVZp = 0._dp 
Call CouplingHpcVWpVZpT(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZp)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,vH,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZ)



cplcHpVWpVZp = 0._dp 
Call CouplingcHpVWpVZpT(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,TWp,cplcVWpVWpVZ)



cplcVWpVWpVZp = 0._dp 
Call CouplingcVWpVWpVZpT(g2,TW,TWp,cplcVWpVWpVZp)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdAhT(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeAhT(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)         & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuAhT(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvAhT(gt1,gt2,gt3,YvL,YvR,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
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


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)            & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

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


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

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


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplcFeFvcHpL(gt1,gt2)               & 
& ,cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcFdFdVPL(gt1,gt2)               & 
& ,cplcFdFdVPR(gt1,gt2))

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


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcFeFeVPL(gt1,gt2)               & 
& ,cplcFeFeVPR(gt1,gt2))

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


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcFuFuVPL(gt1,gt2)               & 
& ,cplcFuFuVPR(gt1,gt2))

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


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVPT(gt1,gt2,g1,g2,gX1,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

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
End Subroutine AllCouplings

Subroutine CouplingAhAhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-2*LamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*vH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-6*LamPhi*vPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHpcHpT(gt1,LamH,LamPhiH,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZH(gt1,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpT  
 
 
Subroutine CouplingAhAhAhAhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res = res-6*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhhhhhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHpcHpT(gt1,gt2,LamH,LamPhiH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpT  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-6*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHpcHpT(gt1,gt2,LamH,LamPhiH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZH(gt1,1)*ZH(gt2,1)
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpT  
 
 
Subroutine CouplingHpHpcHpcHpT(LamH,res)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-4._dp*(LamH)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpT  
 
 
Subroutine CouplingAhhhVPT(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))
res = res+(g2*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gX1*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVPT  
 
 
Subroutine CouplingAhhhVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res+gX1*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res-(gX*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhhhVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-(gX*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = res-(gX1*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZpT  
 
 
Subroutine CouplingAhHpcVWpT(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpT  
 
 
Subroutine CouplingAhcHpVWpT(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpT  
 
 
Subroutine CouplinghhHpcVWpT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZH(gt1,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpT  
 
 
Subroutine CouplinghhcHpVWpT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpT  
 
 
Subroutine CouplingHpcHpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPT  
 
 
Subroutine CouplingHpcHpVZT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW)*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g1*Cos(TWp)*Sin(TW))
res = res+(g1X*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZT  
 
 
Subroutine CouplingHpcHpVZpT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZp' 
 
res = 0._dp 
res = res+(g1X*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp))
res = res+(g1*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZpT  
 
 
Subroutine CouplinghhVPVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1**2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g1*g1X*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-2*gX1**2*vPhi*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+2*gX*gX1*vPhi*Cos(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZT  
 
 
Subroutine CouplinghhVPVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g1*g2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(g1**2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1*g2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+2*gX*gX1*vPhi*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+2*gX1**2*vPhi*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZpT  
 
 
Subroutine CouplinghhcVWpVWpT(gt1,g2,vH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(g1X**2*vH*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+2*gX1**2*vPhi*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)
res = res-4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*gX**2*vPhi*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplinghhVZVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res+(g1X**2*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1**2*vH*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(g1X*g2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(g1*g1X*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1))
res = res-2*gX*gX1*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res+2*gX**2*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-2*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res+2*gX*gX1*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZpT  
 
 
Subroutine CouplinghhVZpVZpT(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*vH*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(g2**2*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)
res = res+(g1**2*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+2*gX**2*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res+4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZpVZpT  
 
 
Subroutine CouplingHpcVWpVPT(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPT  
 
 
Subroutine CouplingHpcVWpVZT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(g1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZT  
 
 
Subroutine CouplingHpcVWpVZpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZp' 
 
res = 0._dp 
res = res+(g1X*g2*vH*Cos(TWp))/2._dp
res = res+(g1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZpT  
 
 
Subroutine CouplingcHpVPVWpT(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpT  
 
 
Subroutine CouplingcHpVWpVZT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(g1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZT  
 
 
Subroutine CouplingcHpVWpVZpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZp' 
 
res = 0._dp 
res = res+(g1X*g2*vH*Cos(TWp))/2._dp
res = res+(g1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZpT  
 
 
Subroutine CouplingAhAhVPVPT(gt1,gt2,g1,g2,gX1,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVPT  
 
 
Subroutine CouplingAhAhVPVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g1X*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX*gX1*Cos(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZT  
 
 
Subroutine CouplingAhAhVPVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+2*gX*gX1*Cos(TW)*Cos(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZpT  
 
 
Subroutine CouplingAhAhcVWpVWpT(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpT  
 
 
Subroutine CouplingAhAhVZVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2)
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhAhVZVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZA(gt1,1)*ZA(gt2,1))
res = res-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX**2*Cos(TWp)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZpT  
 
 
Subroutine CouplingAhAhVZpVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX**2*Cos(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZpVZpT  
 
 
Subroutine CouplingAhHpcVWpVPT(gt1,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVPT  
 
 
Subroutine CouplingAhHpcVWpVZT(gt1,g1,g2,g1X,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))
res = res+(g1X*g2*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZT  
 
 
Subroutine CouplingAhHpcVWpVZpT(gt1,g1,g2,g1X,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X*g2*Cos(TWp)*ZA(gt1,1))/2._dp
res = res+(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZpT  
 
 
Subroutine CouplingAhcHpVPVWpT(gt1,g1,g2,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW)*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVPVWpT  
 
 
Subroutine CouplingAhcHpVWpVZT(gt1,g1,g2,g1X,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Sin(TWp)*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZT  
 
 
Subroutine CouplingAhcHpVWpVZpT(gt1,g1,g2,g1X,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*Cos(TWp)*ZA(gt1,1))
res = res-1._dp/2._dp*(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZpT  
 
 
Subroutine CouplinghhhhVPVPT(gt1,gt2,g1,g2,gX1,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVPT  
 
 
Subroutine CouplinghhhhVPVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g1X*Cos(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX*gX1*Cos(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZT  
 
 
Subroutine CouplinghhhhVPVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+2*gX*gX1*Cos(TW)*Cos(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZpT  
 
 
Subroutine CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2)
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhhhVZVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1)*ZH(gt2,1))
res = res-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZpT  
 
 
Subroutine CouplinghhhhVZpVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX**2*Cos(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZpVZpT  
 
 
Subroutine CouplinghhHpcVWpVPT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVPT  
 
 
Subroutine CouplinghhHpcVWpVZT(gt1,g1,g2,g1X,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g1X*g2*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZT  
 
 
Subroutine CouplinghhHpcVWpVZpT(gt1,g1,g2,g1X,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZpT  
 
 
Subroutine CouplinghhcHpVPVWpT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVPVWpT  
 
 
Subroutine CouplinghhcHpVWpVZT(gt1,g1,g2,g1X,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g1X*g2*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZT  
 
 
Subroutine CouplinghhcHpVWpVZpT(gt1,g1,g2,g1X,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZpT  
 
 
Subroutine CouplingHpcHpVPVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPT  
 
 
Subroutine CouplingHpcHpVPVZT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW)**2*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)**2)
res = res+(g1*g1X*Cos(TW)*Sin(TWp))/2._dp
res = res+(g1X*g2*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZT  
 
 
Subroutine CouplingHpcHpVPVZpT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZp' 
 
res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp))/2._dp
res = res+(g1X*g2*Cos(TWp)*Sin(TW))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Sin(TWp))
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
res = res+(g1*g2*Sin(TW)**2*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZpT  
 
 
Subroutine CouplingHpcHpcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpT  
 
 
Subroutine CouplingHpcHpVZVZT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW))
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(g1X**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZT  
 
 
Subroutine CouplingHpcHpVZVZpT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZp' 
 
res = 0._dp 
res = res+(g1X*g2*Cos(TW)*Cos(TWp)**2)/2._dp
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW))
res = res+(g1X**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp))
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Sin(TWp)**2)
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZpT  
 
 
Subroutine CouplingHpcHpVZpVZpT(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZpVZp' 
 
res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2)/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZpVZpT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWpVPVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpT  
 
 
Subroutine CouplingcVWpVWpVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZT  
 
 
Subroutine CouplingcVWpVWpVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZpT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingFvFvAhT(gt1,gt2,gt3,YvL,YvR,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvAhT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YuL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHpT  
 
 
Subroutine CouplingFvFeHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,6 + j1))*Conjg(ZEL(gt2,j2))*YvL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHpT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucHpT(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YdL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpT  
 
 
Subroutine CouplingFvFvhhT(gt1,gt2,gt3,YvL,YvR,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvhhT  
 
 
Subroutine CouplingcFeFvcHpT(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*YeL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*UV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TW)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TW)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(6,6),ZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdVWpT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*Cos(TWp)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFdFdVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZpT  
 
 
Subroutine CouplingFvFeVWpT(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeVWpT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*Cos(TW)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*Cos(TW)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(ZEL(gt2,j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*Sin(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZpT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZUL(gt2,j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingcFuFuVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*Sin(TWp)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZpT  
 
 
Subroutine CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(6,6),ZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpT  
 
 
Subroutine CouplingFvFvVPT(gt1,gt2,g1,g2,gX1,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVPT  
 
 
Subroutine CouplingFvFvVZT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gX1*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZT  
 
 
Subroutine CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1X*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZpT  
 
 
Subroutine CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWpVPVPVWpT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpT  
 
 
Subroutine CouplingcVWpVPVWpVZT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Cos(TWp)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TWp)*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Cos(TWp)*Sin(TW)
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZT  
 
 
Subroutine CouplingcVWpVPVWpVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZp' 
 
res1 = 0._dp 
res1 = res1-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
res2 = 0._dp 
res2 = res2+g2**2*Sin(2._dp*(TW))*Sin(TWp)
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZpT  
 
 
Subroutine CouplingcVWpcVWpVWpVWpT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpT  
 
 
Subroutine CouplingcVWpVWpVZVZT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Cos(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Cos(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Cos(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZT  
 
 
Subroutine CouplingcVWpVWpVZVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)**2*Sin(2._dp*(TWp))
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZpT  
 
 
Subroutine CouplingcVWpVWpVZpVZpT(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZpVZp' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Sin(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Sin(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Sin(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZpVZpT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWpgAVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAVWpT  
 
 
Subroutine CouplingcgWCgAcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpT  
 
 
Subroutine CouplingcgWpgWpVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPT  
 
 
Subroutine CouplingcgWpgWpVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZT  
 
 
Subroutine CouplingcgWpgWpVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZpT  
 
 
Subroutine CouplingcgAgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpT  
 
 
Subroutine CouplingcgZgWpcVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpT  
 
 
Subroutine CouplingcgZpgWpcVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpcVWpT  
 
 
Subroutine CouplingcgWCgWCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPT  
 
 
Subroutine CouplingcgAgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWCVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWCVWpT  
 
 
Subroutine CouplingcgZgWCVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCVWpT  
 
 
Subroutine CouplingcgZpgWCVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWCVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWCVWpT  
 
 
Subroutine CouplingcgWCgWCVZT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZT  
 
 
Subroutine CouplingcgWCgWCVZpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZpT  
 
 
Subroutine CouplingcgWpgZVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZVWpT  
 
 
Subroutine CouplingcgWCgZcVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpT  
 
 
Subroutine CouplingcgWpgZpVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZpVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZpVWpT  
 
 
Subroutine CouplingcgWCgZpcVWpT(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZpcVWpT  
 
 
Subroutine CouplingcgWpgWpAhT(gt3,g2,vH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*RXiWp*ZA(gt3,1))/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhT  
 
 
Subroutine CouplingcgWCgWCAhT(gt3,g2,vH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp*ZA(gt3,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vH*Cos(TW)**2*Cos(TWp)*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*vH*Cos(TW)*Cos(TWp)*RXiZ*Sin(TW)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*Cos(TWp)*RXiZ*Sin(TW)*ZH(gt3,1))
res = res-1._dp/4._dp*(g1*g2*vH*Cos(TWp)*RXiZ*Sin(TW)**2*ZH(gt3,1))
res = res-1._dp/4._dp*(g1*g1X*vH*Cos(TW)*RXiZ*Sin(TWp)*ZH(gt3,1))
res = res+(g1X*g2*vH*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+gX1**2*vPhi*Cos(TW)*Cos(TWp)*RXiZ*Sin(TW)*ZH(gt3,2)
res = res-(gX*gX1*vPhi*Cos(TW)*RXiZ*Sin(TWp)*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgZpgAhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g1*g1X*vH*Cos(TW)*Cos(TWp)*RXiZp*ZH(gt3,1))
res = res+(g1X*g2*vH*Cos(TWp)*RXiZp*Sin(TW)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g1*g2*vH*Cos(TW)**2*RXiZp*Sin(TWp)*ZH(gt3,1))
res = res-1._dp/4._dp*(g1**2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))
res = res+(g2**2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1*g2*vH*RXiZp*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-(gX*gX1*vPhi*Cos(TW)*Cos(TWp)*RXiZp*ZH(gt3,2))
res = res-(gX1**2*vPhi*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgAhhT  
 
 
Subroutine CouplingcgWpgAHpT(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1*g2*vH*Cos(TW)*RXiWp)
res = res-1._dp/4._dp*(g2**2*vH*RXiWp*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAHpT  
 
 
Subroutine CouplingcgWCgAcHpT(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1*g2*vH*Cos(TW)*RXiWp)
res = res-1._dp/4._dp*(g2**2*vH*RXiWp*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcHpT  
 
 
Subroutine CouplingcgWpgWphhT(gt3,g2,vH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp*ZH(gt3,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhT  
 
 
Subroutine CouplingcgZgWpcHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res+(g1*g2*vH*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiZ*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpT  
 
 
Subroutine CouplingcgZpgWpcHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiZp)
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*RXiZp*Sin(TWp))
res = res-1._dp/4._dp*(g1*g2*vH*RXiZp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpcHpT  
 
 
Subroutine CouplingcgWCgWChhT(gt3,g2,vH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp*ZH(gt3,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhT  
 
 
Subroutine CouplingcgZgWCHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res+(g1*g2*vH*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiZ*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpT  
 
 
Subroutine CouplingcgZpgWCHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWCHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiZp)
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*RXiZp*Sin(TWp))
res = res-1._dp/4._dp*(g1*g2*vH*RXiZp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWCHpT  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*RXiZ*ZH(gt3,1))
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,1))
res = res-1._dp/4._dp*(g1**2*vH*Cos(TWp)**2*RXiZ*Sin(TW)**2*ZH(gt3,1))
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))/2._dp
res = res+(g1*g1X*vH*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,1))/2._dp
res = res-1._dp/4._dp*(g1X**2*vH*RXiZ*Sin(TWp)**2*ZH(gt3,1))
res = res-(gX1**2*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)**2*ZH(gt3,2))
res = res+2*gX*gX1*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)*ZH(gt3,2)
res = res-(gX**2*vPhi*RXiZ*Sin(TWp)**2*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgZpgZhhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZp*ZH(gt3,1))/4._dp
res = res+(g1*g1X*vH*Cos(TWp)**2*RXiZp*Sin(TW)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1**2*vH*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TW)*RXiZp*Sin(TWp)**2*ZH(gt3,1))
res = res-1._dp/4._dp*(g1*g1X*vH*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))
res = res+(g1*g2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt3,1))/4._dp
res = res+gX*gX1*vPhi*Cos(TWp)**2*RXiZp*Sin(TW)*ZH(gt3,2)
res = res-(gX**2*vPhi*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,2))
res = res+gX1**2*vPhi*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp)*ZH(gt3,2)
res = res-(gX*gX1*vPhi*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZhhT  
 
 
Subroutine CouplingcgWpgZHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*Cos(TWp)*RXiWp)
res = res+(g1*g2*vH*Cos(TWp)*RXiWp*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiWp*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpT  
 
 
Subroutine CouplingcgWCgZcHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*Cos(TWp)*RXiWp)
res = res+(g1*g2*vH*Cos(TWp)*RXiWp*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiWp*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpT  
 
 
Subroutine CouplingcgZgZphhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1*g1X*vH*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,1))/4._dp
res = res+(g1**2*vH*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp)*ZH(gt3,1))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TW)*RXiZ*Sin(TWp)**2*ZH(gt3,1))
res = res-1._dp/4._dp*(g1*g1X*vH*RXiZ*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))
res = res+(g1*g2*vH*Cos(TW)*RXiZ*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt3,1))/4._dp
res = res+gX*gX1*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)*ZH(gt3,2)
res = res-(gX**2*vPhi*Cos(TWp)*RXiZ*Sin(TWp)*ZH(gt3,2))
res = res+gX1**2*vPhi*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp)*ZH(gt3,2)
res = res-(gX*gX1*vPhi*RXiZ*Sin(TW)*Sin(TWp)**2*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZphhT  
 
 
Subroutine CouplingcgZpgZphhT(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)**2*RXiZp*ZH(gt3,1))
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp)*ZH(gt3,1))
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,1))
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)**2*RXiZp*Sin(TWp)**2*ZH(gt3,1))
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2*ZH(gt3,1))
res = res-1._dp/4._dp*(g1**2*vH*RXiZp*Sin(TW)**2*Sin(TWp)**2*ZH(gt3,1))
res = res-(gX**2*vPhi*Cos(TWp)**2*RXiZp*ZH(gt3,2))
res = res-2*gX*gX1*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)*ZH(gt3,2)
res = res-(gX1**2*vPhi*RXiZp*Sin(TW)**2*Sin(TWp)**2*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZphhT  
 
 
Subroutine CouplingcgWpgZpHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZpHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiWp)
res = res+(g2**2*vH*Cos(TW)*RXiWp*Sin(TWp))/4._dp
res = res-1._dp/4._dp*(g1*g2*vH*RXiWp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZpHpT  
 
 
Subroutine CouplingcgWCgZpcHpT(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZpcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiWp)
res = res+(g2**2*vH*Cos(TW)*RXiWp*Sin(TWp))/4._dp
res = res-1._dp/4._dp*(g1*g2*vH*RXiWp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZpcHpT  
 
 
Subroutine CouplingsForEffPot4(LamH,LamPhiH,LamPhi,ZA,ZH,cplAhAhAhAh,cplAhAhhhhh,     & 
& cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2),ZH(2,2)

Complex(dp), Intent(out) :: cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHpcHp(2,2),cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHp2L(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHp2L(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2L(LamH,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g3,YdL,              & 
& YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,cplhhhhhh,            & 
& cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,    & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplVGVGVG,cplcFdFdAhL(6,6,2),         & 
& cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),           & 
& cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplcFdFdhhL(6,6,2),             & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplFvFeHpL(9,6),cplFvFeHpR(9,6),  & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),& 
& cplcFuFuVGR(6,6)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHp2L(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdAh2L(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)        & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeAh2L(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)        & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuAh2L(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)        & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvAh2L(gt1,gt2,gt3,YvL,YvR,ZA,UV,cplFvFvAhL(gt1,gt2,gt3)               & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)        & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdHp2L(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)           & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeHp2L(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)        & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)        & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucHp2L(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)         & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhh2L(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)               & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcHp2L(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplcFeFvcHpL(gt1,gt2)              & 
& ,cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*LamH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHpcHp2L(gt1,gt2,LamH,LamPhiH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((gt1.eq.gt2)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHp2L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-6*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHpcHp2L(gt1,gt2,LamH,LamPhiH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res-2*LamH*ZH(gt1,1)*ZH(gt2,1)
End If 
If ((gt1.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2L  
 
 
Subroutine CouplingHpHpcHpcHp2L(LamH,res)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-4._dp*(LamH)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHp2L  
 
 
Subroutine CouplingAhAhhh2L(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-2*LamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*vH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-6*LamPhi*vPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHpcHp2L(gt1,LamH,LamPhiH,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZH(gt1,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingFvFvAh2L(gt1,gt2,gt3,YvL,YvR,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvAh2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHp2L(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YuL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHp2L  
 
 
Subroutine CouplingFvFeHp2L(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,6 + j1))*Conjg(ZEL(gt2,j2))*YvL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHp2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucHp2L(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YdL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2L  
 
 
Subroutine CouplingFvFvhh2L(gt1,gt2,gt3,YvL,YvR,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvhh2L  
 
 
Subroutine CouplingcFeFvcHp2L(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*YeL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*UV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsFor2LPole3(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g3,YdL,              & 
& YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,cplhhhhhh,            & 
& cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,    & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplVGVGVG,cplcFdFdAhL(6,6,2),         & 
& cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),           & 
& cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplcFdFdhhL(6,6,2),             & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplFvFeHpL(9,6),cplFvFeHpR(9,6),  & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),& 
& cplcFuFuVGR(6,6)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole3'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhh2LP(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2LP(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHp2LP(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2LP(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdAh2LP(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)       & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeAh2LP(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)       & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuAh2LP(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)       & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvAh2LP(gt1,gt2,gt3,YvL,YvR,ZA,UV,cplFvFvAhL(gt1,gt2,gt3)              & 
& ,cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdhh2LP(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFdHp2LP(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)          & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingFvFeHp2LP(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFehh2LP(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)       & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuhh2LP(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucHp2LP(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)        & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvhh2LP(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplFvFvhhL(gt1,gt2,gt3)              & 
& ,cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcHp2LP(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplcFeFvcHpL(gt1,gt2)             & 
& ,cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVG2LP(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVG2LP(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsFor2LPole3

Subroutine CouplingAhAhhh2LP(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-2*LamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2LP  
 
 
Subroutine Couplinghhhhhh2LP(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*vH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-6*LamPhi*vPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2LP  
 
 
Subroutine CouplinghhHpcHp2LP(gt1,LamH,LamPhiH,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZH(gt1,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2LP  
 
 
Subroutine CouplingVGVGVG2LP(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2LP  
 
 
Subroutine CouplingcFdFdAh2LP(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2LP  
 
 
Subroutine CouplingcFeFeAh2LP(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2LP  
 
 
Subroutine CouplingcFuFuAh2LP(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2LP  
 
 
Subroutine CouplingFvFvAh2LP(gt1,gt2,gt3,YvL,YvR,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvAh2LP  
 
 
Subroutine CouplingcFdFdhh2LP(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2LP  
 
 
Subroutine CouplingcFuFdHp2LP(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YuL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHp2LP  
 
 
Subroutine CouplingFvFeHp2LP(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UV(gt1,6 + j1))*Conjg(ZEL(gt2,j2))*YvL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHp2LP  
 
 
Subroutine CouplingcFeFehh2LP(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2LP  
 
 
Subroutine CouplingcFuFuhh2LP(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2LP  
 
 
Subroutine CouplingcFdFucHp2LP(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YdL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2LP  
 
 
Subroutine CouplingFvFvhh2LP(gt1,gt2,gt3,YvL,YvR,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvhh2LP  
 
 
Subroutine CouplingcFeFvcHp2LP(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*YeL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*UV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2LP  
 
 
Subroutine CouplingcFdFdVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2LP  
 
 
Subroutine CouplingcFuFuVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2LP  
 
 
Subroutine CouplingsFor2LPole4(LamH,LamPhiH,LamPhi,ZA,ZH,cplAhAhAhAh,cplAhAhhhhh,     & 
& cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2),ZH(2,2)

Complex(dp), Intent(out) :: cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHpcHp(2,2),cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole4'
 
cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHp2LP(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHp2LP(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2LP(LamH,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsFor2LPole4

Subroutine CouplingAhAhAhAh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res = res-6*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2LP  
 
 
Subroutine CouplingAhAhhhhh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2LP  
 
 
Subroutine CouplingAhAhHpcHp2LP(gt1,gt2,LamH,LamPhiH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHp2LP  
 
 
Subroutine Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-6*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-6*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2LP  
 
 
Subroutine CouplinghhhhHpcHp2LP(gt1,gt2,LamH,LamPhiH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZH(gt1,1)*ZH(gt2,1)
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2LP  
 
 
Subroutine CouplingHpHpcHpcHp2LP(LamH,res)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-4._dp*(LamH)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHp2LP  
 
 
Subroutine CouplingsForLoopMasses(LamH,LamPhiH,LamPhi,vH,vPhi,ZA,g1,g2,               & 
& gX1,TW,gX,g1X,TWp,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,             & 
& UV,ZH,g3,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,       & 
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

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,ZH(2,2),g3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2),cplUAhAhhh(2,2,2),cplcFdFdUAhL(6,6,2),         & 
& cplcFdFdUAhR(6,6,2),cplcFeFeUAhL(6,6,2),cplcFeFeUAhR(6,6,2),cplcFuFuUAhL(6,6,2),       & 
& cplcFuFuUAhR(6,6,2),cplFvFvUAhL(9,9,2),cplFvFvUAhR(9,9,2),cplcgWpgWpUAh(2),            & 
& cplcgWCgWCUAh(2),cplUAhhhVP(2,2),cplUAhhhVZ(2,2),cplUAhhhVZp(2,2),cplUAhHpcVWp(2),     & 
& cplUAhUAhAhAh(2,2,2,2),cplUAhUAhhhhh(2,2,2,2),cplUAhUAhHpcHp(2,2),cplUAhUAhVPVP(2,2),  & 
& cplUAhUAhcVWpVWp(2,2),cplUAhUAhVZVZ(2,2),cplUAhUAhVZpVZp(2,2),cplcUFdFdAhL(6,6,2),     & 
& cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),cplcUFdFdVGL(6,6),         & 
& cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),cplcUFdFdVZL(6,6),               & 
& cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),cplcUFdFucHpL(6,6),            & 
& cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6),cplcUFuFuAhL(6,6,2),        & 
& cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),cplcUFuFdVWpL(6,6),            & 
& cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),cplcUFuFuVGL(6,6),          & 
& cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),cplcUFuFuVZL(6,6),               & 
& cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6),cplcUFeFeAhL(6,6,2),           & 
& cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),cplcUFeFeVPL(6,6),         & 
& cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),cplcUFeFeVZpL(6,6),              & 
& cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),cplcUFeFvcVWpL(6,9),          & 
& cplcUFeFvcVWpR(6,9),cplUFvFvAhL(9,9,2),cplUFvFvAhR(9,9,2),cplUFvFeHpL(9,6),            & 
& cplUFvFeHpR(9,6),cplUFvFeVWpL(9,6),cplUFvFeVWpR(9,6),cplUFvFvhhL(9,9,2),               & 
& cplUFvFvhhR(9,9,2),cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),& 
& cplUFvFvVZpL(9,9),cplUFvFvVZpR(9,9),cplcFeUFvcHpL(6,9),cplcFeUFvcHpR(6,9),             & 
& cplcFeUFvcVWpL(6,9),cplcFeUFvcVWpR(6,9),cplAhcHpVWp(2),cplcFdFucHpL(6,6),              & 
& cplcFdFucHpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcgZgWpcHp,cplcgWpgZHp,        & 
& cplcgZpgWpcHp,cplcgWpgZpHp,cplcgWCgZcHp,cplcgZgWCHp,cplcgWCgZpcHp,cplcgZpgWCHp,        & 
& cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,            & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp(2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp,            & 
& cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpcHpVZpVZp,cplcFdFdVGL(6,6),             & 
& cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcgGgGVG,cplVGVGVG,               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplAhhhVP(2,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),& 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvVPL(9,9)

Complex(dp), Intent(out) :: cplFvFvVPR(9,9),cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ(2),cplhhVPVZp(2),cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP(2,2),cplhhhhVPVP(2,2),cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpVPVPVWp3,cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFeVZL(6,6),     & 
& cplcFeFeVZR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplhhVZVZp(2),cplHpcVWpVZ,cplcVWpVWpVZ,         & 
& cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,     & 
& cplAhhhVZp(2,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),& 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWpVZp,   & 
& cplcgWCgWCVZp,cplhhVZpVZp(2),cplHpcVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp(2,2),            & 
& cplhhhhVZpVZp(2,2),cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,              & 
& cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),               & 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplAhAhcVWpVWp(2,2),       & 
& cplhhhhcVWpVWp(2,2),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,          & 
& cplAhAhVPVZ(2,2),cplhhhhVPVZ(2,2),cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,        & 
& cplcVWpVPVWpVZ3,cplAhAhVPVZp(2,2),cplhhhhVPVZp(2,2),cplHpcHpVPVZp,cplcVWpVPVWpVZp1,    & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp(2,2),cplhhhhVZVZp(2,2),cplHpcHpVZVZp,   & 
& cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVPL(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhUhhVP(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhUhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,YdL,YdR,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,YeL,YeR,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,YuL,YuR,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUhhL = 0._dp 
cplFvFvUhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvUhhL(gt1,gt2,gt3,YvL,YvR,UV,cplFvFvUhhL(gt1,gt2,gt3),cplFvFvUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,vH,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,vH,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZgZUhh(gt3))

End Do 


cplcgZpgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZpgZUhh(gt3))

End Do 


cplcgZgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZgZpUhh(gt3))

End Do 


cplcgZpgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZpgZpUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcHpL(gt1,LamH,LamPhiH,vH,vPhi,cplUhhHpcHp(gt1))

End Do 


cplUhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcVWpL(gt1,g2,cplUhhHpcVWp(gt1))

End Do 


cplUhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVPVZ(gt1))

End Do 


cplUhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVPVZp(gt1))

End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,vH,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZVZ(gt1))

End Do 


cplUhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZVZp(gt1))

End Do 


cplUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZpVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZpVZp(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHpcHpL(gt1,gt2,LamH,LamPhiH,cplUhhUhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gX1,TW,cplUhhUhhVPVP(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUhhUhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplUAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUAhAhhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplUAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdUAhL = 0._dp 
cplcFdFdUAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdUAhL(gt1,gt2,gt3,YdL,YdR,ZDL,ZDR,cplcFdFdUAhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUAhL = 0._dp 
cplcFeFeUAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeUAhL(gt1,gt2,gt3,YeL,YeR,ZEL,ZER,cplcFeFeUAhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUAhL = 0._dp 
cplcFuFuUAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuUAhL(gt1,gt2,gt3,YuL,YuR,ZUL,ZUR,cplcFuFuUAhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUAhL = 0._dp 
cplFvFvUAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvUAhL(gt1,gt2,gt3,YvL,YvR,UV,cplFvFvUAhL(gt1,gt2,gt3),cplFvFvUAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUAhL(gt3,g2,vH,cplcgWpgWpUAh(gt3))

End Do 


cplcgWCgWCUAh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUAhL(gt3,g2,vH,cplcgWCgWCUAh(gt3))

End Do 


cplUAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVPL(gt1,gt2,g1,g2,gX1,ZH,TW,cplUAhhhVP(gt1,gt2))

 End Do 
End Do 


cplUAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplUAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplUAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplUAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplUAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUAhHpcVWpL(gt1,g2,cplUAhHpcVWp(gt1))

End Do 


cplUAhUAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplUAhUAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplUAhUAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUAhUAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhHpcHpL(gt1,gt2,LamH,LamPhiH,cplUAhUAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVPVPL(gt1,gt2,g1,g2,gX1,TW,cplUAhUAhVPVP(gt1,gt2))

 End Do 
End Do 


cplUAhUAhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhcVWpVWpL(gt1,gt2,g2,cplUAhUAhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUAhUAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUAhUAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUAhUAhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUAhUAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2)             & 
& ,cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcUFdFdVZL(gt1,gt2)  & 
& ,cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZpL = 0._dp 
cplcUFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcUFdFdVZpL(gt1,gt2)& 
& ,cplcUFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFucHpL(gt1,gt2,YuL,YdL,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),               & 
& cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFdHpL(gt1,gt2,YuL,YdL,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2)             & 
& ,cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcUFuFuVZL(gt1,gt2)  & 
& ,cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZpL = 0._dp 
cplcUFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcUFuFuVZpL(gt1,gt2)& 
& ,cplcUFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)       & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2)             & 
& ,cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcUFeFeVZL(gt1,gt2)  & 
& ,cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZpL = 0._dp 
cplcUFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcUFeFeVZpL(gt1,gt2)& 
& ,cplcUFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcUFeFvcHpL(gt1,gt2,YvL,YeL,UV,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,UV,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplUFvFvAhL = 0._dp 
cplUFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingUFvFvAhL(gt1,gt2,gt3,YvL,YvR,ZA,UV,cplUFvFvAhL(gt1,gt2,gt3)              & 
& ,cplUFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFeHpL = 0._dp 
cplUFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingUFvFeHpL(gt1,gt2,YvL,YeL,ZEL,ZER,cplUFvFeHpL(gt1,gt2),cplUFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplUFvFeVWpL = 0._dp 
cplUFvFeVWpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CouplingUFvFeVWpL(gt1,gt2,g2,ZEL,cplUFvFeVWpL(gt1,gt2),cplUFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplUFvFvhhL = 0._dp 
cplUFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingUFvFvhhL(gt1,gt2,gt3,YvL,YvR,ZH,UV,cplUFvFvhhL(gt1,gt2,gt3)              & 
& ,cplUFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFvVPL = 0._dp 
cplUFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingUFvFvVPL(gt1,gt2,g1,g2,gX1,UV,TW,cplUFvFvVPL(gt1,gt2),cplUFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplUFvFvVZL = 0._dp 
cplUFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingUFvFvVZL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplUFvFvVZL(gt1,gt2)         & 
& ,cplUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplUFvFvVZpL = 0._dp 
cplUFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingUFvFvVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplUFvFvVZpL(gt1,gt2)       & 
& ,cplUFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeUFvcHpL = 0._dp 
cplcFeUFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeUFvcHpL(gt1,gt2,YvL,YeL,ZEL,ZER,cplcFeUFvcHpL(gt1,gt2),               & 
& cplcFeUFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFeUFvcVWpL = 0._dp 
cplcFeUFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeUFvcVWpL(gt1,gt2,g2,ZEL,cplcFeUFvcVWpL(gt1,gt2),cplcFeUFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplAhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpL(gt1,g2,ZA,cplAhcHpVWp(gt1))

End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucHpL(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcHpL(gt1,gt2,YvL,YeL,ZEL,ZER,UV,cplcFeFvcHpL(gt1,gt2)               & 
& ,cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpL(g1,g2,g1X,vH,TW,TWp,cplcgZgWpcHp)



cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpL(g1,g2,g1X,vH,TW,TWp,cplcgWpgZHp)



cplcgZpgWpcHp = 0._dp 
Call CouplingcgZpgWpcHpL(g1,g2,g1X,vH,TW,TWp,cplcgZpgWpcHp)



cplcgWpgZpHp = 0._dp 
Call CouplingcgWpgZpHpL(g1,g2,g1X,vH,TW,TWp,cplcgWpgZpHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpL(g1,g2,g1X,vH,TW,TWp,cplcgWCgZcHp)



cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpL(g1,g2,g1X,vH,TW,TWp,cplcgZgWCHp)



cplcgWCgZpcHp = 0._dp 
Call CouplingcgWCgZpcHpL(g1,g2,g1X,vH,TW,TWp,cplcgWCgZpcHp)



cplcgZpgWCHp = 0._dp 
Call CouplingcgZpgWCHpL(g1,g2,g1X,vH,TW,TWp,cplcgZpgWCHp)



cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpL(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplhhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpL(gt1,g2,ZH,cplhhcHpVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,g1X,TW,TWp,cplHpcHpVZ)



cplHpcHpVZp = 0._dp 
Call CouplingHpcHpVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVZp)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,vH,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZ)



cplcHpVWpVZp = 0._dp 
Call CouplingcHpVWpVZpL(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZp)



cplAhAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHpL(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpL(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpL(LamH,cplHpHpcHpcHp)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,g1X,TW,TWp,cplHpcHpVZVZ)



cplHpcHpVZpVZp = 0._dp 
Call CouplingHpcHpVZpVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVZpVZp)



cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVGL(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVGL(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGL(g3,cplcgGgGVG)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGL(g3,cplVGVGVG)



cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGL(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPL(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcFdFdVPL(gt1,gt2)               & 
& ,cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcFeFeVPL(gt1,gt2)               & 
& ,cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcFuFuVPL(gt1,gt2)               & 
& ,cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVPL(gt1,gt2,g1,g2,gX1,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZp(gt1))

End Do 


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,vH,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplAhAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVPL(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhAhVPVP(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVPL(gt1,gt2,g1,g2,gX1,ZH,TW,cplhhhhVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZL(gt1,gt2)           & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,TWp,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,TWp,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,TWp,cplcVWpVWpVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,TWp,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZpL(gt1,gt2)  & 
& ,cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZpL(gt1,gt2)  & 
& ,cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZp = 0._dp 
Call CouplingcgWpgWpVZpL(g2,TW,TWp,cplcgWpgWpVZp)



cplcgWCgWCVZp = 0._dp 
Call CouplingcgWCgWCVZpL(g2,TW,TWp,cplcgWCgWCVZp)



cplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZpVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplHpcVWpVZp = 0._dp 
Call CouplingHpcVWpVZpL(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZp)



cplcVWpVWpVZp = 0._dp 
Call CouplingcVWpVWpVZpL(g2,TW,TWp,cplcVWpVWpVZp)



cplAhAhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZpVZp(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZpVZp1 = 0._dp 
cplcVWpVWpVZpVZp2 = 0._dp 
cplcVWpVWpVZpVZp3 = 0._dp 
Call CouplingcVWpVWpVZpVZpL(g2,TW,TWp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,            & 
& cplcVWpVWpVZpVZp3)



cplAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpL(gt1,g2,ZA,cplAhHpcVWp(gt1))

End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,UV,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,TWp,cplcgZgWpcVWp)



cplcgZpgWpcVWp = 0._dp 
Call CouplingcgZpgWpcVWpL(g2,TW,TWp,cplcgZpgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,TWp,cplcgWCgZcVWp)



cplcgWCgZpcVWp = 0._dp 
Call CouplingcgWCgZpcVWpL(g2,TW,TWp,cplcgWCgZpcVWp)



cplhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpL(gt1,g2,ZH,cplhhHpcVWp(gt1))

End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,vH,ZH,cplhhcVWpVWp(gt1))

End Do 


cplAhAhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWpVWpL(gt1,gt2,g2,ZA,cplAhAhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplAhAhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZ(gt1,gt2))

 End Do 
End Do 


cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZL(g1,g2,g1X,TW,TWp,cplHpcHpVPVZ)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,TWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplAhAhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZp(gt1,gt2))

 End Do 
End Do 


cplHpcHpVPVZp = 0._dp 
Call CouplingHpcHpVPVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVPVZp)



cplcVWpVPVWpVZp1 = 0._dp 
cplcVWpVPVWpVZp2 = 0._dp 
cplcVWpVPVWpVZp3 = 0._dp 
Call CouplingcVWpVPVWpVZpL(g2,TW,TWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,               & 
& cplcVWpVPVWpVZp3)



cplAhAhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZp(gt1,gt2))

 End Do 
End Do 


cplHpcHpVZVZp = 0._dp 
Call CouplingHpcHpVZVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVZVZp)



cplcVWpVWpVZVZp1 = 0._dp 
cplcVWpVWpVZVZp2 = 0._dp 
cplcVWpVWpVZVZp3 = 0._dp 
Call CouplingcVWpVWpVZVZpL(g2,TW,TWp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,               & 
& cplcVWpVWpVZVZp3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-2*LamH*vH*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((2.eq.gt3)) Then 
res = res-(LamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(LamPhiH*vH*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-2*LamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhUhhVPL(gt1,gt2,g1,g2,gX1,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-1._dp/2._dp*(g1*Cos(TW)*ZA(gt1,1))
End If 
If ((1.eq.gt2)) Then 
res = res+(g2*Sin(TW)*ZA(gt1,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(gX1*Cos(TW)*ZA(gt1,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVPL  
 
 
Subroutine CouplingAhUhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-1._dp/2._dp*(g1X*Sin(TWp)*ZA(gt1,1))
End If 
If ((2.eq.gt2)) Then 
res = res+gX1*Cos(TWp)*Sin(TW)*ZA(gt1,2)
End If 
If ((2.eq.gt2)) Then 
res = res-(gX*Sin(TWp)*ZA(gt1,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingAhUhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-1._dp/2._dp*(g1X*Cos(TWp)*ZA(gt1,1))
End If 
If ((1.eq.gt2)) Then 
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1))
End If 
If ((1.eq.gt2)) Then 
res = res-1._dp/2._dp*(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1))
End If 
If ((2.eq.gt2)) Then 
res = res-(gX*Cos(TWp)*ZA(gt1,2))
End If 
If ((2.eq.gt2)) Then 
res = res-(gX1*Sin(TW)*Sin(TWp)*ZA(gt1,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZpL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,YdL,YdR,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,YeL,YeR,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,YuL,YuR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingFvFvUhhL(gt1,gt2,gt3,YvL,YvR,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvUhhL  
 
 
Subroutine CouplingcgWpgWpUhhL(gt3,g2,vH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpUhhL  
 
 
Subroutine CouplingcgWCgWCUhhL(gt3,g2,vH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*RXiZ)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1**2*vH*Cos(TWp)**2*RXiZ*Sin(TW)**2)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX1**2*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)**2)
End If 
If ((1.eq.gt3)) Then 
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g1X*vH*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+2*gX*gX1*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X**2*vH*RXiZ*Sin(TWp)**2)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX**2*vPhi*RXiZ*Sin(TWp)**2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingcgZpgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZp)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g1X*vH*Cos(TWp)**2*RXiZp*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+gX*gX1*vPhi*Cos(TWp)**2*RXiZp*Sin(TW)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)*RXiZp*Sin(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)*RXiZp*Sin(TWp))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(gX**2*vPhi*Cos(TWp)*RXiZp*Sin(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g1**2*vH*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+gX1**2*vPhi*Cos(TWp)*RXiZp*Sin(TW)**2*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TW)*RXiZp*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1*g1X*vH*RXiZp*Sin(TW)*Sin(TWp)**2)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX*gX1*vPhi*RXiZp*Sin(TW)*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(2._dp*(TWp)))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZUhhL  
 
 
Subroutine CouplingcgZgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g1X*vH*Cos(TWp)**2*RXiZ*Sin(TW))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+gX*gX1*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)*RXiZ*Sin(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)*RXiZ*Sin(TWp))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(gX**2*vPhi*Cos(TWp)*RXiZ*Sin(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res+(g1**2*vH*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp))/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+gX1**2*vPhi*Cos(TWp)*RXiZ*Sin(TW)**2*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TW)*RXiZ*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1*g1X*vH*RXiZ*Sin(TW)*Sin(TWp)**2)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX*gX1*vPhi*RXiZ*Sin(TW)*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res+(g1*g2*vH*Cos(TW)*RXiZ*Sin(TW)*Sin(2._dp*(TWp)))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZpUhhL  
 
 
Subroutine CouplingcgZpgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgZpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)**2*RXiZp)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX**2*vPhi*Cos(TWp)**2*RXiZp)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt3)) Then 
res = res-2*gX*gX1*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)**2*RXiZp*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)
End If 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g1**2*vH*RXiZp*Sin(TW)**2*Sin(TWp)**2)
End If 
If ((2.eq.gt3)) Then 
res = res-(gX1**2*vPhi*RXiZp*Sin(TW)**2*Sin(TWp)**2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgZpUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-6*LamH*vH*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res-(LamPhiH*vPhi*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(LamPhiH*vPhi*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(LamPhiH*vH*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(LamPhiH*vPhi*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(LamPhiH*vH*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(LamPhiH*vH*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-6*LamPhi*vPhi*ZH(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhHpcHpL(gt1,LamH,LamPhiH,vH,vPhi,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-2*LamH*vH
End If 
If ((2.eq.gt1)) Then 
res = res-(LamPhiH*vPhi)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHpcHpL  
 
 
Subroutine CouplingUhhHpcVWpL(gt1,g2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*g2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHpcVWpL  
 
 
Subroutine CouplingUhhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)**2*Cos(TWp))
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1**2*vH*Cos(TW)*Cos(TWp)*Sin(TW))
End If 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-2*gX1**2*vPhi*Cos(TW)*Cos(TWp)*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*vH*Cos(TWp)*Sin(TW)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g1X*vH*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX*gX1*vPhi*Cos(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1X*g2*vH*Sin(TW)*Sin(TWp))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVPVZL  
 
 
Subroutine CouplingUhhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1*g1X*vH*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX*gX1*vPhi*Cos(TW)*Cos(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TWp)*Sin(TW))
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g2*vH*Cos(TW)**2*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*vH*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX1**2*vPhi*Cos(TW)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*g2*vH*Sin(TW)**2*Sin(TWp))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVPVZpL  
 
 
Subroutine CouplingUhhcVWpVWpL(gt1,g2,vH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vH)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWpVWpL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*vH*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX1**2*vPhi*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1)) Then 
res = res-(g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1)) Then 
res = res-(g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1)) Then 
res = res-4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1X**2*vH*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX**2*vPhi*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingUhhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)**2)
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)**2*Sin(TW))
End If 
If ((2.eq.gt1)) Then 
res = res-2*gX*gX1*vPhi*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1X**2*vH*Cos(TWp)*Sin(TWp))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)*Sin(TWp))
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX**2*vPhi*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1**2*vH*Cos(TWp)*Sin(TW)**2*Sin(TWp))
End If 
If ((2.eq.gt1)) Then 
res = res-2*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1X*g2*vH*Cos(TW)*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*g1X*vH*Sin(TW)*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX*gX1*vPhi*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZpL  
 
 
Subroutine CouplingUhhVZpVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g1X**2*vH*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX**2*vPhi*Cos(TWp)**2
End If 
If ((1.eq.gt1)) Then 
res = res+g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1)) Then 
res = res+4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1)) Then 
res = res+(g2**2*vH*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*vH*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+2*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZpVZpL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,1)*ZA(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-6*LamH*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(LamPhiH*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(LamPhiH*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-6*LamPhi*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHpcHpL(gt1,gt2,LamH,LamPhiH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2._dp*(LamH)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(LamPhiH)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHpcHpL  
 
 
Subroutine CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gX1,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVPVPL  
 
 
Subroutine CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhcVWpVWpL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1X**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
Subroutine CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1X**2*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX**2*Cos(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZpVZpL  
 
 
Subroutine CouplingUAhAhhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-2*LamH*vH*ZA(gt2,1)*ZH(gt3,1)
End If 
If ((2.eq.gt1)) Then 
res = res-(LamPhiH*vH*ZA(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(LamPhiH*vPhi*ZA(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-2*LamPhi*vPhi*ZA(gt2,2)*ZH(gt3,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhAhhhL  
 
 
Subroutine CouplingcFdFdUAhL(gt1,gt2,gt3,YdL,YdR,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUAhL  
 
 
Subroutine CouplingcFeFeUAhL(gt1,gt2,gt3,YeL,YeR,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUAhL  
 
 
Subroutine CouplingcFuFuUAhL(gt1,gt2,gt3,YuL,YuR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUAhL  
 
 
Subroutine CouplingFvFvUAhL(gt1,gt2,gt3,YvL,YvR,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvUAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvUAhL  
 
 
Subroutine CouplingcgWpgWpUAhL(gt3,g2,vH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(g2**2*vH*RXiWp)/4._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpUAhL  
 
 
Subroutine CouplingcgWCgWCUAhL(gt3,g2,vH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,vH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCUAh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-1._dp/4._dp*(g2**2*vH*RXiWp)
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCUAhL  
 
 
Subroutine CouplingUAhhhVPL(gt1,gt2,g1,g2,gX1,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*Cos(TW)*ZH(gt2,1))
End If 
If ((1.eq.gt1)) Then 
res = res+(g2*Sin(TW)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(gX1*Cos(TW)*ZH(gt2,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVPL  
 
 
Subroutine CouplingUAhhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2*Cos(TW)*Cos(TWp)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(g1*Cos(TWp)*Sin(TW)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1X*Sin(TWp)*ZH(gt2,1))
End If 
If ((2.eq.gt1)) Then 
res = res+gX1*Cos(TWp)*Sin(TW)*ZH(gt2,2)
End If 
If ((2.eq.gt1)) Then 
res = res-(gX*Sin(TWp)*ZH(gt2,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVZL  
 
 
Subroutine CouplingUAhhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1X*Cos(TWp)*ZH(gt2,1))
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp)*ZH(gt2,1))
End If 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*(g1*Sin(TW)*Sin(TWp)*ZH(gt2,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(gX*Cos(TWp)*ZH(gt2,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(gX1*Sin(TW)*Sin(TWp)*ZH(gt2,2))
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhhhVZpL  
 
 
Subroutine CouplingUAhHpcVWpL(gt1,g2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp/2._dp*g2
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhHpcVWpL  
 
 
Subroutine CouplingUAhUAhAhAhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-6*LamH*ZA(gt3,1)*ZA(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZA(gt3,1)*ZA(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(LamPhiH*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZA(gt3,2)*ZA(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(LamPhiH*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZA(gt3,1)*ZA(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(LamPhiH*ZA(gt3,2)*ZA(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-6*LamPhi*ZA(gt3,2)*ZA(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhAhAhL  
 
 
Subroutine CouplingUAhUAhhhhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2*LamH*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(LamPhiH*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-2*LamPhi*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhhhhhL  
 
 
Subroutine CouplingUAhUAhHpcHpL(gt1,gt2,LamH,LamPhiH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-2._dp*(LamH)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(LamPhiH)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhHpcHpL  
 
 
Subroutine CouplingUAhUAhVPVPL(gt1,gt2,g1,g2,gX1,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVPVPL  
 
 
Subroutine CouplingUAhUAhcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhcVWpVWpL  
 
 
Subroutine CouplingUAhUAhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1X**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVZVZL  
 
 
Subroutine CouplingUAhUAhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUAhUAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1X**2*Cos(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX**2*Cos(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUAhUAhVZpVZpL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*YdL(-3 + gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,3 + j2))*YdR(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,gt1))*ZDR(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,-3 + gt1))*ZDR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*YdL(-3 + gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,3 + j2))*YdR(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,gt1))*ZDR(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,-3 + gt1))*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.6).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.6).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX1*Cos(TW)*ZDR(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-1._dp/3._dp*(g1*Conjg(ZDL(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(ZDL(gt2,gt1))*Sin(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,gt1))*Sin(TWp))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-1._dp/3._dp*(g1*Cos(TWp)*Sin(TW)*ZDR(gt2,gt1))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(g1X*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/3._dp*(g1*Cos(TWp)*Sin(TW)*ZDR(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX1*Cos(TWp)*Sin(TW)*ZDR(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1X*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX*Sin(TWp)*ZDR(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(ZDL(gt2,gt1))*Cos(TWp))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,gt1))*Cos(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZDL(gt2,gt1))*Cos(TW)*Sin(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,gt1))*Sin(TW)*Sin(TWp))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(g1X*Cos(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1X*Cos(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX*Cos(TWp)*ZDR(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*Sin(TWp)*ZDR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX1*Sin(TW)*Sin(TWp)*ZDR(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZpL  
 
 
Subroutine CouplingcUFdFucHpL(gt1,gt2,YuL,YdL,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZUL(gt2,j2))*YdL(-3 + gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,gt1))*ZUR(gt2,3 + j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHpL  
 
 
Subroutine CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucVWpL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*YuL(-3 + gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,3 + j2))*YuR(gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,gt1))*ZUR(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,-3 + gt1))*ZUR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdHpL(gt1,gt2,YuL,YdL,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*YuL(-3 + gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,gt1))*ZDR(gt2,3 + j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdHpL  
 
 
Subroutine CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdVWpL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*YuL(-3 + gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,3 + j2))*YuR(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,gt1))*ZUR(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,-3 + gt1))*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.6).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.6).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(-2*g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX1*Cos(TW)*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(2*g1*Conjg(ZUL(gt2,gt1))*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(-2*g1X*Conjg(ZUL(gt2,gt1))*Sin(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,gt1))*Cos(TW)*Cos(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,gt1))*Sin(TWp))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(2*g1*Cos(TWp)*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(-2*g1X*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Cos(TWp)*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX1*Cos(TWp)*Sin(TW)*ZUR(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1X*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX*Sin(TWp)*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(-2*g1X*Conjg(ZUL(gt2,gt1))*Cos(TWp))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+(-2*g1*Conjg(ZUL(gt2,gt1))*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,gt1))*Cos(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZUL(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,gt1))*Sin(TW)*Sin(TWp))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(-2*g1X*Cos(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+(-2*g1*Sin(TW)*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1X*Cos(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX*Cos(TWp)*ZUR(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Sin(TW)*Sin(TWp)*ZUR(gt2,gt1))/3._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX1*Sin(TW)*Sin(TWp)*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZpL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*YeL(-3 + gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,3 + j2))*YeR(gt1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,gt1))*ZER(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,-3 + gt1))*ZER(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*YeL(-3 + gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,3 + j2))*YeR(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,gt1))*ZER(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,-3 + gt1))*ZER(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+g1*Conjg(ZEL(gt2,gt1))*Cos(TW)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+g1X*Conjg(ZEL(gt2,gt1))*Sin(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g1*Conjg(ZEL(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(ZEL(gt2,gt1))*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW)*ZER(gt2,gt1))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+g1X*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Cos(TWp)*Sin(TW)*ZER(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(gX1*Cos(TWp)*Sin(TW)*ZER(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1X*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+g1X*Conjg(ZEL(gt2,gt1))*Cos(TWp)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+g1*Conjg(ZEL(gt2,gt1))*Sin(TW)*Sin(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(ZEL(gt2,gt1))*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZEL(gt2,gt1))*Cos(TW)*Sin(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Sin(TW)*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+g1X*Cos(TWp)*ZER(gt2,gt1)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+g1*Sin(TW)*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1X*Cos(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX*Cos(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Sin(TW)*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+gX1*Sin(TW)*Sin(TWp)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZpL  
 
 
Subroutine CouplingcUFeFvcHpL(gt1,gt2,YvL,YeL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(UV(gt2,j2))*YeL(-3 + gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,gt1))*UV(gt2,6 + j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHpL  
 
 
Subroutine CouplingcUFeFvcVWpL(gt1,gt2,g2,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(UV(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcVWpL  
 
 
Subroutine CouplingUFvFvAhL(gt1,gt2,gt3,YvL,YvR,ZA,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,6 + j1))*YvL(j1,gt1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(UV(gt2,3 + j1))*YvR(j1,-6 + gt1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(UV(gt2,j2))*YvL(-6 + gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(UV(gt2,6 + j2))*YvR(-3 + gt1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,gt1))*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,-6 + gt1))*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(YvL(-6 + gt1,j2))*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(YvR(-3 + gt1,j2))*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvAhL  
 
 
Subroutine CouplingUFvFeHpL(gt1,gt2,YvL,YeL,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZEL(gt2,j2))*YvL(-6 + gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,gt1))*ZER(gt2,3 + j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeHpL  
 
 
Subroutine CouplingUFvFeVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeVWpL  
 
 
Subroutine CouplingUFvFvhhL(gt1,gt2,gt3,YvL,YvR,ZH,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,6 + j1))*YvL(j1,gt1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(UV(gt2,3 + j1))*YvR(j1,-6 + gt1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(UV(gt2,j2))*YvL(-6 + gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(UV(gt2,6 + j2))*YvR(-3 + gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,gt1))*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,-6 + gt1))*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((-6 + gt1.le.3).And.(-6 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(YvL(-6 + gt1,j2))*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(YvR(-3 + gt1,j2))*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvhhL  
 
 
Subroutine CouplingUFvFvVPL(gt1,gt2,g1,g2,gX1,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+gX1*Conjg(UV(gt2,gt1))*Cos(TW)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(UV(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,gt1))*Sin(TW))
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(gX1*Cos(TW)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/2._dp*(g1*Cos(TW)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVPL  
 
 
Subroutine CouplingUFvFvVZL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL-(gX1*Conjg(UV(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+gX*Conjg(UV(gt2,gt1))*Sin(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,gt1))*Cos(TW)*Cos(TWp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g1*Conjg(UV(gt2,gt1))*Cos(TWp)*Sin(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(UV(gt2,gt1))*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR+gX1*Cos(TWp)*Sin(TW)*UV(gt2,gt1)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(gX*Sin(TWp)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Cos(TW)*Cos(TWp)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TWp)*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/2._dp*(g1X*Sin(TWp)*UV(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZL  
 
 
Subroutine CouplingUFvFvVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+gX*Conjg(UV(gt2,gt1))*Cos(TWp)
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resL = resL+gX1*Conjg(UV(gt2,gt1))*Sin(TW)*Sin(TWp)
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1X*Conjg(UV(gt2,gt1))*Cos(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(UV(gt2,gt1))*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(UV(gt2,gt1))*Sin(TW)*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(gX*Cos(TWp)*UV(gt2,gt1))
End If 
If ((-3 + gt1.le.3).And.(-3 + gt1.ge.1)) Then 
resR = resR-(gX1*Sin(TW)*Sin(TWp)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/2._dp*(g1X*Cos(TWp)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp)*UV(gt2,gt1))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/2._dp*(g1*Sin(TW)*Sin(TWp)*UV(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZpL  
 
 
Subroutine CouplingcFeUFvcHpL(gt1,gt2,YvL,YeL,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeUFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,3 + j1))*YeL(j1,gt2))
End Do 
End If 
resR = 0._dp 
If ((-6 + gt2.le.3).And.(-6 + gt2.ge.1)) Then 
Do j2 = 1,3
resR = resR+Conjg(YvL(-6 + gt2,j2))*ZEL(gt1,j2)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeUFvcHpL  
 
 
Subroutine CouplingcFeUFvcVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeUFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeUFvcVWpL  
 
 
Subroutine CouplingAhcHpVWpL(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpL  
 
 
Subroutine CouplingcFdFucHpL(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YdL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*ZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpL  
 
 
Subroutine CouplingcFeFvcHpL(gt1,gt2,YvL,YeL,ZEL,ZER,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*YeL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*UV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpL  
 
 
Subroutine CouplingcgZgWpcHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res+(g1*g2*vH*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiZ*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpL  
 
 
Subroutine CouplingcgWpgZHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*Cos(TWp)*RXiWp)
res = res+(g1*g2*vH*Cos(TWp)*RXiWp*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiWp*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpL  
 
 
Subroutine CouplingcgZpgWpcHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiZp)
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*RXiZp*Sin(TWp))
res = res-1._dp/4._dp*(g1*g2*vH*RXiZp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpcHpL  
 
 
Subroutine CouplingcgWpgZpHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZpHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiWp)
res = res+(g2**2*vH*Cos(TW)*RXiWp*Sin(TWp))/4._dp
res = res-1._dp/4._dp*(g1*g2*vH*RXiWp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZpHpL  
 
 
Subroutine CouplingcgWCgZcHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*Cos(TWp)*RXiWp)
res = res+(g1*g2*vH*Cos(TWp)*RXiWp*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiWp*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpL  
 
 
Subroutine CouplingcgZgWCHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*RXiZ)/4._dp
res = res+(g1*g2*vH*Cos(TWp)*RXiZ*Sin(TW))/4._dp
res = res-1._dp/4._dp*(g1X*g2*vH*RXiZ*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpL  
 
 
Subroutine CouplingcgWCgZpcHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZpcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiWp)
res = res+(g2**2*vH*Cos(TW)*RXiWp*Sin(TWp))/4._dp
res = res-1._dp/4._dp*(g1*g2*vH*RXiWp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZpcHpL  
 
 
Subroutine CouplingcgZpgWCHpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWCHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1X*g2*vH*Cos(TWp)*RXiZp)
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)*RXiZp*Sin(TWp))
res = res-1._dp/4._dp*(g1*g2*vH*RXiZp*Sin(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWCHpL  
 
 
Subroutine CouplinghhHpcHpL(gt1,LamH,LamPhiH,vH,vPhi,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*ZH(gt1,1)
res = res-(LamPhiH*vPhi*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpL  
 
 
Subroutine CouplinghhcHpVWpL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpL  
 
 
Subroutine CouplingHpcHpVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPL  
 
 
Subroutine CouplingHpcHpVZL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW)*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g1*Cos(TWp)*Sin(TW))
res = res+(g1X*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZL  
 
 
Subroutine CouplingHpcHpVZpL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZp' 
 
res = 0._dp 
res = res+(g1X*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp))
res = res+(g1*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZpL  
 
 
Subroutine CouplingcHpVPVWpL(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpL  
 
 
Subroutine CouplingcHpVWpVZL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(g1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZL  
 
 
Subroutine CouplingcHpVWpVZpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZp' 
 
res = 0._dp 
res = res+(g1X*g2*vH*Cos(TWp))/2._dp
res = res+(g1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZpL  
 
 
Subroutine CouplingAhAhHpcHpL(gt1,gt2,LamH,LamPhiH,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZA(gt1,1)*ZA(gt2,1)
res = res-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpL  
 
 
Subroutine CouplinghhhhHpcHpL(gt1,gt2,LamH,LamPhiH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*ZH(gt1,1)*ZH(gt2,1)
res = res-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpL  
 
 
Subroutine CouplingHpHpcHpcHpL(LamH,res)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-4._dp*(LamH)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpL  
 
 
Subroutine CouplingHpcHpVPVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPL  
 
 
Subroutine CouplingHpcHpcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpL  
 
 
Subroutine CouplingHpcHpVZVZL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW))
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(g1X**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZL  
 
 
Subroutine CouplingHpcHpVZpVZpL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZpVZp' 
 
res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2)/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZpVZpL  
 
 
Subroutine CouplingcFdFdVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGL  
 
 
Subroutine CouplingcFuFuVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGL  
 
 
Subroutine CouplingcgGgGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGL  
 
 
Subroutine CouplingVGVGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGL  
 
 
Subroutine CouplingVGVGVGVGL(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGL  
 
 
Subroutine CouplingAhhhVPL(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))
res = res+(g2*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gX1*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVPL  
 
 
Subroutine CouplingcFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TW)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TW)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPL  
 
 
Subroutine CouplingcFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*Cos(TW)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*Cos(TW)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPL  
 
 
Subroutine CouplingcFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPL  
 
 
Subroutine CouplingFvFvVPL(gt1,gt2,g1,g2,gX1,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVPL  
 
 
Subroutine CouplingcgWpgWpVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPL  
 
 
Subroutine CouplingcgWCgWCVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPL  
 
 
Subroutine CouplinghhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1**2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(g1*g2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g1*g1X*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-2*gX1**2*vPhi*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+2*gX*gX1*vPhi*Cos(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZL  
 
 
Subroutine CouplinghhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(g1*g2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(g1**2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1*g2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+2*gX*gX1*vPhi*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+2*gX1**2*vPhi*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVPVZpL  
 
 
Subroutine CouplingHpcVWpVPL(g1,g2,vH,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPL  
 
 
Subroutine CouplingcVWpVPVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpL  
 
 
Subroutine CouplingAhAhVPVPL(gt1,gt2,g1,g2,gX1,ZA,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZA(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVPL  
 
 
Subroutine CouplinghhhhVPVPL(gt1,gt2,g1,g2,gX1,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g2**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVPL  
 
 
Subroutine CouplingcVWpVPVPVWpL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpL  
 
 
Subroutine CouplingAhhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res+gX1*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res-(gX*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*Cos(TWp)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(ZEL(gt2,j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZUL(gt2,j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingFvFvVZL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(gX1*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZL  
 
 
Subroutine CouplingcgWpgWpVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZL  
 
 
Subroutine CouplingcgWCgWCVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(g1X**2*vH*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+2*gX1**2*vPhi*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)
res = res-4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*gX**2*vPhi*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplinghhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res+(g1X**2*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(g1**2*vH*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(g1X*g2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(g1*g1X*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1))
res = res-2*gX*gX1*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res+2*gX**2*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-2*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res+2*gX*gX1*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZpL  
 
 
Subroutine CouplingHpcVWpVZL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(g1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZL  
 
 
Subroutine CouplingcVWpVWpVZL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZL  
 
 
Subroutine CouplingAhAhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2)
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2)
res = res-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingcVWpVWpVZVZL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Cos(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Cos(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Cos(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZL  
 
 
Subroutine CouplingAhhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-(gX*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = res-(gX1*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZpL  
 
 
Subroutine CouplingcFdFdVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZpL  
 
 
Subroutine CouplingcFeFeVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*Sin(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZpL  
 
 
Subroutine CouplingcFuFuVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*Sin(TWp)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZpL  
 
 
Subroutine CouplingFvFvVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp

Complex(dp), Intent(in) :: UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(g1X*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZpL  
 
 
Subroutine CouplingcgWpgWpVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZpL  
 
 
Subroutine CouplingcgWCgWCVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZpL  
 
 
Subroutine CouplinghhVZpVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*vH*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+g1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(g2**2*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)
res = res+(g1**2*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+2*gX**2*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res+4*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZpVZpL  
 
 
Subroutine CouplingHpcVWpVZpL(g1,g2,g1X,vH,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZp' 
 
res = 0._dp 
res = res+(g1X*g2*vH*Cos(TWp))/2._dp
res = res+(g1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZpL  
 
 
Subroutine CouplingcVWpVWpVZpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZpL  
 
 
Subroutine CouplingAhAhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+2*gX**2*Cos(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZpVZpL  
 
 
Subroutine CouplinghhhhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1X**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+2*gX**2*Cos(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res = res+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZpVZpL  
 
 
Subroutine CouplingcVWpVWpVZpVZpL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZpVZp' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Sin(TWp)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Sin(TWp)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Sin(TWp)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZpVZpL  
 
 
Subroutine CouplingAhHpcVWpL(gt1,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpL  
 
 
Subroutine CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(6,6),ZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpL  
 
 
Subroutine CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(6,6),UV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpL  
 
 
Subroutine CouplingcgWCgAcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpL  
 
 
Subroutine CouplingcgAgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpL  
 
 
Subroutine CouplingcgZgWpcVWpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpL  
 
 
Subroutine CouplingcgZpgWpcVWpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZpgWpcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZpgWpcVWpL  
 
 
Subroutine CouplingcgWCgZcVWpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpL  
 
 
Subroutine CouplingcgWCgZpcVWpL(g2,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZpcVWpL  
 
 
Subroutine CouplinghhHpcVWpL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*ZH(gt1,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpL  
 
 
Subroutine CouplinghhcVWpVWpL(gt1,g2,vH,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vH,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpL  
 
 
Subroutine CouplingAhAhcVWpVWpL(gt1,gt2,g2,ZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpL  
 
 
Subroutine CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpL  
 
 
Subroutine CouplingcVWpcVWpVWpVWpL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpL  
 
 
Subroutine CouplingAhAhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g1X*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX*gX1*Cos(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZL  
 
 
Subroutine CouplinghhhhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g1X*Cos(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX*gX1*Cos(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZL  
 
 
Subroutine CouplingHpcHpVPVZL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW)**2*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW))
res = res+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)**2)
res = res+(g1*g1X*Cos(TW)*Sin(TWp))/2._dp
res = res+(g1X*g2*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZL  
 
 
Subroutine CouplingcVWpVPVWpVZL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TWp)*Sin(2._dp*(TW)))/2._dp
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TWp)*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+(g2**2*Cos(TWp)*Sin(2._dp*(TW)))/2._dp
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZL  
 
 
Subroutine CouplingAhAhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+2*gX*gX1*Cos(TW)*Cos(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZpL  
 
 
Subroutine CouplinghhhhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+2*gX*gX1*Cos(TW)*Cos(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZpL  
 
 
Subroutine CouplingHpcHpVPVZpL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZp' 
 
res = 0._dp 
res = res+(g1*g1X*Cos(TW)*Cos(TWp))/2._dp
res = res+(g1X*g2*Cos(TWp)*Sin(TW))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)**2*Sin(TWp))
res = res+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
res = res+(g1*g2*Sin(TW)**2*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZpL  
 
 
Subroutine CouplingcVWpVPVWpVZpL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZp' 
 
res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g2**2*Sin(2._dp*(TW))*Sin(TWp))
res2 = 0._dp 
res2 = res2+g2**2*Sin(2._dp*(TW))*Sin(TWp)
res3 = 0._dp 
res3 = res3-1._dp/2._dp*(g2**2*Sin(2._dp*(TW))*Sin(TWp))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZpL  
 
 
Subroutine CouplingAhAhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res = res+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZA(gt1,1)*ZA(gt2,1))
res = res-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX**2*Cos(TWp)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res = res+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZpL  
 
 
Subroutine CouplinghhhhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res = res+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1)*ZH(gt2,1))
res = res-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res = res+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZpL  
 
 
Subroutine CouplingHpcHpVZVZpL(g1,g2,g1X,TW,TWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZp' 
 
res = 0._dp 
res = res+(g1X*g2*Cos(TW)*Cos(TWp)**2)/2._dp
res = res-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW))
res = res+(g1X**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
res = res-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp))
res = res-1._dp/2._dp*(g1X*g2*Cos(TW)*Sin(TWp)**2)
res = res+(g1*g1X*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZpL  
 
 
Subroutine CouplingcVWpVWpVZVZpL(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)**2*Sin(2._dp*(TWp))
res2 = 0._dp 
res2 = res2-1._dp/2._dp*(g2**2*Cos(TW)**2*Sin(2._dp*(TWp)))
res3 = 0._dp 
res3 = res3-1._dp/2._dp*(g2**2*Cos(TW)**2*Sin(2._dp*(TWp)))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZpL  
 
 
Subroutine CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,            & 
& ZEL,ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,              & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,        & 
& cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,     & 
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

Implicit None 
Real(dp), Intent(in) :: g2,ZA(2,2),ZH(2,2),g1,TW,g1X,TWp,vH,gX1,gX,vPhi

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6),ZEL(6,6),ZER(6,6),ZUL(6,6),ZUR(6,6),UV(9,9)

Complex(dp), Intent(out) :: cplAhcHpVWp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,          & 
& cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP(2,2),cplcFdFdVPL(6,6),& 
& cplcFdFdVPR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),  & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ(2),cplhhVPVZp(2),  & 
& cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP(2,2),cplhhhhVPVP(2,2),cplcVWpVPVPVWp1,            & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),      & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),   & 
& cplFvFvVZR(9,9),cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplhhVZVZp(2),cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,        & 
& cplcVWpVWpVZVZ3,cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,        & 
& cplcVWpVWpVZpVZp3,cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplAhAhcVWpVWp(2,2),       & 
& cplhhhhcVWpVWp(2,2),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,          & 
& cplAhAhVPVZ(2,2),cplhhhhVPVZ(2,2),cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,        & 
& cplcVWpVPVWpVZ3,cplAhAhVPVZp(2,2),cplhhhhVPVZp(2,2),cplHpcHpVPVZp,cplcVWpVPVWpVZp1,    & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp(2,2),cplhhhhVZVZp(2,2),cplHpcHpVZVZp,   & 
& cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpL(gt1,g2,ZA,cplAhcHpVWp(gt1))

End Do 


cplhhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpL(gt1,g2,ZH,cplhhcHpVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,g1X,TW,TWp,cplHpcHpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,vH,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZ)



cplcHpVWpVZp = 0._dp 
Call CouplingcHpVWpVZpL(g1,g2,g1X,vH,TW,TWp,cplcHpVWpVZp)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,g1X,TW,TWp,cplHpcHpVZVZ)



cplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVPL(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,cplAhhhVP(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcFdFdVPL(gt1,gt2)               & 
& ,cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcFeFeVPL(gt1,gt2)               & 
& ,cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcFuFuVPL(gt1,gt2)               & 
& ,cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplFvFvVPL = 0._dp 
cplFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVPL(gt1,gt2,g1,g2,gX1,UV,TW,cplFvFvVPL(gt1,gt2),cplFvFvVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZ(gt1))

End Do 


cplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVPVZp(gt1))

End Do 


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,vH,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplAhAhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVPL(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhAhVPVP(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVPL(gt1,gt2,g1,g2,gX1,ZH,TW,cplhhhhVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcFdFdVZL(gt1,gt2)    & 
& ,cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZL(gt1,gt2)    & 
& ,cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcFuFuVZL(gt1,gt2)    & 
& ,cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZL(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZL(gt1,gt2)           & 
& ,cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,TWp,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,TWp,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,TWp,cplcVWpVWpVZ)



cplAhAhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,TWp,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplHpcVWpVZp = 0._dp 
Call CouplingHpcVWpVZpL(g1,g2,g1X,vH,TW,TWp,cplHpcVWpVZp)



cplcVWpVWpVZp = 0._dp 
Call CouplingcVWpVWpVZpL(g2,TW,TWp,cplcVWpVWpVZp)



cplcVWpVWpVZpVZp1 = 0._dp 
cplcVWpVWpVZpVZp2 = 0._dp 
cplcVWpVWpVZpVZp3 = 0._dp 
Call CouplingcVWpVWpVZpVZpL(g2,TW,TWp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,            & 
& cplcVWpVWpVZpVZp3)



cplAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpL(gt1,g2,ZA,cplAhHpcVWp(gt1))

End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,UV,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,TWp,cplcgZgWpcVWp)



cplcgZpgWpcVWp = 0._dp 
Call CouplingcgZpgWpcVWpL(g2,TW,TWp,cplcgZpgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,TWp,cplcgWCgZcVWp)



cplcgWCgZpcVWp = 0._dp 
Call CouplingcgWCgZpcVWpL(g2,TW,TWp,cplcgWCgZpcVWp)



cplhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpL(gt1,g2,ZH,cplhhHpcVWp(gt1))

End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,vH,ZH,cplhhcVWpVWp(gt1))

End Do 


cplAhAhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWpVWpL(gt1,gt2,g2,ZA,cplAhAhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplAhAhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZ(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZ(gt1,gt2))

 End Do 
End Do 


cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZL(g1,g2,g1X,TW,TWp,cplHpcHpVPVZ)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,TWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplAhAhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZp(gt1,gt2))

 End Do 
End Do 


cplHpcHpVPVZp = 0._dp 
Call CouplingHpcHpVPVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVPVZp)



cplcVWpVPVWpVZp1 = 0._dp 
cplcVWpVPVWpVZp2 = 0._dp 
cplcVWpVPVWpVZp3 = 0._dp 
Call CouplingcVWpVPVWpVZpL(g2,TW,TWp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,               & 
& cplcVWpVPVWpVZp3)



cplAhAhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZp(gt1,gt2))

 End Do 
End Do 


cplHpcHpVZVZp = 0._dp 
Call CouplingHpcHpVZVZpL(g1,g2,g1X,TW,TWp,cplHpcHpVZVZp)



cplcVWpVWpVZVZp1 = 0._dp 
cplcVWpVWpVZVZp2 = 0._dp 
cplcVWpVWpVZVZp3 = 0._dp 
Call CouplingcVWpVWpVZVZpL(g2,TW,TWp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,               & 
& cplcVWpVWpVZVZp3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(YdL,YdR,ZA,ZDL,ZDR,ZH,g3,g1,g2,gX1,TW,              & 
& gX,g1X,TWp,YuL,ZUL,ZUR,YuR,YeL,YeR,ZEL,ZER,YvL,UV,cplcUFdFdAhL,cplcUFdFdAhR,           & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,     & 
& cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,     & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,         & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,     & 
& cplcUFeFvcVWpL,cplcUFeFvcVWpR)

Implicit None 
Real(dp), Intent(in) :: ZA(2,2),ZH(2,2),g3,g1,g2,gX1,TW,gX,g1X,TWp

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YuL(3,3),ZUL(6,6),ZUR(6,6),YuR(3,3),              & 
& YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),YvL(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6),         & 
& cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),           & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6),             & 
& cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),       & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFdFdAhL(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2)             & 
& ,cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcUFdFdVZL(gt1,gt2)  & 
& ,cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZpL = 0._dp 
cplcUFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFdVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,cplcUFdFdVZpL(gt1,gt2)& 
& ,cplcUFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFucHpL(gt1,gt2,YuL,YdL,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),               & 
& cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFuFuAhL(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFdHpL(gt1,gt2,YuL,YdL,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2)             & 
& ,cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcUFuFuVZL(gt1,gt2)  & 
& ,cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZpL = 0._dp 
cplcUFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFuFuVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,cplcUFuFuVZpL(gt1,gt2)& 
& ,cplcUFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFeFeAhL(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,cplcUFeFeAhL(gt1,gt2,gt3)       & 
& ,cplcUFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2)             & 
& ,cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcUFeFeVZL(gt1,gt2)  & 
& ,cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZpL = 0._dp 
cplcUFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcUFeFeVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcUFeFeVZpL(gt1,gt2)& 
& ,cplcUFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcUFeFvcHpL(gt1,gt2,YvL,YeL,UV,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,UV,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(LamH,LamPhiH,LamPhi,vH,vPhi,ZA,g1,g2,gX1,             & 
& TW,gX,g1X,TWp,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,              & 
& ZH,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZp,cplcFdFdUhhL,cplcFdFdUhhR,             & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,       & 
& cplUhhhhhh,cplUhhHpcHp,cplUhhHpcVWp,cplUhhVPVZ,cplUhhVPVZp,cplUhhcVWpVWp,              & 
& cplUhhVZVZ,cplUhhVZVZp,cplUhhVZpVZp,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpcHp,        & 
& cplUhhUhhVPVP,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,cplUhhUhhVZpVZp)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,ZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9)

Complex(dp), Intent(out) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZA,cplAhAhUhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhUhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVPL(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhUhhVP(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhUhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhUhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhUhhVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhUhhVZp(gt1,gt2))

 End Do 
End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,YdL,YdR,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,YeL,YeR,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,YuL,YuR,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvUhhL = 0._dp 
cplFvFvUhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingFvFvUhhL(gt1,gt2,gt3,YvL,YvR,UV,cplFvFvUhhL(gt1,gt2,gt3),cplFvFvUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,vH,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,vH,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZgZUhh(gt3))

End Do 


cplcgZpgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZpgZUhh(gt3))

End Do 


cplcgZgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZgZpUhh(gt3))

End Do 


cplcgZpgZpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZpgZpUhhL(gt3,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplcgZpgZpUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcHpL(gt1,LamH,LamPhiH,vH,vPhi,cplUhhHpcHp(gt1))

End Do 


cplUhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcVWpL(gt1,g2,cplUhhHpcVWp(gt1))

End Do 


cplUhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVPVZ(gt1))

End Do 


cplUhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVPVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVPVZp(gt1))

End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,vH,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZVZ(gt1))

End Do 


cplUhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZVZp(gt1))

End Do 


cplUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZpVZpL(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,TW,TWp,cplUhhVZpVZp(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhUhhUhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHpcHpL(gt1,gt2,LamH,LamPhiH,cplUhhUhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVPVPL(gt1,gt2,g1,g2,gX1,TW,cplUhhUhhVPVP(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZpVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZpVZpL(gt1,gt2,g1,g2,gX,g1X,gX1,TW,TWp,cplUhhUhhVZpVZp(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

Subroutine CouplingsColoredQuartics(LamH,LamPhiH,LamPhi,ZA,ZH,g1,g2,gX1,              & 
& TW,gX,g1X,TWp,g3,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,   & 
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

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2),ZH(2,2),g1,g2,gX1,TW,gX,g1X,TWp,g3

Complex(dp), Intent(out) :: cplAhAhAhAh1(2,2,2,2),cplAhAhhhhh1(2,2,2,2),cplAhAhHpcHp1(2,2),cplhhhhhhhh1(2,2,2,2), & 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColoredQuartics'
 
cplAhAhAhAh1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhAhAh1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,cplAhAhhhhh1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHpcHp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHpQ(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp1(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplhhhhhhhh1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpQ(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp1(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp1 = 0._dp 
Call CouplingHpHpcHpcHpQ(LamH,cplHpHpcHpcHp1)



cplAhAhVPVP1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVPQ(gt1,gt2,g1,g2,gX1,ZA,TW,cplAhAhVPVP1(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZ1(gt1,gt2))

 End Do 
End Do 


cplAhAhVPVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVPVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVPVZp1(gt1,gt2))

 End Do 
End Do 


cplAhAhcVWpVWp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhcVWpVWpQ(gt1,gt2,g2,ZA,cplAhAhcVWpVWp1(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZ1(gt1,gt2))

 End Do 
End Do 


cplAhAhVZVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZVZp1(gt1,gt2))

 End Do 
End Do 


cplAhAhVZpVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhVZpVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,cplAhAhVZpVZp1(gt1,gt2))

 End Do 
End Do 


cplAhHpcVWpVP1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVPQ(gt1,g1,g2,ZA,TW,cplAhHpcVWpVP1(gt1))

End Do 


cplAhHpcVWpVZ1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVZQ(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhHpcVWpVZ1(gt1))

End Do 


cplAhHpcVWpVZp1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhHpcVWpVZpQ(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhHpcVWpVZp1(gt1))

End Do 


cplAhcHpVPVWp1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVPVWpQ(gt1,g1,g2,ZA,TW,cplAhcHpVPVWp1(gt1))

End Do 


cplAhcHpVWpVZ1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpVZQ(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhcHpVWpVZ1(gt1))

End Do 


cplAhcHpVWpVZp1 = 0._dp 
Do gt1 = 1, 2
Call CouplingAhcHpVWpVZpQ(gt1,g1,g2,g1X,ZA,TW,TWp,cplAhcHpVWpVZp1(gt1))

End Do 


cplhhhhVPVP1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVPQ(gt1,gt2,g1,g2,gX1,ZH,TW,cplhhhhVPVP1(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZ1(gt1,gt2))

 End Do 
End Do 


cplhhhhVPVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVPVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVPVZp1(gt1,gt2))

 End Do 
End Do 


cplhhhhcVWpVWp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpQ(gt1,gt2,g2,ZH,cplhhhhcVWpVWp1(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZ1(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZVZp1(gt1,gt2))

 End Do 
End Do 


cplhhhhVZpVZp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZpVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,cplhhhhVZpVZp1(gt1,gt2))

 End Do 
End Do 


cplhhHpcVWpVP1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVPQ(gt1,g1,g2,ZH,TW,cplhhHpcVWpVP1(gt1))

End Do 


cplhhHpcVWpVZ1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVZQ(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhHpcVWpVZ1(gt1))

End Do 


cplhhHpcVWpVZp1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcVWpVZpQ(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhHpcVWpVZp1(gt1))

End Do 


cplhhcHpVPVWp1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVPVWpQ(gt1,g1,g2,ZH,TW,cplhhcHpVPVWp1(gt1))

End Do 


cplhhcHpVWpVZ1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpVZQ(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhcHpVWpVZ1(gt1))

End Do 


cplhhcHpVWpVZp1 = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpVWpVZpQ(gt1,g1,g2,g1X,ZH,TW,TWp,cplhhcHpVWpVZp1(gt1))

End Do 


cplHpcHpVPVP1 = 0._dp 
Call CouplingHpcHpVPVPQ(g1,g2,TW,cplHpcHpVPVP1)



cplHpcHpVPVZ1 = 0._dp 
Call CouplingHpcHpVPVZQ(g1,g2,g1X,TW,TWp,cplHpcHpVPVZ1)



cplHpcHpVPVZp1 = 0._dp 
Call CouplingHpcHpVPVZpQ(g1,g2,g1X,TW,TWp,cplHpcHpVPVZp1)



cplHpcHpcVWpVWp1 = 0._dp 
Call CouplingHpcHpcVWpVWpQ(g2,cplHpcHpcVWpVWp1)



cplHpcHpVZVZ1 = 0._dp 
Call CouplingHpcHpVZVZQ(g1,g2,g1X,TW,TWp,cplHpcHpVZVZ1)



cplHpcHpVZVZp1 = 0._dp 
Call CouplingHpcHpVZVZpQ(g1,g2,g1X,TW,TWp,cplHpcHpVZVZp1)



cplHpcHpVZpVZp1 = 0._dp 
Call CouplingHpcHpVZpVZpQ(g1,g2,g1X,TW,TWp,cplHpcHpVZpVZp1)



cplVGVGVGVG1Q = 0._dp 
cplVGVGVGVG2Q = 0._dp 
cplVGVGVGVG3Q = 0._dp 
Call CouplingVGVGVGVGQ(g3,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q)



cplcVWpVPVPVWp1Q = 0._dp 
cplcVWpVPVPVWp2Q = 0._dp 
cplcVWpVPVPVWp3Q = 0._dp 
Call CouplingcVWpVPVPVWpQ(g2,TW,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q)



cplcVWpVPVWpVZ1Q = 0._dp 
cplcVWpVPVWpVZ2Q = 0._dp 
cplcVWpVPVWpVZ3Q = 0._dp 
Call CouplingcVWpVPVWpVZQ(g2,TW,TWp,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q)



cplcVWpVPVWpVZp1Q = 0._dp 
cplcVWpVPVWpVZp2Q = 0._dp 
cplcVWpVPVWpVZp3Q = 0._dp 
Call CouplingcVWpVPVWpVZpQ(g2,TW,TWp,cplcVWpVPVWpVZp1Q,cplcVWpVPVWpVZp2Q,             & 
& cplcVWpVPVWpVZp3Q)



cplcVWpcVWpVWpVWp1Q = 0._dp 
cplcVWpcVWpVWpVWp2Q = 0._dp 
cplcVWpcVWpVWpVWp3Q = 0._dp 
Call CouplingcVWpcVWpVWpVWpQ(g2,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q)



cplcVWpVWpVZVZ1Q = 0._dp 
cplcVWpVWpVZVZ2Q = 0._dp 
cplcVWpVWpVZVZ3Q = 0._dp 
Call CouplingcVWpVWpVZVZQ(g2,TW,TWp,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q)



cplcVWpVWpVZVZp1Q = 0._dp 
cplcVWpVWpVZVZp2Q = 0._dp 
cplcVWpVWpVZVZp3Q = 0._dp 
Call CouplingcVWpVWpVZVZpQ(g2,TW,TWp,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZVZp2Q,             & 
& cplcVWpVWpVZVZp3Q)



cplcVWpVWpVZpVZp1Q = 0._dp 
cplcVWpVWpVZpVZp2Q = 0._dp 
cplcVWpVWpVZpVZp3Q = 0._dp 
Call CouplingcVWpVWpVZpVZpQ(g2,TW,TWp,cplcVWpVWpVZpVZp1Q,cplcVWpVWpVZpVZp2Q,          & 
& cplcVWpVWpVZpVZp3Q)



Iname = Iname - 1 
End Subroutine CouplingsColoredQuartics

Subroutine CouplingAhAhAhAhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-6*LamH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res1 = res1-6*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhQ  
 
 
Subroutine CouplingAhAhhhhhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhQ  
 
 
Subroutine CouplingAhAhHpcHpQ(gt1,gt2,LamH,LamPhiH,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZA(gt1,1)*ZA(gt2,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpQ  
 
 
Subroutine CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-6*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-6*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhQ  
 
 
Subroutine CouplinghhhhHpcHpQ(gt1,gt2,LamH,LamPhiH,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZH(gt1,1)*ZH(gt2,1)
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpQ  
 
 
Subroutine CouplingHpHpcHpcHpQ(LamH,res1)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res1 = 0._dp 
res1 = res1-4._dp*(LamH)

 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpQ  
 
 
Subroutine CouplingAhAhVPVPQ(gt1,gt2,g1,g2,gX1,ZA,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZA(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1**2*Cos(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g2**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+2*gX1**2*Cos(TW)**2*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVPQ  
 
 
Subroutine CouplingAhAhVPVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+(g1*g2*Cos(TWp)*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+(g1*g1X*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX*gX1*Cos(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZQ  
 
 
Subroutine CouplingAhAhVPVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g1X*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g1*g2*Cos(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+2*gX*gX1*Cos(TW)*Cos(TWp)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVPVZpQ  
 
 
Subroutine CouplingAhAhcVWpVWpQ(gt1,gt2,g2,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*ZA(gt1,1)*ZA(gt2,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpQ  
 
 
Subroutine CouplingAhAhVZVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1)
res1 = res1+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g1X**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZA(gt1,2)*ZA(gt2,2)
res1 = res1-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZQ  
 
 
Subroutine CouplingAhAhVZVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g1X**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1))
res1 = res1+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZA(gt1,1)*ZA(gt2,1))
res1 = res1-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX**2*Cos(TWp)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZpQ  
 
 
Subroutine CouplingAhAhVZpVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1X**2*Cos(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res1 = res1+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZA(gt2,1)
res1 = res1+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1)
res1 = res1+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,1)*ZA(gt2,1))/2._dp
res1 = res1+2*gX**2*Cos(TWp)**2*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZA(gt2,2)
res1 = res1+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZA(gt1,2)*ZA(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZpVZpQ  
 
 
Subroutine CouplingAhHpcVWpVPQ(gt1,g1,g2,ZA,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZA(gt1,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVPQ  
 
 
Subroutine CouplingAhHpcVWpVZQ(gt1,g1,g2,g1X,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))
res1 = res1+(g1X*g2*Sin(TWp)*ZA(gt1,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZQ  
 
 
Subroutine CouplingAhHpcVWpVZpQ(gt1,g1,g2,g1X,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1X*g2*Cos(TWp)*ZA(gt1,1))/2._dp
res1 = res1+(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZpQ  
 
 
Subroutine CouplingAhcHpVPVWpQ(gt1,g1,g2,ZA,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZA(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)*ZA(gt1,1))
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVPVWpQ  
 
 
Subroutine CouplingAhcHpVWpVZQ(gt1,g1,g2,g1X,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TWp)*Sin(TW)*ZA(gt1,1))/2._dp
res1 = res1-1._dp/2._dp*(g1X*g2*Sin(TWp)*ZA(gt1,1))
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZQ  
 
 
Subroutine CouplingAhcHpVWpVZpQ(gt1,g1,g2,g1X,ZA,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZA(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TWp)*ZA(gt1,1))
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW)*Sin(TWp)*ZA(gt1,1))
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZpQ  
 
 
Subroutine CouplinghhhhVPVPQ(gt1,gt2,g1,g2,gX1,ZH,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g2**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+2*gX1**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVPQ  
 
 
Subroutine CouplinghhhhVPVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g1*g1X*Cos(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1X*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-2*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX*gX1*Cos(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZQ  
 
 
Subroutine CouplinghhhhVPVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g1X*Cos(TW)*Cos(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+2*gX*gX1*Cos(TW)*Cos(TWp)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVPVZpQ  
 
 
Subroutine CouplinghhhhcVWpVWpQ(gt1,gt2,g2,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpQ  
 
 
Subroutine CouplinghhhhVZVZQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+(g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g1X**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+2*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2)
res1 = res1-4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZQ  
 
 
Subroutine CouplinghhhhVZVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g1X**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1))
res1 = res1+(g1X*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g1*g1X*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp))*ZH(gt1,1)*ZH(gt2,1))
res1 = res1-2*gX*gX1*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1-2*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX*gX1*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZpQ  
 
 
Subroutine CouplinghhhhVZpVZpQ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1X**2*Cos(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+(g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+(g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+2*gX**2*Cos(TWp)**2*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+4*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+2*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)*ZH(gt2,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZpVZpQ  
 
 
Subroutine CouplinghhHpcVWpVPQ(gt1,g1,g2,ZH,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVPQ  
 
 
Subroutine CouplinghhHpcVWpVZQ(gt1,g1,g2,g1X,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res1 = res1+(g1X*g2*Sin(TWp)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZQ  
 
 
Subroutine CouplinghhHpcVWpVZpQ(gt1,g1,g2,g1X,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1X*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res1 = res1+(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZpQ  
 
 
Subroutine CouplinghhcHpVPVWpQ(gt1,g1,g2,ZH,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVPVWpQ  
 
 
Subroutine CouplinghhcHpVWpVZQ(gt1,g1,g2,g1X,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res1 = res1+(g1X*g2*Sin(TWp)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZQ  
 
 
Subroutine CouplinghhcHpVWpVZpQ(gt1,g1,g2,g1X,ZH,TW,TWp,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,g1X,ZH(2,2),TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1X*g2*Cos(TWp)*ZH(gt1,1))/2._dp
res1 = res1+(g1*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZpQ  
 
 
Subroutine CouplingHpcHpVPVPQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res1 = 0._dp 
res1 = res1+(g1**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g2**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPQ  
 
 
Subroutine CouplingHpcHpVPVZQ(g1,g2,g1X,TW,TWp,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)**2*Cos(TWp))/2._dp
res1 = res1-1._dp/2._dp*(g1**2*Cos(TW)*Cos(TWp)*Sin(TW))
res1 = res1+(g2**2*Cos(TW)*Cos(TWp)*Sin(TW))/2._dp
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TWp)*Sin(TW)**2)
res1 = res1+(g1*g1X*Cos(TW)*Sin(TWp))/2._dp
res1 = res1+(g1X*g2*Sin(TW)*Sin(TWp))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZQ  
 
 
Subroutine CouplingHpcHpVPVZpQ(g1,g2,g1X,TW,TWp,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZp' 
 
res1 = 0._dp 
res1 = res1+(g1*g1X*Cos(TW)*Cos(TWp))/2._dp
res1 = res1+(g1X*g2*Cos(TWp)*Sin(TW))/2._dp
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW)**2*Sin(TWp))
res1 = res1+(g1**2*Cos(TW)*Sin(TW)*Sin(TWp))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))
res1 = res1+(g1*g2*Sin(TW)**2*Sin(TWp))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZpQ  
 
 
Subroutine CouplingHpcHpcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpQ  
 
 
Subroutine CouplingHpcHpVZVZQ(g1,g2,g1X,TW,TWp,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*Cos(TWp)**2)/2._dp
res1 = res1-(g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW))
res1 = res1+(g1**2*Cos(TWp)**2*Sin(TW)**2)/2._dp
res1 = res1+g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)
res1 = res1-(g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp))
res1 = res1+(g1X**2*Sin(TWp)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZQ  
 
 
Subroutine CouplingHpcHpVZVZpQ(g1,g2,g1X,TW,TWp,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZp' 
 
res1 = 0._dp 
res1 = res1+(g1X*g2*Cos(TW)*Cos(TWp)**2)/2._dp
res1 = res1-1._dp/2._dp*(g1*g1X*Cos(TWp)**2*Sin(TW))
res1 = res1+(g1X**2*Cos(TWp)*Sin(TWp))/2._dp
res1 = res1-1._dp/2._dp*(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))
res1 = res1-1._dp/2._dp*(g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp))
res1 = res1-1._dp/2._dp*(g1X*g2*Cos(TW)*Sin(TWp)**2)
res1 = res1+(g1*g1X*Sin(TW)*Sin(TWp)**2)/2._dp
res1 = res1+(g1*g2*Cos(TW)*Sin(TW)*Sin(2._dp*(TWp)))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZpQ  
 
 
Subroutine CouplingHpcHpVZpVZpQ(g1,g2,g1X,TW,TWp,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZpVZp' 
 
res1 = 0._dp 
res1 = res1+(g1X**2*Cos(TWp)**2)/2._dp
res1 = res1-(g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp))
res1 = res1+g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)
res1 = res1+(g2**2*Cos(TW)**2*Sin(TWp)**2)/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2)
res1 = res1+(g1**2*Sin(TW)**2*Sin(TWp)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZpVZpQ  
 
 
Subroutine CouplingVGVGVGVGQ(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2

 
res2 = 0._dp 
res2 = -(0.,1.)*res2 
 
res3 = 0._dp 
res3 = res3+16*g3**2

 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGQ  
 
 
Subroutine CouplingcVWpVPVPVWpQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2

 
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpQ  
 
 
Subroutine CouplingcVWpVPVWpVZQ(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Cos(TWp)*Sin(TW)

 
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TWp)*Sin(2._dp*(TW)))

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Cos(TWp)*Sin(TW)

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZQ  
 
 
Subroutine CouplingcVWpVPVWpVZpQ(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZp' 
 
res1 = 0._dp 
res1 = res1-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))

 
res2 = 0._dp 
res2 = res2+g2**2*Sin(2._dp*(TW))*Sin(TWp)

 
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TW)*Sin(TW)*Sin(TWp))

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZpQ  
 
 
Subroutine CouplingcVWpcVWpVWpVWpQ(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2

 
res2 = 0._dp 
res2 = res2-g2**2

 
res3 = 0._dp 
res3 = res3-g2**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpQ  
 
 
Subroutine CouplingcVWpVWpVZVZQ(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Cos(TWp)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Cos(TWp)**2

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Cos(TWp)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZQ  
 
 
Subroutine CouplingcVWpVWpVZVZpQ(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)**2*Sin(2._dp*(TWp))

 
res2 = 0._dp 
res2 = res2-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))

 
res3 = 0._dp 
res3 = res3-(g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp))

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZpQ  
 
 
Subroutine CouplingcVWpVWpVZpVZpQ(g2,TW,TWp,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZpVZp' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2*Sin(TWp)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2*Sin(TWp)**2

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2*Sin(TWp)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZpVZpQ  
 
 
Subroutine CouplingsColourStructures(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,               & 
& cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,       & 
& cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),& 
& cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),cplhhhhHpcHp(2,2),cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColourStructures'
 
cplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhAhhhCS(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhCS(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpCS(gt1,LamH,LamPhiH,vH,vPhi,ZH,cplhhHpcHp(gt1))

End Do 


cplAhAhAhAh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhAhAhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,cplAhAhAhAh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingAhAhhhhhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,cplAhAhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingAhAhHpcHpCS(gt1,gt2,LamH,LamPhiH,ZA,cplAhAhHpcHp(gt1,gt2))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpCS(gt1,gt2,LamH,LamPhiH,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpCS(LamH,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsColourStructures

Subroutine CouplingAhAhhhCS(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*vH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res1 = res1-(LamPhiH*vH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res1 = res1-(LamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res1 = res1-2*LamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhCS  
 
 
Subroutine CouplinghhhhhhCS(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-6*LamH*vH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res1 = res1-(LamPhiH*vPhi*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res1 = res1-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res1 = res1-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res1 = res1-(LamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res1 = res1-(LamPhiH*vH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res1 = res1-(LamPhiH*vH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res1 = res1-6*LamPhi*vPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhCS  
 
 
Subroutine CouplinghhHpcHpCS(gt1,LamH,LamPhiH,vH,vPhi,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*vH*ZH(gt1,1)
res1 = res1-(LamPhiH*vPhi*ZH(gt1,2))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpCS  
 
 
Subroutine CouplingAhAhAhAhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-6*LamH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,1)*ZA(gt3,1)*ZA(gt4,2))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,2)*ZA(gt3,1)*ZA(gt4,2))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZA(gt3,2)*ZA(gt4,2))
res1 = res1-6*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZA(gt3,2)*ZA(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhCS  
 
 
Subroutine CouplingAhAhhhhhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2),ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-2*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhCS  
 
 
Subroutine CouplingAhAhHpcHpCS(gt1,gt2,LamH,LamPhiH,ZA,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZA(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZA(gt1,1)*ZA(gt2,1)
res1 = res1-(LamPhiH*ZA(gt1,2)*ZA(gt2,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpCS  
 
 
Subroutine CouplinghhhhhhhhCS(gt1,gt2,gt3,gt4,LamH,LamPhiH,LamPhi,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-6*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-6*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhCS  
 
 
Subroutine CouplinghhhhHpcHpCS(gt1,gt2,LamH,LamPhiH,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: LamH,LamPhiH,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-2*LamH*ZH(gt1,1)*ZH(gt2,1)
res1 = res1-(LamPhiH*ZH(gt1,2)*ZH(gt2,2))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpCS  
 
 
Subroutine CouplingHpHpcHpcHpCS(LamH,res1)

Implicit None 

Real(dp), Intent(in) :: LamH

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res1 = 0._dp 
res1 = res1-4._dp*(LamH)

 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpCS  
 
 
End Module Couplings_U1T3R 
