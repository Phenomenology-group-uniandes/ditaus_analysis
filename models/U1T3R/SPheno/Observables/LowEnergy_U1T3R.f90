! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module LowEnergy_U1T3R 
Use Control 
Use Settings 
Use Couplings_U1T3R 
Use LoopCouplings_U1T3R 
Use LoopMasses_SM_HC 
Use LoopFunctions 
Use LoopMasses_U1T3R 
Use StandardModel 
Use RunSM_U1T3R
Private::F1,F2,F3,F4,F3Gamma
!private variables
 

Contains


Subroutine Gminus2(Ifermion,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,             & 
& MVZp,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,              & 
& cplFvFvVPR,cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,a_mu)

Real(dp),Intent(in)  :: MAh(2),MAh2(2),MFe(6),MFe2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVZp,MVZp2

Complex(dp),Intent(in)  :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),               & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcFeFvcHpL(6,9), & 
& cplcFeFvcHpR(6,9),cplHpcHpVP

Real(dp), Intent(out) :: a_mu 
Integer, Intent(in) :: Ifermion 
Real(dp) :: ratio, chargefactor 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
a_mu = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 3,2
  Do i2= 1,6
   i3 = i2
  If ((MAh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
ratio = MAh2(i1)/MFe2(i2)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh).and.IncludePenguins) Then 
Do i1= 1,6
  Do i2= 1,2
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(Mhh2(i2).gt.mz2).Or.(MAh2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
ratio = Mhh2(i2)/MFe2(i1)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFe(i1)& 
      & +2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFe2(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh).and.IncludePenguins) Then 
Do i1= 1,6
  Do i2= 3,2
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(MAh2(i2).gt.mz2).Or.(Mhh2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
ratio = MAh2(i2)/MFe2(i1)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFe(i1)& 
      & +2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFe2(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp).and.IncludePenguins) Then 
