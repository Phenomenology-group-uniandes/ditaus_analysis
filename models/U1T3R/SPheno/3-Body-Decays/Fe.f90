! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:52 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Fe3Decays_U1T3R 
 
Use Control 
Use Settings 
Use CouplingsForDecays_U1T3R 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FeThreeBodyDecay(n_in,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,             & 
& ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,            & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,               & 
& vPhi,gThh,gTVWp,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,      & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Complex(dp) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZpL(6,6),             & 
& cplcFdFdVZpR(6,6),cplcFdFdVZR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),              & 
& cplcFeFeVZL(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFeVZR(6,6),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6),cplcFuFuhhL(6,6,2),             & 
& cplcFuFuhhR(6,6,2),cplcFuFuVZL(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6),               & 
& cplcFuFuVZR(6,6),cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),& 
& cplFvFvVZL(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9),cplFvFvVZR(9,9)

Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: gFeFecFdFd(6,6,6,6),gFeFecFeFe(6,6,6,6),gFeFecFuFu(6,6,6,6),gFeFeFvFv(6,6,9,9),       & 
& gFeFvcFuFd(6,9,6,6)

Real(dp),Intent(in) :: gThh(2),gTVWp,gTVZ,gTVZp

Real(dp) :: gFeFecFdFdi(6,6,6),gFeFecFeFei(6,6,6),gFeFecFuFui(6,6,6),gFeFeFvFvi(6,9,9),           & 
& gFeFvcFuFdi(9,6,6)

Real(dp) :: gThhtemp(2),gTVWptemp,gTVZtemp,gTVZptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FeThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gThhtemp = 0._dp 
gTVWptemp = 0._dp 
gTVZtemp = 0._dp 
gTVZptemp = 0._dp 
Else 
gThhtemp = gThh 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
gTVZptemp = gTVZp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 6 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 6) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,6) = ',n_in,6 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fe_decays_3B(MFe(i_run),i_run,alphaH,MAh,MAh2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,           & 
& TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,        & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& vH,vPhi,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFeFecFdFdi = 0._dp 
Call FeToFecFdFd(i_run,MFe,MFd,MVZ,MVZp,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralVs,              & 
& IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gThhtemp,       & 
& deltaM,epsI,check,gFeFecFdFdi)

gFeFecFdFd(i_run,:,:,:) = gFeFecFdFdi 
gT(i_run) = gT(i_run) + Sum(gFeFecFdFdi) 
 
gFeFecFeFei = 0._dp 
Call FeToFecFeFe(i_run,MFe,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,          & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralSSst,            & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZptemp,gThhtemp,deltaM,epsI,             & 
& check,gFeFecFeFei)

gFeFecFeFe(i_run,:,:,:) = gFeFecFeFei 
gT(i_run) = gT(i_run) + Sum(gFeFecFeFei) 
 
gFeFecFuFui = 0._dp 
Call FeToFecFuFu(i_run,MFe,MFu,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,IntegralVs,              & 
& IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gThhtemp,       & 
& deltaM,epsI,check,gFeFecFuFui)

gFeFecFuFu(i_run,:,:,:) = gFeFecFuFui 
gT(i_run) = gT(i_run) + Sum(gFeFecFuFui) 
 
gFeFeFvFvi = 0._dp 
Call FeToFeFvFv(i_run,MFe,MFv,MVZ,MVZp,MVWp,Mhh,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplFvFeVWpL,cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,       & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVSst,              & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,              & 
& gTVZptemp,gTVWptemp,gThhtemp,deltaM,epsI,check,gFeFeFvFvi)

gFeFeFvFv(i_run,:,:,:) = gFeFeFvFvi 
gT(i_run) = gT(i_run) + Sum(gFeFeFvFvi) 
 
gFeFvcFuFdi = 0._dp 
Call FeToFvcFuFd(i_run,MFv,MFu,MFd,MVWp,MFe,cplcFeFvcVWpL,cplcFeFvcVWpR,              & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,deltaM,          & 
& epsI,check,gFeFvcFuFdi)

