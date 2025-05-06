! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:18 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fe_U1T3R
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

Subroutine Amplitude_Tree_U1T3R_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,MAh,MFe,             & 
& MAh2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MAh2(2),MFe2(6)

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2)

Complex(dp) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFeAhL(gt1,gt2,gt3)
coupT1R = cplcFeFeAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFeAh


Subroutine Gamma_Real_U1T3R_FeToFeAh(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,           & 
& MAh,MFe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2)

Real(dp), Intent(in) :: MAh(2),MFe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,2
CoupL = cplcFeFeAhL(i1,i2,i3)
CoupR = cplcFeFeAhR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFeAh


Subroutine Amplitude_WAVE_U1T3R_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,ctcplcFeFeAhL,       & 
& ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfEL,ZfER,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),MFe(6),MFe2(6)

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFeFeAhL(6,6,2),ctcplcFeFeAhR(6,6,2)

Complex(dp), Intent(in) :: ZfAh(2,2),ZfEL(6,6),ZfER(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFeAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFeAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplcFeFeAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplcFeFeAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFeAh


Subroutine Amplitude_VERTEX_U1T3R_FeToFeAh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,              & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,          & 
& cplAhcHpVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),             & 
& cplFvFvAhR(9,9,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFvcHpL(6,9),& 
& cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh(gt3) 


! {Ah, bar[Fe], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, hh, Ah}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, hh}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZ, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZp, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = -cplAhhhVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZ}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = -cplAhhhVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZp}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = -cplAhhhVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, VWp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = -cplAhcHpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFeVWpR(i1,gt2)
coup2R = -cplFvFeVWpL(i1,gt2)
coup3 = -cplAhHpcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], bar[Fe]}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZpR(gt1,i2)
coup1R = -cplcFeFeVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fv}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFvcVWpR(gt1,i2)
coup1R = -cplcFeFvcVWpL(gt1,i2)
coup2L = -cplFvFeVWpR(i3,gt2)
coup2R = -cplFvFeVWpL(i3,gt2)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_U1T3R_FeToFeAh


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeAh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,          & 
& cplAhcHpVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),             & 
& cplFvFvAhR(9,9,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),        & 
& cplAhcHpVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFvcHpL(6,9),& 
& cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh(gt3) 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = -cplAhhhVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeAh


Subroutine Amplitude_Tree_U1T3R_FeToFehh(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,             & 
& MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),Mhh(2),MFe2(6),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Complex(dp) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt1,gt2,gt3)
coupT1R = cplcFeFehhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFehh


Subroutine Gamma_Real_U1T3R_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,           & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Real(dp), Intent(in) :: MFe(6),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
CoupL = cplcFeFehhL(i1,i2,i3)
CoupR = cplcFeFehhR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFehh


Subroutine Amplitude_WAVE_U1T3R_FeToFehh(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,       & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(6,6,2),ctcplcFeFehhR(6,6,2)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFehhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFehhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFehhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFehhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFehhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFehh


Subroutine Amplitude_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,              & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fe], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, Ah}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VP, Ah}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZ, Ah}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZp, Ah}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, hh}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, VP}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplAhhhVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VZ, VP}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, VP}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, Ah, VZ}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplAhhhVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, Ah, VZp}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplAhhhVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, VZp}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, VZp}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, VZp}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = cplhhHpcHp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = -cplhhcHpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFeVWpR(i1,gt2)
coup2R = -cplFvFeVWpL(i1,gt2)
coup3 = -cplhhHpcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = -cplFvFeVWpR(i1,gt2)
coup2R = -cplFvFeVWpL(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], bar[Fe]}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZpR(gt1,i2)
coup1R = -cplcFeFeVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fv}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFvcVWpR(gt1,i2)
coup1R = -cplcFeFvcVWpL(gt1,i2)
coup2L = -cplFvFeVWpR(i3,gt2)
coup2R = -cplFvFeVWpL(i3,gt2)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_U1T3R_FeToFehh


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFehh(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,           & 
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

Complex(dp), Intent(out) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {Fe, VP, Ah}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, Ah, VP}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplAhhhVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VZ, VP}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, VP}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VP, VZ}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VP, VZp}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFehh


Subroutine Amplitude_Tree_U1T3R_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,MFe,MVZ,             & 
& MFe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MVZ,MFe2(6),MVZ2

Complex(dp), Intent(in) :: cplcFeFeVZL(6,6),cplcFeFeVZR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFeFeVZL(gt1,gt2)
coupT1R = cplcFeFeVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFeVZ


Subroutine Gamma_Real_U1T3R_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,           & 
& MFe,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeVZL(6,6),cplcFeFeVZR(6,6)

Real(dp), Intent(in) :: MFe(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFeFeVZL(i1,i2)
CoupR = cplcFeFeVZR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFeVZ


Subroutine Amplitude_WAVE_U1T3R_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,MVZ,MVZ2,ZfEL,           & 
& ZfER,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(6,6),ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZR(6,6),          & 
& ctcplcFeFeVZpL(6,6),ctcplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeVZL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFeFeVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFeFeVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFeFeVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplcFeFeVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplcFeFeVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFeVZ


Subroutine Amplitude_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,              & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVZ(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9), & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),         & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fe], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, hh, Ah}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, hh}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZ, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZp, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZpL(gt1,i1)
coup1R = cplcFeFeVZpR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZ}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZp}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZpL(i1,gt2)
coup2R = cplcFeFeVZpR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Hp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = -cplHpcHpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], bar[Fe]}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fv}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcVWpL(gt1,i2)
coup1R = cplcFeFvcVWpR(gt1,i2)
coup2L = cplFvFeVWpL(i3,gt2)
coup2R = cplFvFeVWpR(i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_FeToFeVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVZ(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVZ,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVZ(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9), & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),         & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVZ


Subroutine Amplitude_Tree_U1T3R_FeToFeVZp(cplcFeFeVZpL,cplcFeFeVZpR,MFe,              & 
& MVZp,MFe2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MVZp,MFe2(6),MVZp2

Complex(dp), Intent(in) :: cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplcFeFeVZpL(gt1,gt2)
coupT1R = cplcFeFeVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFeVZp


Subroutine Gamma_Real_U1T3R_FeToFeVZp(MLambda,em,gs,cplcFeFeVZpL,cplcFeFeVZpR,        & 
& MFe,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6)

Real(dp), Intent(in) :: MFe(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFeFeVZpL(i1,i2)
CoupR = cplcFeFeVZpR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFeVZp


Subroutine Amplitude_WAVE_U1T3R_FeToFeVZp(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,MVZp,MVZp2,              & 
& ZfEL,ZfER,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(6,6),ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZR(6,6),          & 
& ctcplcFeFeVZpL(6,6),ctcplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeVZpL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplcFeFeVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplcFeFeVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplcFeFeVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplcFeFeVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplcFeFeVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFeVZp


Subroutine Amplitude_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,      & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,               & 
& cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),& 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),& 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZp 


! {Ah, bar[Fe], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, hh, Ah}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, hh}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZ, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZp, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZpL(gt1,i1)
coup1R = cplcFeFeVZpR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZ}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZp}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZpL(i1,gt2)
coup2R = cplcFeFeVZpR(i1,gt2)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Hp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = -cplHpcHpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], bar[Fe]}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fv}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcVWpL(gt1,i2)
coup1R = cplcFeFvcVWpR(gt1,i2)
coup2L = cplFvFeVWpL(i3,gt2)
coup2R = cplFvFeVWpR(i3,gt2)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_FeToFeVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVZp(MAh,MFe,MFv,Mhh,MHp,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplAhhhVZp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,      & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,          & 
& cplcFeFvcVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpcHpVZp,cplHpcVWpVZp,              & 
& cplcHpVWpVZp,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVZp(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),& 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),& 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),      & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZp 