Do i1= 1,9
  Do i2= 2,1
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHp2.gt.mz2).Or.(MHp2.gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
ratio = MHp2/MFv2(i1)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFv(i1)& 
      & +2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFv2(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 1,2
  Do i2= 1,6
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
ratio = Mhh2(i1)/MFe2(i2)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,6
   i3 = i2
  If ((MVZp2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
ratio = MVZp2/MFe2(i2)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 8._dp*chargefactor*ratio*(Real(coup1L*Conjg(coup1R),dp)*gFFV(ratio)/MFe(i2)& 
      & + 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*fFFV(ratio)/MFe2(i2)) 
End if 
 
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv).and.IncludePenguins) Then 
Do i1= 2,1
  Do i2= 1,9
   i3 = i2
  If ((MHp2.gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
ratio = MHp2/MFv2(i2)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - chargefactor*(Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFv(i2)& 
      & - 2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFv2(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


a_mu = a_mu*MFe(Ifermion)*oo16pi2 
Iname = Iname -1 
 
End Subroutine Gminus2 
 
 
Subroutine LeptonEDM(Ifermion,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,           & 
& cplFvFeHpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,cplcVWpVPVWp,EDM)

Implicit None
Real(dp),Intent(in)  :: MAh(2),MAh2(2),MFe(6),MFe2(6),MFv(9),MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,            & 
& MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp),Intent(in)  :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplAhhhVP(2,2),cplFvFeHpL(9,6),cplFvFeHpR(9,6), & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),               & 
& cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6), & 
& cplcFeFeVZpR(6,6),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9), & 
& cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplHpcHpVP,cplcVWpVPVWp

Real(dp), Intent(out) :: EDM 
Real(dp) :: ratio, chargefactor 
Integer, Intent(in) :: Ifermion 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
EDM = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 3,2
  Do i2= 1,6
   i3 = i2
  If ((MAh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2,i1)
coup1R = cplcFeFeAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
!ratio = MFe2(i2)/MAh2(i1)
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM -(-1)* chargefactor*Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*MFe(i2)/MAh2(i1) 
!End if 
 
ratio = MAh2(i1)/MFe2(i2)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 0.5_dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*F3gamma(ratio)/MFe(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopAh).and.IncludePenguins) Then 
Do i1= 1,6
  Do i2= 1,2
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(Mhh2(i2).gt.mz2).Or.(MAh2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
!ratio = MFe2(i1)/Mhh2(i2)
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM +(0)* chargefactor*Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*MFe(i1)/Mhh2(i2) 
!End if 
 
ratio = Mhh2(i2)/MFe2(i1)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - chargefactor*(Aimag(coup1L*Conjg(coup1R))*F4(ratio)/MFe(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loophh).and.IncludePenguins) Then 
Do i1= 1,6
  Do i2= 3,2
   i3 = i2
  If ((MFe2(i1).gt.mz2).Or.(MAh2(i2).gt.mz2).Or.(Mhh2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i1,i2)
coup1R = cplcFeFeAhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
!ratio = MFe2(i1)/MAh2(i2)
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM +(0)* chargefactor*Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*MFe(i1)/MAh2(i2) 
!End if 
 
ratio = MAh2(i2)/MFe2(i1)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - chargefactor*(Aimag(coup1L*Conjg(coup1R))*F4(ratio)/MFe(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopHp).and.IncludePenguins) Then 
Do i1= 1,9
  Do i2= 2,1
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHp2.gt.mz2).Or.(MHp2.gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i1)
coup1R = cplcFeFvcHpR(gt1,i1)
coup2L = cplFvFeHpL(i1,gt2)
coup2R = cplFvFeHpR(i1,gt2)
!ratio = MFv2(i1)/MHp2
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM +(1)* chargefactor*Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*MFv(i1)/MHp2 
!End if 
 
ratio = MHp2/MFv2(i1)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - chargefactor*(Aimag(coup1L*Conjg(coup1R))*F4(ratio)/MFv(i1)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVWp).and.(Include_in_loopVWp).and.IncludePenguins) Then 
Do i1= 1,9
  i2= 1
  If ((MFv2(i1).gt.mz2).Or.(MVWp2.gt.mz2).Or.(MVWp2.gt.mz2)) Then
coup1L = cplcFeFvcVWpL(gt1,i1)
coup1R = cplcFeFvcVWpR(gt1,i1)
coup2L = cplFvFeVWpL(i1,gt2)
coup2R = cplFvFeVWpR(i1,gt2)
ratio = MVWp2/MFv2(i1)
 chargefactor = chargefactor*(1._dp)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 2._dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*gVVF(ratio)/MFv(i1)) 
End if 
 
End if 
   End Do
End if 


chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
Do i1= 1,2
  Do i2= 1,6
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
!ratio = MFe2(i2)/Mhh2(i1)
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM -(-1)* chargefactor*Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*MFe(i2)/Mhh2(i1) 
!End if 
 
ratio = Mhh2(i1)/MFe2(i2)
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 0.5_dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*F3gamma(ratio)/MFe(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVP).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,6
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
ratio = 0._dp/MFe2(i2)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 4._dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*gFFV(ratio)/MFe(i2)) 
End if 
 
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVZ).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,6
   i3 = i2
  If ((MVZ2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
ratio = MVZ2/MFe2(i2)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 4._dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*gFFV(ratio)/MFe(i2)) 
End if 
 
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopFe).and.IncludePenguins) Then 
  Do i2= 1,6
   i3 = i2
  If ((MVZp2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZpL(gt1,i2)
coup1R = cplcFeFeVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
ratio = MVZp2/MFe2(i2)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 chargefactor = chargefactor*(1._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 4._dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*gFFV(ratio)/MFe(i2)) 
End if 
 
End if 
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopFv).and.IncludePenguins) Then 
Do i1= 2,1
  Do i2= 1,9
   i3 = i2
  If ((MHp2.gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHpL(gt1,i2)
coup1R = cplcFeFvcHpR(gt1,i2)
coup2L = cplFvFeHpL(i3,gt2)
coup2R = cplFvFeHpR(i3,gt2)
!ratio = MFv2(i2)/MHp2
 !If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
!EDM = EDM -(0)* chargefactor*Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*MFv(i2)/MHp2 
!End if 
 
ratio = MHp2/MFv2(i2)
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 0.5_dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*F3gamma(ratio)/MFv(i2)) 
End if 
 
End if 
   End Do
  End Do
End if 


chargefactor = 1 
If ((Include_in_loopVWp).and.(Include_in_loopFv).and.(Include_in_loopFv).and.IncludePenguins) Then 
  Do i2= 1,9
   i3 = i2
  If ((MVWp2.gt.mz2).Or.(MFv2(i2).gt.mz2).Or.(MFv2(i3).gt.mz2)) Then
coup1L = cplcFeFvcVWpL(gt1,i2)
coup1R = cplcFeFvcVWpR(gt1,i2)
coup2L = cplFvFeVWpL(i3,gt2)
coup2R = cplFvFeVWpR(i3,gt2)
ratio = MVWp2/MFv2(i2)
 ratio = 1._dp/ratio ! conventions in 1402.7065 are different 
 chargefactor = chargefactor*(0._dp)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM - 4._dp*chargefactor*(Aimag(coup1L*Conjg(coup1R))*gFFV(ratio)/MFv(i2)) 
End if 
 
End if 
  End Do
End if 


EDM = ecmfactor*EDM*oo16pi2 
Iname = Iname -1 
 
End Subroutine LeptonEDM 
 
 
Subroutine DeltaRho(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhhhVZ,          & 
& cplAhHpcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcgAgWpcVWp,         & 
& cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,    & 
& cplcgZpgWpcVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,               & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,             & 
& cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcVWpVWpVZVZ1,   & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplFvFvVZL,cplFvFvVZR,cplhhcVWpVWp,cplhhhhcVWpVWp,     & 
& cplhhhhVZVZ,cplhhHpcVWp,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpcVWpVWp,cplHpcHpVZ,     & 
& cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,rho)

Implicit None
Real(dp),Intent(in)  :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp),Intent(in)  :: cplAhAhcVWpVWp(2,2),cplAhAhVZVZ(2,2),cplAhhhVZ(2,2),cplAhHpcVWp(2),cplcFdFdVZL(6,6),  & 
& cplcFdFdVZR(6,6),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFeVZL(6,6),               & 
& cplcFeFeVZR(6,6),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplcFuFuVZL(6,6),               & 
& cplcFuFuVZR(6,6),cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,               & 
& cplcgWCgZpcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcVWpcVWpVWpVWp1,           & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,           & 
& cplcVWpVWpVZpVZp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplFvFvVZL(9,9),     & 
& cplFvFvVZR(9,9),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhHpcVWp(2),   & 
& cplhhVPVZ(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpcVWpVWp,cplHpcHpVZ,cplHpcHpVZVZ,       & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp

Real(dp), Intent(out) :: rho 
Integer :: i1, i2, i3, kont 
Real(dp) ::  delta_rho, delta_rho0, Drho_top, mu_old 
Complex(dp) ::  dmW2, dmz2 
mu_old = SetRenormalizationScale(mZ2) 
 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

Call Pi1LoopVWp(0._dp,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,dmW2)

Drho_top = 3*G_F*mf_u(3)**2*oosqrt2*oo8pi2 
 
mu_old = SetRenormalizationScale(mu_old) 
 
! Tree Level 
delta_rho0 =  0 
 
! 1-Loop Level 
delta_rho =  dmZ2/mz2 - dMW2/mW2 - drho_top 
 Rho= delta_rho + delta_rho0
End subroutine DeltaRho 
 
 
Subroutine STUparameter(vSM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,MAh,MAh2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,            & 
& MVZp2,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,cplcVWpVPVWp,               & 
& cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,               & 
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
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,         & 
& Spar,Tpar,Upar)

Implicit None
Real(dp),Intent(in)  :: MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),           & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2

