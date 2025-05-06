! ------------------------------------------------------------------------------ 
! This file was automatically created by SARAH version 4.15.4 
! Two Loop diagrammatic calculation of Higgs masses (c) Mark Goodsell 2015-20 
! References: arXiv: 1503.03098, 1604.05335, 1706.05372  
! ------------------------------------------------------------------------------  

Module Pole2L_U1T3R 
 
Use Control 
Use Settings 
Use Couplings_U1T3R 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_U1T3R 
Use StandardModel 
Use TreeLevelMasses_U1T3R 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,          & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont,             & 
& tad2L,Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(in) :: vH,vPhi

Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Complex(dp) :: cplAhAhhh(2,2,2),cplhhhhhh(2,2,2),cplhhHpcHp(2),cplVGVGVG,cplcFdFdAhL(6,6,2),         & 
& cplcFdFdAhR(6,6,2),cplcFeFeAhL(6,6,2),cplcFeFeAhR(6,6,2),cplcFuFuAhL(6,6,2),           & 
& cplcFuFuAhR(6,6,2),cplFvFvAhL(9,9,2),cplFvFvAhR(9,9,2),cplcFdFdhhL(6,6,2),             & 
& cplcFdFdhhR(6,6,2),cplcFuFdHpL(6,6),cplcFuFdHpR(6,6),cplFvFeHpL(9,6),cplFvFeHpR(9,6),  & 
& cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),           & 
& cplcFdFucHpL(6,6),cplcFdFucHpR(6,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),               & 
& cplcFeFvcHpL(6,9),cplcFeFvcHpR(6,9),cplcFdFdVGL(6,6),cplcFdFdVGR(6,6),cplcFuFuVGL(6,6),& 
& cplcFuFuVGR(6,6)

Complex(dp) :: cplAhAhAhAh(2,2,2,2),cplAhAhhhhh(2,2,2,2),cplAhAhHpcHp(2,2),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHpcHp(2,2),cplHpHpcHpcHp

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(2)
Real(dp)  :: tempcont(2,2)
Real(dp)  :: tempcontah(2,2)
Real(dp)  :: runningval(2,2)
Real(dp), Intent(out) :: tad2l(2)
Real(dp), Intent(out) :: Pi2S(2,2)
Real(dp), Intent(out) :: Pi2P(2,2)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(2)
Real(dp)  :: tempcouplingmatrix(2,2)
Real(dp)  :: tempcouplingmatrixah(2,2)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(2)
real(dp)  :: delta2Lmasses(2,2)
real(dp)  :: delta2Lmassesah(2,2)
Real(dp)  :: tad1LG(2)
complex(dp) :: tad1Lmatrixhh(2,2)
complex(dp) :: tad1LmatrixAh(2,2)
complex(dp) :: tad1LmatrixHp(1,1)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.,kont)

