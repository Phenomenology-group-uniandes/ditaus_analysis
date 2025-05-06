! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:18 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module CouplingsCT_U1T3R
 
Use Control 
Use Settings 
Use Model_Data_U1T3R 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine CalculateCouplingCT(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,               & 
& gX1,TW,gX,g1X,TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,              & 
& YvR,UV,dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH,dZA,dg1,dg2,dgX1,dSinTW,dCosTW,            & 
& dTanTW,dgX,dg1X,dSinTWp,dCosTWp,dTanTWp,dg3,dYdL,dYdR,dZDL,dZDR,dYeL,dYeR,             & 
& dZEL,dZER,dYuL,dYuR,dZUL,dZUR,dYvL,dYvR,dUV,ctcplAhAhhh,ctcplhhhhhh,ctcplhhHpcHp,      & 
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

Implicit None 
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),g1,g2,gX1,TW,gX,g1X,TWp,g3,               & 
& dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH(2,2),dZA(2,2),dg1,dg2,dgX1,dSinTW,dCosTW,         & 
& dTanTW,dgX,dg1X,dSinTWp,dCosTWp,dTanTWp,dg3

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),              & 
& YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),YvL(3,3),YvR(3,3),UV(9,9),dYdL(3,3),               & 
& dYdR(3,3),dZDL(6,6),dZDR(6,6),dYeL(3,3),dYeR(3,3),dZEL(6,6),dZER(6,6),dYuL(3,3),       & 
& dYuR(3,3),dZUL(6,6),dZUR(6,6),dYvL(3,3),dYvR(3,3),dUV(9,9)

Complex(dp), Intent(out) :: ctcplAhAhhh(2,2,2),ctcplhhhhhh(2,2,2),ctcplhhHpcHp(2),ctcplAhhhVP(2,2),               & 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateCouplingCT'
 
ctcplAhAhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingAhAhhh(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,dLamH,           & 
& dLamPhiH,dLamPhi,dvH,dvPhi,dZH,dZA,ctcplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_Couplinghhhhhh(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,dLamH,              & 
& dLamPhiH,dLamPhi,dvH,dvPhi,dZH,ctcplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhHpcHp(gt1,LamH,LamPhiH,vH,vPhi,ZH,dLamH,dLamPhiH,dvH,               & 
& dvPhi,dZH,ctcplhhHpcHp(gt1))

End Do 


ctcplAhhhVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingAhhhVP(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,dg1,dg2,dgX1,dZH,dZA,               & 
& dSinTW,dCosTW,dTanTW,ctcplAhhhVP(gt1,gt2))

 End Do 
End Do 


ctcplAhhhVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,dg1,dg2,dgX,             & 
& dg1X,dgX1,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZ(gt1,gt2))

 End Do 
End Do 


ctcplAhhhVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,dg1,dg2,dgX,            & 
& dg1X,dgX1,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZp(gt1,gt2))

 End Do 
End Do 


ctcplAhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingAhHpcVWp(gt1,g2,ZA,dg2,dZA,ctcplAhHpcVWp(gt1))

End Do 


ctcplAhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingAhcHpVWp(gt1,g2,ZA,dg2,dZA,ctcplAhcHpVWp(gt1))

End Do 


ctcplhhHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhHpcVWp(gt1,g2,ZH,dg2,dZH,ctcplhhHpcVWp(gt1))

End Do 


ctcplhhcHpVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhcHpVWp(gt1,g2,ZH,dg2,dZH,ctcplhhcHpVWp(gt1))

End Do 


ctcplHpcHpVP = 0._dp 
Call CT_CouplingHpcHpVP(g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplHpcHpVP)



ctcplHpcHpVZ = 0._dp 
Call CT_CouplingHpcHpVZ(g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,dTanTW,           & 
& dSinTWp,dCosTWp,dTanTWp,ctcplHpcHpVZ)



ctcplHpcHpVZp = 0._dp 
Call CT_CouplingHpcHpVZp(g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,dTanTW,          & 
& dSinTWp,dCosTWp,dTanTWp,ctcplHpcHpVZp)



ctcplhhVPVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVPVZ(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,dg2,dgX,            & 
& dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplhhVPVZ(gt1))

End Do 


ctcplhhVPVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVPVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,dg2,               & 
& dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& ctcplhhVPVZp(gt1))

End Do 


ctcplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhcVWpVWp(gt1,g2,vH,ZH,dg2,dvH,dZH,ctcplhhcVWpVWp(gt1))

End Do 


ctcplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVZVZ(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,dg2,dgX,            & 
& dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplhhVZVZ(gt1))

End Do 


ctcplhhVZVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVZVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,dg2,               & 
& dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& ctcplhhVZVZp(gt1))

End Do 


ctcplhhVZpVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVZpVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,dg2,              & 
& dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& ctcplhhVZpVZp(gt1))

End Do 


ctcplHpcVWpVP = 0._dp 
Call CT_CouplingHpcVWpVP(g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW,ctcplHpcVWpVP)



ctcplHpcVWpVZ = 0._dp 
Call CT_CouplingHpcVWpVZ(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,          & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpcVWpVZ)



ctcplHpcVWpVZp = 0._dp 
Call CT_CouplingHpcVWpVZp(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,         & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpcVWpVZp)



ctcplcHpVPVWp = 0._dp 
Call CT_CouplingcHpVPVWp(g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW,ctcplcHpVPVWp)



ctcplcHpVWpVZ = 0._dp 
Call CT_CouplingcHpVWpVZ(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,          & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpVWpVZ)



ctcplcHpVWpVZp = 0._dp 
Call CT_CouplingcHpVWpVZp(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,         & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpVWpVZp)



ctcplVGVGVG = 0._dp 
Call CT_CouplingVGVGVG(g3,dg3,ctcplVGVGVG)



ctcplcVWpVPVWp = 0._dp 
Call CT_CouplingcVWpVPVWp(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWpVPVWp)



ctcplcVWpVWpVZ = 0._dp 
Call CT_CouplingcVWpVWpVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,         & 
& dTanTWp,ctcplcVWpVWpVZ)



ctcplcVWpVWpVZp = 0._dp 
Call CT_CouplingcVWpVWpVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,        & 
& dTanTWp,ctcplcVWpVWpVZp)