Complex(dp),Intent(in)  :: cplAhcHpVWp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,          & 
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

Real(dp), Intent(out) :: Spar,Tpar,Upar 
Integer :: i1, i2, i3, kont 
Real(dp) ::  mu_old, cw2, sw2, rMS_SM_save 
Real(dp) ::  delta_T_SM, delta_S_SM, delta_U_SM 
Complex(dp) :: PiZZ, PiZZ_mz2, PiWW,PiWW_mw2,PiZg_mz2, Pigg_mz2 
Complex(dp) :: PiZZ_SM, PiZZ_mz2_SM, PiWW_SM,PiWW_mw2_SM,PiZg_mz2_SM, Pigg_mz2_SM 
Complex(dp) :: LamSM 
Complex(dp), Intent(in) :: YdSM(3,3), YuSM(3,3), YeSM(3,3) 
Real(dp), Intent(in) :: g1SM,g2SM,g3SM,vSM 
mu_old = SetRenormalizationScale(mZ2) 
 
LamSM = Mhh2(1)/vSM**2
 
Call OneLoop_Z_W_Gamma_SM(vSM,g1SM,g2SM,g3SM,LamSM,YuSM,YdSM,YeSM,kont, & 
 & PiZZ_SM,PiZZ_mz2_SM,PiWW_SM,PiWW_mw2_SM,PiZg_mz2_SM,Pigg_mz2_SM) 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,PiZZ)