If (Abs(MHp2/Qscale).lt.TwoLoopRegulatorMass) MHp2=Qscale*TwoLoopRegulatorMass
Where (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass )Mhh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass )MAh2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(LamH,LamPhiH,LamPhi,vH,vPhi,ZH,ZA,g3,YdL,YdR,ZDL,            & 
& ZDR,YeL,YeR,ZEL,ZER,YuL,YuR,ZUL,ZUR,YvL,YvR,UV,cplAhAhhh,cplhhhhhh,cplhhHpcHp,         & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,      & 
& cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,               & 
& cplcFdFucHpR,cplFvFvhhL,cplFvFvhhR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Call CouplingsFor2LPole4(LamH,LamPhiH,LamPhi,ZA,ZH,cplAhAhAhAh,cplAhAhhhhh,           & 
& cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

! ----------------------------------
! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------
! ----------------------------------
delta2Ltadpoles(:)=0._dp
delta2Lmasses(:,:)=0._dp
delta2LmassesAh(:,:)=0._dp
tad1LG(:)=0._dp
if(include1l2lshift) then
temptad(:) = 0._dp 
  Do i1 = 1, 2
A0m = 1._dp/2._dp*(-J0(MAh2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplAhAhhh(i1,i1,gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 1._dp*(-J0(MFe2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFeFehhL(i1,i1,gE1)
coup1R = cplcFeFehhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFe(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 9
A0m = 1._dp/2._dp*(-J0(MFv2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplFvFvhhL(i1,i1,gE1)
coup1R = cplFvFvhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFv(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 2
A0m = 1._dp/2._dp*(-J0(Mhh2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhhhhh(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

A0m = 1._dp*(-J0(MHp2,qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhHpcHp(gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
tad1LG=matmul(temptad*oo16Pi2,ZH)
! ----------------------------
! ----------------------------------
! ------- 1L2L SHIFTS --------
! ----------------------------------
tad1Lmatrixhh=0._dp
tad1Lmatrixhh(1,1)=tad1Lmatrixhh(1,1)+1/vH*tad1LG(1)
tad1Lmatrixhh(2,2)=tad1Lmatrixhh(2,2)+1/vPhi*tad1LG(2)
tad1Lmatrixhh=matmul(Zh,matmul(tad1Lmatrixhh,transpose(Zh)))
do i1=1,2
do i2=1,2
 funcvalue= tad1Lmatrixhh(i2,i1)*BB(Mhh2(i1),Mhh2(i2),qscale)
do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
delta2Ltadpoles(gE1)=delta2Ltadpoles(gE1)+real(0.5_dp*coup1*1._dp*funcvalue,dp)
end do
do gE1=1,2
do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(0.5_dp*coup1*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
do i1=1,2
do i2=1,2
do i3=1,2
 funcvalue= tad1Lmatrixhh(i2,i3)*CCtilde(Mhh2(i1),Mhh2(i2),Mhh2(i3),qscale)
do gE1=1,2
do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i3,i1)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(coup1*coup2*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
 end do
do i1=1,2
do i2=1,2
do i3=1,2
 funcvalue= tad1Lmatrixhh(i2,i3)*CCtilde(MAh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
do gE1=1,2
do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
delta2LmassesAh(gE1,gE2)=delta2LmassesAh(gE1,gE2)+real(coup1*coup2*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
 end do
tad1LmatrixAh=0._dp
tad1LmatrixAh(1,1)=tad1LmatrixAh(1,1)+1/vH*tad1LG(1)
tad1LmatrixAh(2,2)=tad1LmatrixAh(2,2)+1/vPhi*tad1LG(2)
tad1LmatrixAh=matmul(ZA,matmul(tad1LmatrixAh,transpose(ZA)))
do i1=1,2
do i2=1,2
 funcvalue= tad1LmatrixAh(i2,i1)*BB(MAh2(i1),MAh2(i2),qscale)
do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
delta2Ltadpoles(gE1)=delta2Ltadpoles(gE1)+real(0.5_dp*coup1*1._dp*funcvalue,dp)
end do
do gE1=1,2
do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(0.5_dp*coup1*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
do i1=1,2
do i2=1,2
do i3=1,2
 funcvalue= tad1LmatrixAh(i2,i3)*CCtilde(MAh2(i1),MAh2(i2),MAh2(i3),qscale)
do gE1=1,2
do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i3,i1,gE2)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(coup1*coup2*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
 end do
do i1=1,2
do i2=1,2
do i3=1,2
 funcvalue= tad1LmatrixAh(i2,i3)*CCtilde(Mhh2(i1),MAh2(i2),MAh2(i3),Qscale)
do gE1=1,2
do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
delta2LmassesAh(gE1,gE2)=delta2LmassesAh(gE1,gE2)+real(coup1*coup2*1._dp*funcvalue,dp)
end do
 end do
end do 
 end do
 end do
tad1LmatrixHp=0._dp
tad1LmatrixHp(1,1)=tad1LmatrixHp(1,1)+1/vH*tad1LG(1)
do i1=1,1
do i2=1,1
 funcvalue= tad1LmatrixHp(i2,i1)*BB(MHp2,MHp2,qscale)
do gE1=1,2
coup1 = cplhhHpcHp(gE1)
delta2Ltadpoles(gE1)=delta2Ltadpoles(gE1)+real(0.5_dp*coup1*2._dp*funcvalue,dp)
end do
do gE1=1,2
do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(0.5_dp*coup1*2._dp*funcvalue,dp)
end do
 end do
end do 
 end do
do i1=1,1
do i2=1,1
do i3=1,1
 funcvalue= tad1LmatrixHp(i2,i3)*CCtilde(MHp2,MHp2,MHp2,qscale)
do gE1=1,2
do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(coup1*coup2*2._dp*funcvalue,dp)
end do
 end do
end do 
 end do
 end do
delta2Ltadpoles=delta2Ltadpoles*oo16Pi2
delta2Lmasses=delta2Lmasses*oo16Pi2
delta2LmassesAh=delta2LmassesAh*oo16Pi2
! ----------------------------
end if ! include1l2lshift
! ----------------------------------
! ------- TADPOLE DIAGRAMS --------
! ----------------------------------
temptad(:)=0._dp
tempcouplingvector(:)=0._dp
! ---- Topology ToSSS
! ---- Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,i3)
coup2 = cplAhAhhh(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSSS(MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhhhh(gE1,i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/6._dp*TfSSS(Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Hp,conj[Hp] ----
Do i1=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhHpcHp(gE1,i1)
coup2 = cplhhHpcHp(i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(Mhh2(i1),MHp2,MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Topology ToSS
! ---- Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhAhAh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MAh2(i1),MAh2(i2),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
! ---- hh,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplAhAhhhhh(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(Mhh2(i1),Mhh2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*TfSS(Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,hh,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(Mhh2(i1),Mhh2(i2),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Ah ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplAhAhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MHp2,MHp2,MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Hp,conj[Hp],hh ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhhhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MHp2,MHp2,Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Hp,conj[Hp],Hp ----
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplHpHpcHpcHp
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MHp2,MHp2,MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
! ---- Topology ToSSSS
! ---- Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,i4)
coup3 = cplAhAhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(MAh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplAhAhhh(i3,i4,i1)
coup3 = cplAhAhhh(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*TfSSSS(Mhh2(i1),Mhh2(i2),MAh2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(i1,i3,i4)
coup3 = cplhhhhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*TfSSSS(Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhHpcHp(i1)
coup3 = cplhhHpcHp(i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSSS(Mhh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],hh,Hp ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MHp2,MHp2,Mhh2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Topology ToSSFF
! ---- Ah,Ah,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*TfSSFF(MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i3)*MFd(i4)*TfSSFbFb(MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Ah,Ah,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSFF(MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFe(i3)*MFe(i4)*TfSSFbFb(MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Ah,Ah,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*TfSSFF(MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i3)*MFu(i4)*TfSSFbFb(MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Ah,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*TfSSFF(MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i3)*MFv(i4)*TfSSFbFb(MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- hh,hh,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*TfSSFF(Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i3)*MFd(i4)*TfSSFbFb(Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- hh,hh,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*TfSSFF(Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFe(i3)*MFe(i4)*TfSSFbFb(Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- hh,hh,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*TfSSFF(Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i3)*MFu(i4)*TfSSFbFb(Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- hh,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*TfSSFF(Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i3)*MFv(i4)*TfSSFbFb(Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Hp,conj[Hp],Fu,bar[Fd] ----
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFd(i4)*TfSSFbFb(MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
! ---- Hp,conj[Hp],Fv,bar[Fe] ----
Do i3=1,9
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFe(i4)*TfSSFbFb(MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
! ---- Topology ToFFFS
! ---- Fd,bar[Fd],Fd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fu,conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFucHpL(i1,i3)
coup2R = cplcFdFucHpR(i1,i3)
coup3L = cplcFuFdHpL(i3,i2)
coup3R = cplcFuFdHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFucHpL(i1,i3)
coup2R = cplcFdFucHpR(i1,i3)
coup3L = cplcFuFdHpL(i3,i2)
coup3R = cplcFuFdHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFu2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFucHpL(i1,i3)
coup2R = cplcFdFucHpR(i1,i3)
coup3L = cplcFuFdHpL(i3,i2)
coup3R = cplcFuFdHpR(i3,i2)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fe,bar[Fe],Fe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,i4)
coup2R = cplcFeFeAhR(i1,i3,i4)
coup3L = cplcFeFeAhL(i3,i2,i4)
coup3R = cplcFeFeAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFe2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,i4)
coup2R = cplcFeFehhR(i1,i3,i4)
coup3L = cplcFeFehhL(i3,i2,i4)
coup3R = cplcFeFehhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFe2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fe,bar[Fe],Fv,conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,9
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvcHpL(i1,i3)
coup2R = cplcFeFvcHpR(i1,i3)
coup3L = cplFvFeHpL(i3,i2)
coup3R = cplFvFeHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFv(i3)*TfFFFbS(MFe2(i1),MFe2(i2),MFv2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvcHpL(i1,i3)
coup2R = cplcFeFvcHpR(i1,i3)
coup3L = cplFvFeHpL(i3,i2)
coup3R = cplFvFeHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i2)*TfFFbFS(MFe2(i1),MFe2(i2),MFv2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFvcHpL(i1,i3)
coup2R = cplcFeFvcHpR(i1,i3)
coup3L = cplFvFeHpL(i3,i2)
coup3R = cplFvFeHpR(i3,i2)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i3)*MFe(i2)*TfFbFbFbS(MFe2(i1),MFe2(i2),MFv2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fu,bar[Fu],Fu,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fd,Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = cplcFdFucHpL(i3,i2)
coup3R = cplcFdFucHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = cplcFdFucHpL(i3,i2)
coup3R = cplcFdFucHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFd2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = cplcFdFucHpL(i3,i2)
coup3R = cplcFdFucHpR(i3,i2)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fu,bar[Fu],Fu,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,2
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Fv,Ah ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,2
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,i4)
coup2R = cplFvFvAhR(i1,i3,i4)
coup3L = cplFvFvAhL(i2,i3,i4)
coup3R = cplFvFvAhR(i2,i3,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFv2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fv,Fv,Fe,Hp ----
Do i1=1,9
Do i2=1,9
Do i3=1,6
if((MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFeHpL(i1,i3)
coup2R = cplFvFeHpR(i1,i3)
coup3L = cplcFeFvcHpL(i3,i2)
coup3R = cplcFeFvcHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFe(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFe2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFeHpL(i1,i3)
coup2R = cplFvFeHpR(i1,i3)
coup3L = cplcFeFvcHpL(i3,i2)
coup3R = cplcFeFvcHpR(i3,i2)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFe2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFeHpL(i1,i3)
coup2R = cplFvFeHpR(i1,i3)
coup3L = cplcFeFvcHpL(i3,i2)
coup3R = cplcFeFvcHpR(i3,i2)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFv(i1)*MFv(i2)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFe2(i3),MHp2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fv,Fv,Fv,hh ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,2
if((MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*TfFFFbS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i2)*TfFFbFS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,i4)
coup2R = cplFvFvhhR(i1,i3,i4)
coup3L = cplFvFvhhL(i2,i3,i4)
coup3R = cplFvFvhhR(i2,i3,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*TfFbFbFbS(MFv2(i1),MFv2(i2),MFv2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology ToFV
! ---- Fd ----
Do i1=1,6
if((MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFd(i1)*TfFV(MFd2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ---- Fu ----
Do i1=1,6
if((MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFu(i1)*TfFV(MFu2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ----------------------------
! ---- Final tadpole result --
temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles
tad2L=matmul(temptad,ZH)
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2 = cplAhAhhh(i1,i3,i4)
coup3 = cplAhAhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplAhAhhh(i3,i4,i1)
coup3 = cplAhAhhh(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhhh(i1,i3,i4)
coup3 = cplhhhhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhHpcHp(i1)
coup3 = cplhhHpcHp(i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],hh,Hp ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHp2,MHp2,Mhh2(i3),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology XoSSS
! ---- Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2 = cplAhAhAhAh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2 = cplAhAhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2 = cplAhAhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MAh2(i1),MAh2(i2),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- hh,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplAhAhhhhh(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,hh,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Ah ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2 = cplAhAhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHp2,MHp2,MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Hp,conj[Hp],hh ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2 = cplhhhhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHp2,MHp2,Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Hp,conj[Hp],Hp ----
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2 = cplHpHpcHpcHp
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MHp2,MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
! ---- Topology YoSSSS
! ---- Ah,Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3 = cplAhAhAhAh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3 = cplAhAhhhhh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Ah,Hp ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3 = cplAhAhHpcHp(i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplAhAhhhhh(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplhhhhhhhh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,Hp ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplhhhhHpcHp(i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hp,conj[Hp],Hp,Ah ----
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplAhAhHpcHp(i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHp2,MHp2,MHp2,MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Hp,conj[Hp],Hp,hh ----
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplhhhhHpcHp(i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHp2,MHp2,MHp2,Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Hp,conj[Hp],Hp,Hp ----
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplHpHpcHpcHp
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MHp2,MHp2,MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
! ---- Topology ZoSSSS
! ---- Ah,Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i3,i4,gE2)
coup3 = cplAhAhAhAh(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplhhhhhh(gE2,i3,i4)
coup3 = cplAhAhhhhh(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*ZfSSSS(p2,MAh2(i1),MAh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplAhAhHpcHp(i1,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MAh2(i1),MAh2(i2),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i3,i4)
coup3 = cplhhhhhhhh(i1,i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*ZfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhHpcHp(gE2)
coup3 = cplhhhhHpcHp(i1,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Hp,conj[Hp] ----
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplHpHpcHpcHp
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MHp2,MHp2,MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
! ---- Topology SoSSS
! ---- Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,i3)
coup2 = cplAhAhhhhh(i1,i2,gE2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,i1,i2,i3)
coup2 = cplhhhhhhhh(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/6._dp*SfSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Hp,conj[Hp] ----
Do i1=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,i1)
coup2 = cplhhhhHpcHp(gE2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology UoSSSS
! ---- Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhhhh(i1,i3,gE2,i4)
coup3 = cplAhAhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplAhAhhhhh(i3,i4,gE2,i1)
coup3 = cplAhAhhh(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*UfSSSS(p2,Mhh2(i1),Mhh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhhhh(gE2,i1,i3,i4)
coup3 = cplhhhhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*UfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhHpcHp(gE2,i1)
coup3 = cplhhHpcHp(i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],hh,Hp ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhhhHpcHp(gE2,i3)
coup3 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MHp2,MHp2,Mhh2(i3),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology VoSSSSS
! ---- Ah,Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3 = cplAhAhhh(i2,i4,i5)
coup4 = cplAhAhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplAhAhhh(i4,i5,i2)
coup4 = cplAhAhhh(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MAh2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplhhhhhh(i2,i4,i5)
coup4 = cplhhhhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3 = cplhhHpcHp(i2)
coup4 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hp,conj[Hp],Hp,hh,conj[Hp] ----
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplhhHpcHp(i4)
coup4 = cplhhHpcHp(i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MHp2,MHp2,MHp2,Mhh2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology MoSSSSS
! ---- Ah,Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2 = cplAhAhhh(i2,i4,gE2)
coup3 = cplAhAhhh(i1,i2,i5)
coup4 = cplAhAhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,Ah,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2 = cplhhhhhh(gE2,i2,i4)
coup3 = cplAhAhhh(i1,i5,i2)
coup4 = cplAhAhhh(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MAh2(i1),Mhh2(i2),MAh2(i3),Mhh2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2 = cplhhhhhh(gE2,i2,i4)
coup3 = cplhhhhhh(i1,i2,i5)
coup4 = cplhhhhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfSSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,Hp,hh,conj[Hp],Hp ----
Do i1=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2 = cplhhHpcHp(gE2)
coup3 = cplhhHpcHp(i1)
coup4 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MfSSSSS(p2,Mhh2(i1),MHp2,Mhh2(i3),MHp2,MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],conj[Hp],Hp,hh ----
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3 = cplhhHpcHp(i5)
coup4 = cplhhHpcHp(i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MHp2,MHp2,MHp2,MHp2,Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology WoSSFF
! ---- Ah,Ah,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFd(i3)*MFd(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MFe(i3)*MFe(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFu(i3)*MFu(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*MFv(i3)*MFv(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(i1,i2,gE1,gE2)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFd(i3)*MFd(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MFe(i3)*MFe(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFu(i3)*MFu(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*MFv(i3)*MFv(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhhhh(gE1,gE2,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hp,conj[Hp],Fu,bar[Fd] ----
Do i3=1,6
Do i4=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFu(i3)*MFd(i4)*WfSSFbFb(p2,MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Fv,bar[Fe] ----
Do i3=1,9
Do i4=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*MFe(i4)*WfSSFbFb(p2,MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhHpcHp(gE1,gE2)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Topology MoFFFFS
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,Fv,bar[Fe],Fv,conj[Hp] ----
Do i1=1,6
Do i2=1,9
Do i3=1,6
Do i4=1,9
if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFv(i2)*MFv(i4)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i3,i1,gE1)
coup1R = cplcFeFehhR(i3,i1,gE1)
coup2L = cplcFeFehhL(i2,i4,gE2)
coup2R = cplcFeFehhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fe,Fv,bar[Fe],conj[Hp] ----
Do i1=1,9
Do i2=1,6
Do i3=1,9
Do i4=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i2)*MFv(i1)*MFv(i3)*MFe(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i4)*MfFFbFFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFe(i4)*MfFFFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i3,gE1)
coup1R = cplFvFvhhR(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Ah,Fd,Ah,bar[Fd],Fd ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i5)*MFd(i4)*MfSFbSFbFb(p2,MAh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MAh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MAh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fe,Ah,bar[Fe],Fe ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i5)*MFe(i4)*MfSFbSFbFb(p2,MAh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MAh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i5)*MfSFSFFb(p2,MAh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fu,Ah,bar[Fu],Fu ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i5)*MFu(i4)*MfSFbSFbFb(p2,MAh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MAh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MAh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fv,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,9
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MFv(i5)*MfSFbSFbFb(p2,MAh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MAh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i3,gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i5)*MfSFSFFb(p2,MAh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fd,hh,bar[Fd],Fd ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i5)*MFd(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,Mhh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,Mhh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fe,hh,bar[Fe],Fe ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i5)*MFe(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,Mhh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i5)*MfSFSFFb(p2,Mhh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fu,hh,bar[Fu],Fu ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i5)*MFu(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,Mhh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,Mhh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fv,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,9
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MFv(i5)*MfSFbSFbFb(p2,Mhh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,Mhh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i3)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i5)*MfSFSFFb(p2,Mhh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Hp,Fd,conj[Hp],bar[Fd],Fu ----
Do i2=1,6
Do i4=1,6
Do i5=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFucHpL(i2,i5)
coup3R = cplcFdFucHpR(i2,i5)
coup4L = cplcFuFdHpL(i5,i4)
coup4R = cplcFuFdHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i5)*MFd(i4)*MfSFbSFbFb(p2,MHp2,MFd2(i2),MHp2,MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFucHpL(i2,i5)
coup3R = cplcFdFucHpR(i2,i5)
coup4L = cplcFuFdHpL(i5,i4)
coup4R = cplcFuFdHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MHp2,MFd2(i2),MHp2,MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFdFdhhL(i4,i2,gE2)
coup2R = cplcFdFdhhR(i4,i2,gE2)
coup3L = cplcFdFucHpL(i2,i5)
coup3R = cplcFdFucHpR(i2,i5)
coup4L = cplcFuFdHpL(i5,i4)
coup4R = cplcFuFdHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MHp2,MFd2(i2),MHp2,MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
! ---- Hp,Fe,conj[Hp],bar[Fe],Fv ----
Do i2=1,6
Do i4=1,6
Do i5=1,9
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i5)
coup3R = cplcFeFvcHpR(i2,i5)
coup4L = cplFvFeHpL(i5,i4)
coup4R = cplFvFeHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFv(i5)*MFe(i4)*MfSFbSFbFb(p2,MHp2,MFe2(i2),MHp2,MFe2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i5)
coup3R = cplcFeFvcHpR(i2,i5)
coup4L = cplFvFeHpL(i5,i4)
coup4R = cplFvFeHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MHp2,MFe2(i2),MHp2,MFe2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFeFehhL(i4,i2,gE2)
coup2R = cplcFeFehhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i5)
coup3R = cplcFeFvcHpR(i2,i5)
coup4L = cplFvFeHpL(i5,i4)
coup4R = cplFvFeHpR(i5,i4)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i5)*MfSFSFFb(p2,MHp2,MFe2(i2),MHp2,MFe2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
! ---- Hp,Fv,conj[Hp],Fv,bar[Fe] ----
Do i2=1,9
Do i4=1,9
Do i5=1,6
if((MFe(i5) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i5,i2)
coup3R = cplcFeFvcHpR(i5,i2)
coup4L = cplFvFeHpL(i4,i5)
coup4R = cplFvFeHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i4)*MFe(i5)*MfSFbSFbFb(p2,MHp2,MFv2(i2),MHp2,MFv2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i5,i2)
coup3R = cplcFeFvcHpR(i5,i2)
coup4L = cplFvFeHpL(i4,i5)
coup4R = cplFvFeHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i4)*MfSFSFbF(p2,MHp2,MFv2(i2),MHp2,MFv2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplFvFvhhL(i2,i4,gE2)
coup2R = cplFvFvhhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i5,i2)
coup3R = cplcFeFvcHpR(i5,i2)
coup4L = cplFvFeHpL(i4,i5)
coup4R = cplFvFeHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i5)*MfSFSFFb(p2,MHp2,MFv2(i2),MHp2,MFv2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
! ---- Hp,bar[Fu],conj[Hp],Fu,bar[Fd] ----
Do i2=1,6
Do i4=1,6
Do i5=1,6
if((MFd(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i5,i2)
coup3R = cplcFdFucHpR(i5,i2)
coup4L = cplcFuFdHpL(i4,i5)
coup4R = cplcFuFdHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i5)*MFu(i2)*MfSFbSFbFb(p2,MHp2,MFu2(i2),MHp2,MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i5,i2)
coup3R = cplcFdFucHpR(i5,i2)
coup4L = cplcFuFdHpL(i4,i5)
coup4R = cplcFuFdHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MHp2,MFu2(i2),MHp2,MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i5,i2)
coup3R = cplcFdFucHpR(i5,i2)
coup4L = cplcFuFdHpL(i4,i5)
coup4R = cplcFuFdHpR(i4,i5)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MHp2,MFu2(i2),MHp2,MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
! ---- Topology VoSSSFF
! ---- Ah,Ah,Ah,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFdFdAhL(i5,i4,i2)
coup3R = cplcFdFdAhR(i5,i4,i2)
coup4L = cplcFdFdAhL(i4,i5,i3)
coup4R = cplcFdFdAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFd(i5)*VfSSSFbFb(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFdFdAhL(i5,i4,i2)
coup3R = cplcFdFdAhR(i5,i4,i2)
coup4L = cplcFdFdAhL(i4,i5,i3)
coup4R = cplcFdFdAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,Ah,Ah,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFeFeAhL(i5,i4,i2)
coup3R = cplcFeFeAhR(i5,i4,i2)
coup4L = cplcFeFeAhL(i4,i5,i3)
coup4R = cplcFeFeAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i4)*MFe(i5)*VfSSSFbFb(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFeFeAhL(i5,i4,i2)
coup3R = cplcFeFeAhR(i5,i4,i2)
coup4L = cplcFeFeAhL(i4,i5,i3)
coup4R = cplcFeFeAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,Ah,Ah,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFuFuAhL(i5,i4,i2)
coup3R = cplcFuFuAhR(i5,i4,i2)
coup4L = cplcFuFuAhL(i4,i5,i3)
coup4R = cplcFuFuAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i4)*MFu(i5)*VfSSSFbFb(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplcFuFuAhL(i5,i4,i2)
coup3R = cplcFuFuAhR(i5,i4,i2)
coup4L = cplcFuFuAhL(i4,i5,i3)
coup4R = cplcFuFuAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,Ah,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplFvFvAhL(i4,i5,i2)
coup3R = cplFvFvAhR(i4,i5,i2)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i4)*MFv(i5)*VfSSSFbFb(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(i1,i2,gE1)
coup2 = cplAhAhhh(i1,i3,gE2)
coup3L = cplFvFvAhL(i4,i5,i2)
coup3R = cplFvFvAhR(i4,i5,i2)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSFF(p2,MAh2(i1),MAh2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFdFdhhL(i5,i4,i2)
coup3R = cplcFdFdhhR(i5,i4,i2)
coup4L = cplcFdFdhhL(i4,i5,i3)
coup4R = cplcFdFdhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFd(i5)*VfSSSFbFb(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFdFdhhL(i5,i4,i2)
coup3R = cplcFdFdhhR(i5,i4,i2)
coup4L = cplcFdFdhhL(i4,i5,i3)
coup4R = cplcFdFdhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFeFehhL(i5,i4,i2)
coup3R = cplcFeFehhR(i5,i4,i2)
coup4L = cplcFeFehhL(i4,i5,i3)
coup4R = cplcFeFehhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i4)*MFe(i5)*VfSSSFbFb(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFeFehhL(i5,i4,i2)
coup3R = cplcFeFehhR(i5,i4,i2)
coup4L = cplcFeFehhL(i4,i5,i3)
coup4R = cplcFeFehhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFuFuhhL(i5,i4,i2)
coup3R = cplcFuFuhhR(i5,i4,i2)
coup4L = cplcFuFuhhL(i4,i5,i3)
coup4R = cplcFuFuhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i4)*MFu(i5)*VfSSSFbFb(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplcFuFuhhL(i5,i4,i2)
coup3R = cplcFuFuhhR(i5,i4,i2)
coup4L = cplcFuFuhhL(i4,i5,i3)
coup4R = cplcFuFuhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,hh,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplFvFvhhL(i4,i5,i2)
coup3R = cplFvFvhhR(i4,i5,i2)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i4)*MFv(i5)*VfSSSFbFb(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhhhhh(gE1,i1,i2)
coup2 = cplhhhhhh(gE2,i1,i3)
coup3L = cplFvFvhhL(i4,i5,i2)
coup3R = cplFvFvhhR(i4,i5,i2)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSFF(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hp,conj[Hp],Hp,Fd,bar[Fu] ----
Do i4=1,6
Do i5=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3L = cplcFuFdHpL(i5,i4)
coup3R = cplcFuFdHpR(i5,i4)
coup4L = cplcFdFucHpL(i4,i5)
coup4R = cplcFdFucHpR(i4,i5)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i5)*VfSSSFbFb(p2,MHp2,MHp2,MHp2,MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3L = cplcFuFdHpL(i5,i4)
coup3R = cplcFuFdHpR(i5,i4)
coup4L = cplcFdFucHpL(i4,i5)
coup4R = cplcFdFucHpR(i4,i5)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MHp2,MHp2,MHp2,MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Hp,Fe,Fv ----
Do i4=1,6
Do i5=1,9
if((MFe(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3L = cplFvFeHpL(i5,i4)
coup3R = cplFvFeHpR(i5,i4)
coup4L = cplcFeFvcHpL(i4,i5)
coup4R = cplcFeFvcHpR(i4,i5)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i5)*VfSSSFbFb(p2,MHp2,MHp2,MHp2,MFe2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplhhHpcHp(gE1)
coup2 = cplhhHpcHp(gE2)
coup3L = cplFvFeHpL(i5,i4)
coup3R = cplFvFeHpR(i5,i4)
coup4L = cplcFeFvcHpL(i4,i5)
coup4R = cplcFeFvcHpR(i4,i5)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MHp2,MHp2,MHp2,MFe2(i4),MFv2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Topology VoFFFFS
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Fv,Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,9
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFv(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFv(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFehhL(i2,i1,gE1)
coup1R = cplcFeFehhR(i2,i1,gE1)
coup2L = cplcFeFehhL(i1,i3,gE2)
coup2R = cplcFeFehhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fe,Hp ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvhhL(i1,i2,gE1)
coup1R = cplFvFvhhR(i1,i2,gE1)
coup2L = cplFvFvhhL(i1,i3,gE2)
coup2R = cplFvFvhhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
do gE1=1,2
Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2S(gE2,gE1)=Pi2S(gE1,gE2)
End do
End do
Pi2S=Pi2S+delta2lmasses
Pi2S = Matmul(Pi2S,ZH)
Pi2S = Matmul(Transpose(ZH),Pi2S)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2 = cplAhAhhh(i1,i3,i4)
coup3 = cplAhAhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplAhAhhh(i3,i4,i1)
coup3 = cplAhAhhh(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhhh(i1,i3,i4)
coup3 = cplhhhhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhHpcHp(i1)
coup3 = cplhhHpcHp(i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],hh,Hp ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2 = cplhhHpcHp(i3)
coup3 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHp2,MHp2,Mhh2(i3),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Topology XoSSS
! ---- Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2 = cplAhAhAhAh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2 = cplAhAhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Ah,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2 = cplAhAhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MAh2(i1),MAh2(i2),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- hh,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplAhAhhhhh(i3,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhhhhh(i1,i2,i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/4._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,hh,Hp ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2 = cplhhhhHpcHp(i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,Mhh2(i1),Mhh2(i2),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Ah ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2 = cplAhAhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHp2,MHp2,MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Hp,conj[Hp],hh ----
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2 = cplhhhhHpcHp(i3,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHp2,MHp2,Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Hp,conj[Hp],Hp ----
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2 = cplHpHpcHpcHp
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MHp2,MHp2,MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
! ---- Topology YoSSSS
! ---- Ah,hh,hh,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplAhAhhhhh(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplhhhhhhhh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,hh,hh,Hp ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplhhhhHpcHp(i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3 = cplAhAhAhAh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3 = cplAhAhhhhh(i2,i3,i4,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*YfSSSS(p2,Mhh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,Ah,Ah,Hp ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3 = cplAhAhHpcHp(i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology ZoSSSS
! ---- Ah,hh,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i3,i4)
coup3 = cplAhAhhhhh(i1,i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MAh2(i1),Mhh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology SoSSS
! ---- Ah,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,i1,i2,i3)
coup2 = cplAhAhAhAh(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/6._dp*SfSSS(p2,MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,i1,i2,i3)
coup2 = cplAhAhhhhh(gE2,i1,i2,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*SfSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Hp,conj[Hp] ----
Do i1=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,i1)
coup2 = cplAhAhHpcHp(gE2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MHp2,MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Topology UoSSSS
! ---- Ah,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhAhAh(gE2,i1,i3,i4)
coup3 = cplAhAhhh(i3,i4,i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*UfSSSS(p2,MAh2(i1),Mhh2(i2),MAh2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhhhh(gE2,i1,i3,i4)
coup3 = cplhhhhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*UfSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhHpcHp(gE2,i1)
coup3 = cplhhHpcHp(i2)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,MAh2(i1),Mhh2(i2),MHp2,MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- hh,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhhhh(gE2,i3,i1,i4)
coup3 = cplAhAhhh(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*UfSSSS(p2,Mhh2(i1),MAh2(i2),MAh2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoSSSSS
! ---- Ah,hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplAhAhhh(i4,i5,i2)
coup4 = cplAhAhhh(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MAh2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplhhhhhh(i2,i4,i5)
coup4 = cplhhhhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),Mhh2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,Hp,conj[Hp] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3 = cplhhHpcHp(i2)
coup4 = cplhhHpcHp(i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MHp2,MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,Ah,Ah,Ah,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3 = cplAhAhhh(i2,i4,i5)
coup4 = cplAhAhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSSS(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MAh2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSSSSS
! ---- Ah,Ah,hh,hh,hh ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2 = cplAhAhhh(gE2,i2,i4)
coup3 = cplAhAhhh(i1,i2,i5)
coup4 = cplhhhhhh(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MAh2(i1),MAh2(i2),Mhh2(i3),Mhh2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,Ah,Ah ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,2
Do i5=1,2
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2 = cplAhAhhh(gE2,i4,i2)
coup3 = cplAhAhhh(i1,i5,i2)
coup4 = cplAhAhhh(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MAh2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology WoSSFF
! ---- Ah,Ah,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFd(i3)*MFd(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFdFdAhL(i4,i3,i1)
coup2R = cplcFdFdAhR(i4,i3,i1)
coup3L = cplcFdFdAhL(i3,i4,i2)
coup3R = cplcFdFdAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MFe(i3)*MFe(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFeFeAhL(i4,i3,i1)
coup2R = cplcFeFeAhR(i4,i3,i1)
coup3L = cplcFeFeAhL(i3,i4,i2)
coup3R = cplcFeFeAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFu(i3)*MFu(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplcFuFuAhL(i4,i3,i1)
coup2R = cplcFuFuAhR(i4,i3,i1)
coup3L = cplcFuFuAhL(i3,i4,i2)
coup3R = cplcFuFuAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Ah,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*MFv(i3)*MFv(i4)*WfSSFbFb(p2,MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhAhAh(gE1,gE2,i1,i2)
coup2L = cplFvFvAhL(i3,i4,i1)
coup2R = cplFvFvAhR(i3,i4,i1)
coup3L = cplFvFvAhL(i3,i4,i2)
coup3R = cplFvFvAhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSFF(p2,MAh2(i1),MAh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFd(i3)*MFd(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFdFdhhL(i4,i3,i1)
coup2R = cplcFdFdhhR(i4,i3,i1)
coup3L = cplcFdFdhhL(i3,i4,i2)
coup3R = cplcFdFdhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFd2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*MFe(i3)*MFe(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFeFehhL(i4,i3,i1)
coup2R = cplcFeFehhR(i4,i3,i1)
coup3L = cplcFeFehhL(i3,i4,i2)
coup3R = cplcFeFehhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFe2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,6
Do i4=1,6
if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*MFu(i3)*MFu(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplcFuFuhhL(i4,i3,i1)
coup2R = cplcFuFuhhR(i4,i3,i1)
coup3L = cplcFuFuhhL(i3,i4,i2)
coup3R = cplcFuFuhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp/2._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFu2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- hh,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,9
Do i4=1,9
if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*MFv(i3)*MFv(i4)*WfSSFbFb(p2,Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhhhh(gE1,gE2,i1,i2)
coup2L = cplFvFvhhL(i3,i4,i1)
coup2R = cplFvFvhhR(i3,i4,i1)
coup3L = cplFvFvhhL(i3,i4,i2)
coup3R = cplFvFvhhR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp/4._dp*WfSSFF(p2,Mhh2(i1),Mhh2(i2),MFv2(i3),MFv2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hp,conj[Hp],Fu,bar[Fd] ----
Do i3=1,6
Do i4=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFu(i3)*MFd(i4)*WfSSFbFb(p2,MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2L = cplcFdFucHpL(i4,i3)
coup2R = cplcFdFucHpR(i4,i3)
coup3L = cplcFuFdHpL(i3,i4)
coup3R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MHp2,MHp2,MFu2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Hp,conj[Hp],Fv,bar[Fe] ----
Do i3=1,9
Do i4=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MFv(i3)*MFe(i4)*WfSSFbFb(p2,MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhHpcHp(gE1,gE2)
coup2L = cplcFeFvcHpL(i4,i3)
coup2R = cplcFeFvcHpR(i4,i3)
coup3L = cplFvFeHpL(i3,i4)
coup3R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MHp2,MHp2,MFv2(i3),MFe2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Topology MoFFFFS
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFucHpL(i1,i2)
coup3R = cplcFdFucHpR(i1,i2)
coup4L = cplcFuFdHpL(i4,i3)
coup4R = cplcFuFdHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,Fv,bar[Fe],Fv,conj[Hp] ----
Do i1=1,6
Do i2=1,9
Do i3=1,6
Do i4=1,9
if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFv(i2)*MFv(i4)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplcFeFvcHpL(i1,i2)
coup3R = cplcFeFvcHpR(i1,i2)
coup4L = cplFvFeHpL(i4,i3)
coup4R = cplFvFeHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFv2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFeAhL(i1,i2,i5)
coup3R = cplcFeFeAhR(i1,i2,i5)
coup4L = cplcFeFeAhL(i4,i3,i5)
coup4R = cplcFeFeAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],bar[Fe],Fe,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i1)*MFe(i4)*MFe(i2)*MFe(i3)*MfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i3)*MfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i2)*MfFFbFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFe(i3)*MfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i3,i1,gE1)
coup1R = cplcFeFeAhR(i3,i1,gE1)
coup2L = cplcFeFeAhL(i2,i4,gE2)
coup2R = cplcFeFeAhR(i2,i4,gE2)
coup3L = cplcFeFehhL(i1,i2,i5)
coup3R = cplcFeFehhR(i1,i2,i5)
coup4L = cplcFeFehhL(i4,i3,i5)
coup4R = cplcFeFehhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdHpL(i1,i2)
coup3R = cplcFuFdHpR(i1,i2)
coup4L = cplcFdFucHpL(i4,i3)
coup4R = cplcFdFucHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fe,Fv,bar[Fe],conj[Hp] ----
Do i1=1,9
Do i2=1,6
Do i3=1,9
Do i4=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i2)*MFv(i1)*MFv(i3)*MFe(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i4)*MfFFbFFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFe(i4)*MfFFFbFbS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFvcHpL(i2,i1)
coup3R = cplcFeFvcHpR(i2,i1)
coup4L = cplFvFeHpL(i3,i4)
coup4R = cplFvFeHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MFv2(i1),MFe2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i1,i2,i5)
coup3R = cplFvFvAhR(i1,i2,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*MfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*MfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MfFFbFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i3)*MFv(i4)*MfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i3,gE1)
coup1R = cplFvFvAhR(i1,i3,gE1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i1,i2,i5)
coup3R = cplFvFvhhR(i1,i2,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Ah,Fd,hh,bar[Fd],Fd ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i5)*MFd(i4)*MfSFbSFbFb(p2,MAh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MAh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdAhL(i2,i5,i1)
coup3R = cplcFdFdAhR(i2,i5,i1)
coup4L = cplcFdFdhhL(i5,i4,i3)
coup4R = cplcFdFdhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MAh2(i1),MFd2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fe,hh,bar[Fe],Fe ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i5)*MFe(i4)*MfSFbSFbFb(p2,MAh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,MAh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFeAhL(i2,i5,i1)
coup3R = cplcFeFeAhR(i2,i5,i1)
coup4L = cplcFeFehhL(i5,i4,i3)
coup4R = cplcFeFehhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i5)*MfSFSFFb(p2,MAh2(i1),MFe2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fu,hh,bar[Fu],Fu ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i5)*MFu(i4)*MfSFbSFbFb(p2,MAh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MAh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuAhL(i2,i5,i1)
coup3R = cplcFuFuAhR(i2,i5,i1)
coup4L = cplcFuFuhhL(i5,i4,i3)
coup4R = cplcFuFuhhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MAh2(i1),MFu2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Ah,Fv,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,9
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MFv(i5)*MfSFbSFbFb(p2,MAh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,MAh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i3)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvAhL(i2,i5,i1)
coup3R = cplFvFvAhR(i2,i5,i1)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i5)*MfSFSFFb(p2,MAh2(i1),MFv2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fd,Ah,bar[Fd],Fd ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i5)*MFd(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,Mhh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFdFdAhL(i4,i2,gE2)
coup2R = cplcFdFdAhR(i4,i2,gE2)
coup3L = cplcFdFdhhL(i2,i5,i1)
coup3R = cplcFdFdhhR(i2,i5,i1)
coup4L = cplcFdFdAhL(i5,i4,i3)
coup4R = cplcFdFdAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,Mhh2(i1),MFd2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fe,Ah,bar[Fe],Fe ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i2) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i2)*MFe(i5)*MFe(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MfSFSFbF(p2,Mhh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFeFeAhL(i4,i2,gE2)
coup2R = cplcFeFeAhR(i4,i2,gE2)
coup3L = cplcFeFehhL(i2,i5,i1)
coup3R = cplcFeFehhR(i2,i5,i1)
coup4L = cplcFeFeAhL(i5,i4,i3)
coup4R = cplcFeFeAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i5)*MfSFSFFb(p2,Mhh2(i1),MFe2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fu,Ah,bar[Fu],Fu ----
Do i1=1,2
Do i2=1,6
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i5)*MFu(i4)*MfSFbSFbFb(p2,Mhh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,Mhh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFuhhL(i2,i5,i1)
coup3R = cplcFuFuhhR(i2,i5,i1)
coup4L = cplcFuFuAhL(i5,i4,i3)
coup4R = cplcFuFuAhR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,Mhh2(i1),MFu2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- hh,Fv,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,9
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i2) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i4)*MFv(i5)*MfSFbSFbFb(p2,Mhh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i4)*MfSFSFbF(p2,Mhh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i3,i1)
coup2L = cplFvFvAhL(i2,i4,gE2)
coup2R = cplFvFvAhR(i2,i4,gE2)
coup3L = cplFvFvhhL(i2,i5,i1)
coup3R = cplFvFvhhR(i2,i5,i1)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i5)*MfSFSFFb(p2,Mhh2(i1),MFv2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Topology VoSSSFF
! ---- Ah,hh,hh,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFdFdhhL(i5,i4,i2)
coup3R = cplcFdFdhhR(i5,i4,i2)
coup4L = cplcFdFdhhL(i4,i5,i3)
coup4R = cplcFdFdhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFd(i5)*VfSSSFbFb(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFdFdhhL(i5,i4,i2)
coup3R = cplcFdFdhhR(i5,i4,i2)
coup4L = cplcFdFdhhL(i4,i5,i3)
coup4R = cplcFdFdhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFeFehhL(i5,i4,i2)
coup3R = cplcFeFehhR(i5,i4,i2)
coup4L = cplcFeFehhL(i4,i5,i3)
coup4R = cplcFeFehhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i4)*MFe(i5)*VfSSSFbFb(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFeFehhL(i5,i4,i2)
coup3R = cplcFeFehhR(i5,i4,i2)
coup4L = cplcFeFehhL(i4,i5,i3)
coup4R = cplcFeFehhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFuFuhhL(i5,i4,i2)
coup3R = cplcFuFuhhR(i5,i4,i2)
coup4L = cplcFuFuhhL(i4,i5,i3)
coup4R = cplcFuFuhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i4)*MFu(i5)*VfSSSFbFb(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplcFuFuhhL(i5,i4,i2)
coup3R = cplcFuFuhhR(i5,i4,i2)
coup4L = cplcFuFuhhL(i4,i5,i3)
coup4R = cplcFuFuhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Ah,hh,hh,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplFvFvhhL(i4,i5,i2)
coup3R = cplFvFvhhR(i4,i5,i2)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i4)*MFv(i5)*VfSSSFbFb(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i1,i2)
coup2 = cplAhAhhh(gE2,i1,i3)
coup3L = cplFvFvhhL(i4,i5,i2)
coup3R = cplFvFvhhR(i4,i5,i2)
coup4L = cplFvFvhhL(i4,i5,i3)
coup4R = cplFvFvhhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSFF(p2,MAh2(i1),Mhh2(i2),Mhh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,Ah,Ah,Fd,bar[Fd] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFdFdAhL(i5,i4,i2)
coup3R = cplcFdFdAhR(i5,i4,i2)
coup4L = cplcFdFdAhL(i4,i5,i3)
coup4R = cplcFdFdAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFd(i5)*VfSSSFbFb(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFdFdAhL(i5,i4,i2)
coup3R = cplcFdFdAhR(i5,i4,i2)
coup4L = cplcFdFdAhL(i4,i5,i3)
coup4R = cplcFdFdAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFd2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,Ah,Ah,Fe,bar[Fe] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFe(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFeFeAhL(i5,i4,i2)
coup3R = cplcFeFeAhR(i5,i4,i2)
coup4L = cplcFeFeAhL(i4,i5,i3)
coup4R = cplcFeFeAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFe(i4)*MFe(i5)*VfSSSFbFb(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFeFeAhL(i5,i4,i2)
coup3R = cplcFeFeAhR(i5,i4,i2)
coup4L = cplcFeFeAhL(i4,i5,i3)
coup4R = cplcFeFeAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfSSSFF(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFe2(i4),MFe2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,Ah,Ah,Fu,bar[Fu] ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,6
Do i5=1,6
if((MFu(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFuFuAhL(i5,i4,i2)
coup3R = cplcFuFuAhR(i5,i4,i2)
coup4L = cplcFuFuAhL(i4,i5,i3)
coup4R = cplcFuFuAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i4)*MFu(i5)*VfSSSFbFb(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplcFuFuAhL(i5,i4,i2)
coup3R = cplcFuFuAhR(i5,i4,i2)
coup4L = cplcFuFuAhL(i4,i5,i3)
coup4R = cplcFuFuAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*VfSSSFF(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFu2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- hh,Ah,Ah,Fv,Fv ----
Do i1=1,2
Do i2=1,2
Do i3=1,2
Do i4=1,9
Do i5=1,9
if((MFv(i4) .gt. epsfmass) .and. (MFv(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplFvFvAhL(i4,i5,i2)
coup3R = cplFvFvAhR(i4,i5,i2)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*MFv(i4)*MFv(i5)*VfSSSFbFb(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1 = cplAhAhhh(gE1,i2,i1)
coup2 = cplAhAhhh(gE2,i3,i1)
coup3L = cplFvFvAhL(i4,i5,i2)
coup3R = cplFvFvAhR(i4,i5,i2)
coup4L = cplFvFvAhL(i4,i5,i3)
coup4R = cplFvFvAhR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*VfSSSFF(p2,Mhh2(i1),MAh2(i2),MAh2(i3),MFv2(i4),MFv2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology VoFFFFS
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdHpL(i4,i2)
coup3R = cplcFuFdHpR(i4,i2)
coup4L = cplcFdFucHpL(i3,i4)
coup4R = cplcFdFucHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFeAhL(i4,i2,i5)
coup3R = cplcFeFeAhR(i4,i2,i5)
coup4L = cplcFeFeAhL(i3,i4,i5)
coup4R = cplcFeFeAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,Fv,Hp ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,9
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFv(i4)*MFe(i2)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFv(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFv(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i4,i2)
coup3R = cplFvFeHpR(i4,i2)
coup4L = cplcFeFvcHpL(i3,i4)
coup4R = cplcFeFvcHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFv2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fe,bar[Fe],Fe,bar[Fe],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFe(i1) .gt. epsfmass) .and. (MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i3)*MFe(i2)*MFe(i4)*VfFbFbFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i1)*MFe(i3)*VfFbFFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i1) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i1)*MFe(i4)*VfFbFFFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i2) .gt. epsfmass) .and. (MFe(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i3)*MFe(i2)*VfFFbFbFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i3) .gt. epsfmass) .and. (MFe(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i3)*MFe(i4)*VfFFFbFbS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFeFeAhL(i2,i1,gE1)
coup1R = cplcFeFeAhR(i2,i1,gE1)
coup2L = cplcFeFeAhL(i1,i3,gE2)
coup2R = cplcFeFeAhR(i1,i3,gE2)
coup3L = cplcFeFehhL(i4,i2,i5)
coup3R = cplcFeFehhR(i4,i2,i5)
coup4L = cplcFeFehhL(i3,i4,i5)
coup4R = cplcFeFehhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFe2(i1),MFe2(i2),MFe2(i3),MFe2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,2
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],conj[Hp] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFucHpL(i4,i2)
coup3R = cplcFdFucHpR(i4,i2)
coup4L = cplcFuFdHpL(i3,i4)
coup4R = cplcFuFdHpR(i3,i4)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,Ah ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvAhL(i2,i4,i5)
coup3R = cplFvFvAhR(i2,i4,i5)
coup4L = cplFvFvAhL(i3,i4,i5)
coup4R = cplFvFvAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fe,Hp ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,6
if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*MFv(i2)*MFv(i3)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFe(i4)*MFv(i1)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFe(i4) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFe(i4)*MFv(i3)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFeHpL(i2,i4)
coup3R = cplFvFeHpR(i2,i4)
coup4L = cplcFeFvcHpL(i4,i3)
coup4R = cplcFeFvcHpR(i4,i3)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFe2(i4),MHp2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fv,Fv,Fv,Fv,hh ----
Do i1=1,9
Do i2=1,9
Do i3=1,9
Do i4=1,9
Do i5=1,2
if((MFv(i1) .gt. epsfmass) .and. (MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i2)*MFv(i3)*MFv(i4)*VfFbFbFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i1)*MFv(i3)*VfFbFFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i1) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i1)*MFv(i4)*VfFbFFFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i2) .gt. epsfmass) .and. (MFv(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MFv(i2)*MFv(i3)*VfFFbFbFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFv(i3) .gt. epsfmass) .and. (MFv(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MFv(i3)*MFv(i4)*VfFFFbFbS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplFvFvAhL(i1,i2,gE1)
coup1R = cplFvFvAhR(i1,i2,gE1)
coup2L = cplFvFvAhL(i1,i3,gE2)
coup2R = cplFvFvAhR(i1,i3,gE2)
coup3L = cplFvFvhhL(i2,i4,i5)
coup3R = cplFvFvhhR(i2,i4,i5)
coup4L = cplFvFvhhL(i3,i4,i5)
coup4R = cplFvFvhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*VfFFFFS(p2,MFv2(i1),MFv2(i2),MFv2(i3),MFv2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,2
   Do gE2=1,2
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
do gE1=1,2
Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcontah(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcontah(gE1,gE2)+tempcontah(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2P(gE2,gE1)=Pi2P(gE1,gE2)
End do
End do
Pi2P=Pi2P+delta2lmassesah
Pi2P = Matmul(Pi2P,ZA)
Pi2P = Matmul(Transpose(ZA),Pi2P)
End Subroutine CalculatePi2S
End Module Pole2L_U1T3R 
 
