! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:18 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fd_U1T3R
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

Subroutine Amplitude_Tree_U1T3R_FdToFdAh(cplcFdFdAhL,cplcFdFdAhR,MAh,MFd,             & 
& MAh2,MFd2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MAh2(2),MFd2(6)

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2)

Complex(dp) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdAhL(gt1,gt2,gt3)
coupT1R = cplcFdFdAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFdAh


Subroutine Gamma_Real_U1T3R_FdToFdAh(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,           & 
& MAh,MFd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2)

Real(dp), Intent(in) :: MAh(2),MFd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,2
CoupL = cplcFdFdAhL(i1,i2,i3)
CoupR = cplcFdFdAhR(i1,i2,i3)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFdAh


Subroutine Amplitude_WAVE_U1T3R_FdToFdAh(cplcFdFdAhL,cplcFdFdAhR,ctcplcFdFdAhL,       & 
& ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfDL,ZfDR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MAh2(2),MFd(6),MFd2(6)

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFdFdAhL(6,6,2),ctcplcFdFdAhR(6,6,2)

Complex(dp), Intent(in) :: ZfAh(2,2),ZfDL(6,6),ZfDR(6,6)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFdFdAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplcFdFdAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplcFdFdAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdAh


Subroutine Amplitude_VERTEX_U1T3R_FdToFdAh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),            & 
& cplcFuFuAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),       & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6), & 
& cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh(gt3) 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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


! {Fd, hh, Ah}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, Ah, hh}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZp, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
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


! {Fd, hh, VZ}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fd, hh, VZp}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
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


! {Fu, VWp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, Hp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,gt2)
coup2R = -cplcFuFdVWpL(i1,gt2)
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


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZpR(gt1,i2)
coup1R = -cplcFdFdVZpL(gt1,i2)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3,gt3)
coup3R = cplcFuFuAhR(i2,i3,gt3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFucVWpR(gt1,i2)
coup1R = -cplcFdFucVWpL(gt1,i2)
coup2L = -cplcFuFdVWpR(i3,gt2)
coup2R = -cplcFuFdVWpL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3,gt3)
coup3R = cplcFuFuAhR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdAh


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdAh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplAhAhhh,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpcVWp,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFdFucVWpL,cplcFdFucVWpR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(2,2,2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),            & 
& cplcFuFuAhR(6,6,2),cplAhhhVP(2,2),cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),       & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),& 
& cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6), & 
& cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh(gt3) 


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = -cplAhhhVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = -cplAhhhVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
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
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdAh


Subroutine Amplitude_Tree_U1T3R_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,             & 
& MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),Mhh(2),MFd2(6),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Complex(dp) :: Amp(2,6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt1,gt2,gt3)
coupT1R = cplcFdFdhhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFdhh


Subroutine Gamma_Real_U1T3R_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,           & 
& MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Real(dp), Intent(in) :: MFd(6),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
CoupL = cplcFdFdhhL(i1,i2,i3)
CoupR = cplcFdFdhhR(i1,i2,i3)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFdhh


Subroutine Amplitude_WAVE_U1T3R_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,       & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(6,6,2),ctcplcFdFdhhR(6,6,2)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),Zfhh(2,2)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFdFdhhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdhhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdhhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdhhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdhhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFdFdhhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFdFdhhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdhh


Subroutine Amplitude_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,               & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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


! {Fd, Ah, Ah}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, VP, Ah}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, VZ, Ah}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, VZp, Ah}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, hh, hh}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, Ah, VP}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
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


! {Fd, VZ, VP}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
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


! {Fd, VZp, VP}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
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


! {Fd, Ah, VZ}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fd, VP, VZ}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fd, VZ, VZ}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fd, VZp, VZ}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fd, Ah, VZp}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
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


! {Fd, VP, VZp}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
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


! {Fd, VZ, VZp}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
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


! {Fd, VZp, VZp}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
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


! {Fu, Hp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, VWp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, Hp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,gt2)
coup2R = -cplcFuFdVWpL(i1,gt2)
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


! {Fu, VWp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,gt2)
coup2R = -cplcFuFdVWpL(i1,gt2)
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


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZpR(gt1,i2)
coup1R = -cplcFdFdVZpL(gt1,i2)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFucVWpR(gt1,i2)
coup1R = -cplcFdFucVWpL(gt1,i2)
coup2L = -cplcFuFdVWpR(i3,gt2)
coup2R = -cplcFuFdVWpL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdhh


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdhh(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,            & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 


! {Fd, VP, Ah}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, Ah, VP}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplAhhhVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {Fd, VZ, VP}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, VZp, VP}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, VP, VZ}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, VP, VZp}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
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
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdhh


Subroutine Amplitude_Tree_U1T3R_FdToFdVZ(cplcFdFdVZL,cplcFdFdVZR,MFd,MVZ,             & 
& MFd2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MVZ,MFd2(6),MVZ2

Complex(dp), Intent(in) :: cplcFdFdVZL(6,6),cplcFdFdVZR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFdFdVZL(gt1,gt2)
coupT1R = cplcFdFdVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFdVZ


Subroutine Gamma_Real_U1T3R_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,           & 
& MFd,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdVZL(6,6),cplcFdFdVZR(6,6)

Real(dp), Intent(in) :: MFd(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFdFdVZL(i1,i2)
CoupR = cplcFdFdVZR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp/3._dp,-1._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFdVZ


Subroutine Amplitude_WAVE_U1T3R_FdToFdVZ(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,MVZ,MVZ2,ZfDL,           & 
& ZfDR,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),& 
& cplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFdVPL(6,6),ctcplcFdFdVPR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZR(6,6),          & 
& ctcplcFdFdVZpL(6,6),ctcplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdVZL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFdFdVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFdFdVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFdFdVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFdFdVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplcFdFdVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplcFdFdVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdVZ


Subroutine Amplitude_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVZ(2,2),cplcFdFdhhL(6,6,2),              & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,            & 
& cplcVWpVWpVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
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


! {Fd, hh, Ah}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, Ah, hh}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZp, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZpL(gt1,i1)
coup1R = cplcFdFdVZpR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
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


! {Fd, hh, VZ}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
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


! {Fd, hh, VZp}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZpL(i1,gt2)
coup2R = cplcFdFdVZpR(i1,gt2)
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


! {Fu, Hp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, VWp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, Hp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {Fu, VWp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZpL(gt1,i2)
coup1R = cplcFdFdVZpR(gt1,i2)
coup2L = cplcFdFdVZpL(i3,gt2)
coup2R = cplcFdFdVZpR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucVWpL(gt1,i2)
coup1R = cplcFdFucVWpR(gt1,i2)
coup2L = cplcFuFdVWpL(i3,gt2)
coup2R = cplcFuFdVWpR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdVZ


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVZ(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,               & 
& cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVZ(2,2),cplcFdFdhhL(6,6,2),              & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpVZ,cplHpcVWpVZ,cplcHpVWpVZ,            & 
& cplcVWpVWpVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVZ


Subroutine Amplitude_Tree_U1T3R_FdToFdVZp(cplcFdFdVZpL,cplcFdFdVZpR,MFd,              & 
& MVZp,MFd2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MVZp,MFd2(6),MVZp2

Complex(dp), Intent(in) :: cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplcFdFdVZpL(gt1,gt2)
coupT1R = cplcFdFdVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFdVZp


Subroutine Gamma_Real_U1T3R_FdToFdVZp(MLambda,em,gs,cplcFdFdVZpL,cplcFdFdVZpR,        & 
& MFd,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6)

Real(dp), Intent(in) :: MFd(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFdFdVZpL(i1,i2)
CoupR = cplcFdFdVZpR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp/3._dp,-1._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFdVZp


Subroutine Amplitude_WAVE_U1T3R_FdToFdVZp(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,MVZp,MVZp2,              & 
& ZfDL,ZfDR,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),& 
& cplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFdVPL(6,6),ctcplcFdFdVPR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZR(6,6),          & 
& ctcplcFdFdVZpL(6,6),ctcplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdVZpL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplcFdFdVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplcFdFdVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplcFdFdVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplcFdFdVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplcFdFdVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplcFdFdVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdVZp


Subroutine Amplitude_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),             & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,      & 
& cplcVWpVWpVZp

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZp 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
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


! {Fd, hh, Ah}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, Ah, hh}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZp, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZpL(gt1,i1)
coup1R = cplcFdFdVZpR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
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


! {Fd, hh, VZ}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
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


! {Fd, hh, VZp}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZpL(i1,gt2)
coup2R = cplcFdFdVZpR(i1,gt2)
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


! {Fu, Hp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, VWp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, Hp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {Fu, VWp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZpL(gt1,i2)
coup1R = cplcFdFdVZpR(gt1,i2)
coup2L = cplcFdFdVZpL(i3,gt2)
coup2R = cplcFdFdVZpR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuVZpL(i2,i3)
coup3R = cplcFuFuVZpR(i2,i3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucVWpL(gt1,i2)
coup1R = cplcFdFucVWpR(gt1,i2)
coup2L = cplcFuFdVWpL(i3,gt2)
coup2R = cplcFuFdVWpR(i3,gt2)
coup3L = cplcFuFuVZpL(i2,i3)
coup3R = cplcFuFuVZpR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdVZp


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVZp(MAh,MFd,MFu,Mhh,MHp,MVG,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplAhhhVZp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,            & 
& cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVZp(2,2),cplcFdFdhhL(6,6,2),             & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZp(2),cplhhVZVZp(2),cplhhVZpVZp(2),cplHpcHpVZp,cplHpcVWpVZp,cplcHpVWpVZp,      & 
& cplcVWpVWpVZp

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZp 


! {Fd, VP, hh}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
End if 


! {Fd, hh, VP}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVP)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
End if 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVZp


Subroutine Amplitude_Tree_U1T3R_FdToFucHp(cplcFdFucHpL,cplcFdFucHpR,MFd,              & 
& MFu,MHp,MFd2,MFu2,MHp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFu(6),MHp,MFd2(6),MFu2(6),MHp2

Complex(dp), Intent(in) :: cplcFdFucHpL(6,6),cplcFdFucHpR(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHp 
! Tree-Level Vertex 
coupT1L = cplcFdFucHpL(gt1,gt2)
coupT1R = cplcFdFucHpR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFucHp


Subroutine Gamma_Real_U1T3R_FdToFucHp(MLambda,em,gs,cplcFdFucHpL,cplcFdFucHpR,        & 
& MFd,MFu,MHp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFucHpL(6,6),cplcFdFucHpR(6,6)

Real(dp), Intent(in) :: MFd(6),MFu(6),MHp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFdFucHpL(i1,i2)
CoupR = cplcFdFucHpR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFu(i2)
Mex3 = MHp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,-2._dp/9._dp,1._dp/3._dp,4._dp/9._dp,-2._dp/3._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFucHp


Subroutine Amplitude_WAVE_U1T3R_FdToFucHp(cplcFdFucHpL,cplcFdFucHpR,ctcplcFdFucHpL,   & 
& ctcplcFdFucHpR,MFd,MFd2,MFu,MFu2,MHp,MHp2,ZfDL,ZfDR,ZfHp,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MFu(6),MFu2(6),MHp,MHp2

Complex(dp), Intent(in) :: cplcFdFucHpL(6,6),cplcFdFucHpR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFucHpL(6,6),ctcplcFdFucHpR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfHp,ZfUL(6,6),ZfUR(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFucHpL(gt1,gt2) 
ZcoupT1R = ctcplcFdFucHpR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFucHpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFucHpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFdFucHpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFdFucHpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHp)*cplcFdFucHpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHp)*cplcFdFucHpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFucHp


Subroutine Amplitude_VERTEX_U1T3R_FdToFucHp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,              & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcHp,cplhhcHpVWp,          & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),          & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6), & 
& cplcFdFdVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),              & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),               & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,         & 
& cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHp 


! {Ah, bar[Fd], bar[Fu]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFuFuAhL(i3,gt2,i1)
coup2R = cplcFuFuAhR(i3,gt2,i1)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
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


! {Fd, hh, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VP, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VZ, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MHp 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VZp, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MHp 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, Ah, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MVWp 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
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


! {Fd, hh, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
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


! {Fd, VP, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
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


! {Fd, VZ, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
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


! {Fd, VZp, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1L = -cplcFdFdVZpR(gt1,i1)
coup1R = -cplcFdFdVZpL(gt1,i1)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
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


! {Fu, VWp, Ah}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MAh(i3) 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2,i3)
coup2R = cplcFuFuAhR(i1,gt2,i3)
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


! {Fu, Hp, hh}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, VWp, hh}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, Hp, VP}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
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


! {Fu, VWp, VP}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
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


! {Fu, Hp, VZ}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVZ 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
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


! {Fu, VWp, VZ}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
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


! {Fu, Hp, VZp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVZp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFuVZpR(i1,gt2)
coup2R = -cplcFuFuVZpL(i1,gt2)
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


! {Fu, VWp, VZp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZp 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFuVZpR(i1,gt2)
coup2R = -cplcFuFuVZpL(i1,gt2)
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


! {hh, bar[Fd], bar[Fu]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
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


! {VG, bar[Fd], bar[Fu]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fu]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
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


! {VZ, bar[Fd], bar[Fu]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
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


! {VZp, bar[Fd], bar[Fu]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVZpR(gt1,i2)
coup1R = -cplcFdFdVZpL(gt1,i2)
coup2L = -cplcFuFuVZpR(i3,gt2)
coup2R = -cplcFuFuVZpL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFucHp


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFucHp(MAh,MFd,MFu,Mhh,MHp,MVG,               & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHpVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcHp,cplhhcHpVWp,          & 
& cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),          & 
& cplAhcHpVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6), & 
& cplcFdFdVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),              & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),               & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhHpcHp(2),cplhhcHpVWp(2),cplHpcHpVP,         & 
& cplHpcHpVZ,cplHpcHpVZp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHp 


! {Fd, VP, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
coup3 = cplHpcHpVP
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, VP, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFucVWpR(i1,gt2)
coup2R = -cplcFdFucVWpL(i1,gt2)
coup3 = cplcHpVPVWp
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fu, Hp, VP}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplHpcHpVP
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fu, VWp, VP}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplcHpVPVWp
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VG, bar[Fd], bar[Fu]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fu]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFdFucHpL(i2,i3)
coup3R = cplcFdFucHpR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFucHp


Subroutine Amplitude_Tree_U1T3R_FdToFucVWp(cplcFdFucVWpL,cplcFdFucVWpR,               & 
& MFd,MFu,MVWp,MFd2,MFu2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFu(6),MVWp,MFd2(6),MFu2(6),MVWp2

Complex(dp), Intent(in) :: cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplcFdFucVWpL(gt1,gt2)
coupT1R = cplcFdFucVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_U1T3R_FdToFucVWp


Subroutine Gamma_Real_U1T3R_FdToFucVWp(MLambda,em,gs,cplcFdFucVWpL,cplcFdFucVWpR,     & 
& MFd,MFu,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

Real(dp), Intent(in) :: MFd(6),MFu(6),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplcFdFucVWpL(i1,i2)
CoupR = cplcFdFucVWpR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFu(i2)
Mex3 = MVWp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp/3._dp,2._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_U1T3R_FdToFucVWp


Subroutine Amplitude_WAVE_U1T3R_FdToFucVWp(cplcFdFucVWpL,cplcFdFucVWpR,               & 
& ctcplcFdFucVWpL,ctcplcFdFucVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,           & 
& ZfUR,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MFu(6),MFu2(6),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFucVWpL(6,6),ctcplcFdFucVWpR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfUL(6,6),ZfUR(6,6),ZfVWp

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFucVWpL(gt1,gt2) 
ZcoupT1R = ctcplcFdFucVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFucVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFucVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFdFucVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFdFucVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplcFdFucVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplcFdFucVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFucVWp


Subroutine Amplitude_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,             & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,        & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),          & 
& cplAhHpcVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6), & 
& cplcFdFdVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),              & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),               & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 


! {Ah, bar[Fd], bar[Fu]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFuFuAhL(i3,gt2,i1)
coup2R = cplcFuFuAhR(i3,gt2,i1)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
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


! {Fd, Ah, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = MHp 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, hh, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopHp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MHp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VP, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VZ, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MHp 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, VZp, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MHp 
coup1L = cplcFdFdVZpL(gt1,i1)
coup1R = cplcFdFdVZpR(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
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


! {Fd, hh, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVWp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFucVWpL(i1,gt2)
coup2R = cplcFdFucVWpR(i1,gt2)
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


! {Fd, VP, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFucVWpL(i1,gt2)
coup2R = cplcFdFucVWpR(i1,gt2)
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


! {Fd, VZ, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFucVWpL(i1,gt2)
coup2R = cplcFdFucVWpR(i1,gt2)
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


! {Fd, VZp, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = MVWp 
coup1L = cplcFdFdVZpL(gt1,i1)
coup1R = cplcFdFdVZpR(gt1,i1)
coup2L = cplcFdFucVWpL(i1,gt2)
coup2R = cplcFdFucVWpR(i1,gt2)
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


! {Fu, Hp, Ah}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopAh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MAh(i3) 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2,i3)
coup2R = cplcFuFuAhR(i1,gt2,i3)
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


! {Fu, Hp, hh}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = Mhh(i3) 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, VWp, hh}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, Hp, VP}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
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


! {Fu, VWp, VP}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
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


! {Fu, Hp, VZ}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVZ 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuVZL(i1,gt2)
coup2R = cplcFuFuVZR(i1,gt2)
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


! {Fu, VWp, VZ}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVZ)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFuVZL(i1,gt2)
coup2R = cplcFuFuVZR(i1,gt2)
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


! {Fu, Hp, VZp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVZp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuVZpL(i1,gt2)
coup2R = cplcFuFuVZpR(i1,gt2)
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


! {Fu, VWp, VZp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVZp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFuVZpL(i1,gt2)
coup2R = cplcFuFuVZpR(i1,gt2)
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


! {hh, bar[Fd], bar[Fu]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
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


! {VG, bar[Fd], bar[Fu]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fu]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
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


! {VZ, bar[Fd], bar[Fu]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFuFuVZL(i3,gt2)
coup2R = cplcFuFuVZR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
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


! {VZp, bar[Fd], bar[Fu]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVZpL(gt1,i2)
coup1R = cplcFdFdVZpR(gt1,i2)
coup2L = cplcFuFuVZpL(i3,gt2)
coup2R = cplcFuFuVZpR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFucVWp


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFucVWp(MAh,MFd,MFu,Mhh,MHp,MVG,              & 
& MVP,MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHpcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhHpcVWp,cplhhcVWpVWp,        & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),          & 
& cplAhHpcVWp(2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6), & 
& cplcFdFdVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),cplcFuFuVGL(6,6),              & 
& cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),  & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),               & 
& cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplhhHpcVWp(2),cplhhcVWpVWp(2),cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 


! {Fd, VP, conj[Hp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFucHpL(i1,gt2)
coup2R = cplcFdFucHpR(i1,gt2)
coup3 = cplHpcVWpVP
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fd, VP, conj[VWp]}
If ((Include_in_loopFd).and.(Include_in_loopVP).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFucVWpL(i1,gt2)
coup2R = cplcFdFucVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fu, Hp, VP}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVP 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = cplHpcVWpVP
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {Fu, VWp, VP}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVP)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
End if 


! {VG, bar[Fd], bar[Fu]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fu]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFdFucVWpL(i2,i3)
coup3R = cplcFdFucVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFucVWp


Subroutine Amplitude_WAVE_U1T3R_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,ctcplcFdFdVGL,       & 
& ctcplcFdFdVGR,MFd,MFd2,MVG,MVG2,ZfDL,ZfDR,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MVG,MVG2

Complex(dp), Intent(in) :: cplcFdFdVGL(6,6),cplcFdFdVGR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFdVGL(6,6),ctcplcFdFdVGR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdVGL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdVGR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVGL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVGR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVGL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVGR(gt1,i1)
End Do


! External Field 3 


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdVG


Subroutine Amplitude_VERTEX_U1T3R_FdToFdVG(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),          & 
& cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),  & 
& cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFdFucHpL(6,6),& 
& cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplVGVGVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
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


! {Fd, VG, VG}
If ((Include_in_loopFd).and.(Include_in_loopVG).and.(Include_in_loopVG)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFdFdVGL(gt1,i1)
coup1R = cplcFdFdVGR(gt1,i1)
coup2L = cplcFdFdVGL(i1,gt2)
coup2R = cplcFdFdVGR(i1,gt2)
coup3 = cplVGVGVG
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do
End if 


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZpL(gt1,i2)
coup1R = cplcFdFdVZpR(gt1,i2)
coup2L = cplcFdFdVZpL(i3,gt2)
coup2R = cplcFdFdVZpR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucVWpL(gt1,i2)
coup1R = cplcFdFucVWpR(gt1,i2)
coup2L = cplcFuFdVWpL(i3,gt2)
coup2R = cplcFuFdVWpR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdVG


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVG(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVGL,cplcFuFuVGR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),          & 
& cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFdFdVPL(6,6),  & 
& cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),& 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFdFucHpL(6,6),& 
& cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplVGVGVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 


! {Fd, VG, VG}
If ((Include_in_loopFd).and.(Include_in_loopVG).and.(Include_in_loopVG)) Then 
Do i1=1,6
ML1 = MFd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFdFdVGL(gt1,i1)
coup1R = cplcFdFdVGR(gt1,i1)
coup2L = cplcFdFdVGL(i1,gt2)
coup2R = cplcFdFdVGR(i1,gt2)
coup3 = cplVGVGVG
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do
End if 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVG


Subroutine Amplitude_WAVE_U1T3R_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,       & 
& ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,MFd,MFd2,MVP,MVP2,ZfDL,ZfDR,               & 
& ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(6),MFd2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),& 
& cplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ctcplcFdFdVPL(6,6),ctcplcFdFdVPR(6,6),ctcplcFdFdVZL(6,6),ctcplcFdFdVZR(6,6),          & 
& ctcplcFdFdVZpL(6,6),ctcplcFdFdVZpR(6,6)

Complex(dp), Intent(in) :: ZfDL(6,6),ZfDR(6,6),ZfVP,ZfVZpVP,ZfVZVP

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFdFdVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFdFdVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplcFdFdVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplcFdFdVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_U1T3R_FdToFdVP


Subroutine Amplitude_VERTEX_U1T3R_FdToFdVP(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,               & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplAhhhVP,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,              & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVP(2,2),cplcFdFdhhL(6,6,2),              & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 


! {Ah, bar[Fd], bar[Fd]}
If ((Include_in_loopAh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2,i1)
coup1R = cplcFdFdAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
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


! {Fd, hh, Ah}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopAh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
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


! {Fd, Ah, hh}
If ((Include_in_loopFd).and.(Include_in_loopAh).and.(Include_in_loophh)) Then 
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1,i2)
coup1R = cplcFdFdAhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZ).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZp, hh}
If ((Include_in_loopFd).and.(Include_in_loopVZp).and.(Include_in_loophh)) Then 
Do i1=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZpL(gt1,i1)
coup1R = cplcFdFdVZpR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VZ}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZ)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
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


! {Fd, hh, VZp}
If ((Include_in_loopFd).and.(Include_in_loophh).and.(Include_in_loopVZp)) Then 
Do i1=1,6
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZpL(i1,gt2)
coup2R = cplcFdFdVZpR(i1,gt2)
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


! {Fu, Hp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MHp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, VWp, Hp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopHp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
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


! {Fu, Hp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopHp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MHp 
ML3 = MVWp 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {Fu, VWp, VWp}
If ((Include_in_loopFu).and.(Include_in_loopVWp).and.(Include_in_loopVWp)) Then 
Do i1=1,6
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFdFucVWpL(gt1,i1)
coup1R = cplcFdFucVWpR(gt1,i1)
coup2L = cplcFuFdVWpL(i1,gt2)
coup2R = cplcFuFdVWpR(i1,gt2)
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


! {hh, bar[Fd], bar[Fd]}
If ((Include_in_loophh).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
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


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
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


! {VZ, bar[Fd], bar[Fd]}
If ((Include_in_loopVZ).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
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


! {VZp, bar[Fd], bar[Fd]}
If ((Include_in_loopVZp).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZpL(gt1,i2)
coup1R = cplcFdFdVZpR(gt1,i2)
coup2L = cplcFdFdVZpL(i3,gt2)
coup2R = cplcFdFdVZpR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
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


! {conj[Hp], bar[Fu], bar[Fu]}
If ((Include_in_loopHp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MHp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
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


! {conj[VWp], bar[Fu], bar[Fu]}
If ((Include_in_loopVWp).and.(Include_in_loopFu).and.(Include_in_loopFu)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucVWpL(gt1,i2)
coup1R = cplcFdFucVWpR(gt1,i2)
coup2L = cplcFuFdVWpL(i3,gt2)
coup2R = cplcFuFdVWpR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
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
End Subroutine Amplitude_VERTEX_U1T3R_FdToFdVP


Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVP(MAh,MFd,MFu,Mhh,MHp,MVG,MVP,            & 
& MVWp,MVZ,MVZp,MAh2,MFd2,MFu2,Mhh2,MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplAhhhVP,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFdFdVGL,     & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHpL,            & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,              & 
& cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(2),MFd(6),MFu(6),Mhh(2),MHp,MVG,MVP,MVWp,MVZ,MVZp,MAh2(2),MFd2(6),MFu2(6),        & 
& Mhh2(2),MHp2,MVG2,MVP2,MVWp2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),cplAhhhVP(2,2),cplcFdFdhhL(6,6,2),              & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),& 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFdFdVZL(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),& 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),             & 
& cplhhVPVZ(2),cplhhVPVZp(2),cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 


! {VG, bar[Fd], bar[Fd]}
If ((Include_in_loopVG).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do
End if 


! {VP, bar[Fd], bar[Fd]}
If ((Include_in_loopVP).and.(Include_in_loopFd).and.(Include_in_loopFd)) Then 
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End if 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_U1T3R_FdToFdVP



End Module OneLoopDecay_Fd_U1T3R