Call Pi1LoopVZ(MVZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,PiZZ_mz2)

Call Pi1LoopVWp(0._dp,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiWW)

Call Pi1LoopVWp(MVWp2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,PiWW_mw2)

Call Pi1LoopVPVZ(MVZ2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,               & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhVPVZ,cplAhhhVP,cplAhhhVZ,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHpVPVWp,cplcHpVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZp,          & 
& cplhhVZVZ,cplhhVZVZp,cplHpcHpVP,cplHpcHpVPVZ,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& kont,PiZg_mz2)

Call Pi1LoopVP(MVZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcHpVP,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,     & 
& cplhhhhVPVP,cplHpcHpVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& kont,Pigg_mz2)

PiZZ = PiZZ - PiZZ_SM 
PiZZ_mz2 = PiZZ_mz2 - PiZZ_mz2_SM 
PiWW = PiWW - PiWW_SM 
PiWW_mw2 = PiWW_mw2 - PiWW_mw2_SM 
PiZg_mz2 = PiZg_mz2 - PiZg_mz2_SM 
Pigg_mz2 = Pigg_mz2 - Pigg_mz2_SM 
sw2 = 0.22290_dp 
cw2 = 1._dp - sw2 
 
mu_old = SetRenormalizationScale(mu_old) 
 
! T-parameter 
Tpar= PiWW/mW2 - PiZZ/mz2   
 Tpar= -Tpar/alpha 


! S-parameter 
Spar= (PiZZ_mz2-PiZZ)/mz2 - (cw2-sw2)/(sqrt(cw2*sw2))*PiZg_mz2/mz2 - Pigg_mz2/mz2
Spar= -4._dp*sw2*cw2/alpha*Spar 


! U-parameter 
Upar= (PiWW_mw2-PiWW)/mw2 -cw2*(PiZZ_mz2-PiZZ)/mz2 - 2._dp*(sqrt(cw2*sw2))*PiZg_mz2/mz2 - sw2*Pigg_mz2/mz2
Upar= -4._dp*sw2/alpha*Upar 


End subroutine STUparameter 
 
 
Subroutine CalculateLowEnergyConstraints(g1input,g1Xinput,g2input,g3input,            & 
& gXinput,gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,YuLinput,YvRinput,        & 
& YuRinput,YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,mChiEinput,mChiNuinput,        & 
& mChiUinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput,Tpar,Spar,Upar,ae,amu,              & 
& atau,EDMe,EDMmu,EDMtau,dRho)

Real(dp),Intent(inout) :: g1input,g1Xinput,g2input,g3input,gXinput,gX1input,LamHinput,LamPhiHinput,             & 
& LamPhiinput,mu2Hinput,mu2Phiinput,vHinput,vPhiinput

