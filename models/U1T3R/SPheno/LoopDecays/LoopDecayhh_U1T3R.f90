! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:19 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_hh_U1T3R
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_U1T3R 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_U1T3R_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),Mhh(2),MAh2(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhAhhh(gt2,gt3,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToAhAh


Subroutine Gamma_Real_U1T3R_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,GammarealPhoton, & 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2)

Real(dp), Intent(in) :: MAh(2),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,2), GammarealGluon(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=3,2
    Do i3=3,2
Coup = cplAhAhhh(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MAh(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhToAhAh


Subroutine Amplitude_WAVE_U1T3R_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,              & 
& Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2)

Complex(dp), Intent(in) :: ctcplAhAhhh(2,2,2)

Complex(dp), Intent(in) :: ZfAh(2,2),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhAhhh(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhAhhh(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhAhhh(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToAhAh


Subroutine Amplitude_VERTEX_U1T3R_hhToAhAh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplhhhhhh,cplhhHpcHp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,           & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhVPVZ1,cplAhAhVPVZp1,        & 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),  & 
& cplhhHpcHp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),   & 
& cplhhVZpVZp(2),cplAhAhAhAh1(2,2,2,2),cplAhAhhhhh1(2,2,2,2),cplAhAhHpcHp1(2,2),         & 
& cplAhAhVPVZ1(2,2),cplAhAhVPVZp1(2,2),cplAhAhcVWpVWp1(2,2),cplAhAhVZVZ1(2,2),           & 
& cplAhAhVZVZp1(2,2),cplAhAhVZpVZp1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2,gt3)
coup3R = cplcFdFdAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i3,i2,gt3)
coup3R = cplcFuFuAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh(gt2)
coup3 = cplcgWpgWpAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh(gt2)
coup3 = cplcgWCgWCAh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVP(gt2,i1)
coup3 = cplAhhhVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(gt2,i1)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZp(gt2,i1)
coup3 = cplAhhhVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplAhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplAhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = -cplAhhhVZp(gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplAhhhVZp(gt2,i3)
coup3 = cplAhhhVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = -cplAhhhVZp(gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = -cplAhhhVZp(gt2,i3)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplAhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplAhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhAhAh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhAhHpcHp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhAhVPVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhAhVPVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhAhcVWpVWp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhAhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhAhVZVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplAhAhVZpVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt3,i1,gt1,i2)
coup2 = cplAhAhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 


! {Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt2,i1,gt1,i2)
coup2 = cplAhAhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToAhAh


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhAh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplhhhhhh,cplhhHpcHp,cplhhVPVZ,cplhhVPVZp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,           & 
& cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplAhAhVPVZ1,cplAhAhVPVZp1,        & 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),  & 
& cplhhHpcHp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),   & 
& cplhhVZpVZp(2),cplAhAhAhAh1(2,2,2,2),cplAhAhhhhh1(2,2,2,2),cplAhAhHpcHp1(2,2),         & 
& cplAhAhVPVZ1(2,2),cplAhAhVPVZp1(2,2),cplAhAhcVWpVWp1(2,2),cplAhAhVZVZ1(2,2),           & 
& cplAhAhVZVZp1(2,2),cplAhAhVZpVZp1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MAh(gt3) 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplAhhhVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVP(gt2,i1)
coup3 = cplAhhhVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhhhVZ(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplAhhhVP(gt2,i3)
coup3 = cplAhhhVZp(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplAhhhVZ(gt2,i3)
coup3 = cplAhhhVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplAhhhVZp(gt2,i3)
coup3 = cplAhhhVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhAhVPVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhAhVPVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhAh


Subroutine Amplitude_Tree_U1T3R_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),Mhh(2),MVZ,MAh2(2),Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToAhVZ


Subroutine Gamma_Real_U1T3R_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZ(2,2)

Real(dp), Intent(in) :: MAh(2),Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=3,2
Coup = cplAhhhVZ(i2,i1)
Mex1 = Mhh(i1)
Mex2 = MAh(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2) = 0._dp 
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhToAhVZ


Subroutine Amplitude_WAVE_U1T3R_hhToAhVZ(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,              & 
& ZfAh,Zfhh,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ctcplAhhhVP(2,2),ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ZfAh(2,2),Zfhh(2,2),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhhhVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplAhhhVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplAhhhVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToAhVZ


Subroutine Amplitude_VERTEX_U1T3R_hhToAhVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,             & 
& cplAhAhVZVZp1,cplAhHpcVWpVZ1,cplAhcHpVWpVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,   & 
& cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9), & 
& cplFvFvVZR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,             & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1(2,2),cplAhAhVZVZ1(2,2),   & 
& cplAhAhVZVZp1(2,2),cplAhHpcVWpVZ1(2),cplAhcHpVWpVZ1(2),cplhhhhVPVZ1(2,2),              & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVZ1(2),cplhhcHpVWpVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh(gt2)
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh(gt2)
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVP(gt2,i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZp(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhAhVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhAhVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplAhhhVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplAhhhVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplAhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplAhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToAhVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,      & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1,cplAhAhVZVZ1,             & 
& cplAhAhVZVZp1,cplAhHpcVWpVZ1,cplAhcHpVWpVZ1,cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,   & 
& cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9), & 
& cplFvFvVZR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,             & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVPVZ1(2,2),cplAhAhVZVZ1(2,2),   & 
& cplAhAhVZVZp1(2,2),cplAhHpcVWpVZ1(2),cplAhcHpVWpVZ1(2),cplhhhhVPVZ1(2,2),              & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVZ1(2),cplhhcHpVWpVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZ 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVP(gt2,i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVZ


Subroutine Amplitude_Tree_U1T3R_hhToAhVZp(cplAhhhVZp,MAh,Mhh,MVZp,MAh2,               & 
& Mhh2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),Mhh(2),MVZp,MAh2(2),Mhh2(2),MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToAhVZp


Subroutine Gamma_Real_U1T3R_hhToAhVZp(MLambda,em,gs,cplAhhhVZp,MAh,Mhh,               & 
& MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZp(2,2)

Real(dp), Intent(in) :: MAh(2),Mhh(2),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=3,2
Coup = cplAhhhVZp(i2,i1)
Mex1 = Mhh(i1)
Mex2 = MAh(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2) = 0._dp 
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhToAhVZp


Subroutine Amplitude_WAVE_U1T3R_hhToAhVZp(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,             & 
& ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZp,MVZp2,            & 
& ZfAh,Zfhh,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ctcplAhhhVP(2,2),ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ZfAh(2,2),Zfhh(2,2),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVZp(gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhhhVZp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZp*cplAhhhVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplAhhhVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplAhhhVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToAhVZp


Subroutine Amplitude_VERTEX_U1T3R_hhToAhVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,              & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,cplFvFvVZpR,               & 
& cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1,         & 
& cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpcVWpVZp1,cplAhcHpVWpVZp1,cplhhhhVPVZp1,            & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),             & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZp,cplcgWCgWChh(2),       & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1(2,2), & 
& cplAhAhVZVZp1(2,2),cplAhAhVZpVZp1(2,2),cplAhHpcVWpVZp1(2),cplAhcHpVWpVZp1(2),          & 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),cplhhHpcVWpVZp1(2),          & 
& cplhhcHpVWpVZp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZp 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = -cplcFdFdVZpR(i3,i2)
coup3R = -cplcFdFdVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh(gt2)
coup3 = cplcgWpgWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh(gt2)
coup3 = cplcgWCgWCVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVP(gt2,i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZp(gt2,i1)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhAhVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhAhVZpVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWpVZp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWpVZp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplAhhhVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,i1)
coup2 = cplAhhhVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplAhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplAhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToAhVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVZp(MAh,MFd,MFe,MFu,MFv,Mhh,               & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,               & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,            & 
& cplAhAhVPVZp1,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpcVWpVZp1,cplAhcHpVWpVZp1,            & 
& cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),             & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZp,cplcgWCgWChh(2),       & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1(2,2), & 
& cplAhAhVZVZp1(2,2),cplAhAhVZpVZp1(2,2),cplAhHpcVWpVZp1(2),cplAhcHpVWpVZp1(2),          & 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),cplhhHpcVWpVZp1(2),          & 
& cplhhcHpVWpVZp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVZp 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVP(gt2,i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVZpVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVZp


Subroutine Amplitude_Tree_U1T3R_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,            & 
& MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),Mhh(2),MFd2(6),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Complex(dp) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt2,gt3,gt1)
coupT1R = cplcFdFdhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTocFdFd


Subroutine Gamma_Real_U1T3R_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,          & 
& MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Real(dp), Intent(in) :: MFd(6),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,6,6), GammarealGluon(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
CoupL = cplcFdFdhhL(i2,i3,i1)
CoupR = cplcFdFdhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhTocFdFd


Subroutine Amplitude_WAVE_U1T3R_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,      & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(6,6,2),ctcplcFdFdhhR(6,6,2)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFdhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFdhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFdhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt3)*cplcFdFdhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt3))*cplcFdFdhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTocFdFd


Subroutine Amplitude_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,        & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6), & 
& cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),             & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopFd)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, Fd}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hp, Hp, Fu}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MHp 
ML3 = MFu(i3) 
coup1 = cplhhHpcHp(gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFdHpL(i3,gt3)
coup3R = cplcFuFdHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, Fu}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFdVWpL(i3,gt3)
coup3R = cplcFuFdVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, Ah, Fd}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fd}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fd}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Fu}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MHp 
ML3 = MFu(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFdHpL(i3,gt3)
coup3R = cplcFuFdHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, Fu}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFdVWpL(i3,gt3)
coup3R = cplcFuFdVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, Fd}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2L = cplcFdFdVZpL(gt2,i3)
coup2R = cplcFdFdVZpR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, Fd}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFdFdVZpL(gt2,i3)
coup2R = cplcFdFdVZpR(gt2,i3)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, Fd}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFdFdVZpL(gt2,i3)
coup2R = cplcFdFdVZpR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, Fd}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2L = cplcFdFdVZpL(gt2,i3)
coup2R = cplcFdFdVZpR(gt2,i3)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], Ah}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i1,i3)
coup2R = cplcFdFdAhR(gt2,i1,i3)
coup3L = cplcFdFdAhL(i2,gt3,i3)
coup3R = cplcFdFdAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], hh}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i1,i3)
coup2R = cplcFdFdhhR(gt2,i1,i3)
coup3L = cplcFdFdhhL(i2,gt3,i3)
coup3R = cplcFdFdhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VZ}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(i2,gt3)
coup3R = cplcFdFdVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VZp}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZp 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVZpL(gt2,i1)
coup2R = cplcFdFdVZpR(gt2,i1)
coup3L = cplcFdFdVZpL(i2,gt3)
coup3R = cplcFdFdVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[Hp]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHp 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFuFdHpL(i2,gt3)
coup3R = cplcFuFdHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], conj[VWp]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWp 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFuFdVWpL(i2,gt3)
coup3R = cplcFuFdVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTocFdFd


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFdFd(MAh,MFd,MFu,Mhh,MHp,MVG,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,        & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,         & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6), & 
& cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),             & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, VP, Fd}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i3,i1)
coup2R = cplcFdFdAhR(gt2,i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VP, Ah, Fd}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFd)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fd}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fd}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, Fd}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, Fd}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFdFdVZpL(gt2,i3)
coup2R = cplcFdFdVZpR(gt2,i3)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], VG}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VP}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFdFd


Subroutine Amplitude_Tree_U1T3R_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,            & 
& MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),Mhh(2),MFe2(6),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Complex(dp) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt2,gt3,gt1)
coupT1R = cplcFeFehhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTocFeFe


Subroutine Gamma_Real_U1T3R_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,          & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Real(dp), Intent(in) :: MFe(6),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,6,6), GammarealGluon(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
CoupL = cplcFeFehhL(i2,i3,i1)
CoupR = cplcFeFehhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhTocFeFe


Subroutine Amplitude_WAVE_U1T3R_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,      & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFehhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFehhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFehhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFeFehhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFeFehhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTocFeFe


Subroutine Amplitude_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),     & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),              & 
& cplcFeFvcVWpR(6,9),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),         & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Fv, conj[Hp]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopHp)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MHp 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvcHpL(gt2,i1)
coup2R = cplcFeFvcHpR(gt2,i1)
coup3L = cplFvFeHpL(i2,gt3)
coup3R = cplFvFeHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Fv, conj[VWp]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVWp)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVWp 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvcVWpL(gt2,i1)
coup2R = cplcFeFvcVWpR(gt2,i1)
coup3L = cplFvFeVWpL(i2,gt3)
coup3R = cplFvFeVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, Fe}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hp, Hp, Fv}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MHp 
ML2 = MHp 
ML3 = MFv(i3) 
coup1 = cplhhHpcHp(gt1)
coup2L = cplcFeFvcHpL(gt2,i3)
coup2R = cplcFeFvcHpR(gt2,i3)
coup3L = cplFvFeHpL(i3,gt3)
coup3R = cplFvFeHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, Fv}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MHp 
ML2 = MVWp 
ML3 = MFv(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2L = cplcFeFvcHpL(gt2,i3)
coup2R = cplcFeFvcHpR(gt2,i3)
coup3L = cplFvFeVWpL(i3,gt3)
coup3R = cplFvFeVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, Ah, Fe}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fe}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fe}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVWp 
ML2 = MHp 
ML3 = MFv(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2L = cplcFeFvcVWpL(gt2,i3)
coup2R = cplcFeFvcVWpR(gt2,i3)
coup3L = cplFvFeHpL(i3,gt3)
coup3R = cplFvFeHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFv(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFeFvcVWpL(gt2,i3)
coup2R = cplcFeFvcVWpR(gt2,i3)
coup3L = cplFvFeVWpL(i3,gt3)
coup3R = cplFvFeVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, Fe}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, Fe}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, Fe}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, Fe}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fe], bar[Fe], Ah}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
coup3L = cplcFeFeAhL(i2,gt3,i3)
coup3R = cplcFeFeAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], hh}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3L = cplcFeFehhL(i2,gt3,i3)
coup3R = cplcFeFehhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VZ}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VZp}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZp 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVZpL(gt2,i1)
coup2R = cplcFeFeVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i2,gt3)
coup3R = cplcFeFeVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTocFeFe


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFeFe(MAh,MFe,MFv,Mhh,MHp,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,    & 
& cplcFeFeAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,          & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,              & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),     & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),              & 
& cplcFeFvcVWpR(6,9),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),         & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, VP, Fe}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VP, Ah, Fe}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFe)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fe}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fe}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, Fe}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, Fe}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFe(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = cplcFeFeVPL(i3,gt3)
coup3R = cplcFeFeVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fe], bar[Fe], VP}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFeFe


Subroutine Amplitude_Tree_U1T3R_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,            & 
& MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(6),Mhh(2),MFu2(6),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2)

Complex(dp) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt2,gt3,gt1)
coupT1R = cplcFuFuhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTocFuFu


Subroutine Gamma_Real_U1T3R_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,          & 
& MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2)

Real(dp), Intent(in) :: MFu(6),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,6,6), GammarealGluon(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
CoupL = cplcFuFuhhL(i2,i3,i1)
CoupR = cplcFuFuhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhTocFuFu


Subroutine Amplitude_WAVE_U1T3R_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,      & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(6),MFu2(6),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(6,6,2),ctcplcFuFuhhR(6,6,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfUL(6,6),ZfUR(6,6)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFuFuhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt2)*cplcFuFuhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt2))*cplcFuFuhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFuFuhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFuFuhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTocFuFu


Subroutine Amplitude_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,        & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),  & 
& cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),& 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopFu)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, Fu}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, Ah, Fu}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fu}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fu}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, Fu}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, Fu}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, Fu}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, Fu}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fd], bar[Fd], Hp}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHp 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdHpL(gt2,i1)
coup2R = cplcFuFdHpR(gt2,i1)
coup3L = cplcFdFucHpL(i2,gt3)
coup3R = cplcFdFucHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fd], bar[Fd], VWp}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdVWpL(gt2,i1)
coup2R = cplcFuFdVWpR(gt2,i1)
coup3L = cplcFdFucVWpL(i2,gt3)
coup3R = cplcFdFucVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], Ah}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i1,i3)
coup2R = cplcFuFuAhR(gt2,i1,i3)
coup3L = cplcFuFuAhL(i2,gt3,i3)
coup3R = cplcFuFuAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], hh}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
coup3L = cplcFuFuhhL(i2,gt3,i3)
coup3R = cplcFuFuhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VZ}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
coup3L = cplcFuFuVZL(i2,gt3)
coup3R = cplcFuFuVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VZp}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZp 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVZpL(gt2,i1)
coup2R = cplcFuFuVZpR(gt2,i1)
coup3L = cplcFuFuVZpL(i2,gt3)
coup3R = cplcFuFuVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hp], conj[Hp], Fd}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MHp 
ML3 = MFd(i3) 
coup1 = cplhhHpcHp(gt1)
coup2L = cplcFuFdHpL(gt2,i3)
coup2R = cplcFuFdHpR(gt2,i3)
coup3L = cplcFdFucHpL(i3,gt3)
coup3R = cplcFdFucHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], Fd}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2L = cplcFuFdHpL(gt2,i3)
coup2R = cplcFuFdHpR(gt2,i3)
coup3L = cplcFdFucVWpL(i3,gt3)
coup3R = cplcFdFucVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], Fd}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MHp 
ML3 = MFd(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2L = cplcFuFdVWpL(gt2,i3)
coup2R = cplcFuFdVWpR(gt2,i3)
coup3L = cplcFdFucHpL(i3,gt3)
coup3R = cplcFdFucHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[VWp], Fd}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFd)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFuFdVWpL(gt2,i3)
coup2R = cplcFuFdVWpR(gt2,i3)
coup3L = cplcFdFucVWpL(i3,gt3)
coup3R = cplcFdFucVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTocFuFu


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFuFu(MAh,MFd,MFu,Mhh,MHp,MVG,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,        & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2), & 
& cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),  & 
& cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),& 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),   & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, VP, Fu}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
Do i1=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VP, Ah, Fu}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFu)) Then 
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fu}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fu}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVP 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, Fu}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZ 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, Fu}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFu)) Then 
    Do i3=1,6
ML1 = MVZp 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fu], bar[Fu], VG}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVG)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
End if 


! {bar[Fu], bar[Fu], VP}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocFuFu


Subroutine Amplitude_Tree_U1T3R_hhToFvFv(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,               & 
& MFv2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(9),Mhh(2),MFv2(9),Mhh2(2)

Complex(dp), Intent(in) :: cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2)

Complex(dp) :: Amp(2,2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,9
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvhhL(gt2,gt3,gt1)
coupT1R = cplFvFvhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToFvFv


Subroutine Gamma_Real_U1T3R_hhToFvFv(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,             & 
& MFv,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2)

Real(dp), Intent(in) :: MFv(9),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,9,9), GammarealGluon(2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,9
    Do i3=1,9
CoupL = cplFvFvhhL(i2,i3,i1)
CoupR = cplFvFvhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFv(i2)
Mex3 = MFv(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhToFvFv


Subroutine Amplitude_WAVE_U1T3R_hhToFvFv(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,          & 
& ctcplFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFV,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(9),MFv2(9),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2)

Complex(dp), Intent(in) :: ctcplFvFvhhL(9,9,2),ctcplFvFvhhR(9,9,2)

Complex(dp), Intent(in) :: ZfFV(9,9),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,9
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplFvFvhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplFvFvhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplFvFvhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplFvFvhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplFvFvhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt3)*cplFvFvhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt3))*cplFvFvhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToFvFv


Subroutine Amplitude_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,              & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,          & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),   & 
& cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),     & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),             & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZpL(9,9),      & 
& cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),               & 
& cplcFeFvcVWpR(6,9),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),         & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,9
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 