! {Fe, VP, hh}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VP}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVZp


Subroutine Amplitude_Tree_U1T3R_FeToFvcHp(cplcFeFvcHpL,cplcFeFvcHpR,MFe,              & 
& MFv,MHp,MFe2,MFv2,MHp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFv(9),MHp,MFe2(6),MFv2(9),MHp2

Complex(dp), Intent(in) :: cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9)

Complex(dp) :: Amp(2,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,9
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHp 
! Tree-Level Vertex 
coupT1L = cplcFeFvcHpL(gt1,gt2)
coupT1R = cplcFeFvcHpR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFvcHp


Subroutine Gamma_Real_U1T3R_FeToFvcHp(MLambda,em,gs,cplcFeFvcHpL,cplcFeFvcHpR,        & 
& MFe,MFv,MHp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9)

Real(dp), Intent(in) :: MFe(6),MFv(9),MHp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,9), GammarealGluon(6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,9
CoupL = cplcFeFvcHpL(i1,i2)
CoupR = cplcFeFvcHpR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFv(i2)
Mex3 = MHp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFvcHp


Subroutine Amplitude_WAVE_U1T3R_FeToFvcHp(cplcFeFvcHpL,cplcFeFvcHpR,ctcplcFeFvcHpL,   & 
& ctcplcFeFvcHpR,MFe,MFe2,MFv,MFv2,MHp,MHp2,ZfEL,ZfER,ZfFV,ZfHp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),MFv(9),MFv2(9),MHp,MHp2

Complex(dp), Intent(in) :: cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9)

Complex(dp), Intent(in) :: ctcplcFeFvcHpL(6,9),ctcplcFeFvcHpR(6,9)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),ZfFV(9,9),ZfHp

Complex(dp), Intent(out) :: Amp(2,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,9
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvcHpL(gt1,gt2) 
ZcoupT1R = ctcplcFeFvcHpR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFvcHpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvcHpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplcFeFvcHpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplcFeFvcHpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHp)*cplcFeFvcHpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHp)*cplcFeFvcHpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFvcHp


Subroutine Amplitude_VERTEX_U1T3R_FeToFvcHp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,             & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplFvFvAhL,cplFvFvAhR,cplAhcHpVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,    & 
& cplcHpVWpVZ,cplcHpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),            & 
& cplAhcHpVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,     & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp

Complex(dp), Intent(out) :: Amp(2,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHp 


! {Ah, bar[Fe], Fv}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, hh, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplhhHpcHp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcHpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHp 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcHpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MHp 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcHpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, Ah, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplAhcHpVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplhhcHpVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplcHpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1L = -cplcFeFeVZpR(gt1,i1)
coup1R = -cplcFeFeVZpL(gt1,i1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplcHpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, Ah}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopAh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MAh(i3) 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhcHpVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Hp, hh}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhHpcHp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, VWp, hh}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhcHpVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Hp, VP}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplHpcHpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VP}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplcHpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VZ}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVZ 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplHpcHpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VZ}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplcHpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VZp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVZp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplHpcHpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VZp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZp 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplcHpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], Fv}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], Fv}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], Fv}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], Fv}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFeVZpR(gt1,i2)
coup1R = -cplcFeFeVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fe}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,9
    Do i3=1,6
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(gt2,i3)
coup2R = cplFvFeHpR(gt2,i3)
coup3L = cplcFeFvcHpL(i3,i2)
coup3R = cplcFeFvcHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fe}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,9
    Do i3=1,6
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvcVWpR(gt1,i2)
coup1R = -cplcFeFvcVWpL(gt1,i2)
coup2L = cplFvFeVWpL(gt2,i3)
coup2R = cplFvFeVWpR(gt2,i3)
coup3L = cplcFeFvcHpL(i3,i2)
coup3R = cplcFeFvcHpR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_FeToFvcHp


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFvcHp(MAh,MFe,MFv,Mhh,MHp,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhcHpVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,       & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,              & 
& cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),            & 
& cplAhcHpVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,     & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp

Complex(dp), Intent(out) :: Amp(2,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHp 


! {Fe, VP, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcHpVP
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VP, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvcVWpR(i1,gt2)
coup2R = -cplcFeFvcVWpL(i1,gt2)
coup3 = cplcHpVPVWp
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VP}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplHpcHpVP
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VP}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFeFvcVWpR(gt1,i1)
coup1R = -cplcFeFvcVWpL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplcHpVPVWp
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, bar[Fe], Fv}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplcFeFvcHpL(i2,i3)
coup3R = cplcFeFvcHpR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFvcHp


Subroutine Amplitude_Tree_U1T3R_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,               & 
& MFe,MFv,MVWp,MFe2,MFv2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFv(9),MVWp,MFe2(6),MFv2(9),MVWp2

Complex(dp), Intent(in) :: cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Complex(dp) :: Amp(4,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,9
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplcFeFvcVWpL(gt1,gt2)
coupT1R = cplcFeFvcVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FeToFvcVWp


Subroutine Gamma_Real_U1T3R_FeToFvcVWp(MLambda,em,gs,cplcFeFvcVWpL,cplcFeFvcVWpR,     & 
& MFe,MFv,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Real(dp), Intent(in) :: MFe(6),MFv(9),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,9), GammarealGluon(6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,9
CoupL = cplcFeFvcVWpL(i1,i2)
CoupR = cplcFeFvcVWpR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFv(i2)
Mex3 = MVWp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp,0._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FeToFvcVWp


Subroutine Amplitude_WAVE_U1T3R_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,               & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfFV,           & 
& ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),MFv(9),MFv2(9),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9)

Complex(dp), Intent(in) :: ctcplcFeFvcVWpL(6,9),ctcplcFeFvcVWpR(6,9)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),ZfFV(9,9),ZfVWp

Complex(dp), Intent(out) :: Amp(4,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,9
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvcVWpL(gt1,gt2) 
ZcoupT1R = ctcplcFeFvcVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvcVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFvcVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFV(i1,gt2)*cplcFeFvcVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFV(i1,gt2))*cplcFeFvcVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplcFeFvcVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplcFeFvcVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFvcVWp


Subroutine Amplitude_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,            & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,            & 
& cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),            & 
& cplAhHpcVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,cplHpcVWpVZ,             & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp

Complex(dp), Intent(out) :: Amp(4,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 


! {Ah, bar[Fe], Fv}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = MHp 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = -cplAhHpcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = -cplhhHpcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHp 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MHp 
coup1L = cplcFeFeVZpL(gt1,i1)
coup1R = cplcFeFeVZpR(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, hh, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvcVWpL(i1,gt2)
coup2R = cplcFeFvcVWpR(i1,gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, VP, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcVWpL(i1,gt2)
coup2R = cplcFeFvcVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZ, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvcVWpL(i1,gt2)
coup2R = cplcFeFvcVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VZp, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1L = cplcFeFeVZpL(gt1,i1)
coup1R = cplcFeFeVZpR(gt1,i1)
coup2L = cplcFeFvcVWpL(i1,gt2)
coup2R = cplcFeFvcVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, Ah}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MAh(i3) 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhHpcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Hp, hh}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhHpcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, VWp, hh}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
Do i1=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fv, Hp, VP}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = cplHpcVWpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VP}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VZ}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVZ 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
coup3 = cplHpcVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VZ}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VZp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVZp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFvVZpR(gt2,i1)
coup2R = -cplFvFvVZpL(gt2,i1)
coup3 = cplHpcVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VZp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = -cplFvFvVZpR(gt2,i1)
coup2R = -cplFvFvVZpL(gt2,i1)
coup3 = cplcVWpVWpVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], Fv}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], Fv}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], Fv}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], Fv}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = -cplFvFvVZpR(gt2,i3)
coup2R = -cplFvFvVZpL(gt2,i3)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fe}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,9
    Do i3=1,6
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(gt2,i3)
coup2R = cplFvFeHpR(gt2,i3)
coup3L = -cplcFeFvcVWpR(i3,i2)
coup3R = -cplcFeFvcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fe}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFe)) Then 
  Do i2=1,9
    Do i3=1,6
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcVWpL(gt1,i2)
coup1R = cplcFeFvcVWpR(gt1,i2)
coup2L = -cplFvFeVWpR(gt2,i3)
coup2R = -cplFvFeVWpL(gt2,i3)
coup3L = -cplcFeFvcVWpR(i3,i2)
coup3R = -cplcFeFvcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_FeToFvcVWp


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp(MAh,MFe,MFv,Mhh,MHp,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,cplAhHpcVWp,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,       & 
& cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,     & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcHpL,cplcFeFvcHpR,               & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,          & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),            & 
& cplAhHpcVWp(2),cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),      & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),     & 
& cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,cplHpcVWpVZ,             & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp

Complex(dp), Intent(out) :: Amp(4,6,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 


! {Fe, VP, conj[Hp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3 = cplHpcVWpVP
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fe, VP, conj[VWp]}
If ((Include_in_loopFe).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcVWpL(i1,gt2)
coup2R = cplcFeFvcVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VP}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = cplHpcVWpVP
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VP}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VP, bar[Fe], Fv}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFv)) Then 
  Do i2=1,6
    Do i3=1,9
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = cplcFeFvcVWpL(i2,i3)
coup3R = cplcFeFvcVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFvcVWp


Subroutine Amplitude_WAVE_U1T3R_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,       & 
& ctcplcFeFeVZR,ctcplcFeFeVZpL,ctcplcFeFeVZpR,MFe,MFe2,MVP,MVP2,ZfEL,ZfER,               & 
& ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(6),MFe2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(6,6),ctcplcFeFeVPR(6,6),ctcplcFeFeVZL(6,6),ctcplcFeFeVZR(6,6),          & 
& ctcplcFeFeVZpL(6,6),ctcplcFeFeVZpR(6,6)

Complex(dp), Intent(in) :: ZfEL(6,6),ZfER(6,6),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFeFeVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplcFeFeVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplcFeFeVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FeToFeVP


Subroutine Amplitude_VERTEX_U1T3R_FeToFeVP(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,              & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVPL,cplFvFvVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9), & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,           & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {Ah, bar[Fe], bar[Fe]}
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, hh, Ah}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, Ah, hh}
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {Fe, VZ, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, VZp, hh}
If ((Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZpL(gt1,i1)
coup1R = cplcFeFeVZpR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fe, hh, VZ}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fe, hh, VZp}
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZpL(i1,gt2)
coup2R = cplcFeFeVZpR(i1,gt2)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fv, Hp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = -cplHpcHpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, Hp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
coup3 = cplcHpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, Hp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = cplHpcVWpVP
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fv, VWp, VWp}
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,9
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {hh, bar[Fe], bar[Fe]}
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End if 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZ, bar[Fe], bar[Fe]}
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {VZp, bar[Fe], bar[Fe]}
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[Hp], Fv, Fv}
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MHp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 


! {conj[VWp], Fv, Fv}
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv)) Then 
  Do i2=1,9
    Do i3=1,9
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcVWpL(gt1,i2)
coup1R = cplcFeFvcVWpR(gt1,i2)
coup2L = cplFvFeVWpL(i3,gt2)
coup2R = cplFvFeVWpR(i3,gt2)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do
End Subroutine Amplitude_VERTEX_U1T3R_FeToFeVP


Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVP(MAh,MFe,MFv,Mhh,MHp,MVP,MVWp,           & 
& MVZ,MVZp,MAh2,MFe2,MFv2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvVPL,cplFvFvVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,           & 
& cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVP,MVWp,MVZ,MVZp,MAh2(2),MFe2(6),MFv2(9),            & 
& Mhh2(2),MHp2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9), & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,           & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {VP, bar[Fe], bar[Fe]}
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FeToFeVP



End Module OneLoopDecay_Fe_U1T3R