Complex(dp),Intent(inout) :: YvLinput(3,3),YuLinput(3,3),YvRinput(3,3),YuRinput(3,3),YdLinput(3,3),YeLinput(3,3),  & 
& YdRinput(3,3),YeRinput(3,3),mChiDinput(3,3),mChiEinput(3,3),mChiNuinput(3,3),          & 
& mChiUinput(3,3)

Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp) :: cplAhAhcVWpVWp(2,2),cplAhAhhh(2,2,2),cplAhAhVPVP(2,2),cplAhAhVPVZ(2,2),               & 
& cplAhAhVPVZp(2,2),cplAhAhVZVZ(2,2),cplAhAhVZVZp(2,2),cplAhcHpVWp(2),cplAhhhVP(2,2),    & 
& cplAhhhVZ(2,2),cplAhhhVZp(2,2),cplAhHpcVWp(2),cplcFdFdAhL(6,6,2),cplcFdFdAhR(6,6,2),   & 
& cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),               & 
& cplcFdFdVPL(6,6),cplcFdFdVPR(6,6),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),& 
& cplcFdFdVZR(6,6),cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplcFdFucVWpL(6,6),               & 
& cplcFdFucVWpR(6,6),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFehhL(6,6,2),           & 
& cplcFeFehhR(6,6,2),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),& 
& cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),& 
& cplcFuFuAhL(6,6,2),cplcFuFuAhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFuFuVGL(6,6),cplcFuFuVGR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),cplcFuFuVZL(6,6),  & 
& cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),cplcFuFuVZR(6,6),cplcgAgWpcVWp,cplcgWCgAcVWp,      & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,      & 
& cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplcVWpcVWpVWpVWp1,  & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVPVWpVZp1,         & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplcVWpVWpVZ,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,        & 
& cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,   & 
& cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,cplFvFeHpL(9,6),cplFvFeHpR(9,6),    & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvhhL(9,9,2),& 
& cplFvFvhhR(9,9,2),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZpL(9,9),    & 
& cplFvFvVZpR(9,9),cplFvFvVZR(9,9),cplhhcHpVWp(2),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),   & 
& cplhhhhhh(2,2,2),cplhhhhVPVP(2,2),cplhhhhVPVZ(2,2),cplhhhhVPVZp(2,2),cplhhhhVZVZ(2,2), & 
& cplhhhhVZVZp(2,2),cplhhHpcHp(2),cplhhHpcVWp(2),cplhhVPVZ(2),cplhhVPVZp(2),             & 
& cplhhVZpVZp(2),cplhhVZVZ(2),cplhhVZVZp(2),cplHpcHpcVWpVWp,cplHpcHpVP,cplHpcHpVPVP,     & 
& cplHpcHpVPVZ,cplHpcHpVPVZp,cplHpcHpVZ,cplHpcHpVZp,cplHpcHpVZVZ,cplHpcHpVZVZp,          & 
& cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,cplVGVGVG

Real(dp),Intent(out) :: Tpar,Spar,Upar,ae,amu,atau,EDMe,EDMmu,EDMtau,dRho

Complex(dp) :: c7,c7p,c8,c8p 
Real(dp) :: ResultMuE(6), ResultTauMeson(3), ResultTemp(99) 
Real(dp) :: epsTree=1.0E-20_dp 
Complex(dp), Dimension(3,3) :: UpYukawa_save, DownYukawa_save, ElectronYukawa_save, CKMsave 
Complex(dp) :: YuSM(3,3),YeSM(3,3),YdSM(3,3) 
Real(dp)::g1SM, g2SM, g3SM, vSM 
Real(dp) ::Qin,vev2,sinw2, mzsave, scalein, scale_save, gSM(11),Qinsave, maxdiff =0._dp 
Integer :: i1, i2, i3, gt1, gt2, gt3, gt4,iQTEST, iQFinal 
Integer :: IndexArray4(99,4), IndexArray3(99,3), IndexArray2(99,2)   
Write(*,*) "Calculating low energy constraints" 
If (MatchingOrder.gt.-1) Then 
g1Xinput = Sqrt(5._dp/3._dp)*g1Xinput 
gX1input = 1*gX1input 


End if 
!-------------------------------------
! running to 160 GeV for b -> so gamma
!-------------------------------------

Qin=sqrt(getRenormalizationScale()) 
scale_save = Qin 
Call RunSM_and_SUSY_RGEs(160._dp,g1input,g1Xinput,g2input,g3input,gXinput,            & 
& gX1input,LamHinput,LamPhiHinput,LamPhiinput,YvLinput,YuLinput,YvRinput,YuRinput,       & 
& YdLinput,YeLinput,YdRinput,YeRinput,mChiDinput,mChiEinput,mChiNuinput,mChiUinput,      & 
& mu2Hinput,mu2Phiinput,vHinput,vPhiinput,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,              & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& vH,vPhi,CKM_160,sinW2_160,Alpha_160,AlphaS_160,.false.)

