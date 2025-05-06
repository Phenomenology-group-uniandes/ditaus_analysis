! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:25 on 14.6.2024   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_THDMII 
 
Use Model_Data_THDMII 
Use TreeLevelMasses_THDMII 
Use RGEs_THDMII 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,             & 
& Ye,M12,M112,M222,vd,vu,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,vd,vu

Complex(dp),Intent(inout) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(75)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
M112 = -1._dp/4._dp*(4*Lam1*vd**3 + 2*M12*vu + 2*Lam3*vd*vu**2 + 2*Lam4*vd*vu**2 +           & 
&  Lam5*vd*vu**2 + vd*vu**2*Conjg(Lam5) + 2*vu*Conjg(M12) - 4*Tad1Loop(1))/vd
M222 = -1._dp/4._dp*(2*M12*vd + 2*Lam3*vd**2*vu + 2*Lam4*vd**2*vu + Lam5*vd**2*vu +          & 
&  4*Lam2*vu**3 + vd**2*vu*Conjg(Lam5) + 2*vd*Conjg(M12) - 4*Tad1Loop(2))/vu

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
M112 = -1._dp/4._dp*(4*Lam1*vd**3 + 2*M12*vu + 2*Lam3*vd*vu**2 + 2*Lam4*vd*vu**2 +           & 
&  Lam5*vd*vu**2 + vd*vu**2*Conjg(Lam5) + 2*vu*Conjg(M12) - 4*Tad1Loop(1))/vd
M222 = -1._dp/4._dp*(2*M12*vd + 2*Lam3*vd**2*vu + 2*Lam4*vd**2*vu + Lam5*vd**2*vu +          & 
&  4*Lam2*vu**3 + vd**2*vu*Conjg(Lam5) + 2*vd*Conjg(M12) - 4*Tad1Loop(2))/vu

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(M112,dp).ne.Real(M112,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M112" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M112)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M112" 
   !Call TerminateProgram  
   M112 = Real(M112,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M222,dp).ne.Real(M222,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M222" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M222)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M222" 
   !Call TerminateProgram  
   M222 = Real(M222,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,              & 
& M12,M112,M222,vd,vu,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,vd,vu

Complex(dp),Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real((4*Lam1*vd**3 + vd*(4._dp*(M112) + vu**2*(2._dp*(Lam3)        & 
&  + 2._dp*(Lam4) + Lam5 + Conjg(Lam5))) + 2*vu*(M12 + Conjg(M12)))/4._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((4*vu*(M222 + Lam2*vu**2) + vd**2*vu*(2._dp*(Lam3)            & 
&  + 2._dp*(Lam4) + Lam5 + Conjg(Lam5)) + 2*vd*(M12 + Conjg(M12)))/4._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_THDMII 
 
