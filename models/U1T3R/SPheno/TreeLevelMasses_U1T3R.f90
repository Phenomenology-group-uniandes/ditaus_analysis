! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:17 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_U1T3R 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_U1T3R 

 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(out) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(out) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: vH,vPhi

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesU1-T3R'
 
kont = 0 
Call CalculateVPVZVZp(g1,g2,gX,g1X,gX1,vH,vPhi,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Call CalculateVWp(g2,vH,ZW,MVWp,MVWp2,kont)

MHp2 = (2*(2._dp*(mu2H) + 2*LamH*vH**2 + LamPhiH*vPhi**2) + g2**2*vH**2*RXiWp)/4._dp 
  If (MHp2.ne.MHp2) Then 
      Write(*,*) 'NaN appearing in MHp2' 
      Call TerminateProgram 
    End If 
  If (MHp2.Ge.0._dp) Then 
MHp = sqrt(MHp2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MHp2' 
      Write(10,*) 'mass squarred is negative: ',MHp2 
    End If 
     Write(ErrCan,*) 'Warning from routine MHp2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MHp2 
     Write(*,*) 'Warning from routine MHp2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MHp2 
        MHp= 1._dp 
        MHp2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
Call CalculateMhh(mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAh(g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,           & 
& TW,TWp,ZA,MAh,MAh2,kont)

kont = kontSave 
Call CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFv(mChiNu,YvL,YvR,vH,vPhi,UV,MFv,kont)

MFv2 = MFv**2 

 
 Call SortGoldstones(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,kont)

If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
MAh(1)=MVZ*sqrt(RXiZ)
MAh2(1)=MVZ2*RXiZ
MAh(2)=MVZp*sqrt(RXiZp)
MAh2(2)=MVZp2*RXiZp
MHp=MVWp*sqrt(RXiWp)
MHp2=MVWp2*RXiWp
TW = ACos(Abs(ZZ(1,1)))
TWp = ACos(Abs(ZZ(3,3)))
alphaH = -ATan(ZH(1,2)/ZH(2,2))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,               & 
& YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(in) :: vH,vPhi

Real(dp),Intent(inout) :: MFeIN(6),MFe2IN(6),MFdIN(6),MFd2IN(6),MFuIN(6),MFu2IN(6)

Real(dp) :: MFe(6),MFe2(6),MFd(6),MFd2(6),MFu(6),MFu2(6)

Call CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,               & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(out) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(out) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: vH,vPhi

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesU1-T3R'
 
kont = 0 
Call CalculateVPVZVZpEffPot(g1,g2,gX,g1X,gX1,vH,vPhi,ZZ,MVZ,MVZp,MVZ2,MVZp2,          & 
& TW,TWp,kont)

Call CalculateVWpEffPot(g2,vH,ZW,MVWp,MVWp2,kont)

MHp2 = (2*(2._dp*(mu2H) + 2*LamH*vH**2 + LamPhiH*vPhi**2) + g2**2*vH**2*RXiWp)/4._dp 
  If (MHp2.ne.MHp2) Then 
      Write(*,*) 'NaN appearing in MHp2' 
      Call TerminateProgram 
    End If 
  If (MHp2.Ge.0._dp) Then 
MHp = sqrt(MHp2) 
  Else 
 End if 


! ------------------------------- 
Call CalculateMhhEffPot(mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,Mhh,               & 
& Mhh2,kont)

kontSave = kont 
Call CalculateMAhEffPot(g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,             & 
& vH,vPhi,TW,TWp,ZA,MAh,MAh2,kont)

kont = kontSave 
Call CalculateMFdEffPot(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFeEffPot(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFvEffPot(mChiNu,YvL,YvR,vH,vPhi,UV,MFv,kont)

MFv2 = MFv**2 

 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMhh(mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,Mhh,               & 
& Mhh2,kont)

Real(dp), Intent(in) :: mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mu2H
mat(1,1) = mat(1,1)+3*LamH*vH**2
mat(1,1) = mat(1,1)+(LamPhiH*vPhi**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+LamPhiH*vH*vPhi
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu2Phi
mat(2,2) = mat(2,2)+(LamPhiH*vH**2)/2._dp
mat(2,2) = mat(2,2)+3*LamPhi*vPhi**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMAh(g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,             & 
& vH,vPhi,TW,TWp,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MAh(2), MAh2(2) 
Real(dp), Intent(out) :: ZA(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mu2H
mat(1,1) = mat(1,1)+LamH*vH**2
mat(1,1) = mat(1,1)+(LamPhiH*vPhi**2)/2._dp
mat(1,1) = mat(1,1)+(g2**2*vH**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat(1,1) = mat(1,1)+(g1X**2*vH**2*Cos(TWp)**2*RXiZp)/4._dp
mat(1,1) = mat(1,1)+(g1*g2*vH**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat(1,1) = mat(1,1)+(g1**2*vH**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat(1,1) = mat(1,1)-1._dp/2._dp*(g1X*g2*vH**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat(1,1) = mat(1,1)+(g1X*g2*vH**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,1) = mat(1,1)-1._dp/2._dp*(g1*g1X*vH**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat(1,1) = mat(1,1)+(g1*g1X*vH**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,1) = mat(1,1)+(g1X**2*vH**2*RXiZ*Sin(TWp)**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vH**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat(1,1) = mat(1,1)+(g1*g2*vH**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vH**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g1X*gX*vH*vPhi*Cos(TWp)**2*RXiZp)/2._dp
mat(1,2) = mat(1,2)+(g2*gX1*vH*vPhi*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat(1,2) = mat(1,2)+(g1*gX1*vH*vPhi*Cos(TWp)**2*RXiZ*Sin(TW)**2)/2._dp
mat(1,2) = mat(1,2)-1._dp/2._dp*(g2*gX*vH*vPhi*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat(1,2) = mat(1,2)+(g2*gX*vH*vPhi*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)-1._dp/2._dp*(g1*gX*vH*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat(1,2) = mat(1,2)-1._dp/2._dp*(g1X*gX1*vH*vPhi*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat(1,2) = mat(1,2)+(g1*gX*vH*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g1X*gX1*vH*vPhi*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g1X*gX*vH*vPhi*RXiZ*Sin(TWp)**2)/2._dp
mat(1,2) = mat(1,2)+(g2*gX1*vH*vPhi*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat(1,2) = mat(1,2)+(g1*gX1*vH*vPhi*RXiZp*Sin(TW)**2*Sin(TWp)**2)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu2Phi
mat(2,2) = mat(2,2)+(LamPhiH*vH**2)/2._dp
mat(2,2) = mat(2,2)+LamPhi*vPhi**2
mat(2,2) = mat(2,2)+gX**2*vPhi**2*Cos(TWp)**2*RXiZp
mat(2,2) = mat(2,2)+gX1**2*vPhi**2*Cos(TWp)**2*RXiZ*Sin(TW)**2
mat(2,2) = mat(2,2)-2*gX*gX1*vPhi**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat(2,2) = mat(2,2)+2*gX*gX1*vPhi**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat(2,2) = mat(2,2)+gX**2*vPhi**2*RXiZ*Sin(TWp)**2
mat(2,2) = mat(2,2)+gX1**2*vPhi**2*RXiZp*Sin(TW)**2*Sin(TWp)**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(MAh2(i1)).Le.MaxMassNumericalZero) MAh2(i1) = 1.E-10_dp 
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MAh2(i1) 
    End If 
  MAh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MAh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MAh2(i1) 
  MAh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAh 

Subroutine CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiD(3,3),YdL(3,3),YdR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(6) 
 Complex(dp), Intent(out) :: ZDL(6,6), ZDR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZDL2(6,6), ZDR2(6,6) 
 
 Real(dp) :: ZDL1(6,6), ZDR1(6,6), test(2), MFd2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YdL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YdL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YdL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YdL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YdL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YdL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YdL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YdL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YdL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YdR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YdR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YdR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiD(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiD(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiD(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YdR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YdR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YdR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiD(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiD(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiD(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YdR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YdR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YdR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiD(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiD(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiD(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiU(3,3),YuL(3,3),YuR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(6) 
 Complex(dp), Intent(out) :: ZUL(6,6), ZUR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZUL2(6,6), ZUR2(6,6) 
 
 Real(dp) :: ZUL1(6,6), ZUR1(6,6), test(2), MFu2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YuL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YuL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YuL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YuL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YuL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YuL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YuL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YuL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YuL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YuR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YuR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YuR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiU(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiU(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiU(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YuR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YuR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YuR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiU(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiU(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiU(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YuR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YuR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YuR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiU(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiU(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiU(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiE(3,3),YeL(3,3),YeR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(6) 
 Complex(dp), Intent(out) :: ZEL(6,6), ZER(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZEL2(6,6), ZER2(6,6) 
 
 Real(dp) :: ZEL1(6,6), ZER1(6,6), test(2), MFe2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YeL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YeL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YeL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YeL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YeL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YeL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YeL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YeL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YeL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YeR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YeR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YeR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiE(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiE(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiE(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YeR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YeR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YeR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiE(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiE(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiE(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YeR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YeR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YeR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiE(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiE(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiE(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateMFv(mChiNu,YvL,YvR,vH,vPhi,UV,MFv,kont)

Real(dp) ,Intent(in) :: vH,vPhi

Complex(dp) ,Intent(in) :: mChiNu(3,3),YvL(3,3),YvR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(9) 
Complex(dp), Intent(out) ::  UV(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: UVa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,5) = 0._dp 
mat(1,6) = 0._dp 
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+(vH*YvL(1,1))/sqrt(2._dp)
mat(1,8) = 0._dp 
mat(1,8) = mat(1,8)+(vH*YvL(2,1))/sqrt(2._dp)
mat(1,9) = 0._dp 
mat(1,9) = mat(1,9)+(vH*YvL(3,1))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,5) = 0._dp 
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,7) = mat(2,7)+(vH*YvL(1,2))/sqrt(2._dp)
mat(2,8) = 0._dp 
mat(2,8) = mat(2,8)+(vH*YvL(2,2))/sqrt(2._dp)
mat(2,9) = 0._dp 
mat(2,9) = mat(2,9)+(vH*YvL(3,2))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,5) = 0._dp 
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)+(vH*YvL(1,3))/sqrt(2._dp)
mat(3,8) = 0._dp 
mat(3,8) = mat(3,8)+(vH*YvL(2,3))/sqrt(2._dp)
mat(3,9) = 0._dp 
mat(3,9) = mat(3,9)+(vH*YvL(3,3))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)+(vPhi*YvR(1,1))/sqrt(2._dp)
mat(4,8) = 0._dp 
mat(4,8) = mat(4,8)+(vPhi*YvR(1,2))/sqrt(2._dp)
mat(4,9) = 0._dp 
mat(4,9) = mat(4,9)+(vPhi*YvR(1,3))/sqrt(2._dp)
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)+(vPhi*YvR(2,1))/sqrt(2._dp)
mat(5,8) = 0._dp 
mat(5,8) = mat(5,8)+(vPhi*YvR(2,2))/sqrt(2._dp)
mat(5,9) = 0._dp 
mat(5,9) = mat(5,9)+(vPhi*YvR(2,3))/sqrt(2._dp)
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)+(vPhi*YvR(3,1))/sqrt(2._dp)
mat(6,8) = 0._dp 
mat(6,8) = mat(6,8)+(vPhi*YvR(3,2))/sqrt(2._dp)
mat(6,9) = 0._dp 
mat(6,9) = mat(6,9)+(vPhi*YvR(3,3))/sqrt(2._dp)
mat(7,7) = 0._dp 
mat(7,7) = mat(7,7)+mChiNu(1,1)
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+mChiNu(1,2)/2._dp
mat(7,8) = mat(7,8)+mChiNu(2,1)/2._dp
mat(7,9) = 0._dp 
mat(7,9) = mat(7,9)+mChiNu(1,3)/2._dp
mat(7,9) = mat(7,9)+mChiNu(3,1)/2._dp
mat(8,8) = 0._dp 
mat(8,8) = mat(8,8)+mChiNu(2,2)
mat(8,9) = 0._dp 
mat(8,9) = mat(8,9)+mChiNu(2,3)/2._dp
mat(8,9) = mat(8,9)+mChiNu(3,2)/2._dp
mat(9,9) = 0._dp 
mat(9,9) = mat(9,9)+mChiNu(3,3)

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E9 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFv 

Subroutine CalculateVPVZVZp(g1,g2,gX,g1X,gX1,vH,vPhi,ZZ,MVZ,MVZp,MVZ2,MVZp2,          & 
& TW,TWp,kont)

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi

Real(dp), Intent(out) :: TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZp, MVZp2
Real(dp) :: VPVZVZp2(3),VPVZVZp(3)  

Real(dp), Intent(out) :: ZZ(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vH**2)/4._dp
mat(1,1) = mat(1,1)+gX1**2*vPhi**2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp/4._dp*(g1*g2*vH**2)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(g1*g1X*vH**2)/4._dp
mat(1,3) = mat(1,3)+gX*gX1*vPhi**2
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vH**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/4._dp*(g1X*g2*vH**2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1X**2*vH**2)/4._dp
mat(3,3) = mat(3,3)+gX**2*vPhi**2

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZp2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZp2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZp2))) VPVZVZp2(i1) = 1.E-10_dp 
  If (VPVZVZp2(i1).ne.VPVZVZp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZp2(i1).Ge.0._dp) Then 
  VPVZVZp(i1) =Sqrt(VPVZVZp2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZVZp2(i1) 
    End If 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZVZp2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZVZp2(i1) 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZp(2) 
MVZ2 = VPVZVZp2(2) 
MVZp = VPVZVZp(3) 
MVZp2 = VPVZVZp2(3) 
TW = ACos(Abs(ZZ(1,1)))
TWp = ACos(Abs(ZZ(3,3)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZp 

Subroutine CalculateVWp(g2,vH,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,vH

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vH**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vH**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWp2(i1) 
    End If 
  VWp(i1)= 1._dp 
  VWp2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWp2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWp2(i1) 
  VWp(i1)= 1._dp 
  VWp2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWp 

Subroutine CalculateMhhEffPot(mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,ZH,             & 
& Mhh,Mhh2,kont)

Real(dp), Intent(in) :: mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) :: Mhh2temp(2), Q2 
Real(dp) :: ZHtemp(2,2),ZHtemp2(2,2) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mu2H
mat(1,1) = mat(1,1)+3*LamH*vH**2
mat(1,1) = mat(1,1)+(LamPhiH*vPhi**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+LamPhiH*vH*vPhi
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu2Phi
mat(2,2) = mat(2,2)+(LamPhiH*vH**2)/2._dp
mat(2,2) = mat(2,2)+3*LamPhi*vPhi**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMAhEffPot(g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,              & 
& LamPhi,vH,vPhi,TW,TWp,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,mu2H,mu2Phi,LamH,LamPhiH,LamPhi,vH,vPhi,TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MAh(2), MAh2(2) 
Real(dp), Intent(out) :: ZA(2,2) 
 
Real(dp) :: ZAFIX(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mu2H
mat(1,1) = mat(1,1)+LamH*vH**2
mat(1,1) = mat(1,1)+(LamPhiH*vPhi**2)/2._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu2Phi
mat(2,2) = mat(2,2)+(LamPhiH*vH**2)/2._dp
mat(2,2) = mat(2,2)+LamPhi*vPhi**2

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZA(i1,:)),1)
  If (Real(ZA(i1,pos),dp).lt.0._dp) Then
    ZA(i1,:)=-ZA(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
  MAh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAhEffPot 

Subroutine CalculateMFdEffPot(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiD(3,3),YdL(3,3),YdR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(6) 
 Complex(dp), Intent(out) :: ZDL(6,6), ZDR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZDL2(6,6), ZDR2(6,6) 
 
 Real(dp) :: ZDL1(6,6), ZDR1(6,6), test(2), MFd2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YdL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YdL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YdL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YdL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YdL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YdL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YdL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YdL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YdL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YdR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YdR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YdR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiD(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiD(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiD(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YdR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YdR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YdR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiD(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiD(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiD(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YdR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YdR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YdR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiD(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiD(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiD(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiU(3,3),YuL(3,3),YuR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(6) 
 Complex(dp), Intent(out) :: ZUL(6,6), ZUR(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZUL2(6,6), ZUR2(6,6) 
 
 Real(dp) :: ZUL1(6,6), ZUR1(6,6), test(2), MFu2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YuL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YuL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YuL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YuL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YuL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YuL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YuL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YuL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YuL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YuR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YuR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YuR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiU(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiU(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiU(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YuR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YuR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YuR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiU(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiU(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiU(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YuR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YuR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YuR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiU(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiU(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiU(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateMFeEffPot(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: vH,vPhi

Complex(dp),Intent(in) :: mChiE(3,3),YeL(3,3),YeR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(6) 
 Complex(dp), Intent(out) :: ZEL(6,6), ZER(6,6) 
 
 Complex(dp) :: mat(6,6)=0._dp, mat2(6,6)=0._dp, phaseM 

Complex(dp) :: ZEL2(6,6), ZER2(6,6) 
 
 Real(dp) :: ZEL1(6,6), ZER1(6,6), test(2), MFe2(6) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(vH*YeL(1,1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(vH*YeL(2,1))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(vH*YeL(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(vH*YeL(1,2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(vH*YeL(2,2))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(vH*YeL(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,2) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(vH*YeL(1,3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(vH*YeL(2,3))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(vH*YeL(3,3))/sqrt(2._dp)
mat(4,1) = 0._dp 
mat(4,1) = mat(4,1)+(vPhi*YeR(1,1))/sqrt(2._dp)
mat(4,2) = 0._dp 
mat(4,2) = mat(4,2)+(vPhi*YeR(2,1))/sqrt(2._dp)
mat(4,3) = 0._dp 
mat(4,3) = mat(4,3)+(vPhi*YeR(3,1))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+mChiE(1,1)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mChiE(1,2)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mChiE(1,3)
mat(5,1) = 0._dp 
mat(5,1) = mat(5,1)+(vPhi*YeR(1,2))/sqrt(2._dp)
mat(5,2) = 0._dp 
mat(5,2) = mat(5,2)+(vPhi*YeR(2,2))/sqrt(2._dp)
mat(5,3) = 0._dp 
mat(5,3) = mat(5,3)+(vPhi*YeR(3,2))/sqrt(2._dp)
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+mChiE(2,1)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+mChiE(2,2)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mChiE(2,3)
mat(6,1) = 0._dp 
mat(6,1) = mat(6,1)+(vPhi*YeR(1,3))/sqrt(2._dp)
mat(6,2) = 0._dp 
mat(6,2) = mat(6,2)+(vPhi*YeR(2,3))/sqrt(2._dp)
mat(6,3) = 0._dp 
mat(6,3) = mat(6,3)+(vPhi*YeR(3,3))/sqrt(2._dp)
mat(6,4) = 0._dp 
mat(6,4) = mat(6,4)+mChiE(3,1)
mat(6,5) = 0._dp 
mat(6,5) = mat(6,5)+mChiE(3,2)
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+mChiE(3,3)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,6
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateMFvEffPot(mChiNu,YvL,YvR,vH,vPhi,UV,MFv,kont)

Real(dp) ,Intent(in) :: vH,vPhi

Complex(dp) ,Intent(in) :: mChiNu(3,3),YvL(3,3),YvR(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(9) 
Complex(dp), Intent(out) ::  UV(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: UVa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,5) = 0._dp 
mat(1,6) = 0._dp 
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+(vH*YvL(1,1))/sqrt(2._dp)
mat(1,8) = 0._dp 
mat(1,8) = mat(1,8)+(vH*YvL(2,1))/sqrt(2._dp)
mat(1,9) = 0._dp 
mat(1,9) = mat(1,9)+(vH*YvL(3,1))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,5) = 0._dp 
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,7) = mat(2,7)+(vH*YvL(1,2))/sqrt(2._dp)
mat(2,8) = 0._dp 
mat(2,8) = mat(2,8)+(vH*YvL(2,2))/sqrt(2._dp)
mat(2,9) = 0._dp 
mat(2,9) = mat(2,9)+(vH*YvL(3,2))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,5) = 0._dp 
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)+(vH*YvL(1,3))/sqrt(2._dp)
mat(3,8) = 0._dp 
mat(3,8) = mat(3,8)+(vH*YvL(2,3))/sqrt(2._dp)
mat(3,9) = 0._dp 
mat(3,9) = mat(3,9)+(vH*YvL(3,3))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)+(vPhi*YvR(1,1))/sqrt(2._dp)
mat(4,8) = 0._dp 
mat(4,8) = mat(4,8)+(vPhi*YvR(1,2))/sqrt(2._dp)
mat(4,9) = 0._dp 
mat(4,9) = mat(4,9)+(vPhi*YvR(1,3))/sqrt(2._dp)
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)+(vPhi*YvR(2,1))/sqrt(2._dp)
mat(5,8) = 0._dp 
mat(5,8) = mat(5,8)+(vPhi*YvR(2,2))/sqrt(2._dp)
mat(5,9) = 0._dp 
mat(5,9) = mat(5,9)+(vPhi*YvR(2,3))/sqrt(2._dp)
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)+(vPhi*YvR(3,1))/sqrt(2._dp)
mat(6,8) = 0._dp 
mat(6,8) = mat(6,8)+(vPhi*YvR(3,2))/sqrt(2._dp)
mat(6,9) = 0._dp 
mat(6,9) = mat(6,9)+(vPhi*YvR(3,3))/sqrt(2._dp)
mat(7,7) = 0._dp 
mat(7,7) = mat(7,7)+mChiNu(1,1)
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+mChiNu(1,2)/2._dp
mat(7,8) = mat(7,8)+mChiNu(2,1)/2._dp
mat(7,9) = 0._dp 
mat(7,9) = mat(7,9)+mChiNu(1,3)/2._dp
mat(7,9) = mat(7,9)+mChiNu(3,1)/2._dp
mat(8,8) = 0._dp 
mat(8,8) = mat(8,8)+mChiNu(2,2)
mat(8,9) = 0._dp 
mat(8,9) = mat(8,9)+mChiNu(2,3)/2._dp
mat(8,9) = mat(8,9)+mChiNu(3,2)/2._dp
mat(9,9) = 0._dp 
mat(9,9) = mat(9,9)+mChiNu(3,3)

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
  Do i1=1,9
   pos=Maxloc(Abs(UV(i1,:)),1) 
   If (Abs(Real(UV(i1,pos),dp)).gt.Abs(Aimag(UV(i1,pos)))) Then 
      If (Real(UV(i1,pos),dp).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
       End If 
    Else 
      If (Aimag(UV(i1,pos)).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E9 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFvEffPot 

Subroutine CalculateVPVZVZpEffPot(g1,g2,gX,g1X,gX1,vH,vPhi,ZZ,MVZ,MVZp,               & 
& MVZ2,MVZp2,TW,TWp,kont)

Real(dp), Intent(in) :: g1,g2,gX,g1X,gX1,vH,vPhi

Real(dp), Intent(out) :: TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZp, MVZp2
Real(dp) :: VPVZVZp2(3),VPVZVZp(3)  

Real(dp), Intent(out) :: ZZ(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vHFix**2)/4._dp
mat(1,1) = mat(1,1)+gX1**2*vPhiFix**2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp/4._dp*(g1*g2*vHFix**2)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(g1*g1X*vHFix**2)/4._dp
mat(1,3) = mat(1,3)+gX*gX1*vPhiFix**2
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vHFix**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/4._dp*(g1X*g2*vHFix**2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1X**2*vHFix**2)/4._dp
mat(3,3) = mat(3,3)+gX**2*vPhiFix**2

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZp2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZp2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZp2))) VPVZVZp2(i1) = 1.E-10_dp 
  If (VPVZVZp2(i1).ne.VPVZVZp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZp2(i1).Ge.0._dp) Then 
  VPVZVZp(i1) =Sqrt(VPVZVZp2(i1) ) 
  Else 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZp(2) 
MVZ2 = VPVZVZp2(2) 
MVZp = VPVZVZp(3) 
MVZp2 = VPVZVZp2(3) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZpEffPot 

Subroutine CalculateVWpEffPot(g2,vH,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,vH

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vHFix**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vHFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
  VWp(i1)= 1._dp 
  VWp(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWpEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVWp,MVWp2,               & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZW,ZZ,vH,vPhi,g1,g1X,            & 
& g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,          & 
& mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(out) :: MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),MFv2(9),MVWp,MVWp2,               & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZZ(3,3)

Complex(dp),Intent(out) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(in) :: vH,vPhi

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesU1-T3R'
 
kont = 0 
Call CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFv(mChiNu,YvL,YvR,vH,vPhi,UV,MFv,kont)

MFv2 = MFv**2 

 
 Call CalculateVPVZVZp(g1,g2,gX,g1X,gX1,vH,vPhi,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Call CalculateVWp(g2,vH,ZW,MVWp,MVWp2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,kont)

Real(dp),Intent(inout) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(inout) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MAhtemp(2) 
Complex(dp) :: ZAhtemp(2,2) 


pos = MinLoc(Abs(MAh2-MVZ2*RXiZ),1) 
If (pos.ne.1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(1) = MAhtemp(pos) 
  ZA(1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(1) 
  ZA(pos,:) = ZAhtemp(1,:) 
End if 
pos = MinLoc(Abs(MAh2-MVZp2*RXiZp),1) 
If (pos.ne.2) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(2) = MAhtemp(pos) 
  ZA(2,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(2) 
  ZA(pos,:) = ZAhtemp(2,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=3,2
 pos = Minloc(MAh2(i1:2),1) + i1 -1  
If (pos.ne.i1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(i1) = MAhtemp(pos) 
  ZA(i1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(i1) 
  ZA(pos,:) = ZAhtemp(i1,:) 
End if 
End do 
MAh = sqrt(MAh2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_U1T3R 
 