If (MatchingOrder.eq.-1) Then 
g1=g1input 
g1X=g1Xinput 
g2=g2input 
g3=g3input 
gX=gXinput 
gX1=gX1input 
LamH=LamHinput 
LamPhiH=LamPhiHinput 
LamPhi=LamPhiinput 
YvL=YvLinput 
YuL=YuLinput 
YvR=YvRinput 
YuR=YuRinput 
YdL=YdLinput 
YeL=YeLinput 
YdR=YdRinput 
YeR=YeRinput 
mChiD=mChiDinput 
mChiE=mChiEinput 
mChiNu=mChiNuinput 
mChiU=mChiUinput 
mu2H=mu2Hinput 
mu2Phi=mu2Phiinput 
vH=vHinput 
vPhi=vPhiinput 
End if 

! ## All contributions ## 

Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

 mf_d_160 = MFd(1:3) 
 mf_d2_160 = MFd(1:3)**2 
 mf_u_160 = MFu(1:3) 
 mf_u2_160 = MFu(1:3)**2 
 mf_l_160 = MFe(1:3) 
 mf_l2_160 = MFe(1:3)**2 
If (WriteParametersAtQ) Then 
! Write running parameters at Q=160 GeV in output file 
g1input = g1
g1Xinput = g1X
g2input = g2
g3input = g3
gXinput = gX
gX1input = gX1
LamHinput = LamH
LamPhiHinput = LamPhiH
LamPhiinput = LamPhi
YvLinput = YvL
YuLinput = YuL
YvRinput = YvR
YuRinput = YuR
YdLinput = YdL
YeLinput = YeL
YdRinput = YdR
YeRinput = YeR
mChiDinput = mChiD
mChiEinput = mChiE
mChiNuinput = mChiNu
mChiUinput = mChiU
mu2Hinput = mu2H
mu2Phiinput = mu2Phi
vHinput = vH
vPhiinput = vPhi
End If 
 
Mhh= MhhL 
Mhh2 = Mhh2L 
MAh= MAhL 
MAh2 = MAh2L 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
Call AllCouplings(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,gX,g1X,              & 
& TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,           & 
& cplhhhhhh,cplhhHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,           & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,              & 
& cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,    & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,             & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR)


! ## SM only ##

CKM = CKMsave 
!-------------------------------------
! running to M_Z 
!-------------------------------------

scalein=SetRenormalizationScale(scale_save**2) 
If (MatchingOrder.gt.-1) Then 
Call RunSM_and_SUSY_RGEs(mz,g1input,g1Xinput,g2input,g3input,gXinput,gX1input,        & 
& LamHinput,LamPhiHinput,LamPhiinput,YvLinput,YuLinput,YvRinput,YuRinput,YdLinput,       & 
& YeLinput,YdRinput,YeRinput,mChiDinput,mChiEinput,mChiNuinput,mChiUinput,               & 
& mu2Hinput,mu2Phiinput,vHinput,vPhiinput,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,              & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& vH,vPhi,CKM_MZ,sinW2_MZ,Alpha_MZ,AlphaS_MZ,.true.)

Else 
g1=g1input 
g1X=g1Xinput 
g2=g2input 
g3=g3input 
gX=gXinput 
gX1=gX1input 
LamH=LamHinput 
LamPhiH=LamPhiHinput 
LamPhi=LamPhiinput 
YvL=YvLinput 
YuL=YuLinput 
YvR=YvRinput 
YuR=YuRinput 
YdL=YdLinput 
YeL=YeLinput 
YdR=YdRinput 
YeR=YeRinput 
mChiD=mChiDinput 
mChiE=mChiEinput 
mChiNu=mChiNuinput 
mChiU=mChiUinput 
mu2H=mu2Hinput 
mu2Phi=mu2Phiinput 
vH=vHinput 
vPhi=vPhiinput 
End if 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

mzsave  = sqrt(mz2) 
 mf_d_mz = MFd(1:3) 
 mf_d2_mz = MFd(1:3)**2 
 mf_u_mz = MFu(1:3) 
 mf_u2_mz = MFu(1:3)**2 
 mf_l_MZ = MFe(1:3) 
 mf_l2_MZ = MFe(1:3)**2 