gFeFvcFuFd(i_run,:,:,:) = gFeFvcFuFdi 
gT(i_run) = gT(i_run) + Sum(gFeFvcFuFdi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gFeFecFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=gt1,6
gPartial(i1,n_length)= gFeFecFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gFeFecFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,9
    Do gt3=gt2,9
gPartial(i1,n_length)= gFeFeFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gFeFvcFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FeThreeBodyDecay
 
 
Subroutine FeToFecFdFd(iIN,MFe,MFd,MVZ,MVZp,Mhh,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,IntegralSs,IntegralSSss,             & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,             & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(6),MFd(6),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFdFdhhL(6,6,2),cplcFdFdhhR(6,6,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),              & 
& cplcFdFdVZpL(6,6),cplcFdFdVZpR(6,6),cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),             & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(6,6,6, Isum) ) 
Allocate( Contribution(6,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFdFd 
 
 
Subroutine FeToFecFeFe(iIN,MFe,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralSSst,            & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZp,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(6),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),              & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(6,6,6, Isum) ) 
Allocate( Contribution(6,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt3) 
coup2(2) = cplcFeFeVZpR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplcFeFeVZpL(gt2,gt1) 
coup2(6) = cplcFeFeVZpR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i1))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFeVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt3,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFeVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt1,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt3,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt3) 
coup2(2) = cplcFeFeVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt1) 
coup2(6) = cplcFeFeVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt3) 
coup2(2) = cplcFeFeVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt1) 
coup2(6) = cplcFeFeVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFehhL(iIN,gt3,i1) 
coup2(2) = cplcFeFehhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt1,i1) 
coup2(6) = cplcFeFehhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt3,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFeFe 
 
 
Subroutine FeToFecFuFu(iIN,MFe,MFu,MVZ,MVZp,Mhh,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,IntegralSs,IntegralSSss,             & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,             & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(6),MFu(6),MVZ,MVZp,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),              & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFuFuhhL(6,6,2),cplcFuFuhhR(6,6,2),             & 
& cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplcFuFuVZpL(6,6),cplcFuFuVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 16 
Allocate( gSum(6,6,6, Isum) ) 
Allocate( Contribution(6,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFuFu 
 
 
Subroutine FeToFeFvFv(iIN,MFe,MFv,MVZ,MVZp,MVWp,Mhh,cplcFeFehhL,cplcFeFehhR,          & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplFvFeVWpL,cplFvFeVWpR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,       & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVSst,              & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZp,            & 
& gTVWp,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(6),MFv(9),MVZ,MVZp,MVWp,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFehhL(6,6,2),cplcFeFehhR(6,6,2),cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),              & 
& cplcFeFeVZpL(6,6),cplcFeFeVZpR(6,6),cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),             & 
& cplFvFeVWpL(9,6),cplFvFeVWpR(9,6),cplFvFvhhL(9,9,2),cplFvFvhhR(9,9,2),cplFvFvVZL(9,9), & 
& cplFvFvVZR(9,9),cplFvFvVZpL(9,9),cplFvFvVZpR(9,9)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12),IntegralVSst(500000,16),              & 
& IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTVWp,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 25 
Allocate( gSum(6,9,9, Isum) ) 
Allocate( Contribution(6,9,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFeFeVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplFvFvVZpL(gt3,gt2) 
coup2(6) = cplFvFvVZpR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt2)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt2)) 
coup(4) = Conjg(cplFvFeVWpL(gt3,gt1)) 
coup(3) = Conjg(cplFvFeVWpR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt3)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt1)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt3) 
coup2(2) = cplcFeFvcVWpR(iIN,gt3) 
coup2(4) = cplcFeFvcVWpL(iIN,gt2) 
coup2(3) = cplcFeFvcVWpR(iIN,gt2)  
coup2(5) = cplFvFeVWpL(gt2,gt1) 
coup2(6) = cplFvFeVWpR(gt2,gt1) 
coup2(8) = cplFvFeVWpL(gt3,gt1) 
coup2(7) = cplFvFeVWpR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i1))  
coup2(5) = cplFvFvhhL(gt3,gt2,i1) 
coup2(6) = cplFvFvhhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFeVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcFeFeVZpR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[VWp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = cplcFeFvcVWpL(iIN,gt2) 
coup2(3) = cplcFeFvcVWpR(iIN,gt2)  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = cplFvFeVWpL(gt3,gt1) 
coup2(7) = cplFvFeVWpR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = cplcFeFvcVWpL(iIN,gt3) 
coup2(3) = cplcFeFvcVWpR(iIN,gt3)  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = cplFvFeVWpL(gt2,gt1) 
coup2(7) = cplFvFeVWpR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWp]'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, conj[VWp] 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = cplcFeFvcVWpL(iIN,gt2) 
coup2(3) = cplcFeFvcVWpR(iIN,gt2)  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = cplFvFeVWpL(gt3,gt1) 
coup2(7) = cplFvFeVWpR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = cplcFeFvcVWpL(iIN,gt3) 
coup2(3) = cplcFeFvcVWpR(iIN,gt3)  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = cplFvFeVWpL(gt2,gt1) 
coup2(7) = cplFvFeVWpR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZp,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[VWp]'



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFeVZpL(iIN,gt1) 
coup2(2) = cplcFeFeVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  conj[VWp], hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt2) 
coup2(2) = cplcFeFvcVWpR(iIN,gt2) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplFvFeVWpL(gt3,gt1) 
coup2(6) = cplFvFeVWpR(gt3,gt1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt3) 
coup2(2) = cplcFeFvcVWpR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplFvFeVWpL(gt2,gt1) 
coup2(6) = cplFvFeVWpR(gt2,gt1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWp],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFeFehhL(iIN,gt1,i1) 
coup2(2) = cplcFeFehhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFeFehhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFeFehhR(gt1,iIN,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFeFvFv 
 
 
Subroutine FeToFvcFuFd(iIN,MFv,MFu,MFd,MVWp,MFe,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(9),MFu(6),MFd(6),MVWp,MFe(6)

Complex(dp),Intent(in) :: cplcFeFvcVWpL(6,9),cplcFeFvcVWpR(6,9),cplcFuFdVWpL(6,6),cplcFuFdVWpR(6,6)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFe(iIN) 
 
Isum = 1 
Allocate( gSum(9,6,6, Isum) ) 
Allocate( Contribution(9,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFuFd 
 
 
End Module Fe3Decays_U1T3R 
 
