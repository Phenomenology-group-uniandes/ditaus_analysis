! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:51 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_U1T3R 
 
Use Control 
Use Settings 
Use Couplings_U1T3R 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Real(dp) Function Alpha_MSbar(Q,mW,mt) 
Implicit None 
Real(dp),Intent(in)::Q,mW 
Real(dp),Intent(in),Optional::mt 
Real(dp)::DeltaAlpha 
If (MZ_input) Then 
Alpha_MSbar=Alpha_mZ_MS 
If (Present(mt)) Then 
DeltaAlpha=-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha_MSbar/(1._dp+DeltaAlpha*alpha) 
End If 
Else 
DeltaAlpha=3.5_dp*Log(Q/mW)/Pi+0.5_dp*oo3pi 
If (Present(mt)) DeltaAlpha=DeltaAlpha-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha/(1._dp-Delta_Alpha_Lepton-Delta_Alpha_Hadron& 
&+DeltaAlpha*alpha) 
Alpha_MZ_MS=Alpha_MSbar 
End If 
End Function Alpha_MSbar
 
 
Real(dp) Function AlphaEwDR(Q,MHp,MVWp,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::Q,MHp,MVWp,MFd(6),MFu(6),MFe(6)
Integer::i1 
Real(dp)::DeltaAlpha 
If (MZ_input) then 
DeltaAlpha=1._dp-Alpha/Alpha_MZ_MS! MSbar value^=mW+light fermions 
DeltaAlpha=DeltaAlpha+alpha/(6._dp*Pi)*(1._dp-rMS)! conversion to DRbar if necessary 
If (MHp.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MHp/ Q)*Alpha/(2._dp*pi) 
End if 
If (MVWp.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MVWp/ Q)*Alpha/(2._dp*pi) 
End if 
Do i1=1,6
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/9._dp*Log(MFd(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,6
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-16._dp/9._dp*Log(MFu(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,6
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/3._dp*Log(MFe(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Else 
DeltaAlpha=7._dp*Log(Q/mW)
If (MHp.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHp/ Q)
End if 
If (MVWp.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWp/ Q)
End if 
Do i1=1,6
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End if 
End Do 
Do i1=1,6
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End if 
End Do 
Do i1=1,6
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End if 
End Do 
DeltaAlpha=Delta_Alpha_Lepton+Delta_Alpha_Hadron& 
    &-alpha*DeltaAlpha/(2._dp*Pi) 
End If 
 
AlphaEwDR=Alpha/(1._dp-DeltaAlpha) 
 
End Function AlphaEwDR 
 
 
Real(dp) Function AlphaSDR(Q,MFd,MFu) 
Real(dp),Intent(in)::Q,MFd(6),MFu(6) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha = 0._dp 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha = 0.5_dp 
End if 
Do i1=1,6
 If (Abs(MFd(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
 End If 
End Do 
Do i1=1,6
 If (Abs(MFu(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
 End If 
End Do 
DeltaAlpha=AlphaS_mZ*DeltaAlpha/(2._dp*Pi) 
AlphaSDR=AlphaS_mZ/(1._dp-DeltaAlpha)
 
End Function AlphaSDR 
Real(dp) Function AlphaEW_T(AlphaEW_In, Q,MHp,MVWp,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MHp,MVWp,MFd(6),MFu(6),MFe(6)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=1._dp/(3._dp)*(1._dp-rMS)! conversion to DRbar if necessary 
Do i1=4,6
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,6
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End Do 
Do i1=4,6
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End Do 
DeltaAlpha=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
AlphaEW_T=AlphaEW_in/(1._dp-DeltaAlpha) 
 
End Function AlphaEW_T 
 
 
Real(dp) Function DeltaAlphaEW_T(AlphaEW_In, Q,MHp,MVWp,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MHp,MVWp,MFd(6),MFu(6),MFe(6)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp
Do i1=4,6
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,6
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End Do 
Do i1=4,6
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End Do 
DeltaAlphaEW_T=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
End Function DeltaAlphaEW_T 
 
 
Real(dp) Function AlphaS_T(AlphaS_In, Q,MFd,MFu) 
Real(dp),Intent(in):: AlphaS_In, Q,MFd(6),MFu(6) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp 
!Conversion to DR bar if necessary 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha=0.5_dp 
End if
Do i1=4,6
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,6
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
End Do 
DeltaAlpha=AlphaS_In*DeltaAlpha/(2._dp*Pi) 
   AlphaS_T=AlphaS_In/(1._dp-DeltaAlpha)
 
End Function AlphaS_T



Subroutine DeltaVB(sinW2,sinW2_dr,rho,MAh,MFe,MFv,Mhh,MHp,MVZp,g1,g1X,g2,             & 
& gX,gX1,TW,TWp,ZER,UVinput,ZEL,YeL,YeR,YvL,YvR,ZA,ZH,res)

Implicit None 
Real(dp),Intent(in) :: MAh(2),MFe(6),MFv(9),Mhh(2),MHp,MVZp,g1,g1X,g2,gX,gX1,TW,TWp,ZA(2,2),ZH(2,2)

Complex(dp),Intent(in) :: ZER(6,6),UVinput(9,9),ZEL(6,6),YeL(3,3),YeR(3,3),YvL(3,3),YvR(3,3)

Real(dp) :: MAh2(2),MFe2(6),MFv2(9),Mhh2(2),MHp2,MVZp2

Complex(dp) :: cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),          & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),               & 
& cplFvFeHpL(9,6),cplFvFeHpR(9,6),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplFvFvhhL(9,9,2), & 
& cplFvFvhhR(9,9,2),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9)

Complex(dp) :: UV(9,9) 
Integer :: i1,i2,i3,i4,gt1,gt2,gt3,gt4 
Real(dp), Intent(in) :: sinW2,sinW2_Dr, rho 
Real(dp), Intent(out) :: res 
 
Complex(dp) :: sumI, coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,coup3, coup4L,coup4R, teil 
Complex(dp) :: D27m2, D0m2, vertex, phase 
Real(dp) :: cosW2, cosW2_Dr, chargefactor 
Iname = Iname+1
NameOfUnit(Iname) = "DeltaVB" 
MAh2 = MAh**2 
MFe2 = MFe**2 
MFv2 = MFv**2 
Mhh2 = Mhh**2 
MHp2 = MHp**2 
MVZp2 = MVZp**2 

 
 ! Fix neutrino phases 
 
Do i1=1,9
  phase=(1._dp,0._dp) 
  If (Abs(UVinput(i1,i1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,i1))/Abs(UVinput(i1,i1)) 
     Else If (Abs(UVinput(i1,1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,1))/Abs(UVinput(i1,1)) 
     Else If (Abs(UVinput(i1,2)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,2))/Abs(UVinput(i1,2)) 
     Else If (Abs(UVinput(i1,3)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,3))/Abs(UVinput(i1,3)) 
     Else If (Abs(UVinput(i1,4)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,4))/Abs(UVinput(i1,4)) 
     Else If (Abs(UVinput(i1,5)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,5))/Abs(UVinput(i1,5)) 
     Else If (Abs(UVinput(i1,6)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,6))/Abs(UVinput(i1,6)) 
     Else If (Abs(UVinput(i1,7)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,7))/Abs(UVinput(i1,7)) 
     Else If (Abs(UVinput(i1,8)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,8))/Abs(UVinput(i1,8)) 
     Else If (Abs(UVinput(i1,9)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,9))/Abs(UVinput(i1,9)) 
  End If 
 UV(i1,:) = UVinput(i1,:)*phase 
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


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,ZEL,ZER,TW,TWp,cplcFeFeVZpL(gt1,gt2)  & 
& ,cplcFeFeVZpR(gt1,gt2))

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


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gX,g1X,gX1,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)         & 
& ,cplFvFvVZpR(gt1,gt2))

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


!-------------------------- 
!SM Contributions 
!-------------------------- 
cosW2 = 1._dp - sinW2 
cosW2_DR = 1._dp - sinW2_DR 
sumI = 6._dp & 
  & + Log(cosW2)*(3.5_dp - 2.5_dp *sinW2   & 
  & - sinW2_DR*(5._dp - 1.5_dp*cosW2/cosW2_DR))/sinW2   
res = sumI*g2**2*rho 
 
 
If (IncludeBSMdeltaVB) Then 
!-------------------------- 
!BSM  Contributions 
!-------------------------- 
teil = 0._dp 
 
Do gt1=1,9 
 Do gt2=1,9 
sumI = 0._dp 
 
If (mf_l2(2).gt. 0.5_dp*MFv2(gt2)) Then 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFv).and.IncludeWave) Then 
Do i1=1,2
  Do i2=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2R = Conjg(cplFvFvAhL(gt2,i2,i1))
coup2L = Conjg(cplFvFvAhR(gt2,i2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i2),MAh2(i1))  
End if 
   End Do
  End Do
End if 




chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loopHp).and.IncludeWave) Then 
Do i1=1,6
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i1)
coup1R = cplFvFeHpR(gt1,i1)
coup2R = Conjg(cplFvFeHpL(gt2,i1))
coup2L = Conjg(cplFvFeHpR(gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHp2)  
End if 
   End Do
End if 




chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loophh).and.IncludeWave) Then 
Do i1=1,9
  Do i2=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2R = Conjg(cplFvFvhhL(gt2,i1,i2))
coup2L = Conjg(cplFvFvhhR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),Mhh2(i2))  
End if 
   End Do
  End Do
End if 




chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVZp).and.IncludeWave) Then 
Do i1=1,9
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = Conjg(cplFvFvVZpL(gt2,i1))
coup2R = Conjg(cplFvFvVZpR(gt2,i1))
End if 
   End Do
End if 




chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loopHp).and.IncludeWave) Then 
Do i1=1,6
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2))) Then
coup1L = cplcFeFvcHpL(i1,gt1)
coup1R = cplcFeFvcHpR(i1,gt1)
coup2R = Conjg(cplcFeFvcHpL(i1,gt2))
coup2L = Conjg(cplcFeFvcHpR(i1,gt2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHp2)  
End if 
   End Do
End if 




res = res + sumI*(UV(gt2,1)+UV(gt2,2)) 
End if 
End Do 
 
End Do 
 
Do gt1=1,2 
Do  gt2=1,6 
sumI = 0._dp 
 
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.IncludeWave) Then 
Do i1=1,2
  Do i2=1,6
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeAhL(i2,gt1,i1)
coup1R = cplcFeFeAhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFeAhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFeAhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MAh2(i1))  
End if 
   End Do
  End Do