Call AllCouplings(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g1,g2,gX1,TW,gX,g1X,              & 
& TWp,g3,YdL,YdR,ZDL,ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,           & 
& cplhhhhhh,cplhhHpcHp,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpcVWp,cplAhcHpVWp,           & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplHpcHpVZp,cplhhVPVZ,cplhhVPVZp,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,    & 
& cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,              & 
& cplcVWpVWpVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,     & 
& cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,    & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplFvFeVWpL,cplFvFeVWpR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVGL,             & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdFucVWpL,cplcFdFucVWpR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,             & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR)

Mhh_s = Mhh 
Mhh2_s  = Mhh2   
MAh_s = MAh 
MAh2_s  = MAh2   
Mhh= MhhL 
Mhh2 = Mhh2L 
MAh= MAhL 
MAh2 = MAh2L 
Mhh= Mhh_s 
Mhh2 = Mhh2_s 
MAh= MAh_s 
MAh2 = MAh2_s 

! *****  G minus 2 ***** 

Call Gminus2(1,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVZp,MVZp2,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,ae)

Call Gminus2(2,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVZp,MVZp2,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,amu)

Call Gminus2(3,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVZp,MVZp2,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplHpcHpVP,atau)


! *****  Lepton EDM ***** 

Call LeptonEDM(1,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,MVZp,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,cplcVWpVPVWp,EDMe)

Call LeptonEDM(2,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,MVZp,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,cplcVWpVPVWp,EDMmu)

Call LeptonEDM(3,MAh,MAh2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,MVZp,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVP,cplFvFeHpL,cplFvFeHpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvVPL,cplFvFvVPR,               & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,cplcVWpVPVWp,EDMtau)


! *****  delta Rho ***** 

sinW2=0.22290_dp 
TW = asin(sqrt(sinW2)) 
g2SM=2._dp*Sqrt(alpha*pi/sinW2) 
g1SM=g2SM*Sqrt(sinW2/(1._dp-sinW2)) 
If (MatchingOrder.gt.-1) Then 
   vSM = Sqrt(mZ2*(1._dp-sinW2)*SinW2/(pi*alpha)) 
 Else
   vSM=1/Sqrt((G_F*Sqrt(2._dp)))
End if
YuSM=0._dp
YdSM=0._dp
YeSM=0._dp
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
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

Call DeltaRho(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhhhVZ,              & 
& cplAhHpcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcgAgWpcVWp,         & 
& cplcgWCgAcVWp,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,    & 
& cplcgZpgWpcVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,               & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,             & 
& cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplcVWpVWpVZVZ1,   & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplFvFvVZL,cplFvFvVZR,cplhhcVWpVWp,cplhhhhcVWpVWp,     & 
& cplhhhhVZVZ,cplhhHpcVWp,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpcVWpVWp,cplHpcHpVZ,     & 
& cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplHpcVWpVZp,dRho)

Call STUparameter(vSM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,MAh,MAh2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,               & 
& cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplcHpVWpVZp,    & 
& cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,    & 
& cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,    & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,     & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,    & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplHpcVWpVZp,cplcVWpVWpVZp,            & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,cplAhHpcVWp,cplcFdFucVWpL,       & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,   & 
& cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,               & 
& cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,  & 
& cplAhAhVPVZp,cplhhhhVPVZp,cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,             & 
& cplcVWpVPVWpVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,             & 
& cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3,Spar,Tpar,Upar)

Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

CalculateOneLoopMassesSave = CalculateOneLoopMasses 
If (MatchingOrder.gt.-1) Then 
CalculateOneLoopMasses = .true. 
Call OneLoopMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

CalculateOneLoopMasses = CalculateOneLoopMassesSave 
nuMixing = UV 
End if 
MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
If (WriteParametersAtQ) Then 
scalein = SetRenormalizationScale(160._dp**2) 
Else 
scalein = SetRenormalizationScale(scale_save**2) 
End if 
mz2 = mzsave**2 
mz = mzsave 
End subroutine CalculateLowEnergyConstraints 
 
 
End Module LowEnergy_U1T3R 