! {Ah, Ah, Fv}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, Fv}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
Do i1=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, Fv}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
Do i1=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, Fv}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopFv)) Then 
Do i1=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVZpR(gt3,i3)
coup3R = -cplFvFvVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Fe, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHp 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3L = cplFvFeHpL(gt3,i2)
coup3R = cplFvFeHpR(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, Fe, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3L = -cplFvFeVWpR(gt3,i2)
coup3R = -cplFvFeVWpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Fv, Ah}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopAh)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3L = cplFvFvAhL(gt3,i2,i3)
coup3R = cplFvFvAhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, hh}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loophh)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3L = cplFvFvhhL(gt3,i2,i3)
coup3R = cplFvFvhhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, VP}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVP)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3L = -cplFvFvVPR(gt3,i2)
coup3R = -cplFvFvVPL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Fv, VZ}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVZ)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3L = -cplFvFvVZR(gt3,i2)
coup3R = -cplFvFvVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Fv, VZp}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVZp)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVZp 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = -cplFvFvVZpR(gt3,i2)
coup3R = -cplFvFvVZpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, Fv}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFv(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplFvFvhhL(gt3,i3,i2)
coup3R = cplFvFvhhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hp, Hp, bar[Fe]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhHpcHp(gt1)
coup2L = cplcFeFvcHpL(i3,gt2)
coup2R = cplcFeFvcHpR(i3,gt2)
coup3L = cplFvFeHpL(gt3,i3)
coup3R = cplFvFeHpR(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, bar[Fe]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2L = cplcFeFvcHpL(i3,gt2)
coup2R = cplcFeFvcHpR(i3,gt2)
coup3L = -cplFvFeVWpR(gt3,i3)
coup3R = -cplFvFeVWpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, Ah, Fv}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
  Do i2=1,2
    Do i3=1,9
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fv}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVP 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fv}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVP 
ML2 = MVZp 
ML3 = MFv(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = -cplFvFvVZpR(gt3,i3)
coup3R = -cplFvFvVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, bar[Fe]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2L = -cplcFeFvcVWpR(i3,gt2)
coup2R = -cplcFeFvcVWpL(i3,gt2)
coup3L = cplFvFeHpL(gt3,i3)
coup3R = cplFvFeHpR(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, bar[Fe]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = -cplcFeFvcVWpR(i3,gt2)
coup2R = -cplcFeFvcVWpL(i3,gt2)
coup3L = -cplFvFeVWpR(gt3,i3)
coup3R = -cplFvFeVWpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
  Do i2=1,2
    Do i3=1,9
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZ 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZ 
ML2 = MVZp 
ML3 = MFv(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = -cplFvFvVZpR(gt3,i3)
coup3R = -cplFvFvVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, Fv}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
  Do i2=1,2
    Do i3=1,9
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, Fv}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZp 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, Fv}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZp 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVZVZp(gt1)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, Fv}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZp 
ML2 = MVZp 
ML3 = MFv(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = -cplFvFvVZpR(gt3,i3)
coup3R = -cplFvFvVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {bar[Fe], bar[Fe], Hp}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHp 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFeHpL(gt2,i1)
coup2R = cplFvFeHpR(gt2,i1)
coup3L = cplcFeFvcHpL(i2,gt3)
coup3R = cplcFeFvcHpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], VWp}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFeVWpL(gt2,i1)
coup2R = cplFvFeVWpR(gt2,i1)
coup3L = cplcFeFvcVWpL(i2,gt3)
coup3R = cplcFeFvcVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {conj[Hp], conj[Hp], Fe}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhHpcHp(gt1)
coup2L = cplFvFeHpL(gt2,i3)
coup2R = cplFvFeHpR(gt2,i3)
coup3L = cplcFeFvcHpL(i3,gt3)
coup3R = cplcFeFvcHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], Fe}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MHp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2L = cplFvFeHpL(gt2,i3)
coup2R = cplFvFeHpR(gt2,i3)
coup3L = cplcFeFvcVWpL(i3,gt3)
coup3R = cplcFeFvcVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], Fe}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MHp 
ML3 = MFe(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2L = cplFvFeVWpL(gt2,i3)
coup2R = cplFvFeVWpR(gt2,i3)
coup3L = cplcFeFvcHpL(i3,gt3)
coup3R = cplcFeFvcHpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[VWp], Fe}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopFe)) Then 
    Do i3=1,6
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplFvFeVWpL(gt2,i3)
coup2R = cplFvFeVWpR(gt2,i3)
coup3L = cplcFeFvcVWpL(i3,gt3)
coup3R = cplcFeFvcVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToFvFv


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToFvFv(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,          & 
& cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,           & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,     & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),   & 
& cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),     & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),             & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZpL(9,9),      & 
& cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),               & 
& cplcFeFvcVWpR(6,9),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),         & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2)

Complex(dp), Intent(out) :: Amp(2,2,9,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,9
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 


! {Ah, VP, Fv}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
Do i1=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Fv, VP}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopVP)) Then 
Do i1=1,9
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3L = -cplFvFvVPR(gt3,i2)
coup3R = -cplFvFvVPL(gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, Fv}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopFv)) Then 
  Do i2=1,2
    Do i3=1,9
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MFv(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvAhL(gt3,i3,i2)
coup3R = cplFvFvAhR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Fv}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVP 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Fv}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVP 
ML2 = MVZp 
ML3 = MFv(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = -cplFvFvVZpR(gt3,i3)
coup3R = -cplFvFvVZpL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, Fv}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZ 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = cplhhVPVZ(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, Fv}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopFv)) Then 
    Do i3=1,9
ML1 = MVZp 
ML2 = MVP 
ML3 = MFv(i3) 
coup1 = cplhhVPVZp(gt1)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = -cplFvFvVPR(gt3,i3)
coup3R = -cplFvFvVPL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToFvFv


Subroutine Amplitude_Tree_U1T3R_hhTohhhh(cplhhhhhh,Mhh,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhhhhh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTohhhh


Subroutine Gamma_Real_U1T3R_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,GammarealPhoton,     & 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Real(dp), Intent(in) :: Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,2), GammarealGluon(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
Coup = cplhhhhhh(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_hhTohhhh


Subroutine Amplitude_WAVE_U1T3R_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: ctcplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhhh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhhhhh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplhhhhhh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhhhhh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTohhhh


Subroutine Amplitude_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,   & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),           & 
& cplcFuFuhhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),& 
& cplcgZgZhh(2),cplcgZpgZhh(2),cplcgZgZphh(2),cplcgZpgZphh(2),cplhhhhhh(2,2,2),          & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplAhAhhhhh1(2,2,2,2),cplhhhhhhhh1(2,2,2,2), & 
& cplhhhhHpcHp1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhhhcVWpVWp1(2,2),          & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = -cplAhhhVP(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VZ, VP}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, VP}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VP, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, Ah, VZp}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZp(i1,gt2)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VP, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZp(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVZp(i1,gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gZ, gZ, gZ}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gZ, gZp, gZ}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gZp}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgZp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgZphh(gt2)
coup3 = cplcgZpgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZp, gZp}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgZphh(gt2)
coup3 = cplcgZpgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZ, gZ}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgZhh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZp, gZ}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZpgZhh(gt2)
coup3 = cplcgZgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZ, gZp}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgZp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgZphh(gt2)
coup3 = cplcgZpgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZp, gZp}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZpgZphh(gt2)
coup3 = cplcgZpgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplhhcHpVWp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = -cplhhcHpVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, Ah}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Ah}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Ah}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, Ah, VZ}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, VZp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplhhHpcVWp(gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHpcVWp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, VP}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = -cplAhhhVP(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VZ, VP}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VP}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VP, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VP, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, Ah}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplAhhhVZp(i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, Ah}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, Ah}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZp(i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, Ah}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplAhhhVZp(i3,gt2)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, VP}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = -cplAhhhVP(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VZ, VP}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VP}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, VZ}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VP, VZ}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, VZ}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VZ}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplhhVZpVZp(gt2)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VP, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZpVZp(gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVZpVZp(gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZp], bar[gZ]}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZpgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gZp]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgZp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZpgZhh(gt2)
coup3 = cplcgZgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZp], bar[gZp]}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgZhh(gt2)
coup3 = cplcgZpgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZ], bar[gZ]}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgZ)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgZphh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZp], bar[gZ]}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgZ)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZgZphh(gt2)
coup3 = cplcgZpgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZ], bar[gZp]}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgZp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZpgZphh(gt2)
coup3 = cplcgZgZphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplhhHpcVWp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplhhHpcVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = -cplhhcHpVWp(gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhcHpVWp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhhhh1(i1,i2,gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhhhHpcHp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhhhVPVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhhhVPVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhhhcVWpVWp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhhhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhhhVZVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhhhVZpVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhhhh1(i1,i2,gt1,gt3)
coup2 = cplAhAhhh(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt3,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhhhHpcHp1(gt1,gt3)
coup2 = cplhhHpcHp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,gt3)
coup2 = cplhhVPVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,gt3)
coup2 = cplhhVPVZp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,gt3)
coup2 = cplhhcVWpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt3)
coup2 = cplhhVZVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,gt3)
coup2 = cplhhVZVZp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,gt3)
coup2 = cplhhVZpVZp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhhhh1(i1,i2,gt1,gt2)
coup2 = cplAhAhhh(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhhhHpcHp1(gt1,gt2)
coup2 = cplhhHpcHp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,gt2)
coup2 = cplhhVPVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,gt2)
coup2 = cplhhVPVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,gt2)
coup2 = cplhhcVWpVWp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt2)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,gt2)
coup2 = cplhhVZVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,gt2)
coup2 = cplhhVZpVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTohhhh


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,   & 
& cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,      & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpcHp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhcVWpVWp1,    & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),           & 
& cplcFuFuhhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),& 
& cplcgZgZhh(2),cplcgZpgZhh(2),cplcgZgZphh(2),cplcgZpgZphh(2),cplhhhhhh(2,2,2),          & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplAhAhhhhh1(2,2,2,2),cplhhhhhhhh1(2,2,2,2), & 
& cplhhhhHpcHp1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhhhcVWpVWp1(2,2),          & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, VP, Ah}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhAhhh(i1,i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = -cplAhhhVP(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VZ, VP}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, VP}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVP(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VP, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZ(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VP, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, Ah, Ah}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = cplAhAhhh(i3,i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, Ah}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = -cplAhhhVZ(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, Ah}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(i3,gt2)
coup3 = -cplAhhhVZp(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, Ah, VZ}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = -cplAhhhVZ(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVZVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVZVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, VZp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = -cplAhhhVZp(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVZVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVZpVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, Ah}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVZ(i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, Ah, VP}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = -cplAhhhVP(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VZ, VP}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VP}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZ(gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, Ah}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVZp(i3,gt2)
coup3 = -cplAhhhVP(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, VP}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = -cplAhhhVP(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VZ, VP}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VP}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVPVZp(gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, VZ}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZVZp(gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhhhVPVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhhhVPVZp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,gt3)
coup2 = cplhhVPVZ(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,gt3)
coup2 = cplhhVPVZp(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,gt2)
coup2 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,gt2)
coup2 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhhh


Subroutine Amplitude_Tree_U1T3R_hhTocHpHp(cplhhHpcHp,Mhh,MHp,Mhh2,MHp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHp,Mhh2(2),MHp2

Complex(dp), Intent(in) :: cplhhHpcHp(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MHp 
! Tree-Level Vertex 
coupT1 = cplhhHpcHp(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTocHpHp


Subroutine Gamma_Real_U1T3R_hhTocHpHp(MLambda,em,gs,cplhhHpcHp,Mhh,MHp,               & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpcHp(2)

Real(dp), Intent(in) :: Mhh(2),MHp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhHpcHp(i1)
Mex1 = Mhh(i1)
Mex2 = MHp
Mex3 = MHp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1),kont)
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhTocHpHp


Subroutine Amplitude_WAVE_U1T3R_hhTocHpHp(cplhhHpcHp,ctcplhhHpcHp,Mhh,Mhh2,           & 
& MHp,MHp2,Zfhh,ZfHp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHp,MHp2

Complex(dp), Intent(in) :: cplhhHpcHp(2)

Complex(dp), Intent(in) :: ctcplhhHpcHp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHp

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MHp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpcHp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHpcHp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHp)*cplhhHpcHp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHp*cplhhHpcHp(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTocHpHp


Subroutine Amplitude_VERTEX_U1T3R_hhTocHpHp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,              & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,        & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,              & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp1,cplhhhhHpcHp1,cplhhHpcVWpVP1,       & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,          & 
& cplHpHpcHpcHp1,cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,            & 
& cplHpcHpVZVZp1,cplHpcHpVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcgWpgWphh(2),cplcgZgWpcHp,    & 
& cplcgZpgWpcHp,cplcgWCgWChh(2),cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),   & 
& cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp,    & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,    & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp1(2,2),cplhhhhHpcHp1(2,2),cplhhHpcVWpVP1(2),      & 
& cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),              & 
& cplhhcHpVWpVZp1(2),cplHpHpcHpcHp1,cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,       & 
& cplHpcHpVZVZ1,cplHpcHpVZVZp1,cplHpcHpVZpVZp1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MHp 


! {Ah, Ah, VWp}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhcHpVWp(i1)
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VP, VWp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhcHpVWp(i1)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ, VWp}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhcHpVWp(i1)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, VWp}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhcHpVWp(i1)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFucHpL(i1,i3)
coup2R = cplcFdFucHpR(i1,i3)
coup3L = cplcFuFdHpL(i3,i2)
coup3R = cplcFuFdHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvcHpL(i1,i3)
coup2R = cplcFeFvcHpR(i1,i3)
coup3L = cplFvFeHpL(i3,i2)
coup3R = cplFvFeHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, bar[Fe]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvcHpL(i3,i1)
coup2R = cplcFeFvcHpR(i3,i1)
coup3L = cplFvFeHpL(i2,i3)
coup3R = cplFvFeHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWpC, gWpC, gZ}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZcHp
coup3 = cplcgZgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gZp}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZpcHp
coup3 = cplcgZpgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpcHp
coup3 = cplcgWpgZHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZp, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgWpcHp
coup3 = cplcgWpgZpHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZ, gWp}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgWpcHp
coup3 = cplcgWpgZHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZp, gWp}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZpgWpcHp
coup3 = cplcgWpgZpHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, Hp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpcHp(i1)
coup3 = cplhhHpcHp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VWp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcHpVWp(i1)
coup3 = -cplhhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, VZ, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, VWp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplcHpVPVWp
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplcHpVWpVZ
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VP, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplcHpVWpVZp
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VP, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucHpL(i3,i1)
coup2R = cplcFdFucHpR(i3,i1)
coup3L = cplcFuFdHpL(i2,i3)
coup3R = cplcFuFdHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWp], bar[gWp], bar[gZ]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZgWpcHp
coup3 = cplcgWpgZHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWp], bar[gWp], bar[gZp]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZpgWpcHp
coup3 = cplcgWpgZpHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWCgZcHp
coup3 = cplcgZgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZp], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgWCgZcHp
coup3 = cplcgZpgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgWCgZpcHp
coup3 = cplcgZgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZp], bar[gWpC]}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgWCgZpcHp
coup3 = cplcgZpgWCHp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhHpcHp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcHp(i3)
coup3 = -cplhhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], Ah}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = MAh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHpVWp(i3)
coup3 = -cplAhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(i3)
coup3 = cplhhHpcHp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[VWp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHpVWp(i3)
coup3 = -cplhhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhHpcHp1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhHpcHp1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpHpcHpcHp1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVPVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVPVZp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpcHpVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcHpVZVZp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplHpcHpVZpVZp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, Hp}
If ((Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MHp 
coup1 = cplhhhhHpcHp1(gt1,i1)
coup2 = cplhhHpcHp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VP, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {VZp, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, conj[Hp]}
If ((Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MHp 
coup1 = cplhhhhHpcHp1(gt1,i1)
coup2 = cplhhHpcHp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VP, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVZ 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, VZp}
If ((Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MVZp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTocHpHp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocHpHp(MAh,MFd,MFe,MFu,MFv,Mhh,               & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgWpgWphh,cplcgZgWpcHp,cplcgZpgWpcHp,cplcgWCgWChh,        & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcHp,              & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcHp,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp1,cplhhhhHpcHp1,cplhhHpcVWpVP1,       & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,          & 
& cplHpHpcHpcHp1,cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,            & 
& cplHpcHpVZVZp1,cplHpcHpVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),& 
& cplcFuFuhhR(6,6,2),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcgWpgWphh(2),cplcgZgWpcHp,    & 
& cplcgZpgWpcHp,cplcgWCgWChh(2),cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),   & 
& cplcgWpgZHp,cplcgWCgZcHp,cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcHp,    & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,    & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplAhAhHpcHp1(2,2),cplhhhhHpcHp1(2,2),cplhhHpcVWpVP1(2),      & 
& cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),              & 
& cplhhcHpVWpVZp1(2),cplHpHpcHpcHp1,cplHpcHpVPVZ1,cplHpcHpVPVZp1,cplHpcHpcVWpVWp1,       & 
& cplHpcHpVZVZ1,cplHpcHpVZVZp1,cplHpcHpVZpVZp1

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MHp 


! {Ah, VP, VWp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = cplAhcHpVWp(i1)
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, VZ, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVZ
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVZp
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, VWp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplcHpVPVWp
coup3 = -cplAhHpcVWp(i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZp
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVPVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVPVZp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 


! {VP, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocHpHp


Subroutine Amplitude_Tree_U1T3R_hhToHpcVWp(cplhhHpcVWp,Mhh,MHp,MVWp,Mhh2,             & 
& MHp2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHp,MVWp,Mhh2(2),MHp2,MVWp2

Complex(dp), Intent(in) :: cplhhHpcVWp(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhHpcVWp(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToHpcVWp


Subroutine Gamma_Real_U1T3R_hhToHpcVWp(MLambda,em,gs,cplhhHpcVWp,Mhh,MHp,             & 
& MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHpcVWp(2)

Real(dp), Intent(in) :: Mhh(2),MHp,MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhHpcVWp(i1)
Mex1 = Mhh(i1)
Mex2 = MHp
Mex3 = MVWp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,-1._dp,Coup,Gammarealphoton(i1),kont)
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhToHpcVWp


Subroutine Amplitude_WAVE_U1T3R_hhToHpcVWp(cplhhHpcVWp,ctcplhhHpcVWp,Mhh,             & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,Zfhh,ZfHp,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhHpcVWp(2)

Complex(dp), Intent(in) :: ctcplhhHpcVWp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHp,ZfVWp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHpcVWp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHpcVWp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHp*cplhhHpcVWp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhHpcVWp(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToHpcVWp


Subroutine Amplitude_VERTEX_U1T3R_hhToHpcVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,             & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,        & 
& cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,           & 
& cplcgZpgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh,cplcgZpgZhh,           & 
& cplcgWpgZHp,cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpHp,cplcgWCgZpcVWp,        & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,        & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhHpcVWpVP1,       & 
& cplAhHpcVWpVZ1,cplAhHpcVWpVZp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,          & 
& cplhhHpcVWpVZp1,cplHpcHpcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplcFdFdhhL(6,6,2),      & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplFvFeHpL(9,6),cplFvFeHpR(9,6),  & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),             & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAHp,        & 
& cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh(2),            & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZHp,cplcgWCgZcVWp,       & 
& cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcVWp,cplhhhhhh(2,2,2),           & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,           & 
& cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& cplAhHpcVWpVP1(2),cplAhHpcVWpVZ1(2),cplAhHpcVWpVZp1(2),cplhhhhcVWpVWp1(2,2),           & 
& cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplHpcHpcVWpVWp1

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MVWp 


! {Ah, VP, conj[VWp]}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = -cplAhHpcVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ, conj[VWp]}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = -cplAhHpcVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, conj[VWp]}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = -cplAhHpcVWp(i1)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fu, Fu, Fd}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = -cplcFdFucVWpR(i3,i2)
coup3R = -cplcFdFucVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fe}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFeHpL(i1,i3)
coup2R = cplFvFeHpR(i1,i3)
coup3L = -cplcFeFvcVWpR(i3,i2)
coup3R = -cplcFeFvcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gP}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgAHp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWp, gWp, gZ}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgZHp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWp, gWp, gZp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgZpHp
coup3 = cplcgZpgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWpC}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWCHp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZp, gWpC}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgWCHp
coup3 = cplcgWCgZpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZ, gWpC}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgWCHp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZp, gWpC}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZpgWCHp
coup3 = cplcgWCgZpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, conj[Hp]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpcHp(i1)
coup3 = -cplhhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplhhHpcVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, VWp, hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Hp, Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplHpcHpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VZp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VZp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplHpcHpVP
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Ah}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MHp 
ML3 = MAh(i3) 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplAhHpcVWp(i3)
coup3 = cplAhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplhhHpcVWp(i3)
coup3 = cplhhHpcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, VWp, hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHpcVWp(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VZp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VZp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplHpcHpVZ
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VP, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, conj[VWp]}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, conj[VWp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, conj[VWp]}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcVWpVZ
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, conj[Hp]}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplHpcHpVZp
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VP, conj[Hp]}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, conj[Hp]}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, conj[Hp]}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, conj[VWp]}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, conj[VWp]}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, conj[VWp]}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fd], bar[Fd], bar[Fu]}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdHpL(i3,i1)
coup2R = cplcFuFdHpR(i3,i1)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[Fe], bar[Fe], Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFeHpL(i3,i1)
coup2R = cplFvFeHpR(i3,i1)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWpC], bar[gWpC], bar[gZ]}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgZgWCHp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWpC], bar[gWpC], bar[gZp]}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgZpgWCHp
coup3 = cplcgWCgZpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWp]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWpgZHp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWp]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpgZHp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZp], bar[gWp]}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgWpgZHp
coup3 = cplcgZpgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gP], bar[gWp]}
If ((Include_in_loopgZp).and.(Include_in_loopgA).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZpgAhh(gt1)
coup2 = cplcgWpgZpHp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZ], bar[gWp]}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgWpgZpHp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZp], bar[gWp]}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgWpgZpHp
coup3 = cplcgZpgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhHpcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhHpcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhHpcVWpVZp1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
coup2 = -cplhhHpcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplHpcHpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVZ 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplHpcHpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZp}
If ((Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MVZp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplHpcHpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToHpcVWp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToHpcVWp(MAh,MFd,MFe,MFu,MFv,Mhh,              & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcgZgAhh,cplcgZpgAhh,cplcgWpgAHp,cplcgWpgWphh,cplcgAgWpcVWp,           & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh,cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh,         & 
& cplcgZpgZhh,cplcgWpgZHp,cplcgWCgZcVWp,cplcgZgZphh,cplcgZpgZphh,cplcgWpgZpHp,           & 
& cplcgWCgZpcVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,      & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,       & 
& cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhHpcVWpVZp1,cplhhhhcVWpVWp1,cplhhHpcVWpVP1,          & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplHpcHpcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplcFdFdhhL(6,6,2),      & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplFvFeHpL(9,6),cplFvFeHpR(9,6),  & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),             & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAHp,        & 
& cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh(2),            & 
& cplcgZgWCHp,cplcgZpgWCHp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZHp,cplcgWCgZcVWp,       & 
& cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpHp,cplcgWCgZpcVWp,cplhhhhhh(2,2,2),           & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,           & 
& cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,          & 
& cplAhHpcVWpVP1(2),cplAhHpcVWpVZ1(2),cplAhHpcVWpVZp1(2),cplhhhhcVWpVWp1(2,2),           & 
& cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplHpcHpcVWpVWp1

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHp 
Mex3 = MVWp 


! {Ah, VP, conj[VWp]}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplAhhhVP(i1,gt1)
coup2 = -cplAhHpcVWp(i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplHpcHpVP
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplHpcHpVP
coup3 = -cplAhHpcVWp(i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZ
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, conj[Hp]}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZp
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVWpVZ
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, conj[VWp]}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVWpVZp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, conj[Hp]}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, conj[VWp]}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, conj[Hp]}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVP
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, conj[VWp]}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhHpcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplHpcHpVP
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToHpcVWp


Subroutine Amplitude_Tree_U1T3R_hhTocVWpVWp(cplhhcVWpVWp,Mhh,MVWp,Mhh2,               & 
& MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVWp,Mhh2(2),MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhcVWpVWp(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhTocVWpVWp


Subroutine Gamma_Real_U1T3R_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,Mhh,               & 
& MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Real(dp), Intent(in) :: Mhh(2),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhcVWpVWp(i1)
Mex1 = Mhh(i1)
Mex2 = MVWp
Mex3 = MVWp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealGluon(i1) = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1),kont)
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhTocVWpVWp


Subroutine Amplitude_WAVE_U1T3R_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp,              & 
& Mhh,Mhh2,MVWp,MVWp2,Zfhh,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Complex(dp), Intent(in) :: ctcplhhcVWpVWp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVWp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcVWpVWp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhcVWpVWp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWp)*cplhhcVWpVWp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhcVWpVWp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTocVWpVWp


Subroutine Amplitude_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
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
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),& 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),           & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),             & 
& cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh(2),               & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh(2),cplcgAgWCVWp,               & 
& cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZVWp,cplcgWCgZcVWp,    & 
& cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh(2,2,2),          & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,        & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhcVWpVWp1(2,2),cplhhhhcVWpVWp1(2,2),cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),         & 
& cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q, & 
& cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,           & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,& 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,             & 
& cplcVWpVWpVZpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 


! {Ah, Ah, Hp}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhHpcVWp(i1)
coup3 = -cplAhcHpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Ah, VP, Hp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MHp 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhHpcVWp(i1)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ, Hp}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = MHp 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhHpcVWp(i1)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp, Hp}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = MHp 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhHpcVWp(i1)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, Fd, Fu}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFucVWpR(i1,i3)
coup2R = -cplcFdFucVWpL(i1,i3)
coup3L = -cplcFuFdVWpR(i3,i2)
coup3R = -cplcFuFdVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fv}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFvcVWpR(i1,i3)
coup2R = -cplcFeFvcVWpL(i1,i3)
coup3L = -cplFvFeVWpR(i3,i2)
coup3R = -cplFvFeVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, bar[Fe]}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplcFeFvcVWpL(i3,i1)
coup2R = cplcFeFvcVWpR(i3,i1)
coup3L = cplFvFeVWpL(i2,i3)
coup3R = cplFvFeVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gP, gZ, gWp}
If ((Include_in_loopgA).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gP, gZp, gWp}
If ((Include_in_loopgA).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgAhh(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgZpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gP}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgAcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gZ}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gWpC, gWpC, gZp}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZpcVWp
coup3 = cplcgZpgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZ, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZ, gZp, gWp}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZ, gWp}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgZpgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {gZp, gZp, gWp}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgZpgWpcVWp
coup3 = cplcgWpgZpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, hh, Hp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHpcVWp(i1)
coup3 = -cplhhcHpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VWp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcVWpVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, Hp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplHpcVWpVP
coup3 = -cplAhcHpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplHpcVWpVZ
coup3 = -cplAhcHpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZ, VP, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcVWpVWpVZ
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWpVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZp, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplcVWpVWpVZ
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, Ah, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplAhcHpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VZp, VP, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZ, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[Fu], bar[Fu], bar[Fd]}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucVWpL(i3,i1)
coup2R = cplcFdFucVWpR(i3,i1)
coup3L = cplcFuFdVWpL(i2,i3)
coup3R = cplcFuFdVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
End if 


! {bar[gWp], bar[gWp], bar[gP]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgA)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgAVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWp], bar[gWp], bar[gZ]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gWp], bar[gWp], bar[gZp]}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZpgWpcVWp
coup3 = cplcgWpgZpVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gP], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgA).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZ], bar[gZp], bar[gWpC]}
If ((Include_in_loopgZ).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZ 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZgZphh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgZpgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gP], bar[gWpC]}
If ((Include_in_loopgZp).and.(Include_in_loopgA).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZpgAhh(gt1)
coup2 = cplcgWCgZpcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZ], bar[gWpC]}
If ((Include_in_loopgZp).and.(Include_in_loopgZ).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZpgZhh(gt1)
coup2 = cplcgWCgZpcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {bar[gZp], bar[gZp], bar[gWpC]}
If ((Include_in_loopgZp).and.(Include_in_loopgZp).and.(Include_in_loopgWC)) Then 
ML1 = MVZp 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplcgZpgZphh(gt1)
coup2 = cplcgWCgZpcVWp
coup3 = cplcgZpgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], Ah}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MHp 
ML3 = MAh(i3) 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplAhHpcVWp(i3)
coup3 = cplAhcHpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], hh}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplhhHpcVWp(i3)
coup3 = cplhhcHpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], hh}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MHp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcHpVWp(gt1)
coup2 = -cplhhHpcVWp(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZ}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VZp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVZp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VZp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhcHpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[VWp], hh}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZ 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZ}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VZp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVZp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VZp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhcVWpVWp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhcVWpVWp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcVWpVPVWpVZp1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZp2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpcVWpVWpVWp1Q
coup2b = coup2 
coup2 = cplcVWpcVWpVWpVWp2Q
coup2a = coup2 
coup2 = cplcVWpcVWpVWpVWp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VZ}
If ((Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {VZ, VZp}
If ((Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplhhVZVZp(gt1)
coup2 = cplcVWpVWpVZVZp1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZp2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VZp}
If ((Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplcVWpVWpVZpVZp1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZpVZp2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZpVZp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
End if 


! {hh, VWp}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
coup2 = cplhhcVWpVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {VP, Hp}
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VZ, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VZp, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, conj[VWp]}
If ((Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
coup2 = cplhhcVWpVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZ}
If ((Include_in_loopHp).and.(Include_in_loopVZ)) Then 
ML1 = MHp 
ML2 = MVZ 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VZp}
If ((Include_in_loopHp).and.(Include_in_loopVZp)) Then 
ML1 = MHp 
ML2 = MVZp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTocVWpVWp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp(MAh,MFd,MFe,MFu,MFv,Mhh,             & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,    & 
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
& cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),& 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),           & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),             & 
& cplcgZgAhh(2),cplcgZpgAhh(2),cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh(2),               & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgWChh(2),cplcgAgWCVWp,               & 
& cplcgZgWCVWp,cplcgZpgWCVWp,cplcgZgZhh(2),cplcgZpgZhh(2),cplcgWpgZVWp,cplcgWCgZcVWp,    & 
& cplcgZgZphh(2),cplcgZpgZphh(2),cplcgWpgZpVWp,cplcgWCgZpcVWp,cplhhhhhh(2,2,2),          & 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,        & 
& cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhcVWpVWp1(2,2),cplhhhhcVWpVWp1(2,2),cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),         & 
& cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpcVWpVWp1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZp3Q, & 
& cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,           & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZp3Q,& 
& cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,             & 
& cplcVWpVWpVZpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 


! {Ah, VP, Hp}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = MHp 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhHpcVWp(i1)
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, Ah, Hp}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
  Do i2=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = MHp 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplHpcVWpVP
coup3 = -cplAhcHpVWp(i2)
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End if 


! {VP, VZ, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, Hp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZp
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcVWpVWpVZ
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp, VWp}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
ML1 = MVP 
ML2 = MVZp 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcVWpVWpVZp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, Hp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZ, VP, VWp}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcVWpVWpVZ
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, Hp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MHp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VZp, VP, VWp}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
ML1 = MVZp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], VP}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], VP}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVP 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], VP}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZ}
If ((Include_in_loopVP).and.(Include_in_loopVZ)) Then 
ML1 = MVP 
ML2 = MVZ 
coup1 = cplhhVPVZ(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2c = coup2 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, VZp}
If ((Include_in_loopVP).and.(Include_in_loopVZp)) Then 
ML1 = MVP 
ML2 = MVZp 
coup1 = cplhhVPVZp(gt1)
coup2 = cplcVWpVPVWpVZp1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZp2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZp3Q
coup2c = coup2 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Hp}
If ((Include_in_loopVP).and.(Include_in_loopHp)) Then 
ML1 = MVP 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {Hp, VP}
If ((Include_in_loopHp).and.(Include_in_loopVP)) Then 
ML1 = MHp 
ML2 = MVP 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTocVWpVWp


Subroutine Amplitude_Tree_U1T3R_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVZ,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZ(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToVZVZ


Subroutine Gamma_Real_U1T3R_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,GammarealPhoton, & 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Real(dp), Intent(in) :: Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhVZVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MVZ
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhToVZVZ


Subroutine Amplitude_WAVE_U1T3R_hhToVZVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,              & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVPVZ,ZfVZ,ZfVZpVZ,ZfVZVP,              & 
& ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVPVZ,ZfVZ,ZfVZpVZ,ZfVZVP,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplhhVPVZ(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplhhVZVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVZVZ


Subroutine Amplitude_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,              & 
& cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,   & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),               & 
& cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),               & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),          & 
& cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),               & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1(2,2),      & 
& cplhhhhVPVZ1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVZ1(2),              & 
& cplhhcHpVWpVZ1(2),cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,i3)
coup2R = -cplcFeFeVZL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,i3)
coup2R = -cplcFuFuVZL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVZR(i1,i3)
coup2R = -cplFvFvVZL(i1,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVZ
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVZ
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZ(i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZp(i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVZ
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZ(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZ(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVZVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVWpVZ
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcVWpVWpVZ
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVZVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1,              & 
& cplhhhhVPVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,cplHpcHpVZVZ1,   & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),               & 
& cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),               & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),          & 
& cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),               & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ1(2,2),      & 
& cplhhhhVPVZ1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVZ1(2),              & 
& cplhhcHpVWpVZ1(2),cplHpcHpVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZ(i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZ(i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZ(i3)
coup3 = -cplAhhhVZ(i2,i3)
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZVZ


Subroutine Amplitude_Tree_U1T3R_hhToVZpVZ(cplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,               & 
& MVZ2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVZ,MVZp,Mhh2(2),MVZ2,MVZp2

Complex(dp), Intent(in) :: cplhhVZVZp(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZp(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToVZpVZ


Subroutine Gamma_Real_U1T3R_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,Mhh,MVZ,               & 
& MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZp(2)

Real(dp), Intent(in) :: Mhh(2),MVZ,MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhVZVZp(i1)
Mex1 = Mhh(i1)
Mex2 = MVZp
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhToVZpVZ


Subroutine Amplitude_WAVE_U1T3R_hhToVZpVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,             & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZ,ZfVZ,ZfVZp,            & 
& ZfVZpVP,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVPVZ,ZfVZ,ZfVZp,ZfVZpVP,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZVZp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplhhVZVZp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplhhVPVZp(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZp(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplhhVZpVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVZpVZ


Subroutine Amplitude_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,              & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,          & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,    & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,          & 
& cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVZ,               & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZ,            & 
& cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1(2,2),cplhhhhVPVZ1(2,2),          & 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),           & 
& cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZpR(i1,i3)
coup2R = -cplcFdFdVZpL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZpR(i1,i3)
coup2R = -cplcFeFeVZpL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZpR(i1,i3)
coup2R = -cplcFuFuVZpL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVZpR(i1,i3)
coup2R = -cplFvFvVZpL(i1,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVZp
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVZp
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZp(i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZp(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZpVZp(i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVZp
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVZp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVZVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZVZp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVWpVZVZp1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZp2Q
coup2c = coup2 
coup2 = cplcVWpVWpVZVZp3Q
coup2b = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZpVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVZpVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ(MAh,MFd,MFe,MFu,MFv,Mhh,               & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,    & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh,          & 
& cplcgWCgWCVZ,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZ,cplHpcVWpVZ,      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZ,cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhVZVZp1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,    & 
& cplhhHpcVWpVZ1,cplhhHpcVWpVZp1,cplhhcHpVWpVZ1,cplhhcHpVWpVZp1,cplHpcHpVZVZp1,          & 
& cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVZ,               & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZ,            & 
& cplcVWpVWpVZ,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZVZp1(2,2),cplhhhhVPVZ1(2,2),          & 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),           & 
& cplhhHpcVWpVZ1(2),cplhhHpcVWpVZp1(2),cplhhcHpVWpVZ1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpVZVZp1,cplcVWpVWpVZVZp3Q,cplcVWpVWpVZVZp2Q,cplcVWpVWpVZVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZ 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZp(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZ(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZpVZ


Subroutine Amplitude_Tree_U1T3R_hhToVZpVZp(cplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVZp,Mhh2(2),MVZp2

Complex(dp), Intent(in) :: cplhhVZpVZp(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = cplhhVZpVZp(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_U1T3R_hhToVZpVZp


Subroutine Gamma_Real_U1T3R_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,Mhh,MVZp,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZpVZp(2)

Real(dp), Intent(in) :: Mhh(2),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhVZpVZp(i1)
Mex1 = Mhh(i1)
Mex2 = MVZp
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_U1T3R_hhToVZpVZp


Subroutine Amplitude_WAVE_U1T3R_hhToVZpVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,            & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVPVZp,ZfVZp,ZfVZpVP,        & 
& ZfVZpVZ,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVPVZp,ZfVZp,ZfVZpVP,ZfVZpVZ,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZpVZp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZpVZp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplhhVZpVZp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZp*cplhhVPVZp(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplhhVZVZp(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplhhVZpVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVZpVZp


Subroutine Amplitude_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,             & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,            & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,             & 
& cplhhcHpVWpVZp1,cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFehhL(6,6,2),             & 
& cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),             & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZp,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),           & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1(2,2),& 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),cplhhHpcVWpVZp1(2),          & 
& cplhhcHpVWpVZp1(2),cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,              & 
& cplcVWpVWpVZpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZp 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZpR(i1,i3)
coup2R = -cplcFdFdVZpL(i1,i3)
coup3L = -cplcFdFdVZpR(i3,i2)
coup3R = -cplcFdFdVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZpR(i1,i3)
coup2R = -cplcFeFeVZpL(i1,i3)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZpR(i1,i3)
coup2R = -cplcFuFuVZpL(i1,i3)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVZpR(i1,i3)
coup2R = -cplFvFvVZpL(i1,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVZp
coup3 = cplcgWpgWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVZp
coup3 = cplcgWCgWCVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZp(i3,i1)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZp(i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZpVZp(i1)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVZp
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVZVZp(i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVZp
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVWpVZp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcVWpVWpVZp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVZpVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZpVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVZpVZp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVWpVZpVZp1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZpVZp2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZpVZp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,i1)
coup2 = cplhhVZpVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,i1)
coup2 = cplhhVZpVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVZpVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp(MAh,MFd,MFe,MFu,MFv,Mhh,              & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhhhhh,           & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,            & 
& cplAhAhVZpVZp1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpcVWpVZp1,             & 
& cplhhcHpVWpVZp1,cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,cplcVWpVWpVZpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFehhL(6,6,2),             & 
& cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),             & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),              & 
& cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2),cplcgWpgWpVZp,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),           & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),  & 
& cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVZpVZp1(2,2),& 
& cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),cplhhHpcVWpVZp1(2),          & 
& cplhhcHpVWpVZp1(2),cplHpcHpVZpVZp1,cplcVWpVWpVZpVZp2Q,cplcVWpVWpVZpVZp3Q,              & 
& cplcVWpVWpVZpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZp 
Mex3 = MVZp 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVZp(i1,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {hh, hh, VP}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZp(i2,i3)
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZpVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVZVZp(i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVZpVZp(i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVZpVZp


Subroutine Amplitude_WAVE_U1T3R_hhToAhhh(MAh,MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: ZfAh(2,2),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = Mhh(gt3) 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp(gt1, gt2, gt3) = 0._dp
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToAhhh


Subroutine Amplitude_VERTEX_U1T3R_hhToAhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVWp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,   & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MAh2(2),MFd2(6),MFe2(6),           & 
& MFu2(6),MFv2(9),Mhh2(2),MHp2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),          & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),             & 
& cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),      & 
& cplcFdFdhhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),           & 
& cplcFuFuhhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),& 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = Mhh(gt3) 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh(gt2)
coup3 = cplcgWpgWphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh(gt2)
coup3 = cplcgWCgWChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplhhcHpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = -cplAhHpcVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhcHpVWp(gt2)
coup3 = cplhhHpcVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End if 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToAhhh


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhhh(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVWp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,   & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcgWpgWphh,cplcgWCgWChh,               & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MAh2(2),MFd2(6),MFe2(6),           & 
& MFu2(6),MFv2(9),Mhh2(2),MHp2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),          & 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),             & 
& cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),      & 
& cplcFdFdhhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),           & 
& cplcFuFuhhR(6,6,2),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplcgWpgWphh(2),cplcgWCgWChh(2),& 
& cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhhh


Subroutine Amplitude_WAVE_U1T3R_hhToAhVP(cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& ctcplAhhhVP,ctcplAhhhVZ,ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,ZfAh,Zfhh,             & 
& ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),Mhh(2),Mhh2(2),MVP,MVP2

Complex(dp), Intent(in) :: cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ctcplAhhhVP(2,2),ctcplAhhhVZ(2,2),ctcplAhhhVZp(2,2)

Complex(dp), Intent(in) :: ZfAh(2,2),Zfhh(2,2),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt2)*cplAhhhVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplAhhhVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToAhVP


Subroutine Amplitude_VERTEX_U1T3R_hhToAhVP(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,      & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1,cplAhAhVPVZ1,             & 
& cplAhAhVPVZp1,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,   & 
& cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVPL(9,9), & 
& cplFvFvVPR(9,9),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,             & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1(2,2),cplAhAhVPVZ1(2,2),   & 
& cplAhAhVPVZp1(2,2),cplAhHpcVWpVP1(2),cplAhcHpVPVWp1(2),cplhhhhVPVP1(2,2),              & 
& cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhHpcVWpVP1(2),cplhhcHpVPVWp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i1,gt1)
coup2 = cplAhAhhh(gt2,i1,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3,gt2)
coup2R = cplcFdFdAhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3,gt2)
coup2R = cplcFeFeAhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3,gt2)
coup2R = cplcFuFuAhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvAhL(i1,i3,gt2)
coup2R = cplFvFvAhR(i1,i3,gt2)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh(gt2)
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh(gt2)
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(gt2,i3,i1)
coup3 = cplAhhhVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(gt2,i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZp(gt2,i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(i2,gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZ(gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZp(i2,gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplAhhhVZp(gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWp(gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHpVWp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZ}
If ((Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhAhVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Ah, VZp}
If ((Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhAhVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplAhcHpVPVWp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplAhHpcVWpVP1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplAhhhVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplAhhhVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplAhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplAhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToAhVP


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVP(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWphh,      & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,               & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1,cplAhAhVPVZ1,             & 
& cplAhAhVPVZp1,cplAhHpcVWpVP1,cplAhcHpVPVWp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,   & 
& cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),            & 
& cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),            & 
& cplFvFvAhR(9,9,2),cplcgWpgWpAh(2),cplcgWCgWCAh(2),cplAhhhVP(2,2),cplAhhhVZ(2,2),       & 
& cplAhhhVZp(2,2),cplAhHpcVWp(2),cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),   & 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVPL(9,9), & 
& cplFvFvVPR(9,9),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,             & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1(2,2),cplAhAhVPVZ1(2,2),   & 
& cplAhAhVPVZp1(2,2),cplAhHpcVWpVP1(2),cplAhcHpVPVWp1(2),cplhhhhVPVP1(2,2),              & 
& cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhHpcVWpVP1(2),cplhhcHpVPVWp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh(gt2) 
Mex3 = MVP 


! {VP, Ah, hh}
If ((Include_in_loopVP).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhVP(i2,gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VP, VZ, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VP, VZp, hh}
If ((Include_in_loopVP).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVP 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplAhhhVP(gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {Ah, VP}
If ((Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = MAh(i1) 
ML2 = MVP 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhAhVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplAhhhVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToAhVP


Subroutine Amplitude_WAVE_U1T3R_hhTohhVP(Mhh,Mhh2,MVP,MVP2,Zfhh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTohhVP


Subroutine Amplitude_VERTEX_U1T3R_hhTohhVP(MFd,MFe,MFu,MFv,Mhh,MHp,MVP,               & 
& MVWp,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,              & 
& cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MFd2(6),MFe2(6),MFu2(6),              & 
& MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),               & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWphh(2),   & 
& cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2), & 
& cplhhcVWpVWp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1(2),     & 
& cplhhcHpVPVWp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplhhcHpVPVWp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWpVP1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplhhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplhhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTohhVP


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVP(MFd,MFe,MFu,MFv,Mhh,MHp,MVP,            & 
& MVWp,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,              & 
& cplhhHpcVWpVP1,cplhhcHpVPVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MFd2(6),MFe2(6),MFu2(6),              & 
& MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),               & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWphh(2),   & 
& cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2), & 
& cplhhcVWpVWp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplhhHpcVWpVP1(2),     & 
& cplhhcHpVPVWp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVP


Subroutine Amplitude_WAVE_U1T3R_hhTohhVZ(Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTohhVZ


Subroutine Amplitude_VERTEX_U1T3R_hhTohhVZ(MFd,MFe,MFu,MFv,Mhh,MHp,MVWp,              & 
& MVZ,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,              & 
& cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MVZ,MFd2(6),MFe2(6),MFu2(6),              & 
& MFv2(9),Mhh2(2),MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWphh(2),   & 
& cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2), & 
& cplhhcVWpVWp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1(2),     & 
& cplhhcHpVWpVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplhhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplhhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTohhVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVZ(MFd,MFe,MFu,MFv,Mhh,MHp,MVWp,           & 
& MVZ,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhHpcHp,cplhhHpcVWp,            & 
& cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,              & 
& cplhhHpcVWpVZ1,cplhhcHpVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MVZ,MFd2(6),MFe2(6),MFu2(6),              & 
& MFv2(9),Mhh2(2),MHp2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),               & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),               & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWpgWphh(2),   & 
& cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhHpcHp(2),cplhhHpcVWp(2),cplhhcHpVWp(2), & 
& cplhhcVWpVWp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhHpcVWpVZ1(2),     & 
& cplhhcHpVWpVZ1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVZ


Subroutine Amplitude_WAVE_U1T3R_hhTohhVZp(Mhh,Mhh2,MVZp,MVZp2,Zfhh,ZfVZp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZp,MVZp2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZp

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZp 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhTohhVZp


Subroutine Amplitude_VERTEX_U1T3R_hhTohhVZp(MFd,MFe,MFu,MFv,Mhh,MHp,MVWp,             & 
& MVZp,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,   & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZpL,               & 
& cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,cplhhHpcHp,          & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,            & 
& cplcVWpVWpVZp,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MVZp,MFd2(6),MFe2(6),MFu2(6),             & 
& MFv2(9),Mhh2(2),MHp2,MVWp2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),            & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2), & 
& cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVZp,cplhhHpcHp(2),cplhhHpcVWp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,    & 
& cplhhHpcVWpVZp1(2),cplhhcHpVWpVZp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZp 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVZpR(i3,i2)
coup3R = -cplcFdFdVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = cplFvFvhhL(i1,i3,gt2)
coup2R = cplFvFvhhR(i1,i3,gt2)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcHp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWp(gt2)
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHpVWp(gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = -cplhhHpcVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplhhcHpVWpVZp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplhhHpcVWpVZp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplhhcHpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplhhHpcVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhTohhVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVZp(MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVWp,MVZp,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVWp2,MVZp2,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVZp,cplcgWCgWChh,cplcgWCgWCVZp,         & 
& cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplHpcHpVZp,cplHpcVWpVZp,              & 
& cplcHpVWpVZp,cplcVWpVWpVZp,cplhhHpcVWpVZp1,cplhhcHpVWpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVWp,MVZp,MFd2(6),MFe2(6),MFu2(6),             & 
& MFv2(9),Mhh2(2),MHp2,MVWp2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),            & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),             & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),             & 
& cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcgWpgWphh(2), & 
& cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVZp,cplhhHpcHp(2),cplhhHpcVWp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,    & 
& cplhhHpcVWpVZp1(2),cplhhcHpVWpVZp1(2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZp 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhTohhVZp


Subroutine Amplitude_WAVE_U1T3R_hhToVGVG(Mhh,Mhh2,MVG,MVG2,Zfhh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVG,MVG2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVG

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVGVG


Subroutine Amplitude_VERTEX_U1T3R_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,Mhh2,            & 
& MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,          & 
& cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFu(6),Mhh(2),MVG,MFd2(6),MFu2(6),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),              & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVGR(i1,i3)
coup2R = -cplcFdFdVGL(i1,i3)
coup3L = -cplcFdFdVGR(i3,i2)
coup3R = -cplcFdFdVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVGR(i1,i3)
coup2R = -cplcFuFuVGL(i1,i3)
coup3L = -cplcFuFuVGR(i3,i2)
coup3R = -cplcFuFuVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVGVG


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,              & 
& Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFu(6),Mhh(2),MVG,MFd2(6),MFu2(6),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),              & 
& cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVGVG


Subroutine Amplitude_WAVE_U1T3R_hhToVPVP(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,              & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,             & 
& ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVPVZ,ZfVPVZp,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplhhVPVZ(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplhhVPVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVPVP


Subroutine Amplitude_VERTEX_U1T3R_hhToVPVP(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1,              & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,   & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFehhL(6,6,2),               & 
& cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuhhL(6,6,2),               & 
& cplcFuFuhhR(6,6,2),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),          & 
& cplcgWCgWCVP,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),               & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1(2,2),      & 
& cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhHpcVWpVP1(2),              & 
& cplhhcHpVPVWp1(2),cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVPR(i1,i3)
coup2R = -cplFvFvVPL(i1,i3)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVP(i3,i1)
coup3 = cplAhhhVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZ(i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVP
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVPVZ(i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcHpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVPVP1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVPVP1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVPVP1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVPVWp1Q
coup2b = coup2 
coup2 = cplcVWpVPVPVWp2Q
coup2c = coup2 
coup2 = cplcVWpVPVPVWp3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVPVP


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVP(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhhhhh,cplhhHpcHp,              & 
& cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,        & 
& cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1,              & 
& cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhHpcVWpVP1,cplhhcHpVPVWp1,cplHpcHpVPVP1,   & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFeFehhL(6,6,2),               & 
& cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuhhL(6,6,2),               & 
& cplcFuFuhhR(6,6,2),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),          & 
& cplcgWCgWCVP,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),               & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,cplAhAhVPVP1(2,2),      & 
& cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhHpcVWpVP1(2),              & 
& cplhhcHpVPVWp1(2),cplHpcHpVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVP


Subroutine Amplitude_WAVE_U1T3R_hhToVPVZ(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,              & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVPVZ,ZfVPVZp,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVPVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVPVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVP*cplhhVPVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVPVZ(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplhhVPVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVPVZ


Subroutine Amplitude_VERTEX_U1T3R_hhToVPVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,             & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,      & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,              & 
& cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,       & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,             & 
& cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2), & 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,   & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplAhAhVPVZ1(2,2),cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2), & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),              & 
& cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,   & 
& cplcVWpVPVWpVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVPR(i1,i3)
coup2R = -cplFvFvVPL(i1,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVP(i3,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVP
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVPVZ(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcHpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVPVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVPVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVPVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZ1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZ1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVZ
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVPVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVZ(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,            & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,       & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,             & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,       & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,      & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,cplcVWpVWpVZ,              & 
& cplAhAhVPVZ1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,       & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVZ1,             & 
& cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),               & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvhhL(9,9,2), & 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,   & 
& cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),              & 
& cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2),              & 
& cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZ,    & 
& cplcVWpVWpVZ,cplAhAhVPVZ1(2,2),cplhhhhVPVP1(2,2),cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2), & 
& cplhhhhVZVZ1(2,2),cplhhhhVZVZp1(2,2),cplhhHpcVWpVP1(2),cplhhHpcVWpVZ1(2),              & 
& cplhhcHpVPVWp1(2),cplhhcHpVWpVZ1(2),cplHpcHpVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,   & 
& cplcVWpVPVWpVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplhhVPVZ(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVZ


Subroutine Amplitude_WAVE_U1T3R_hhToVPVZp(cplhhVPVZ,cplhhVPVZp,cplhhVZVZ,             & 
& cplhhVZVZp,cplhhVZpVZp,ctcplhhVPVZ,ctcplhhVPVZp,ctcplhhVZVZ,ctcplhhVZVZp,              & 
& ctcplhhVZpVZp,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,ZfVP,ZfVPVZ,ZfVPVZp,          & 
& ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplhhVPVZ(2),cplhhVPVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplhhVZpVZp(2)

Complex(dp), Intent(in) :: ctcplhhVPVZ(2),ctcplhhVPVZp(2),ctcplhhVZVZ(2),ctcplhhVZVZp(2),ctcplhhVZpVZp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVPVZ,ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVPVZp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVPVZp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVP*cplhhVPVZp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplhhVPVZ(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplhhVPVZp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_U1T3R_hhToVPVZp


Subroutine Amplitude_VERTEX_U1T3R_hhToVPVZp(MAh,MFd,MFe,MFu,MFv,Mhh,MHp,              & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,            & 
& cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh,          & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,    & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZp1,cplHpcHpVPVZp1,          & 
& cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVP,               & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,            & 
& cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1(2,2),cplhhhhVPVP1(2,2),          & 
& cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),           & 
& cplhhHpcVWpVP1(2),cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpVPVZp1,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZp 


! {Ah, Ah, hh}
If ((Include_in_loopAh).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZ, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Ah, VZp, hh}
If ((Include_in_loopAh).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Fd, Fd}
If ((Include_in_loopFd).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVZpR(i3,i2)
coup3R = -cplcFdFdVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Fe, Fe}
If ((Include_in_loopFe).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fu, Fu, Fu}
If ((Include_in_loopFu).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fv, Fv, Fv}
If ((Include_in_loopFv).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
Do i1=1,9
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(i1,i2,gt1)
coup1R = cplFvFvhhR(i1,i2,gt1)
coup2L = -cplFvFvVPR(i1,i3)
coup2R = -cplFvFvVPL(i1,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {gWp, gWp, gWp}
If ((Include_in_loopgWp).and.(Include_in_loopgWp).and.(Include_in_loopgWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {gWpC, gWpC, gWpC}
If ((Include_in_loopgWC).and.(Include_in_loopgWC).and.(Include_in_loopgWC)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {hh, hh, Ah}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVP(i3,i1)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {hh, hh, VZ}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZ(i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {hh, hh, VZp}
If ((Include_in_loophh).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVPVZp(i1)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = -cplHpcHpVP
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {Hp, VWp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplHpcHpVP
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Hp, VWp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = -cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, Hp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
End if 


! {VZ, Ah, hh}
If ((Include_in_loopVZ).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(i2,gt1)
coup2 = cplhhVPVZ(i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZ, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZ, VZp, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, Ah, hh}
If ((Include_in_loopVZp).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZp(i2,gt1)
coup2 = cplhhVPVZp(i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZ, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VZp, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplhhVZpVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {conj[Hp], conj[VWp], conj[Hp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcHpVP
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[Hp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[Hp], conj[VWp], conj[VWp]}
If ((Include_in_loopHp).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHpVWp(gt1)
coup2 = cplHpcVWpVP
coup3 = cplcVWpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MHp 
coup1 = cplhhHpcVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcHpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[VWp], conj[Hp]}
If ((Include_in_loopVWp).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHpVPVWp
coup3 = cplHpcVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {conj[VWp], conj[Hp], conj[VWp]}
If ((Include_in_loopVWp).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MHp 
ML3 = MVWp 
coup1 = cplhhHpcVWp(gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcHpVWpVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {Ah, Ah}
If ((Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhhh(i1,i2,gt1)
coup2 = cplAhAhVPVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {hh, hh}
If ((Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVPVZp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do
End if 


! {Hp, Hp}
If ((Include_in_loopHp).and.(Include_in_loopHp)) Then 
ML1 = MHp 
ML2 = MHp 
coup1 = cplhhHpcHp(gt1)
coup2 = cplHpcHpVPVZp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {VWp, VWp}
If ((Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWpVZp1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZp2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZp1(gt1,i1)
coup2 = cplhhVPVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVZpVZp1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVZp1(gt1)
coup2 = cplcHpVPVWp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVWpVZp1(gt1)
coup2 = cplHpcVWpVP
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplhhVPVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZ}
If ((Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVPVZ1(gt1,i1)
coup2 = cplhhVZVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {hh, VZp}
If ((Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZp 
coup1 = cplhhhhVPVZp1(gt1,i1)
coup2 = cplhhVZpVZp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 


! {Hp, VWp}
If ((Include_in_loopHp).and.(Include_in_loopVWp)) Then 
ML1 = MHp 
ML2 = MVWp 
coup1 = cplhhHpcVWpVP1(gt1)
coup2 = cplcHpVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 


! {VWp, Hp}
If ((Include_in_loopVWp).and.(Include_in_loopHp)) Then 
ML1 = MVWp 
ML2 = MHp 
coup1 = cplhhcHpVPVWp1(gt1)
coup2 = cplHpcVWpVZp
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End if 
End Do
End Subroutine Amplitude_VERTEX_U1T3R_hhToVPVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVZp(MAh,MFd,MFe,MFu,MFv,Mhh,               & 
& MHp,MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,              & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZpL,cplFvFvVZpR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh,          & 
& cplcgWCgWCVP,cplcgWCgWCVZp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVPVZ,cplhhVPVZp,      & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVP,cplHpcVWpVP,      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,          & 
& cplAhAhVPVZp1,cplhhhhVPVP1,cplhhhhVPVZ1,cplhhhhVPVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,    & 
& cplhhHpcVWpVP1,cplhhHpcVWpVZp1,cplhhcHpVPVWp1,cplhhcHpVWpVZp1,cplHpcHpVPVZp1,          & 
& cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFe(6),MFu(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),              & 
& MFd2(6),MFe2(6),MFu2(6),MFv2(9),Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),    & 
& cplcFdFdhhR(6,6,2),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),   & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZp,cplcgWCgWChh(2),cplcgWCgWCVP,               & 
& cplcgWCgWCVZp,cplhhhhhh(2,2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),              & 
& cplhhVPVZp(2),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhVZVZp(2),               & 
& cplhhVZpVZp(2),cplHpcHpVP,cplHpcVWpVP,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVPVWp,            & 
& cplcVWpVPVWp,cplcHpVWpVZp,cplcVWpVWpVZp,cplAhAhVPVZp1(2,2),cplhhhhVPVP1(2,2),          & 
& cplhhhhVPVZ1(2,2),cplhhhhVPVZp1(2,2),cplhhhhVZVZp1(2,2),cplhhhhVZpVZp1(2,2),           & 
& cplhhHpcVWpVP1(2),cplhhHpcVWpVZp1(2),cplhhcHpVPVWp1(2),cplhhcHpVWpVZp1(2),             & 
& cplHpcHpVPVZp1,cplcVWpVPVWpVZp3Q,cplcVWpVPVWpVZp2Q,cplcVWpVPVWpVZp1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZp 


! {Ah, VP, hh}
If ((Include_in_loopAh).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVP(i1,gt1)
coup2 = cplAhhhVP(i1,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {VZ, VP, hh}
If ((Include_in_loopVZ).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZ 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZ(gt1)
coup2 = cplhhVPVZ(i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {VZp, VP, hh}
If ((Include_in_loopVZp).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
    Do i3=1,2
ML1 = MVZp 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplhhVPVZp(gt1)
coup2 = cplhhVPVZp(i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End if 


! {hh, VP}
If ((Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVP 
coup1 = cplhhhhVPVP1(gt1,i1)
coup2 = cplhhVPVZp(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End if 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_hhToVPVZp



End Module OneLoopDecay_hh_U1T3R