End if 




chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopHp).and.IncludeWave) Then 
Do i1=1,9
If ((MFv2(i1).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(i1,gt1)
coup1R = cplFvFeHpR(i1,gt1)
coup2R = Conjg(cplFvFeHpL(i1,gt2))
coup2L = Conjg(cplFvFeHpR(i1,gt2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),MHp2)  
End if 
   End Do
End if 




chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.IncludeWave) Then 
Do i1=1,2
  Do i2=1,6
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFehhL(i2,gt1,i1)
coup1R = cplcFeFehhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFehhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFehhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),Mhh2(i1))  
End if 
   End Do
  End Do
End if 




chargefactor = 1 
If ((Include_in_loopVZp).and.(Include_in_loopFe).and.IncludeWave) Then 
  Do i2=1,6
If ((MVZp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeVZpL(i2,gt1)
coup1R = cplcFeFeVZpR(i2,gt1)
coup2L = Conjg(cplcFeFeVZpL(i2,gt2))
coup2R = Conjg(cplcFeFeVZpR(i2,gt2))
End if 
  End Do
End if 




res = res + sumI 
End Do 
 
End Do 
 
vertex = 0._dp 
 
Do gt1=1,9 
 Do gt2=1,2 
 End Do 
 
End Do 
 
res = res + vertex/g2 
Do gt1=1,9 
 Do gt2=1,9 
gt3 = 2 
gt4 = 1 
! Fe,conj[Hp],Fv,conj[Hp]
chargefactor = 1 
If ((Include_in_loopFe).and.(Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopHp).and.IncludeBoxes) Then 
Do i1=1,6
    Do i3=1,9
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i1)
coup1R = cplFvFeHpR(gt1,i1)
coup2L = cplcFeFvcHpL(i1,gt2)
coup2R = cplcFeFvcHpR(i1,gt2)
coup3L = cplFvFeHpL(i3,gt3)
coup3R = cplFvFeHpR(i3,gt3)
coup4L = cplcFeFvcHpL(gt4,i3)
coup4R = cplcFeFvcHpR(gt4,i3)
D27m2 = D27_Bagger(MHp2,MHp2,MFe2(i1),MFv2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
  End Do 
End if 


 ! Fv,Ah,bar[Fe],Ah
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopAh).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 
End if 


 ! Fv,Ah,bar[Fe],hh
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loophh).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 
End if 


 ! Fv,Ah,bar[Fe],VZp
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopVZp).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 
End if 


 ! Fv,hh,bar[Fe],Ah
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopAh).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 
End if 


 ! Fv,hh,bar[Fe],hh
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loophh).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 
End if 


 ! Fv,hh,bar[Fe],VZp
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopVZp).and.IncludeBoxes) Then 
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 
End if 


 ! Fv,VZp,bar[Fe],Ah
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopAh).and.IncludeBoxes) Then 
Do i1=1,9
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 
End if 


 ! Fv,VZp,bar[Fe],hh
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loophh).and.IncludeBoxes) Then 
Do i1=1,9
    Do i3=1,6
      Do i4=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 