ctcplcFdFdAhL = 0._dp 
ctcplcFdFdAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFdFdAh(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,dYdL,dYdR,dZA,dZDL,            & 
& dZDR,ctcplcFdFdAhL(gt1,gt2,gt3),ctcplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFeAhL = 0._dp 
ctcplcFeFeAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFeFeAh(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,dYeL,dYeR,dZA,dZEL,            & 
& dZER,ctcplcFeFeAhL(gt1,gt2,gt3),ctcplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuAhL = 0._dp 
ctcplcFuFuAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFuFuAh(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,dYuL,dYuR,dZA,dZUL,            & 
& dZUR,ctcplcFuFuAhL(gt1,gt2,gt3),ctcplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFvAhL = 0._dp 
ctcplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingFvFvAh(gt1,gt2,gt3,YvL,YvR,ZA,UV,dYvL,dYvR,dZA,dUV,ctcplFvFvAhL(gt1,gt2,gt3)& 
& ,ctcplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFdhhL = 0._dp 
ctcplcFdFdhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFdFdhh(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,dYdL,dYdR,dZH,dZDL,            & 
& dZDR,ctcplcFdFdhhL(gt1,gt2,gt3),ctcplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFdHpL = 0._dp 
ctcplcFuFdHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFdHp(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,dYuL,dYdL,dZDL,               & 
& dZDR,dZUL,dZUR,ctcplcFuFdHpL(gt1,gt2),ctcplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFeHpL = 0._dp 
ctcplFvFeHpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CT_CouplingFvFeHp(gt1,gt2,YvL,YeL,ZEL,ZER,UV,dYvL,dYeL,dZEL,dZER,dUV,            & 
& ctcplFvFeHpL(gt1,gt2),ctcplFvFeHpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFehhL = 0._dp 
ctcplcFeFehhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFeFehh(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,dYeL,dYeR,dZH,dZEL,            & 
& dZER,ctcplcFeFehhL(gt1,gt2,gt3),ctcplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuhhL = 0._dp 
ctcplcFuFuhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CT_CouplingcFuFuhh(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,dYuL,dYuR,dZH,dZUL,            & 
& dZUR,ctcplcFuFuhhL(gt1,gt2,gt3),ctcplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFucHpL = 0._dp 
ctcplcFdFucHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFucHp(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,dYuL,dYdL,dZDL,              & 
& dZDR,dZUL,dZUR,ctcplcFdFucHpL(gt1,gt2),ctcplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvhhL = 0._dp 
ctcplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingFvFvhh(gt1,gt2,gt3,YvL,YvR,ZH,UV,dYvL,dYvR,dZH,dUV,ctcplFvFvhhL(gt1,gt2,gt3)& 
& ,ctcplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFvcHpL = 0._dp 
ctcplcFeFvcHpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CT_CouplingcFeFvcHp(gt1,gt2,YvL,YeL,ZEL,ZER,UV,dYvL,dYeL,dZEL,dZER,              & 
& dUV,ctcplcFeFvcHpL(gt1,gt2),ctcplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVGL = 0._dp 
ctcplcFdFdVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,ctcplcFdFdVGL(gt1,gt2),ctcplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVPL = 0._dp 
ctcplcFdFdVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFdVP(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,dg1,dg2,dgX1,dZDL,               & 
& dZDR,dSinTW,dCosTW,dTanTW,ctcplcFdFdVPL(gt1,gt2),ctcplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFdVWpL = 0._dp 
ctcplcFuFdVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFdVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFuFdVWpL(gt1,gt2)     & 
& ,ctcplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZL = 0._dp 
ctcplcFdFdVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,dg1,dg2,              & 
& dgX,dg1X,dgX1,dZDL,dZDR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZL(gt1,gt2)& 
& ,ctcplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZpL = 0._dp 
ctcplcFdFdVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,dg1,dg2,             & 
& dgX,dg1X,dgX1,dZDL,dZDR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZpL(gt1,gt2)& 
& ,ctcplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFeVWpL = 0._dp 
ctcplFvFeVWpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 6
Call CT_CouplingFvFeVWp(gt1,gt2,g2,ZEL,UV,dg2,dZEL,dUV,ctcplFvFeVWpL(gt1,gt2)         & 
& ,ctcplFvFeVWpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVPL = 0._dp 
ctcplcFeFeVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFeFeVP(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,dg1,dg2,dgX1,dZEL,               & 
& dZER,dSinTW,dCosTW,dTanTW,ctcplcFeFeVPL(gt1,gt2),ctcplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZL = 0._dp 
ctcplcFeFeVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,dg1,dg2,              & 
& dgX,dg1X,dgX1,dZEL,dZER,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZL(gt1,gt2)& 
& ,ctcplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZpL = 0._dp 
ctcplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,dg1,dg2,             & 
& dgX,dg1X,dgX1,dZEL,dZER,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZpL(gt1,gt2)& 
& ,ctcplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVGL = 0._dp 
ctcplcFuFuVGR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,ctcplcFuFuVGL(gt1,gt2),ctcplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVPL = 0._dp 
ctcplcFuFuVPR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFuVP(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,dg1,dg2,dgX1,dZUL,               & 
& dZUR,dSinTW,dCosTW,dTanTW,ctcplcFuFuVPL(gt1,gt2),ctcplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZL = 0._dp 
ctcplcFuFuVZR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,dg1,dg2,              & 
& dgX,dg1X,dgX1,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZL(gt1,gt2)& 
& ,ctcplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZpL = 0._dp 
ctcplcFuFuVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,dg1,dg2,             & 
& dgX,dg1X,dgX1,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZpL(gt1,gt2)& 
& ,ctcplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFucVWpL = 0._dp 
ctcplcFdFucVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingcFdFucVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFdFucVWpL(gt1,gt2)   & 
& ,ctcplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVPL = 0._dp 
ctcplFvFvVPR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingFvFvVP(gt1,gt2,g1,g2,gX1,UV,TW,dg1,dg2,dgX1,dUV,dSinTW,               & 
& dCosTW,dTanTW,ctcplFvFvVPL(gt1,gt2),ctcplFvFvVPR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZL = 0._dp 
ctcplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingFvFvVZ(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,dg1,dg2,dgX,dg1X,           & 
& dgX1,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplFvFvVZL(gt1,gt2)            & 
& ,ctcplFvFvVZR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZpL = 0._dp 
ctcplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingFvFvVZp(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,dg1,dg2,dgX,               & 
& dg1X,dgX1,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplFvFvVZpL(gt1,gt2)      & 
& ,ctcplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFvcVWpL = 0._dp 
ctcplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 9
Call CT_CouplingcFeFvcVWp(gt1,gt2,g2,ZEL,UV,dg2,dZEL,dUV,ctcplcFeFvcVWpL(gt1,gt2)     & 
& ,ctcplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CalculateCouplingCT

Subroutine CT_CouplingAhAhhh(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,              & 
& ZA,dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),ZA(2,2),dLamH,dLamPhiH,dLamPhi,dvH,               & 
& dvPhi,dZH(2,2),dZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhhh' 
 
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
res = res-2*LamH*vH*dZH(gt3,1)*ZA(gt1,1)*ZA(gt2,1)
res = res-(LamPhiH*vPhi*dZH(gt3,2)*ZA(gt1,1)*ZA(gt2,1))
res = res-(LamPhiH*vH*dZH(gt3,1)*ZA(gt1,2)*ZA(gt2,2))
res = res-2*LamPhi*vPhi*dZH(gt3,2)*ZA(gt1,2)*ZA(gt2,2)
res = res-2*LamH*vH*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,1)
res = res-(LamPhiH*vH*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,1))
res = res-2*LamH*vH*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-2*dvH*LamH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-2*dLamH*vH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vH*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(dvH*LamPhiH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(dLamPhiH*vH*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*dZA(gt2,1)*ZA(gt1,1)*ZH(gt3,2))
res = res-2*LamPhi*vPhi*dZA(gt2,2)*ZA(gt1,2)*ZH(gt3,2)
res = res-(LamPhiH*vPhi*dZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(dvPhi*LamPhiH*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-(dLamPhiH*vPhi*ZA(gt1,1)*ZA(gt2,1)*ZH(gt3,2))
res = res-2*LamPhi*vPhi*dZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
res = res-2*dvPhi*LamPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
res = res-2*dLamPhi*vPhi*ZA(gt1,2)*ZA(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhhh  
 
 
Subroutine CT_Couplinghhhhhh(gt1,gt2,gt3,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,              & 
& dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: LamH,LamPhiH,LamPhi,vH,vPhi,ZH(2,2),dLamH,dLamPhiH,dLamPhi,dvH,dvPhi,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_Couplinghhhhhh' 
 
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
res = res-6*LamH*vH*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1)
res = res-(LamPhiH*vPhi*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))
res = res-(LamPhiH*vPhi*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))
res = res-(LamPhiH*vH*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))
res = res-(LamPhiH*vPhi*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))
res = res-(LamPhiH*vH*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))
res = res-(LamPhiH*vH*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))
res = res-6*LamPhi*vPhi*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2)
res = res-6*LamH*vH*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1)
res = res-(LamPhiH*vPhi*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))
res = res-(LamPhiH*vH*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))
res = res-6*LamH*vH*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-(LamPhiH*vPhi*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-6*dvH*LamH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-6*dLamH*vH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res-(dvPhi*LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dLamPhiH*vPhi*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vH*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvPhi*LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dLamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvH*LamPhiH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dLamPhiH*vH*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(LamPhiH*vPhi*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))
res = res-6*LamPhi*vPhi*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2)
res = res-(LamPhiH*vPhi*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvPhi*LamPhiH*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dLamPhiH*vPhi*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvH*LamPhiH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dLamPhiH*vH*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(LamPhiH*vH*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-6*LamPhi*vPhi*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res-(dvH*LamPhiH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dLamPhiH*vH*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-6*dvPhi*LamPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res-6*dLamPhi*vPhi*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_Couplinghhhhhh  
 
 
Subroutine CT_CouplinghhHpcHp(gt1,LamH,LamPhiH,vH,vPhi,ZH,dLamH,dLamPhiH,             & 
& dvH,dvPhi,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: LamH,LamPhiH,vH,vPhi,ZH(2,2),dLamH,dLamPhiH,dvH,dvPhi,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*LamH*vH*dZH(gt1,1)
res = res-(LamPhiH*vPhi*dZH(gt1,2))
res = res-2*dvH*LamH*ZH(gt1,1)
res = res-2*dLamH*vH*ZH(gt1,1)
res = res-(dvPhi*LamPhiH*ZH(gt1,2))
res = res-(dLamPhiH*vPhi*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpcHp  
 
 
Subroutine CT_CouplingAhhhVP(gt1,gt2,g1,g2,gX1,ZH,ZA,TW,dg1,dg2,dgX1,dZH,             & 
& dZA,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,ZH(2,2),ZA(2,2),TW,dg1,dg2,dgX1,dZH(2,2),dZA(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVP' 
 
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
res = res-1._dp/2._dp*(g1*Cos(TW)*dZH(gt2,1)*ZA(gt1,1))
res = res+(g2*dZH(gt2,1)*Sin(TW)*ZA(gt1,1))/2._dp
res = res-(gX1*Cos(TW)*dZH(gt2,2)*ZA(gt1,2))
res = res-1._dp/2._dp*(g1*Cos(TW)*dZA(gt1,1)*ZH(gt2,1))
res = res+(g2*dZA(gt1,1)*Sin(TW)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(dCosTW*g1*ZA(gt1,1)*ZH(gt2,1))
res = res+(dSinTW*g2*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(dg1*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))
res = res+(dg2*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-(gX1*Cos(TW)*dZA(gt1,2)*ZH(gt2,2))
res = res-(dCosTW*gX1*ZA(gt1,2)*ZH(gt2,2))
res = res-(dgX1*Cos(TW)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVP  
 
 
Subroutine CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,dg1,               & 
& dg2,dgX,dg1X,dgX1,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dZH(2,2),               & 
& dZA(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZ' 
 
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
res = res+(g2*Cos(TW)*Cos(TWp)*dZH(gt2,1)*ZA(gt1,1))/2._dp
res = res+(g1*Cos(TWp)*dZH(gt2,1)*Sin(TW)*ZA(gt1,1))/2._dp
res = res-1._dp/2._dp*(g1X*dZH(gt2,1)*Sin(TWp)*ZA(gt1,1))
res = res+gX1*Cos(TWp)*dZH(gt2,2)*Sin(TW)*ZA(gt1,2)
res = res-(gX*dZH(gt2,2)*Sin(TWp)*ZA(gt1,2))
res = res+(g2*Cos(TW)*Cos(TWp)*dZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g1*Cos(TWp)*dZA(gt1,1)*Sin(TW)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(g1X*dZA(gt1,1)*Sin(TWp)*ZH(gt2,1))
res = res-1._dp/2._dp*(dSinTWp*g1X*ZA(gt1,1)*ZH(gt2,1))
res = res+(dCosTWp*g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dCosTW*g2*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dg2*Cos(TW)*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))/2._dp
res = res-1._dp/2._dp*(dg1X*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res+gX1*Cos(TWp)*dZA(gt1,2)*Sin(TW)*ZH(gt2,2)
res = res-(gX*dZA(gt1,2)*Sin(TWp)*ZH(gt2,2))
res = res-(dSinTWp*gX*ZA(gt1,2)*ZH(gt2,2))
res = res+dSinTW*gX1*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2)
res = res+dCosTWp*gX1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res+dgX1*Cos(TWp)*Sin(TW)*ZA(gt1,2)*ZH(gt2,2)
res = res-(dgX*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZ  
 
 
Subroutine CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZH,ZA,TW,TWp,dg1,              & 
& dg2,dgX,dg1X,dgX1,dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,ZH(2,2),ZA(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dZH(2,2),               & 
& dZA(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZp' 
 
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
res = res-1._dp/2._dp*(g1X*Cos(TWp)*dZH(gt2,1)*ZA(gt1,1))
res = res-1._dp/2._dp*(g2*Cos(TW)*dZH(gt2,1)*Sin(TWp)*ZA(gt1,1))
res = res-1._dp/2._dp*(g1*dZH(gt2,1)*Sin(TW)*Sin(TWp)*ZA(gt1,1))
res = res-(gX*Cos(TWp)*dZH(gt2,2)*ZA(gt1,2))
res = res-(gX1*dZH(gt2,2)*Sin(TW)*Sin(TWp)*ZA(gt1,2))
res = res-1._dp/2._dp*(g1X*Cos(TWp)*dZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(g2*Cos(TW)*dZA(gt1,1)*Sin(TWp)*ZH(gt2,1))
res = res-1._dp/2._dp*(g1*dZA(gt1,1)*Sin(TW)*Sin(TWp)*ZH(gt2,1))
res = res-1._dp/2._dp*(dCosTWp*g1X*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dSinTWp*g2*Cos(TW)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dg1X*Cos(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dSinTWp*g1*Sin(TW)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dSinTW*g1*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dCosTW*g2*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dg2*Cos(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-1._dp/2._dp*(dg1*Sin(TW)*Sin(TWp)*ZA(gt1,1)*ZH(gt2,1))
res = res-(gX*Cos(TWp)*dZA(gt1,2)*ZH(gt2,2))
res = res-(gX1*dZA(gt1,2)*Sin(TW)*Sin(TWp)*ZH(gt2,2))
res = res-(dCosTWp*gX*ZA(gt1,2)*ZH(gt2,2))
res = res-(dgX*Cos(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = res-(dSinTWp*gX1*Sin(TW)*ZA(gt1,2)*ZH(gt2,2))
res = res-(dSinTW*gX1*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = res-(dgX1*Sin(TW)*Sin(TWp)*ZA(gt1,2)*ZH(gt2,2))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZp  
 
 
Subroutine CT_CouplingAhHpcVWp(gt1,g2,ZA,dg2,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2),dg2,dZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*dZA(gt1,1))
res = res-1._dp/2._dp*(dg2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpcVWp  
 
 
Subroutine CT_CouplingAhcHpVWp(gt1,g2,ZA,dg2,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZA(2,2),dg2,dZA(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*dZA(gt1,1))
res = res-1._dp/2._dp*(dg2*ZA(gt1,1))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhcHpVWp  
 
 
Subroutine CT_CouplinghhHpcVWp(gt1,g2,ZH,dg2,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2),dg2,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g2*dZH(gt1,1))
res = res-1._dp/2._dp*(dg2*ZH(gt1,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpcVWp  
 
 
Subroutine CT_CouplinghhcHpVWp(gt1,g2,ZH,dg2,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2),dg2,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*dZH(gt1,1))/2._dp
res = res+(dg2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcHpVWp  
 
 
Subroutine CT_CouplingHpcHpVP(g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(dCosTW*g1)/2._dp
res = res+(dSinTW*g2)/2._dp
res = res+(dg1*Cos(TW))/2._dp
res = res+(dg2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcHpVP  
 
 
Subroutine CT_CouplingHpcHpVZ(g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,            & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(dSinTWp*g1X)/2._dp
res = res+(dCosTWp*g2*Cos(TW))/2._dp
res = res-1._dp/2._dp*(dSinTW*g1*Cos(TWp))
res = res+(dCosTW*g2*Cos(TWp))/2._dp
res = res+(dg2*Cos(TW)*Cos(TWp))/2._dp
res = res-1._dp/2._dp*(dCosTWp*g1*Sin(TW))
res = res-1._dp/2._dp*(dg1*Cos(TWp)*Sin(TW))
res = res+(dg1X*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcHpVZ  
 
 
Subroutine CT_CouplingHpcHpVZp(g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,TW,TWp,dg1,dg2,dg1X,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcHpVZp' 
 
res = 0._dp 
res = res+(dCosTWp*g1X)/2._dp
res = res-1._dp/2._dp*(dSinTWp*g2*Cos(TW))
res = res+(dg1X*Cos(TWp))/2._dp
res = res+(dSinTWp*g1*Sin(TW))/2._dp
res = res+(dSinTW*g1*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(dCosTW*g2*Sin(TWp))
res = res-1._dp/2._dp*(dg2*Cos(TW)*Sin(TWp))
res = res+(dg1*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcHpVZp  
 
 
Subroutine CT_CouplinghhVPVZ(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,              & 
& dg2,dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dvH,dvPhi,              & 
& dZH(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)**2*Cos(TWp)*dZH(gt1,1))
res = res-1._dp/2._dp*(g1**2*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW))
res = res+(g2**2*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW))/2._dp
res = res-2*gX1**2*vPhi*Cos(TW)*Cos(TWp)*dZH(gt1,2)*Sin(TW)
res = res+(g1*g2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2)/2._dp
res = res+(g1*g1X*vH*Cos(TW)*dZH(gt1,1)*Sin(TWp))/2._dp
res = res+2*gX*gX1*vPhi*Cos(TW)*dZH(gt1,2)*Sin(TWp)
res = res-1._dp/2._dp*(g1X*g2*vH*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res+(dSinTWp*g1*g1X*vH*Cos(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dCosTWp*g1*g2*vH*Cos(TW)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dSinTW*g1**2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res-(dCosTW*g1*g2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res+(dSinTW*g2**2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dvH*g1*g2*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dSinTWp*g1X*g2*vH*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTWp*g1**2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))
res = res+(dCosTWp*g2**2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dCosTW*g1**2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+dSinTW*g1*g2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dCosTW*g2**2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dvH*g1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dg1*g1*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+dg2*g2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dCosTWp*g1*g2*vH*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dvH*g1*g2*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1*g1X*vH*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dSinTW*g1X*g2*vH*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1*g1X*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1X*g1*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*g1X*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dvH*g1X*g2*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1X*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1X*g2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+2*dSinTWp*gX*gX1*vPhi*Cos(TW)*ZH(gt1,2)
res = res-2*dSinTW*gX1**2*vPhi*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res-2*dCosTWp*gX1**2*vPhi*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res-2*dCosTW*gX1**2*vPhi*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res-2*dvPhi*gX1**2*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res-4*dgX1*gX1*vPhi*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+2*dCosTW*gX*gX1*vPhi*Sin(TWp)*ZH(gt1,2)
res = res+2*dvPhi*gX*gX1*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*dgX1*gX*vPhi*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*dgX*gX1*vPhi*Cos(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVPVZ  
 
 
Subroutine CT_CouplinghhVPVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,             & 
& dg2,dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dvH,dvPhi,              & 
& dZH(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVPVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g1X*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1))/2._dp
res = res+2*gX*gX1*vPhi*Cos(TW)*Cos(TWp)*dZH(gt1,2)
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW))
res = res+(g1*g2*vH*Cos(TW)**2*dZH(gt1,1)*Sin(TWp))/2._dp
res = res+(g1**2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res-1._dp/2._dp*(g2**2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res+2*gX1**2*vPhi*Cos(TW)*dZH(gt1,2)*Sin(TW)*Sin(TWp)
res = res-1._dp/2._dp*(g1*g2*vH*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))
res = res+(dCosTWp*g1*g1X*vH*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dSinTWp*g1*g2*vH*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1*g1X*vH*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dSinTW*g1X*g2*vH*Cos(TWp)*ZH(gt1,1))
res = res+(dvH*g1*g1X*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1X*g1*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*g1X*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dCosTWp*g1X*g2*vH*Sin(TW)*ZH(gt1,1))
res = res+(dSinTWp*g1**2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dSinTWp*g2**2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dvH*g1X*g2*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1X*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1X*g2*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dSinTWp*g1*g2*vH*Sin(TW)**2*ZH(gt1,1))
res = res+(dSinTW*g1**2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+dCosTW*g1*g2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res-1._dp/2._dp*(dSinTW*g2**2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1*g2*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1**2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTW*g2**2*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dvH*g2**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+dg1*g1*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dg2*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dvH*g1*g2*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+2*dCosTWp*gX*gX1*vPhi*Cos(TW)*ZH(gt1,2)
res = res+2*dCosTW*gX*gX1*vPhi*Cos(TWp)*ZH(gt1,2)
res = res+2*dvPhi*gX*gX1*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+2*dgX1*gX*vPhi*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+2*dgX*gX1*vPhi*Cos(TW)*Cos(TWp)*ZH(gt1,2)
res = res+2*dSinTWp*gX1**2*vPhi*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+2*dSinTW*gX1**2*vPhi*Cos(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*dCosTW*gX1**2*vPhi*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+2*dvPhi*gX1**2*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+4*dgX1*gX1*vPhi*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVPVZp  
 
 
Subroutine CT_CouplinghhcVWpVWp(gt1,g2,vH,ZH,dg2,dvH,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vH,ZH(2,2),dg2,dvH,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vH*dZH(gt1,1))/2._dp
res = res+(dvH*g2**2*ZH(gt1,1))/2._dp
res = res+dg2*g2*vH*ZH(gt1,1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcVWpVWp  
 
 
Subroutine CT_CouplinghhVZVZ(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,              & 
& dg2,dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dvH,dvPhi,              & 
& dZH(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vH*dZH(gt1,1))/8._dp
res = res+(g1X**2*vH*dZH(gt1,1))/4._dp
res = res+(g2**2*vH*dZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(g1**2*vH*Cos(TW)**2*dZH(gt1,1))
res = res+(g2**2*vH*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res+(g1**2*vH*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(g1X**2*vH*Cos(TWp)**2*dZH(gt1,1))
res = res+(g2**2*vH*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(g1**2*vH*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))
res = res+(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res+gX**2*vPhi*dZH(gt1,2)
res = res+(gX1**2*vPhi*dZH(gt1,2))/2._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TW)**2*dZH(gt1,2))
res = res-(gX**2*vPhi*Cos(TWp)**2*dZH(gt1,2))
res = res+(gX1**2*vPhi*Cos(TWp)**2*dZH(gt1,2))/2._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))
res = res+(g1*g2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g1*g2*vH*Cos(TW)*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))/2._dp
res = res+(g1**2*vH*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-1._dp/8._dp*(g2**2*vH*dZH(gt1,1)*Sin(TW)**2)
res = res+(g1**2*vH*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-1._dp/8._dp*(g2**2*vH*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)
res = res+(gX1**2*vPhi*dZH(gt1,2)*Sin(TW)**2)/2._dp
res = res+(gX1**2*vPhi*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)/2._dp
res = res-(g1X*g2*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TWp))
res = res-(g1*g1X*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res-4*gX*gX1*vPhi*Cos(TWp)*dZH(gt1,2)*Sin(TW)*Sin(TWp)
res = res-1._dp/8._dp*(g1**2*vH*dZH(gt1,1)*Sin(TWp)**2)
res = res+(g1X**2*vH*dZH(gt1,1)*Sin(TWp)**2)/4._dp
res = res-1._dp/8._dp*(g2**2*vH*dZH(gt1,1)*Sin(TWp)**2)
res = res+(g1**2*vH*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-1._dp/8._dp*(g2**2*vH*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)
res = res+gX**2*vPhi*dZH(gt1,2)*Sin(TWp)**2
res = res-1._dp/2._dp*(gX1**2*vPhi*dZH(gt1,2)*Sin(TWp)**2)
res = res+(gX1**2*vPhi*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)/2._dp
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)
res = res-1._dp/8._dp*(g1**2*vH*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)
res = res+(g2**2*vH*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)
res = res+(dvH*g1**2*ZH(gt1,1))/8._dp
res = res+(dvH*g1X**2*ZH(gt1,1))/4._dp
res = res+(dvH*g2**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vH*ZH(gt1,1))/4._dp
res = res+(dg1X*g1X*vH*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vH*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTW*g1**2*vH*Cos(TW)*ZH(gt1,1))
res = res+(dSinTW*g1*g2*vH*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vH*Cos(TW)*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TW)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TW)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dCosTWp*g1**2*vH*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dCosTWp*g1X**2*vH*Cos(TWp)*ZH(gt1,1))
res = res+(dCosTWp*g2**2*vH*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-(dSinTWp*g1X*g2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/4._dp*(dCosTWp*g1**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res+(dCosTWp*g2**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res+(dvH*g1**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dvH*g1X**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vH*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dg1X*g1X*vH*Cos(TWp)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTW*g1**2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res+(dSinTW*g1*g2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1**2*vH*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vH*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTW*g2**2*vH*Sin(TW)*ZH(gt1,1))
res = res+(dvH*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res-(dSinTWp*g1*g1X*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res+dCosTWp*g1*g2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res+(dSinTW*g1**2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTW*g2**2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res+(dvH*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dvH*g1**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Sin(TW)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Sin(TW)**2*ZH(gt1,1))
res = res+(dCosTWp*g1**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTWp*g2**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))
res = res+(dvH*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dSinTWp*g1**2*vH*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1X**2*vH*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTWp*g2**2*vH*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1X*g2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dSinTWp*g2**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res-(dSinTW*g1*g1X*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTW*g1X*g2*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dvH*g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dg2*g1X*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1*g1X*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dSinTWp*g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dvH*g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1X*g1*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/4._dp*(dSinTWp*g1**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g2**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g1X**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g2**2*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dg1*g1*vH*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg1X*g1X*vH*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Sin(TWp)**2*ZH(gt1,1))
res = res+(dCosTW*g1**2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dSinTW*g1*g2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dCosTW*g2**2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dSinTW*g1**2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTW*g1*g2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res+(dSinTW*g2**2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dvH*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res-1._dp/8._dp*(dvH*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+dvPhi*gX**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*ZH(gt1,2))/2._dp
res = res+2*dgX*gX*vPhi*ZH(gt1,2)
res = res+dgX1*gX1*vPhi*ZH(gt1,2)
res = res-(dCosTW*gX1**2*vPhi*Cos(TW)*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TW)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Cos(TW)**2*ZH(gt1,2))
res = res-2*dCosTWp*gX**2*vPhi*Cos(TWp)*ZH(gt1,2)
res = res+dCosTWp*gX1**2*vPhi*Cos(TWp)*ZH(gt1,2)
res = res-(dCosTWp*gX1**2*vPhi*Cos(TW)**2*Cos(TWp)*ZH(gt1,2))
res = res-(dvPhi*gX**2*Cos(TWp)**2*ZH(gt1,2))
res = res+(dvPhi*gX1**2*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res-2*dgX*gX*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res+dgX1*gX1*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res-(dCosTW*gX1**2*vPhi*Cos(TW)*Cos(TWp)**2*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))
res = res+dSinTW*gX1**2*vPhi*Sin(TW)*ZH(gt1,2)
res = res-4*dSinTWp*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res+dSinTW*gX1**2*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res+(dvPhi*gX1**2*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Sin(TW)**2*ZH(gt1,2)
res = res+dCosTWp*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2)
res = res+2*dSinTWp*gX**2*vPhi*Sin(TWp)*ZH(gt1,2)
res = res-(dSinTWp*gX1**2*vPhi*Sin(TWp)*ZH(gt1,2))
res = res+dSinTWp*gX1**2*vPhi*Cos(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res-4*dSinTW*gX*gX1*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-4*dCosTWp*gX*gX1*vPhi*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-4*dvPhi*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-4*dgX1*gX*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-4*dgX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dSinTWp*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))
res = res+dvPhi*gX**2*Sin(TWp)**2*ZH(gt1,2)
res = res-1._dp/2._dp*(dvPhi*gX1**2*Sin(TWp)**2*ZH(gt1,2))
res = res+2*dgX*gX*vPhi*Sin(TWp)**2*ZH(gt1,2)
res = res-(dgX1*gX1*vPhi*Sin(TWp)**2*ZH(gt1,2))
res = res+dCosTW*gX1**2*vPhi*Cos(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2)
res = res-(dSinTW*gX1**2*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZ  
 
 
Subroutine CT_CouplinghhVZVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,             & 
& dg2,dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dvH,dvPhi,              & 
& dZH(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-1._dp/2._dp*(g1X*g2*vH*Cos(TW)*Cos(TWp)**2*dZH(gt1,1))
res = res-1._dp/2._dp*(g1*g1X*vH*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))
res = res-2*gX*gX1*vPhi*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)
res = res-1._dp/4._dp*(g1**2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TWp))
res = res+(g1X**2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/2._dp
res = res-1._dp/4._dp*(g2**2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TWp))
res = res+(g1**2*vH*Cos(TW)**2*Cos(TWp)*dZH(gt1,1)*Sin(TWp))/4._dp
res = res-1._dp/4._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)*dZH(gt1,1)*Sin(TWp))
res = res+2*gX**2*vPhi*Cos(TWp)*dZH(gt1,2)*Sin(TWp)
res = res-(gX1**2*vPhi*Cos(TWp)*dZH(gt1,2)*Sin(TWp))
res = res+gX1**2*vPhi*Cos(TW)**2*Cos(TWp)*dZH(gt1,2)*Sin(TWp)
res = res-(g1*g2*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp))
res = res-1._dp/4._dp*(g1**2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))
res = res+(g2**2*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(gX1**2*vPhi*Cos(TWp)*dZH(gt1,2)*Sin(TW)**2*Sin(TWp))
res = res+(g1X*g2*vH*Cos(TW)*dZH(gt1,1)*Sin(TWp)**2)/2._dp
res = res+(g1*g1X*vH*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+2*gX*gX1*vPhi*dZH(gt1,2)*Sin(TW)*Sin(TWp)**2
res = res-1._dp/4._dp*(dSinTWp*g1**2*vH*Cos(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1X**2*vH*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTWp*g2**2*vH*Cos(TWp)*ZH(gt1,1))
res = res-(dCosTWp*g1X*g2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g1**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dSinTWp*g2**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dSinTW*g1*g1X*vH*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTW*g1X*g2*vH*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dvH*g1X*g2*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1X*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1X*g2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-(dCosTWp*g1*g1X*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-(dSinTWp*g1*g2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dvH*g1*g1X*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1X*g1*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g1X*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/4._dp*(dSinTWp*g1**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))
res = res+(dSinTWp*g2**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTWp*g1**2*vH*Sin(TWp)*ZH(gt1,1))
res = res+(dCosTWp*g1X**2*vH*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dCosTWp*g2**2*vH*Sin(TWp)*ZH(gt1,1))
res = res+dSinTWp*g1X*g2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(dCosTWp*g1**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTWp*g2**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/4._dp*(dvH*g1**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1X**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dvH*g2**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g1*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+dg1X*g1X*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res-1._dp/2._dp*(dg2*g2*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+(dCosTW*g1**2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTW*g2**2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dvH*g2**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+(dg1*g1*vH*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/2._dp*(dg2*g2*vH*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,1))
res = res+dSinTWp*g1*g1X*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res-(dCosTWp*g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/2._dp*(dSinTW*g1**2*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dCosTW*g1*g2*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTW*g2**2*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))/2._dp
res = res-(dvH*g1*g2*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg2*g1*vH*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-(dg1*g2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1))
res = res-1._dp/4._dp*(dCosTWp*g1**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dCosTWp*g2**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dvH*g1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dg1*g1*vH*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/2._dp
res = res+(dSinTW*g1*g1X*vH*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g1X*g2*vH*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvH*g1X*g2*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g1X*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1X*g2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvH*g1*g1X*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1X*g1*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1*g1X*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+2*dSinTWp*gX**2*vPhi*Cos(TWp)*ZH(gt1,2)
res = res-(dSinTWp*gX1**2*vPhi*Cos(TWp)*ZH(gt1,2))
res = res+dSinTWp*gX1**2*vPhi*Cos(TW)**2*Cos(TWp)*ZH(gt1,2)
res = res-2*dSinTW*gX*gX1*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res-4*dCosTWp*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res-2*dvPhi*gX*gX1*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res-2*dgX1*gX*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res-2*dgX*gX1*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2)
res = res-(dSinTWp*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))
res = res+2*dCosTWp*gX**2*vPhi*Sin(TWp)*ZH(gt1,2)
res = res-(dCosTWp*gX1**2*vPhi*Sin(TWp)*ZH(gt1,2))
res = res+dCosTWp*gX1**2*vPhi*Cos(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res+2*dvPhi*gX**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-(dvPhi*gX1**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2))
res = res+4*dgX*gX*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res-2*dgX1*gX1*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+2*dCosTW*gX1**2*vPhi*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+dvPhi*gX1**2*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+2*dgX1*gX1*vPhi*Cos(TW)**2*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+4*dSinTWp*gX*gX1*vPhi*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-2*dSinTW*gX1**2*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res-(dCosTWp*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))
res = res-(dvPhi*gX1**2*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2))
res = res-2*dgX1*gX1*vPhi*Cos(TWp)*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res+2*dSinTW*gX*gX1*vPhi*Sin(TWp)**2*ZH(gt1,2)
res = res+2*dvPhi*gX*gX1*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+2*dgX1*gX*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+2*dgX*gX1*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZp  
 
 
Subroutine CT_CouplinghhVZpVZp(gt1,g1,g2,gX,g1X,gX1,vH,vPhi,ZH,TW,TWp,dg1,            & 
& dg2,dgX,dg1X,dgX1,dvH,dvPhi,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi,ZH(2,2),TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dvH,dvPhi,              & 
& dZH(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vH*dZH(gt1,1))/8._dp
res = res+(g1X**2*vH*dZH(gt1,1))/4._dp
res = res+(g2**2*vH*dZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(g1**2*vH*Cos(TW)**2*dZH(gt1,1))
res = res+(g2**2*vH*Cos(TW)**2*dZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(g1**2*vH*Cos(TWp)**2*dZH(gt1,1))
res = res+(g1X**2*vH*Cos(TWp)**2*dZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(g2**2*vH*Cos(TWp)**2*dZH(gt1,1))
res = res+(g1**2*vH*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(g2**2*vH*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,1))
res = res+gX**2*vPhi*dZH(gt1,2)
res = res+(gX1**2*vPhi*dZH(gt1,2))/2._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TW)**2*dZH(gt1,2))
res = res+gX**2*vPhi*Cos(TWp)**2*dZH(gt1,2)
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TWp)**2*dZH(gt1,2))
res = res+(gX1**2*vPhi*Cos(TW)**2*Cos(TWp)**2*dZH(gt1,2))/2._dp
res = res+(g1*g2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW))/2._dp
res = res-1._dp/2._dp*(g1*g2*vH*Cos(TW)*Cos(TWp)**2*dZH(gt1,1)*Sin(TW))
res = res+(g1**2*vH*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res-1._dp/8._dp*(g2**2*vH*dZH(gt1,1)*Sin(TW)**2)
res = res-1._dp/8._dp*(g1**2*vH*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)
res = res+(g2**2*vH*Cos(TWp)**2*dZH(gt1,1)*Sin(TW)**2)/8._dp
res = res+(gX1**2*vPhi*dZH(gt1,2)*Sin(TW)**2)/2._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TWp)**2*dZH(gt1,2)*Sin(TW)**2)
res = res+g1X*g2*vH*Cos(TW)*Cos(TWp)*dZH(gt1,1)*Sin(TWp)
res = res+g1*g1X*vH*Cos(TWp)*dZH(gt1,1)*Sin(TW)*Sin(TWp)
res = res+4*gX*gX1*vPhi*Cos(TWp)*dZH(gt1,2)*Sin(TW)*Sin(TWp)
res = res+(g1**2*vH*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-1._dp/4._dp*(g1X**2*vH*dZH(gt1,1)*Sin(TWp)**2)
res = res+(g2**2*vH*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-1._dp/8._dp*(g1**2*vH*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)
res = res+(g2**2*vH*Cos(TW)**2*dZH(gt1,1)*Sin(TWp)**2)/8._dp
res = res-(gX**2*vPhi*dZH(gt1,2)*Sin(TWp)**2)
res = res+(gX1**2*vPhi*dZH(gt1,2)*Sin(TWp)**2)/2._dp
res = res-1._dp/2._dp*(gX1**2*vPhi*Cos(TW)**2*dZH(gt1,2)*Sin(TWp)**2)
res = res+(g1*g2*vH*Cos(TW)*dZH(gt1,1)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1**2*vH*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-1._dp/8._dp*(g2**2*vH*dZH(gt1,1)*Sin(TW)**2*Sin(TWp)**2)
res = res+(gX1**2*vPhi*dZH(gt1,2)*Sin(TW)**2*Sin(TWp)**2)/2._dp
res = res+(dvH*g1**2*ZH(gt1,1))/8._dp
res = res+(dvH*g1X**2*ZH(gt1,1))/4._dp
res = res+(dvH*g2**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vH*ZH(gt1,1))/4._dp
res = res+(dg1X*g1X*vH*ZH(gt1,1))/2._dp
res = res+(dg2*g2*vH*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTW*g1**2*vH*Cos(TW)*ZH(gt1,1))
res = res+(dSinTW*g1*g2*vH*Cos(TW)*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vH*Cos(TW)*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TW)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TW)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTWp*g1**2*vH*Cos(TWp)*ZH(gt1,1))
res = res+(dCosTWp*g1X**2*vH*Cos(TWp)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dCosTWp*g2**2*vH*Cos(TWp)*ZH(gt1,1))
res = res+dSinTWp*g1X*g2*vH*Cos(TW)*Cos(TWp)*ZH(gt1,1)
res = res+(dCosTWp*g1**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTWp*g2**2*vH*Cos(TW)**2*Cos(TWp)*ZH(gt1,1))
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dvH*g1X**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g2**2*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TWp)**2*ZH(gt1,1))
res = res+(dg1X*g1X*vH*Cos(TWp)**2*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Cos(TWp)**2*ZH(gt1,1))
res = res+(dCosTW*g1**2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dSinTW*g1*g2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dCosTW*g2**2*vH*Cos(TW)*Cos(TWp)**2*ZH(gt1,1))
res = res+(dvH*g1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,1))
res = res+(dSinTW*g1**2*vH*Sin(TW)*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vH*Sin(TW)*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTW*g2**2*vH*Sin(TW)*ZH(gt1,1))
res = res+(dvH*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TW)*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dSinTWp*g1*g1X*vH*Cos(TWp)*Sin(TW)*ZH(gt1,1)
res = res-(dCosTWp*g1*g2*vH*Cos(TW)*Cos(TWp)*Sin(TW)*ZH(gt1,1))
res = res-1._dp/4._dp*(dSinTW*g1**2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dCosTW*g1*g2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res+(dSinTW*g2**2*vH*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dvH*g1*g2*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg2*g1*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res-1._dp/2._dp*(dg1*g2*vH*Cos(TW)*Cos(TWp)**2*Sin(TW)*ZH(gt1,1))
res = res+(dvH*g1**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Sin(TW)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Sin(TW)**2*ZH(gt1,1))
res = res-1._dp/4._dp*(dCosTWp*g1**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))
res = res+(dCosTWp*g2**2*vH*Cos(TWp)*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dSinTWp*g1**2*vH*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dSinTWp*g1X**2*vH*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g2**2*vH*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+dCosTWp*g1X*g2*vH*Cos(TW)*Sin(TWp)*ZH(gt1,1)
res = res-1._dp/4._dp*(dSinTWp*g1**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dSinTWp*g2**2*vH*Cos(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res+dSinTW*g1*g1X*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dCosTW*g1X*g2*vH*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dvH*g1X*g2*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dg2*g1X*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dg1X*g2*vH*Cos(TW)*Cos(TWp)*Sin(TWp)*ZH(gt1,1)
res = res+dCosTWp*g1*g1X*vH*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dSinTWp*g1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dvH*g1*g1X*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dg1X*g1*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+dg1*g1X*vH*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,1)
res = res+(dSinTWp*g1**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dSinTWp*g2**2*vH*Sin(TW)**2*Sin(TWp)*ZH(gt1,1))
res = res+(dvH*g1**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dvH*g1X**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res+(dg1*g1*vH*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/2._dp*(dg1X*g1X*vH*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dCosTW*g1**2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res+(dSinTW*g1*g2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dCosTW*g2**2*vH*Cos(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/8._dp*(dvH*g1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g2**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/4._dp*(dg1*g1*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg2*g2*vH*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dSinTW*g1**2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res+(dCosTW*g1*g2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res-1._dp/4._dp*(dSinTW*g2**2*vH*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))
res = res+(dvH*g1*g2*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g1*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dg1*g2*vH*Cos(TW)*Sin(TW)*Sin(TWp)**2*ZH(gt1,1))/2._dp
res = res+(dvH*g1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/8._dp
res = res-1._dp/8._dp*(dvH*g2**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+(dg1*g1*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))/4._dp
res = res-1._dp/4._dp*(dg2*g2*vH*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,1))
res = res+dvPhi*gX**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*ZH(gt1,2))/2._dp
res = res+2*dgX*gX*vPhi*ZH(gt1,2)
res = res+dgX1*gX1*vPhi*ZH(gt1,2)
res = res-(dCosTW*gX1**2*vPhi*Cos(TW)*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TW)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Cos(TW)**2*ZH(gt1,2))
res = res+2*dCosTWp*gX**2*vPhi*Cos(TWp)*ZH(gt1,2)
res = res-(dCosTWp*gX1**2*vPhi*Cos(TWp)*ZH(gt1,2))
res = res+dCosTWp*gX1**2*vPhi*Cos(TW)**2*Cos(TWp)*ZH(gt1,2)
res = res+dvPhi*gX**2*Cos(TWp)**2*ZH(gt1,2)
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TWp)**2*ZH(gt1,2))
res = res+2*dgX*gX*vPhi*Cos(TWp)**2*ZH(gt1,2)
res = res-(dgX1*gX1*vPhi*Cos(TWp)**2*ZH(gt1,2))
res = res+dCosTW*gX1**2*vPhi*Cos(TW)*Cos(TWp)**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Cos(TW)**2*Cos(TWp)**2*ZH(gt1,2)
res = res+dSinTW*gX1**2*vPhi*Sin(TW)*ZH(gt1,2)
res = res+4*dSinTWp*gX*gX1*vPhi*Cos(TWp)*Sin(TW)*ZH(gt1,2)
res = res-(dSinTW*gX1**2*vPhi*Cos(TWp)**2*Sin(TW)*ZH(gt1,2))
res = res+(dvPhi*gX1**2*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Sin(TW)**2*ZH(gt1,2)
res = res-(dCosTWp*gX1**2*vPhi*Cos(TWp)*Sin(TW)**2*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Cos(TWp)**2*Sin(TW)**2*ZH(gt1,2))
res = res-2*dSinTWp*gX**2*vPhi*Sin(TWp)*ZH(gt1,2)
res = res+dSinTWp*gX1**2*vPhi*Sin(TWp)*ZH(gt1,2)
res = res-(dSinTWp*gX1**2*vPhi*Cos(TW)**2*Sin(TWp)*ZH(gt1,2))
res = res+4*dSinTW*gX*gX1*vPhi*Cos(TWp)*Sin(TWp)*ZH(gt1,2)
res = res+4*dCosTWp*gX*gX1*vPhi*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+4*dvPhi*gX*gX1*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+4*dgX1*gX*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+4*dgX*gX1*vPhi*Cos(TWp)*Sin(TW)*Sin(TWp)*ZH(gt1,2)
res = res+dSinTWp*gX1**2*vPhi*Sin(TW)**2*Sin(TWp)*ZH(gt1,2)
res = res-(dvPhi*gX**2*Sin(TWp)**2*ZH(gt1,2))
res = res+(dvPhi*gX1**2*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res-2*dgX*gX*vPhi*Sin(TWp)**2*ZH(gt1,2)
res = res+dgX1*gX1*vPhi*Sin(TWp)**2*ZH(gt1,2)
res = res-(dCosTW*gX1**2*vPhi*Cos(TW)*Sin(TWp)**2*ZH(gt1,2))
res = res-1._dp/2._dp*(dvPhi*gX1**2*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))
res = res-(dgX1*gX1*vPhi*Cos(TW)**2*Sin(TWp)**2*ZH(gt1,2))
res = res+dSinTW*gX1**2*vPhi*Sin(TW)*Sin(TWp)**2*ZH(gt1,2)
res = res+(dvPhi*gX1**2*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2))/2._dp
res = res+dgX1*gX1*vPhi*Sin(TW)**2*Sin(TWp)**2*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZpVZp  
 
 
Subroutine CT_CouplingHpcVWpVP(g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(dCosTW*g1*g2*vH)/2._dp
res = res+(dvH*g1*g2*Cos(TW))/2._dp
res = res+(dg2*g1*vH*Cos(TW))/2._dp
res = res+(dg1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcVWpVP  
 
 
Subroutine CT_CouplingHpcVWpVZ(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res+(dSinTWp*g1X*g2*vH)/2._dp
res = res-1._dp/2._dp*(dSinTW*g1*g2*vH*Cos(TWp))
res = res-1._dp/2._dp*(dCosTWp*g1*g2*vH*Sin(TW))
res = res-1._dp/2._dp*(dvH*g1*g2*Cos(TWp)*Sin(TW))
res = res-1._dp/2._dp*(dg2*g1*vH*Cos(TWp)*Sin(TW))
res = res-1._dp/2._dp*(dg1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(dvH*g1X*g2*Sin(TWp))/2._dp
res = res+(dg2*g1X*vH*Sin(TWp))/2._dp
res = res+(dg1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcVWpVZ  
 
 
Subroutine CT_CouplingHpcVWpVZp(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,          & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpcVWpVZp' 
 
res = 0._dp 
res = res+(dCosTWp*g1X*g2*vH)/2._dp
res = res+(dvH*g1X*g2*Cos(TWp))/2._dp
res = res+(dg2*g1X*vH*Cos(TWp))/2._dp
res = res+(dg1X*g2*vH*Cos(TWp))/2._dp
res = res+(dSinTWp*g1*g2*vH*Sin(TW))/2._dp
res = res+(dSinTW*g1*g2*vH*Sin(TWp))/2._dp
res = res+(dvH*g1*g2*Sin(TW)*Sin(TWp))/2._dp
res = res+(dg2*g1*vH*Sin(TW)*Sin(TWp))/2._dp
res = res+(dg1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpcVWpVZp  
 
 
Subroutine CT_CouplingcHpVPVWp(g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vH,TW,dg1,dg2,dvH,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(dCosTW*g1*g2*vH)/2._dp
res = res+(dvH*g1*g2*Cos(TW))/2._dp
res = res+(dg2*g1*vH*Cos(TW))/2._dp
res = res+(dg1*g2*vH*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpVPVWp  
 
 
Subroutine CT_CouplingcHpVWpVZ(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res+(dSinTWp*g1X*g2*vH)/2._dp
res = res-1._dp/2._dp*(dSinTW*g1*g2*vH*Cos(TWp))
res = res-1._dp/2._dp*(dCosTWp*g1*g2*vH*Sin(TW))
res = res-1._dp/2._dp*(dvH*g1*g2*Cos(TWp)*Sin(TW))
res = res-1._dp/2._dp*(dg2*g1*vH*Cos(TWp)*Sin(TW))
res = res-1._dp/2._dp*(dg1*g2*vH*Cos(TWp)*Sin(TW))
res = res+(dvH*g1X*g2*Sin(TWp))/2._dp
res = res+(dg2*g1X*vH*Sin(TWp))/2._dp
res = res+(dg1X*g2*vH*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpVWpVZ  
 
 
Subroutine CT_CouplingcHpVWpVZp(g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,          & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,g1X,vH,TW,TWp,dg1,dg2,dg1X,dvH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpVWpVZp' 
 
res = 0._dp 
res = res+(dCosTWp*g1X*g2*vH)/2._dp
res = res+(dvH*g1X*g2*Cos(TWp))/2._dp
res = res+(dg2*g1X*vH*Cos(TWp))/2._dp
res = res+(dg1X*g2*vH*Cos(TWp))/2._dp
res = res+(dSinTWp*g1*g2*vH*Sin(TW))/2._dp
res = res+(dSinTW*g1*g2*vH*Sin(TWp))/2._dp
res = res+(dvH*g1*g2*Sin(TW)*Sin(TWp))/2._dp
res = res+(dg2*g1*vH*Sin(TW)*Sin(TWp))/2._dp
res = res+(dg1*g2*vH*Sin(TW)*Sin(TWp))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpVWpVZp  
 
 
Subroutine CT_CouplingVGVGVG(g3,dg3,res)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingVGVGVG' 
 
res = 0._dp 
res = res+dg3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingVGVGVG  
 
 
Subroutine CT_CouplingcVWpVPVWp(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(dSinTW*g2)
res = res-(dg2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWpVPVWp  
 
 
Subroutine CT_CouplingcVWpVWpVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+dCosTWp*g2*Cos(TW)
res = res+dCosTW*g2*Cos(TWp)
res = res+dg2*Cos(TW)*Cos(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWpVWpVZ  
 
 
Subroutine CT_CouplingcVWpVWpVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,          & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWpVWpVZp' 
 
res = 0._dp 
res = res-(dSinTWp*g2*Cos(TW))
res = res-(dCosTW*g2*Sin(TWp))
res = res-(dg2*Cos(TW)*Sin(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWpVWpVZp  
 
 
Subroutine CT_CouplingcFdFdAh(gt1,gt2,gt3,YdL,YdR,ZA,ZDL,ZDR,dYdL,dYdR,               & 
& dZA,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2),dZA(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),dYdL(3,3),dYdR(3,3),dZDL(6,6),dZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdAh' 
 
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
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*dZA(gt3,1)*YdL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*dZA(gt3,2)*YdR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*dYdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,3 + j1))*YdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*dYdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,3 + j2))*Conjg(ZDR(gt1,j1))*YdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*dZA(gt3,1)*ZDR(gt2,3 + j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*dZA(gt3,2)*ZDR(gt2,j1)*ZDL(gt1,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdL(j1,j2))*dZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*dZDL(gt1,3 + j2)*ZDR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YdR(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdAh  
 
 
Subroutine CT_CouplingcFeFeAh(gt1,gt2,gt3,YeL,YeR,ZA,ZEL,ZER,dYeL,dYeR,               & 
& dZA,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2),dZA(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),dYeL(3,3),dYeR(3,3),dZEL(6,6),dZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeAh' 
 
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
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dZA(gt3,1)*YeL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*dZA(gt3,2)*YeR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dYeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,3 + j1))*YeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*dYeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,3 + j2))*Conjg(ZER(gt1,j1))*YeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*dZA(gt3,1)*ZER(gt2,3 + j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*dZA(gt3,2)*ZER(gt2,j1)*ZEL(gt1,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*dZEL(gt1,j2)*ZER(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeL(j1,j2))*dZER(gt2,3 + j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*dZEL(gt1,3 + j2)*ZER(gt2,j1)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(YeR(j1,j2))*dZER(gt2,j1)*ZEL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeAh  
 
 
Subroutine CT_CouplingcFuFuAh(gt1,gt2,gt3,YuL,YuR,ZA,ZUL,ZUR,dYuL,dYuR,               & 
& dZA,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2),dZA(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),dYuL(3,3),dYuR(3,3),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuAh' 
 
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
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*dZA(gt3,1)*YuL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*dZA(gt3,2)*YuR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*dYuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,3 + j1))*YuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*dYuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,3 + j2))*Conjg(ZUR(gt1,j1))*YuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZA(gt3,1)*ZUR(gt2,3 + j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZA(gt3,2)*ZUR(gt2,j1)*ZUL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,3 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZUL(gt1,3 + j2)*ZUR(gt2,j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuAh  
 
 
Subroutine CT_CouplingFvFvAh(gt1,gt2,gt3,YvL,YvR,ZA,UV,dYvL,dYvR,dZA,dUV,             & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZA(2,2),dZA(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9),dYvL(3,3),dYvR(3,3),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvAh' 
 
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
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*dZA(gt3,1)*YvL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*dZA(gt3,1)*YvL(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dZA(gt3,2)*YvR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dZA(gt3,2)*YvR(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*dYvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*dYvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,j2))*Conjg(UV(gt1,6 + j1))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,6 + j1))*Conjg(UV(gt1,j2))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZA(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dYvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dYvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,6 + j2))*Conjg(UV(gt1,3 + j1))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,6 + j2))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZA(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dZA(gt3,2)*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dZA(gt3,1)*UV(gt1,j2)*UV(gt2,6 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dZA(gt3,1)*UV(gt1,6 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dZA(gt3,2)*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt2,j2)*UV(gt1,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt2,6 + j1)*UV(gt1,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt1,j2)*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt1,6 + j1)*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZA(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt2,6 + j2)*UV(gt1,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZA(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvAh  
 
 
Subroutine CT_CouplingcFdFdhh(gt1,gt2,gt3,YdL,YdR,ZH,ZDL,ZDR,dYdL,dYdR,               & 
& dZH,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: YdL(3,3),YdR(3,3),ZDL(6,6),ZDR(6,6),dYdL(3,3),dYdR(3,3),dZDL(6,6),dZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdhh' 
 
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
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*dZH(gt3,1)*YdL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*dZH(gt3,2)*YdR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*dYdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,3 + j1))*YdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YdL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*dYdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,3 + j2))*Conjg(ZDR(gt1,j1))*YdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,3 + j2))*YdR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*dZH(gt3,1)*ZDR(gt2,3 + j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*dZH(gt3,2)*ZDR(gt2,j1)*ZDL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdL(j1,j2))*dZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYdL(j1,j2))*ZDR(gt2,3 + j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*dZDL(gt1,3 + j2)*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YdR(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYdR(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdhh  
 
 
Subroutine CT_CouplingcFuFdHp(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,dYuL,dYdL,              & 
& dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6),dYuL(3,3),dYdL(3,3),            & 
& dZDL(6,6),dZDR(6,6),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdHp' 
 
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
resL = resL+Conjg(ZUR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*dYuL(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,3 + j1))*YuL(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,3 + j1))*Conjg(ZDL(gt2,j2))*YuL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YdL(j1,j2))*dZDR(gt2,3 + j1)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYdL(j1,j2))*ZDR(gt2,3 + j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdHp  
 
 
Subroutine CT_CouplingFvFeHp(gt1,gt2,YvL,YeL,ZEL,ZER,UV,dYvL,dYeL,dZEL,               & 
& dZER,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9),dYvL(3,3),dYeL(3,3),dZEL(6,6),            & 
& dZER(6,6),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFeHp' 
 
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
resL = resL+Conjg(UV(gt1,6 + j1))*Conjg(ZEL(gt2,j2))*dYvL(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j2))*Conjg(UV(gt1,6 + j1))*YvL(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,6 + j1))*Conjg(ZEL(gt2,j2))*YvL(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,j2))*dUV(gt1,j2)*ZER(gt2,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(YeL(j1,j2))*dZER(gt2,3 + j1)*UV(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYeL(j1,j2))*ZER(gt2,3 + j1)*UV(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFeHp  
 
 
Subroutine CT_CouplingcFeFehh(gt1,gt2,gt3,YeL,YeR,ZH,ZEL,ZER,dYeL,dYeR,               & 
& dZH,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: YeL(3,3),YeR(3,3),ZEL(6,6),ZER(6,6),dYeL(3,3),dYeR(3,3),dZEL(6,6),dZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFehh' 
 
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
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dZH(gt3,1)*YeL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*dZH(gt3,2)*YeR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*dYeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,3 + j1))*YeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,3 + j1))*Conjg(ZEL(gt2,j2))*YeL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*dYeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,3 + j2))*Conjg(ZER(gt1,j1))*YeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,3 + j2))*YeR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*dZH(gt3,1)*ZER(gt2,3 + j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*dZH(gt3,2)*ZER(gt2,j1)*ZEL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*dZEL(gt1,j2)*ZER(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeL(j1,j2))*dZER(gt2,3 + j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYeL(j1,j2))*ZER(gt2,3 + j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*dZEL(gt1,3 + j2)*ZER(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YeR(j1,j2))*dZER(gt2,j1)*ZEL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYeR(j1,j2))*ZER(gt2,j1)*ZEL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFehh  
 
 
Subroutine CT_CouplingcFuFuhh(gt1,gt2,gt3,YuL,YuR,ZH,ZUL,ZUR,dYuL,dYuR,               & 
& dZH,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: YuL(3,3),YuR(3,3),ZUL(6,6),ZUR(6,6),dYuL(3,3),dYuR(3,3),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuhh' 
 
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
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*dZH(gt3,1)*YuL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*dZH(gt3,2)*YuR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*dYuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,3 + j1))*YuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YuL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*dYuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,3 + j2))*Conjg(ZUR(gt1,j1))*YuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,3 + j2))*YuR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZH(gt3,1)*ZUR(gt2,3 + j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZH(gt3,2)*ZUR(gt2,j1)*ZUL(gt1,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,3 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuL(j1,j2))*dZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYuL(j1,j2))*ZUR(gt2,3 + j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZUL(gt1,3 + j2)*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YuR(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYuR(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,3 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuhh  
 
 
Subroutine CT_CouplingcFdFucHp(gt1,gt2,YuL,YdL,ZDL,ZDR,ZUL,ZUR,dYuL,dYdL,             & 
& dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YuL(3,3),YdL(3,3),ZDL(6,6),ZDR(6,6),ZUL(6,6),ZUR(6,6),dYuL(3,3),dYdL(3,3),            & 
& dZDL(6,6),dZDR(6,6),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFucHp' 
 
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
resL = resL-(Conjg(ZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*dYdL(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,3 + j1))*YdL(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDR(gt1,3 + j1))*Conjg(ZUL(gt2,j2))*YdL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*dZDL(gt1,j2)*ZUR(gt2,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YuL(j1,j2))*dZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYuL(j1,j2))*ZUR(gt2,3 + j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFucHp  
 
 
Subroutine CT_CouplingFvFvhh(gt1,gt2,gt3,YvL,YvR,ZH,UV,dYvL,dYvR,dZH,dUV,             & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: YvL(3,3),YvR(3,3),UV(9,9),dYvL(3,3),dYvR(3,3),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvhh' 
 
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
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*dZH(gt3,1)*YvL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*dZH(gt3,1)*YvL(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dZH(gt3,2)*YvR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dZH(gt3,2)*YvR(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,j2))*Conjg(UV(gt2,6 + j1))*dYvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j1))*Conjg(UV(gt2,j2))*dYvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,j2))*Conjg(UV(gt1,6 + j1))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,6 + j1))*Conjg(UV(gt1,j2))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,j2))*Conjg(UV(gt2,6 + j1))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,6 + j1))*Conjg(UV(gt2,j2))*YvL(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*dYvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(UV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*dYvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,6 + j2))*Conjg(UV(gt1,3 + j1))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt2,3 + j1))*Conjg(UV(gt1,6 + j2))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,6 + j2))*Conjg(UV(gt2,3 + j1))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dUV(gt1,3 + j1))*Conjg(UV(gt2,6 + j2))*YvR(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dZH(gt3,2)*UV(gt1,6 + j2)*UV(gt2,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dZH(gt3,1)*UV(gt1,j2)*UV(gt2,6 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dZH(gt3,1)*UV(gt1,6 + j1)*UV(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dZH(gt3,2)*UV(gt1,3 + j1)*UV(gt2,6 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt2,j2)*UV(gt1,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt2,6 + j1)*UV(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt1,j2)*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvL(j1,j2))*UV(gt1,j2)*UV(gt2,6 + j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvL(j1,j2))*dUV(gt1,6 + j1)*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvL(j1,j2))*UV(gt1,6 + j1)*UV(gt2,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt2,6 + j2)*UV(gt1,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt2,3 + j1)*UV(gt1,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvR(j1,j2))*UV(gt1,6 + j2)*UV(gt2,3 + j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(YvR(j1,j2))*dUV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYvR(j1,j2))*UV(gt1,3 + j1)*UV(gt2,6 + j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvhh  
 
 
Subroutine CT_CouplingcFeFvcHp(gt1,gt2,YvL,YeL,ZEL,ZER,UV,dYvL,dYeL,dZEL,             & 
& dZER,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: YvL(3,3),YeL(3,3),ZEL(6,6),ZER(6,6),UV(9,9),dYvL(3,3),dYeL(3,3),dZEL(6,6),            & 
& dZER(6,6),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvcHp' 
 
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
resL = resL-(Conjg(ZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*dYeL(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dUV(gt2,j2))*Conjg(ZER(gt1,3 + j1))*YeL(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZER(gt1,3 + j1))*Conjg(UV(gt2,j2))*YeL(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*dZEL(gt1,j2)*UV(gt2,6 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(YvL(j1,j2))*dUV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYvL(j1,j2))*UV(gt2,6 + j1)*ZEL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvcHp  
 
 
Subroutine CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVG' 
 
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
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVG  
 
 
Subroutine CT_CouplingcFdFdVP(gt1,gt2,g1,g2,gX1,ZDL,ZDR,TW,dg1,dg2,dgX1,              & 
& dZDL,dZDR,dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW,dg1,dg2,dgX1,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6),dZDL(6,6),dZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVP' 
 
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
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*Cos(TW)*dZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TW)*dZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*dZDL(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dCosTW*g1*Conjg(ZDL(gt2,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g2*Conjg(ZDL(gt2,j1))*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(dZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1*Conjg(ZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g1*Conjg(ZDL(gt2,3 + j1))*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZDL(gt2,3 + j1))*Cos(TW)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZDL(gt2,3 + j1))*Cos(TW)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*Cos(TW)*dZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*Cos(TW)*dZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TW)*dZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*g1*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dCosTW*gX1*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(ZDR(gt1,j1))*Cos(TW)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*g1*Conjg(ZDR(gt1,3 + j1))*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZDR(gt1,3 + j1))*Cos(TW)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZDR(gt1,3 + j1))*Cos(TW)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVP  
 
 
Subroutine CT_CouplingcFuFdVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(6,6),ZUL(6,6),dZDL(6,6),dZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdVWp' 
 
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
resL = resL-((g2*Conjg(ZDL(gt2,j1))*dZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdVWp  
 
 
Subroutine CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,dg1,            & 
& dg2,dgX,dg1X,dgX1,dZDL,dZDR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6),dZDL(6,6),dZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZ' 
 
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
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*Cos(TWp)*dZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,j1))*Cos(TWp)*dZDL(gt1,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(g1*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*dZDL(gt1,3 + j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*dZDL(gt1,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*dZDL(gt1,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTWp*g1X*Conjg(ZDL(gt2,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g2*Conjg(ZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(ZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g2*Conjg(ZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZDL(gt2,j1))*Cos(TW)*Cos(TWp)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZDL(gt2,j1))*Cos(TW)*Cos(TWp)*ZDL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g1*Conjg(ZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZDL(gt2,j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZDL(gt2,j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(dZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1X*Conjg(ZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1X*Conjg(ZDL(gt2,3 + j1))*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(dSinTW*g1*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(dCosTWp*g1*Conjg(ZDL(gt2,3 + j1))*Sin(TW)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(g1*Conjg(dZDL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/3._dp*(dg1*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZDL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dZDL(gt2,3 + j1))*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(ZDL(gt2,3 + j1))*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,j1))*Cos(TWp)*dZDR(gt2,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZDR(gt1,j1))*Cos(TWp)*dZDR(gt2,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*dZDR(gt2,3 + j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*dZDR(gt2,j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*dZDR(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*dZDR(gt2,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*g1X*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*gX*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dSinTW*g1*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gX1*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dCosTWp*g1*Conjg(ZDR(gt1,j1))*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gX1*Conjg(ZDR(gt1,j1))*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(dZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dg1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(ZDR(gt1,j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(dZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(dZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dg1X*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dgX*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*g1X*Conjg(ZDR(gt1,3 + j1))*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dSinTW*g1*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dCosTWp*g1*Conjg(ZDR(gt1,3 + j1))*Sin(TW)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(g1*Conjg(dZDR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/3._dp*(dg1*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZDR(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(dZDR(gt1,3 + j1))*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1X*Conjg(ZDR(gt1,3 + j1))*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZ  
 
 
Subroutine CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZDL,ZDR,TW,TWp,               & 
& dg1,dg2,dgX,dg1X,dgX1,dZDL,dZDR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZDL(6,6),ZDR(6,6),dZDL(6,6),dZDR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZp' 
 
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
resL = resL-1._dp/6._dp*(g1X*Conjg(ZDL(gt2,j1))*Cos(TWp)*dZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*dZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZDL(gt2,j1))*Cos(TW)*dZDL(gt1,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,j1))*dZDL(gt1,j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZDL(gt2,3 + j1))*dZDL(gt1,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dCosTWp*g1X*Conjg(ZDL(gt2,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTWp*g2*Conjg(ZDL(gt2,j1))*Cos(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(dZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1X*Conjg(ZDL(gt2,j1))*Cos(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTWp*g1*Conjg(ZDL(gt2,j1))*Sin(TW)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTW*g1*Conjg(ZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTW*g2*Conjg(ZDL(gt2,j1))*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dZDL(gt2,j1))*Cos(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(ZDL(gt2,j1))*Cos(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(dZDL(gt2,j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1*Conjg(ZDL(gt2,j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g1X*Conjg(ZDL(gt2,3 + j1))*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dZDL(gt2,3 + j1))*Cos(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(ZDL(gt2,3 + j1))*Cos(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1*Conjg(ZDL(gt2,3 + j1))*Sin(TW)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(ZDL(gt2,3 + j1))*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZDL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZDL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZDL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,j1))*Cos(TWp)*dZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZDR(gt1,j1))*Cos(TWp)*dZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*dZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,j1))*dZDR(gt2,j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZDR(gt1,j1))*dZDR(gt2,j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZDR(gt1,3 + j1))*dZDR(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g1X*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*gX*Conjg(ZDR(gt1,j1))*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(dZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(dZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dg1X*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dgX*Conjg(ZDR(gt1,j1))*Cos(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*g1*Conjg(ZDR(gt1,j1))*Sin(TW)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*gX1*Conjg(ZDR(gt1,j1))*Sin(TW)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g1*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dSinTW*gX1*Conjg(ZDR(gt1,j1))*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(ZDR(gt1,j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g1X*Conjg(ZDR(gt1,3 + j1))*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1X*Conjg(dZDR(gt1,3 + j1))*Cos(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1X*Conjg(ZDR(gt1,3 + j1))*Cos(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTWp*g1*Conjg(ZDR(gt1,3 + j1))*Sin(TW)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g1*Conjg(ZDR(gt1,3 + j1))*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZDR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZDR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZDR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZp  
 
 
Subroutine CT_CouplingFvFeVWp(gt1,gt2,g2,ZEL,UV,dg2,dZEL,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZEL(6,6),UV(9,9),dZEL(6,6),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFeVWp' 
 
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
resL = resL-((g2*Conjg(ZEL(gt2,j1))*dUV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFeVWp  
 
 
Subroutine CT_CouplingcFeFeVP(gt1,gt2,g1,g2,gX1,ZEL,ZER,TW,dg1,dg2,dgX1,              & 
& dZEL,dZER,dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW,dg1,dg2,dgX1,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6),dZEL(6,6),dZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVP' 
 
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
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Cos(TW)*dZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*Cos(TW)*dZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*dZEL(gt1,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g1*Conjg(ZEL(gt2,j1))*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g2*Conjg(ZEL(gt2,j1))*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+dCosTW*g1*Conjg(ZEL(gt2,3 + j1))*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(dZEL(gt2,3 + j1))*Cos(TW)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dg1*Conjg(ZEL(gt2,3 + j1))*Cos(TW)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*Cos(TW)*dZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*Cos(TW)*dZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*Cos(TW)*dZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTW*g1*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTW*gX1*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(dZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dg1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(ZER(gt1,j1))*Cos(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTW*g1*Conjg(ZER(gt1,3 + j1))*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(dZER(gt1,3 + j1))*Cos(TW)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dg1*Conjg(ZER(gt1,3 + j1))*Cos(TW)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVP  
 
 
Subroutine CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,dg1,            & 
& dg2,dgX,dg1X,dgX1,dZEL,dZER,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6),dZEL(6,6),dZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZ' 
 
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
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*Cos(TWp)*dZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(ZEL(gt2,j1))*Cos(TWp)*dZEL(gt1,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*dZEL(gt1,3 + j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*dZEL(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*dZEL(gt1,3 + j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1X*Conjg(ZEL(gt2,j1))*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g2*Conjg(ZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTW*g1*Conjg(ZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g2*Conjg(ZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZEL(gt2,j1))*Cos(TW)*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZEL(gt2,j1))*Cos(TW)*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTWp*g1*Conjg(ZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(dZEL(gt2,j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg1*Conjg(ZEL(gt2,j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(ZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+dSinTWp*g1X*Conjg(ZEL(gt2,3 + j1))*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*g1*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*g1*Conjg(ZEL(gt2,3 + j1))*Sin(TW)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZEL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZEL(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(dZEL(gt2,3 + j1))*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dg1X*Conjg(ZEL(gt2,3 + j1))*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,j1))*Cos(TWp)*dZER(gt2,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZER(gt1,j1))*Cos(TWp)*dZER(gt2,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*dZER(gt2,3 + j1)*Sin(TW))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*dZER(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*dZER(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*dZER(gt2,3 + j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*g1X*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*gX*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*g1*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gX1*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*g1*Conjg(ZER(gt1,j1))*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gX1*Conjg(ZER(gt1,j1))*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(ZER(gt1,j1))*Cos(TWp)*Sin(TW)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(dZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(dZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dg1X*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dgX*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*g1X*Conjg(ZER(gt1,3 + j1))*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*g1*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*g1*Conjg(ZER(gt1,3 + j1))*Sin(TW)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZER(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZER(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(dZER(gt1,3 + j1))*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dg1X*Conjg(ZER(gt1,3 + j1))*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZ  
 
 
Subroutine CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,               & 
& dg1,dg2,dgX,dg1X,dgX1,dZEL,dZER,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZEL(6,6),ZER(6,6),dZEL(6,6),dZER(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZp' 
 
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
resL = resL+(g1X*Conjg(ZEL(gt2,j1))*Cos(TWp)*dZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*dZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZEL(gt2,j1))*Cos(TW)*dZEL(gt1,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*dZEL(gt1,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(ZEL(gt2,3 + j1))*dZEL(gt1,3 + j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g1X*Conjg(ZEL(gt2,j1))*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTWp*g2*Conjg(ZEL(gt2,j1))*Cos(TW)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(ZEL(gt2,j1))*Cos(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1*Conjg(ZEL(gt2,j1))*Sin(TW)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(ZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTW*g2*Conjg(ZEL(gt2,j1))*Sin(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dZEL(gt2,j1))*Cos(TW)*Sin(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(ZEL(gt2,j1))*Cos(TW)*Sin(TWp)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZEL(gt2,j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZEL(gt2,j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+dCosTWp*g1X*Conjg(ZEL(gt2,3 + j1))*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+g1X*Conjg(dZEL(gt2,3 + j1))*Cos(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dg1X*Conjg(ZEL(gt2,3 + j1))*Cos(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dSinTWp*g1*Conjg(ZEL(gt2,3 + j1))*Sin(TW)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dSinTW*g1*Conjg(ZEL(gt2,3 + j1))*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+g1*Conjg(dZEL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dg1*Conjg(ZEL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZEL(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,j1))*Cos(TWp)*dZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(ZER(gt1,j1))*Cos(TWp)*dZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*dZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,j1))*dZER(gt2,j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZER(gt1,j1))*dZER(gt2,j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(ZER(gt1,3 + j1))*dZER(gt2,3 + j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*g1X*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*gX*Conjg(ZER(gt1,j1))*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(dZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX*Conjg(dZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dg1X*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dgX*Conjg(ZER(gt1,j1))*Cos(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*g1*Conjg(ZER(gt1,j1))*Sin(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*gX1*Conjg(ZER(gt1,j1))*Sin(TW)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTW*g1*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTW*gX1*Conjg(ZER(gt1,j1))*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(dZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dg1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(ZER(gt1,j1))*Sin(TW)*Sin(TWp)*ZER(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*g1X*Conjg(ZER(gt1,3 + j1))*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1X*Conjg(dZER(gt1,3 + j1))*Cos(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dg1X*Conjg(ZER(gt1,3 + j1))*Cos(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTWp*g1*Conjg(ZER(gt1,3 + j1))*Sin(TW)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dSinTW*g1*Conjg(ZER(gt1,3 + j1))*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+g1*Conjg(dZER(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dg1*Conjg(ZER(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZER(gt2,3 + j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZp  
 
 
Subroutine CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVG' 
 
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
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVG  
 
 
Subroutine CT_CouplingcFuFuVP(gt1,gt2,g1,g2,gX1,ZUL,ZUR,TW,dg1,dg2,dgX1,              & 
& dZUL,dZUR,dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW,dg1,dg2,dgX1,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVP' 
 
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
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*Cos(TW)*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TW)*dZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*dZUL(gt1,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dCosTW*g1*Conjg(ZUL(gt2,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTW*g2*Conjg(ZUL(gt2,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(dZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1*Conjg(ZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(ZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*dCosTW*g1*Conjg(ZUL(gt2,3 + j1))*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(dZUL(gt2,3 + j1))*Cos(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dg1*Conjg(ZUL(gt2,3 + j1))*Cos(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*Cos(TW)*dZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*Cos(TW)*dZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TW)*dZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dCosTW*g1*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTW*gX1*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(dZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(ZUR(gt1,j1))*Cos(TW)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dCosTW*g1*Conjg(ZUR(gt1,3 + j1))*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(dZUR(gt1,3 + j1))*Cos(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1*Conjg(ZUR(gt1,3 + j1))*Cos(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVP  
 
 
Subroutine CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,dg1,            & 
& dg2,dgX,dg1X,dgX1,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,              & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZ' 
 
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
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*Cos(TWp)*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZUL(gt2,j1))*Cos(TWp)*dZUL(gt1,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(2*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*dZUL(gt1,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*dZUL(gt1,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*dZUL(gt1,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTWp*g1X*Conjg(ZUL(gt2,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTWp*g2*Conjg(ZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(ZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTW*g2*Conjg(ZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dZUL(gt2,j1))*Cos(TW)*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(ZUL(gt2,j1))*Cos(TW)*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g1*Conjg(ZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZUL(gt2,j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZUL(gt2,j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,j1))/6._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(dZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1X*Conjg(ZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*dSinTWp*g1X*Conjg(ZUL(gt2,3 + j1))*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*dSinTW*g1*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*dCosTWp*g1*Conjg(ZUL(gt2,3 + j1))*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*g1*Conjg(dZUL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(2*dg1*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(dZUL(gt2,3 + j1))*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dg1X*Conjg(ZUL(gt2,3 + j1))*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,j1))*Cos(TWp)*dZUR(gt2,j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(ZUR(gt1,j1))*Cos(TWp)*dZUR(gt2,j1)*Sin(TW)
End Do 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*dZUR(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*dZUR(gt2,j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*dZUR(gt2,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*dZUR(gt2,3 + j1)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTWp*g1X*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gX*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*dSinTW*g1*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dSinTW*gX1*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(2*dCosTWp*g1*Conjg(ZUR(gt1,j1))*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*gX1*Conjg(ZUR(gt1,j1))*Sin(TW)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(dZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(2*dg1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(ZUR(gt1,j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(dZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(dZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1X*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dgX*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTWp*g1X*Conjg(ZUR(gt1,3 + j1))*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*dSinTW*g1*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*dCosTWp*g1*Conjg(ZUR(gt1,3 + j1))*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*g1*Conjg(dZUR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(2*dg1*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(dZUR(gt1,3 + j1))*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1X*Conjg(ZUR(gt1,3 + j1))*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZ  
 
 
Subroutine CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gX,g1X,gX1,ZUL,ZUR,TW,TWp,               & 
& dg1,dg2,dgX,dg1X,dgX1,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZUL(6,6),ZUR(6,6),dZUL(6,6),dZUR(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZp' 
 
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
resL = resL-1._dp/6._dp*(g1X*Conjg(ZUL(gt2,j1))*Cos(TWp)*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*dZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZUL(gt2,j1))*Cos(TW)*dZUL(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,j1))*dZUL(gt1,j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(ZUL(gt2,3 + j1))*dZUL(gt1,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dCosTWp*g1X*Conjg(ZUL(gt2,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g2*Conjg(ZUL(gt2,j1))*Cos(TW)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1X*Conjg(dZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1X*Conjg(ZUL(gt2,j1))*Cos(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTWp*g1*Conjg(ZUL(gt2,j1))*Sin(TW)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dSinTW*g1*Conjg(ZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g2*Conjg(ZUL(gt2,j1))*Sin(TWp)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZUL(gt2,j1))*Cos(TW)*Sin(TWp)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZUL(gt2,j1))*Cos(TW)*Sin(TWp)*ZUL(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(g1*Conjg(dZUL(gt2,j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/6._dp*(dg1*Conjg(ZUL(gt2,j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(-2*dCosTWp*g1X*Conjg(ZUL(gt2,3 + j1))*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1X*Conjg(dZUL(gt2,3 + j1))*Cos(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dg1X*Conjg(ZUL(gt2,3 + j1))*Cos(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dSinTWp*g1*Conjg(ZUL(gt2,3 + j1))*Sin(TW)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dSinTW*g1*Conjg(ZUL(gt2,3 + j1))*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*g1*Conjg(dZUL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resL = resL+(-2*dg1*Conjg(ZUL(gt2,3 + j1))*Sin(TW)*Sin(TWp)*ZUL(gt1,3 + j1))/3._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,j1))*Cos(TWp)*dZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(ZUR(gt1,j1))*Cos(TWp)*dZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*dZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,j1))*dZUR(gt2,j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(ZUR(gt1,j1))*dZUR(gt2,j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(ZUR(gt1,3 + j1))*dZUR(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dCosTWp*g1X*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gX*Conjg(ZUR(gt1,j1))*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(dZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(dZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1X*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dgX*Conjg(ZUR(gt1,j1))*Cos(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTWp*g1*Conjg(ZUR(gt1,j1))*Sin(TW)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gX1*Conjg(ZUR(gt1,j1))*Sin(TW)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTW*g1*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gX1*Conjg(ZUR(gt1,j1))*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(dZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(ZUR(gt1,j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(-2*dCosTWp*g1X*Conjg(ZUR(gt1,3 + j1))*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1X*Conjg(dZUR(gt1,3 + j1))*Cos(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1X*Conjg(ZUR(gt1,3 + j1))*Cos(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTWp*g1*Conjg(ZUR(gt1,3 + j1))*Sin(TW)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dSinTW*g1*Conjg(ZUR(gt1,3 + j1))*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*g1*Conjg(dZUR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR+(-2*dg1*Conjg(ZUR(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZUR(gt2,3 + j1))/3._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZp  
 
 
Subroutine CT_CouplingcFdFucVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(6,6),ZUL(6,6),dZDL(6,6),dZUL(6,6)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFucVWp' 
 
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
resL = resL-((g2*Conjg(ZUL(gt2,j1))*dZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFucVWp  
 
 
Subroutine CT_CouplingFvFvVP(gt1,gt2,g1,g2,gX1,UV,TW,dg1,dg2,dgX1,dUV,dSinTW,         & 
& dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX1,TW,dg1,dg2,dgX1,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UV(9,9),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVP' 
 
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
resL = resL+(g1*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*Cos(TW)*dUV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g1*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTW*g2*Conjg(UV(gt2,j1))*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dUV(gt2,j1))*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+dCosTW*gX1*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(dUV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dgX1*Conjg(UV(gt2,3 + j1))*Cos(TW)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*Cos(TW)*dUV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dCosTW*g1*Conjg(UV(gt1,j1))*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g2*Conjg(UV(gt1,j1))*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(dUV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dg1*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dUV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(dCosTW*gX1*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dUV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(UV(gt1,3 + j1))*Cos(TW)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVP  
 
 
Subroutine CT_CouplingFvFvVZ(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,dg1,dg2,              & 
& dgX,dg1X,dgX1,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UV(9,9),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZ' 
 
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
resL = resL-1._dp/2._dp*(g2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*dUV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL-(gX1*Conjg(UV(gt2,3 + j1))*Cos(TWp)*dUV(gt1,3 + j1)*Sin(TW))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*dUV(gt1,3 + j1)*Sin(TWp)
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1X*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTWp*g2*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dSinTW*g1*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTW*g2*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g2*Conjg(dUV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg2*Conjg(UV(gt2,j1))*Cos(TW)*Cos(TWp)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dCosTWp*g1*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(g1*Conjg(dUV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL-1._dp/2._dp*(dg1*Conjg(UV(gt2,j1))*Cos(TWp)*Sin(TW)*UV(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dUV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+dSinTWp*gX*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL-(dSinTW*gX1*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(dCosTWp*gX1*Conjg(UV(gt2,3 + j1))*Sin(TW)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(gX1*Conjg(dUV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL-(dgX1*Conjg(UV(gt2,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt1,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(dUV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dgX*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(g2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*dUV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(UV(gt1,3 + j1))*Cos(TWp)*dUV(gt2,3 + j1)*Sin(TW)
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*dUV(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dSinTWp*g1X*Conjg(UV(gt1,j1))*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g2*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dSinTW*g1*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTW*g2*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dUV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(UV(gt1,j1))*Cos(TW)*Cos(TWp)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dCosTWp*g1*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dUV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(UV(gt1,j1))*Cos(TWp)*Sin(TW)*UV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(dUV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dg1X*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gX*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+dSinTW*gX1*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dCosTWp*gX1*Conjg(UV(gt1,3 + j1))*Sin(TW)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+gX1*Conjg(dUV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+dgX1*Conjg(UV(gt1,3 + j1))*Cos(TWp)*Sin(TW)*UV(gt2,3 + j1)
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(dUV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZ  
 
 
Subroutine CT_CouplingFvFvVZp(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,dg1,dg2,             & 
& dgX,dg1X,dgX1,dUV,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,TW,TWp,dg1,dg2,dgX,dg1X,dgX1,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UV(9,9),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZp' 
 
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
resL = resL+(g1X*Conjg(UV(gt2,j1))*Cos(TWp)*dUV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(UV(gt2,3 + j1))*Cos(TWp)*dUV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(UV(gt2,j1))*Cos(TW)*dUV(gt1,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(UV(gt2,j1))*dUV(gt1,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(UV(gt2,3 + j1))*dUV(gt1,3 + j1)*Sin(TW)*Sin(TWp)
End Do 
Do j1 = 1,3
resL = resL+(dCosTWp*g1X*Conjg(UV(gt2,j1))*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g2*Conjg(UV(gt2,j1))*Cos(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1X*Conjg(dUV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1X*Conjg(UV(gt2,j1))*Cos(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTWp*g1*Conjg(UV(gt2,j1))*Sin(TW)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dSinTW*g1*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dCosTW*g2*Conjg(UV(gt2,j1))*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dUV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(UV(gt2,j1))*Cos(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dUV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(UV(gt2,j1))*Sin(TW)*Sin(TWp)*UV(gt1,j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL+dCosTWp*gX*Conjg(UV(gt2,3 + j1))*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+gX*Conjg(dUV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dgX*Conjg(UV(gt2,3 + j1))*Cos(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dSinTWp*gX1*Conjg(UV(gt2,3 + j1))*Sin(TW)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dSinTW*gX1*Conjg(UV(gt2,3 + j1))*Sin(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+gX1*Conjg(dUV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1)
End Do 
Do j1 = 1,3
resL = resL+dgX1*Conjg(UV(gt2,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt1,3 + j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(UV(gt1,j1))*Cos(TWp)*dUV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(UV(gt1,3 + j1))*Cos(TWp)*dUV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g2*Conjg(UV(gt1,j1))*Cos(TW)*dUV(gt2,j1)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(UV(gt1,j1))*dUV(gt2,j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(UV(gt1,3 + j1))*dUV(gt2,3 + j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dCosTWp*g1X*Conjg(UV(gt1,j1))*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dSinTWp*g2*Conjg(UV(gt1,j1))*Cos(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1X*Conjg(dUV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dg1X*Conjg(UV(gt1,j1))*Cos(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dSinTWp*g1*Conjg(UV(gt1,j1))*Sin(TW)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dSinTW*g1*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dCosTW*g2*Conjg(UV(gt1,j1))*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g2*Conjg(dUV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dg2*Conjg(UV(gt1,j1))*Cos(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(g1*Conjg(dUV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-1._dp/2._dp*(dg1*Conjg(UV(gt1,j1))*Sin(TW)*Sin(TWp)*UV(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dCosTWp*gX*Conjg(UV(gt1,3 + j1))*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(gX*Conjg(dUV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX*Conjg(UV(gt1,3 + j1))*Cos(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dSinTWp*gX1*Conjg(UV(gt1,3 + j1))*Sin(TW)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dSinTW*gX1*Conjg(UV(gt1,3 + j1))*Sin(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(gX1*Conjg(dUV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(dgX1*Conjg(UV(gt1,3 + j1))*Sin(TW)*Sin(TWp)*UV(gt2,3 + j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZp  
 
 
Subroutine CT_CouplingcFeFvcVWp(gt1,gt2,g2,ZEL,UV,dg2,dZEL,dUV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZEL(6,6),UV(9,9),dZEL(6,6),dUV(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvcVWp' 
 
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
resL = resL-((g2*Conjg(UV(gt2,j1))*dZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvcVWp  
 
 
End Module CouplingsCT_U1T3R 
