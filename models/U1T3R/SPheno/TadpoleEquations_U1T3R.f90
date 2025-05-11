! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:57 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_U1T3R 
 
Use Model_Data_U1T3R 
Use TreeLevelMasses_U1T3R 
Use RGEs_U1T3R 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,             & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,               & 
& vPhi,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(229)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
mu2H = -(LamH*vH**2) - (LamPhiH*vPhi**2)/2._dp + Tad1Loop(1)/vH
mu2Phi = -1._dp/2._dp*(LamPhiH*vH**2) - LamPhi*vPhi**2 + Tad1Loop(2)/vPhi

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mu2H.ne.mu2H) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2H" 
   Call TerminateProgram  
 End If 
 If (mu2Phi.ne.mu2Phi) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2Phi" 
   Call TerminateProgram  
 End If 
 Else 
mu2H = -(LamH*vH**2) - (LamPhiH*vPhi**2)/2._dp + Tad1Loop(1)/vH
mu2Phi = -1._dp/2._dp*(LamPhiH*vH**2) - LamPhi*vPhi**2 + Tad1Loop(2)/vPhi

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mu2H.ne.mu2H) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2H" 
   Call TerminateProgram  
 End If 
 If (mu2Phi.ne.mu2Phi) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mu2Phi" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,             & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp),Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real((vH*(2._dp*(mu2H) + 2*LamH*vH**2 + LamPhiH*vPhi**2))          & 
& /2._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((vPhi*(LamPhiH*vH**2 + 2*(mu2Phi + LamPhi*vPhi**2)))          & 
& /2._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_U1T3R 
 