End if 


 ! Fv,VZp,bar[Fe],VZp
chargefactor = 1 
If ((Include_in_loopFv).and.(Include_in_loopVZp).and.(Include_in_loopFe).and.(Include_in_loopVZp).and.IncludeBoxes) Then 
Do i1=1,9
    Do i3=1,6
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
  End Do 
End if 


 ! Ah,Fv,conj[Hp],Fv
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopFv).and.IncludeBoxes) Then 
Do i1=1,2
  Do i2=1,9
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplFvFvAhL(gt2,i2,i1)
coup2R = cplFvFvAhR(gt2,i2,i1)
coup3L = cplcFeFvcHpL(gt4,i2)
coup3R = cplcFeFvcHpR(gt4,i2)
coup4L = cplFvFeHpL(i4,gt3)
coup4R = cplFvFeHpR(i4,gt3)
D0m2 = D0_Bagger(MAh2(i1),MHp2,MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(MAh2(i1),MHp2,MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
End Do 
End if 


 ! hh,Fv,conj[Hp],Fv
chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFv).and.(Include_in_loopHp).and.(Include_in_loopFv).and.IncludeBoxes) Then 
Do i1=1,2
  Do i2=1,9
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplFvFvhhL(gt2,i2,i1)
coup2R = cplFvFvhhR(gt2,i2,i1)
coup3L = cplcFeFvcHpL(gt4,i2)
coup3R = cplcFeFvcHpR(gt4,i2)
coup4L = cplFvFeHpL(i4,gt3)
coup4R = cplFvFeHpR(i4,gt3)
D0m2 = D0_Bagger(Mhh2(i1),MHp2,MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(Mhh2(i1),MHp2,MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
End Do 
End if 


 ! Hp,bar[Fe],Ah,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFe).and.(Include_in_loopAh).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(i2,gt2)
coup2R = cplcFeFvcHpR(i2,gt2)
coup3L = cplcFeFeAhL(gt4,i2,i3)
coup3R = cplcFeFeAhR(gt4,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHp2,MAh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHp2,MAh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
   End Do 
  End Do 
End Do 
End if 


 ! Hp,bar[Fe],hh,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFe).and.(Include_in_loophh).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(i2,gt2)
coup2R = cplcFeFvcHpR(i2,gt2)
coup3L = cplcFeFehhL(gt4,i2,i3)
coup3R = cplcFeFehhR(gt4,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHp2,Mhh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHp2,Mhh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
   End Do 
  End Do 
End Do 
End if 


 ! Hp,bar[Fe],VZp,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFe).and.(Include_in_loopVZp).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,6
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(i2,gt2)
coup2R = cplcFeFvcHpR(i2,gt2)
coup3L = cplcFeFeVZpL(gt4,i2)
coup3R = cplcFeFeVZpR(gt4,i2)
coup4L = cplcFeFeVZpL(i4,gt3)
coup4R = cplcFeFeVZpR(i4,gt3)
End if 
   End Do 
End Do 
End if 


 ! Ah,Fe,conj[Hp],Fv
chargefactor = 1 
If ((Include_in_loopAh).and.(Include_in_loopFe).and.(Include_in_loopHp).and.(Include_in_loopFv).and.IncludeBoxes) Then 
Do i1=1,2
  Do i2=1,6
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplcFeFeAhL(gt4,i2,i1)
coup2R = cplcFeFeAhR(gt4,i2,i1)
coup3L = cplcFeFvcHpL(i2,gt2)
coup3R = cplcFeFvcHpR(i2,gt2)
coup4L = cplFvFeHpL(i4,gt3)
coup4R = cplFvFeHpR(i4,gt3)
D0m2 = D0_Bagger(MAh2(i1),MHp2,MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
End Do 
End if 


 ! hh,Fe,conj[Hp],Fv
chargefactor = 1 
If ((Include_in_loophh).and.(Include_in_loopFe).and.(Include_in_loopHp).and.(Include_in_loopFv).and.IncludeBoxes) Then 
Do i1=1,2
  Do i2=1,6
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHp2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplcFeFehhL(gt4,i2,i1)
coup2R = cplcFeFehhR(gt4,i2,i1)
coup3L = cplcFeFvcHpL(i2,gt2)
coup3R = cplcFeFvcHpR(i2,gt2)
coup4L = cplFvFeHpL(i4,gt3)
coup4R = cplFvFeHpR(i4,gt3)
D0m2 = D0_Bagger(Mhh2(i1),MHp2,MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
End Do 
End if 


 ! Hp,Fv,Ah,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopAh).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,9
    Do i3=1,2
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(gt4,i2)
coup2R = cplcFeFvcHpR(gt4,i2)
coup3L = cplFvFvAhL(gt2,i2,i3)
coup3R = cplFvFvAhR(gt2,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHp2,MAh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
   End Do 
  End Do 
End Do 
End if 


 ! Hp,Fv,hh,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loophh).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,9
    Do i3=1,2
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(gt4,i2)
coup2R = cplcFeFvcHpR(gt4,i2)
coup3L = cplFvFvhhL(gt2,i2,i3)
coup3R = cplFvFvhhR(gt2,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHp2,Mhh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
   End Do 
  End Do 
End Do 
End if 


 ! Hp,Fv,VZp,bar[Fe]
chargefactor = 1 
If ((Include_in_loopHp).and.(Include_in_loopFv).and.(Include_in_loopVZp).and.(Include_in_loopFe).and.IncludeBoxes) Then 
  Do i2=1,9
      Do i4=1,6
If ((MHp2.gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHpL(gt1,i4)
coup1R = cplFvFeHpR(gt1,i4)
coup2L = cplcFeFvcHpL(gt4,i2)
coup2R = cplcFeFvcHpR(gt4,i2)
coup3L = cplFvFvVZpL(gt2,i2)
coup3R = cplFvFvVZpR(gt2,i2)
coup4L = cplcFeFeVZpL(i4,gt3)
coup4R = cplcFeFeVZpR(i4,gt3)
End if 
   End Do 
End Do 
End if 


  End Do 
 
End Do 
 

 
sumI = -2._dp*cosW2_DR*mz2*Real(teil,dp)/g2**2 
res = res + SumI 
End if ! BSM part 
res = res*oo16pi2 
Iname = Iname-1
End subroutine DeltaVB 
 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHp,ratVWp,               & 
& MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(6),ratFe(6),ratFu(6),ratHp,ratVWp

Real(dp),Intent(in) :: MFd(6),MFe(6),MFu(6),MHp,MVWp

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(1)**2*ratHp*A_zero(mH2p/MHp**2)
HPPloopHp(inG) = HPPloopHp(inG)+1*(1)**2*ratHp*A_zero(mH2p/MHp**2)
coup = coup + 1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
HPPloopVWp(inG) = HPPloopVWp(inG)+1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
Do i1 = 1 , 6
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + 1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1,inG) = HPPloopFe(i1,inG)+1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(6),ratFu(6)

Real(dp),Intent(in) :: MFd(6),MFu(6)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 6
coup = coup + 1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + 1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(6),MFe(6),MFu(6),MHp,MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(1)**2*A_one(mH2p/MVWp**2)
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(6),MFu(6)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHp,ratVWp,         & 
& MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(6),ratFe(6),ratFu(6),ratHp,ratVWp

Real(dp),Intent(in) :: MFd(6),MFe(6),MFu(6),MHp,MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(6),ratFu(6)

Real(dp),Intent(in) :: MFd(6),MFu(6)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 6
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHp,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(6),MFe(6),MFu(6),MHp,MVWp

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(6),MFu(6)

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 6
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 6
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluonSM 

Complex(dp) Function cNLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cNLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_onehalf = 1._dp - oo4pi2*g**2  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cNLO_onehalf = 1._dp 
  End if 
End if 
End Function cNLO_onehalf 
 
Complex(dp) Function cANLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cANLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cANLO_onehalf = 1._dp  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cANLO_onehalf = 1._dp 
  End if 
End if 
End Function cANLO_onehalf 
 
Real(dp) Function cNLO_zero(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
If (g.lt.0._dp) Then 
   cNLO_zero= 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_zero = 1._dp + 2._dp*oo3pi2*g**2  
  Else  
    cNLO_zero = 1._dp 
  End if 
End if 
End Function cNLO_zero 
End Module LoopCouplings_U1T3R 
 
