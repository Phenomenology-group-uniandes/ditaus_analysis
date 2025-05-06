! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:22 on 14.6.2024   
! ----------------------------------------------------------------------  
 
 
Module RGEs_THDMII 
 
Use Control 
Use Settings 
Use Model_Data_THDMII 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters73(g,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,              & 
& M12,M112,M222)

Implicit None 
Real(dp), Intent(in) :: g(73) 
Real(dp),Intent(out) :: g1,g2,g3

Complex(dp),Intent(out) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters73' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam5= Cmplx(g(4),g(5),dp) 
Lam1= Cmplx(g(6),g(7),dp) 
Lam4= Cmplx(g(8),g(9),dp) 
Lam3= Cmplx(g(10),g(11),dp) 
Lam2= Cmplx(g(12),g(13),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(68),g(69),dp) 
M112= Cmplx(g(70),g(71),dp) 
M222= Cmplx(g(72),g(73),dp) 
Do i1=1,73 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters73

Subroutine ParametersToG73(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,            & 
& M112,M222,g)

Implicit None 
Real(dp), Intent(out) :: g(73) 
Real(dp), Intent(in) :: g1,g2,g3

Complex(dp), Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG73' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam5,dp)  
g(5) = Aimag(Lam5)  
g(6) = Real(Lam1,dp)  
g(7) = Aimag(Lam1)  
g(8) = Real(Lam4,dp)  
g(9) = Aimag(Lam4)  
g(10) = Real(Lam3,dp)  
g(11) = Aimag(Lam3)  
g(12) = Real(Lam2,dp)  
g(13) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(Yu(i1,i2), dp) 
g(SumI+15) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(Yd(i1,i2), dp) 
g(SumI+33) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(Ye(i1,i2), dp) 
g(SumI+51) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(68) = Real(M12,dp)  
g(69) = Aimag(M12)  
g(70) = Real(M112,dp)  
g(71) = Aimag(M112)  
g(72) = Real(M222,dp)  
g(73) = Aimag(M222)  
Iname = Iname - 1 
 
End Subroutine ParametersToG73

Subroutine rge73(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,Dg3
Complex(dp) :: Lam5,betaLam51,betaLam52,DLam5,Lam1,betaLam11,betaLam12,               & 
& DLam1,Lam4,betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,              & 
& betaLam21,betaLam22,DLam2,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)        & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),M12,betaM121,betaM122,DM12,M112,betaM1121,           & 
& betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Real(dp) :: AbsLam5
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYd(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),        & 
& adjYuYu(3,3),YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),              & 
& YuadjYuYu(3,3),adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYuYuadjYd(3,3),YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYdadjYuYuadjYd,TrYeadjYeYeadjYe,     & 
& TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lam1p2,Lam2p2,Lam3p2,Lam4p2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge73' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters73(gy,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,               & 
& M112,M222)

AbsLam5 = Conjg(Lam5)*Lam5
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYd = Matmul(Yu,adjYd) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYd = Matmul(adjYu,YuadjYd) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYuYuadjYd = Matmul(Yd,adjYuYuadjYd) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lam1p2 =Lam1**2 
 Lam2p2 =Lam2**2 
 Lam3p2 =Lam3**2 
 Lam4p2 =Lam4**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 21._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = (-9*g1p2*Lam5)/5._dp - 9*g2p2*Lam5 + 4*Lam1*Lam5 + 4*Lam2*Lam5 +         & 
&  8*Lam3*Lam5 + 12*Lam4*Lam5 + 6*Lam5*TrYdadjYd + 2*Lam5*TrYeadjYe + 6*Lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = AbsLam5 + 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)    & 
& /8._dp + 24._dp*(Lam1p2) + 2._dp*(Lam3p2) + Lam4p2 - (9*g1p2*Lam1)/5._dp -             & 
&  9*g2p2*Lam1 + 2*Lam3*Lam4 + 12*Lam1*TrYdadjYd - 6._dp*(TrYdadjYdYdadjYd)              & 
&  + 4*Lam1*TrYeadjYe - 2._dp*(TrYeadjYeYeadjYe)

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 8._dp*(AbsLam5) + (9*g1p2*g2p2)/5._dp + 4._dp*(Lam4p2) - (9*g1p2*Lam4)   & 
& /5._dp - 9*g2p2*Lam4 + 4*Lam1*Lam4 + 4*Lam2*Lam4 + 8*Lam3*Lam4 + 6*Lam4*TrYdadjYd +    & 
&  12._dp*(TrYdadjYuYuadjYd) + 2*Lam4*TrYeadjYe + 6*Lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 2._dp*(AbsLam5) + 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp +         & 
&  9._dp*(g2p4)/4._dp + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) - (9*g1p2*Lam3)/5._dp -          & 
&  9*g2p2*Lam3 + 12*Lam1*Lam3 + 12*Lam2*Lam3 + 4*Lam1*Lam4 + 4*Lam2*Lam4 +               & 
&  6*Lam3*TrYdadjYd - 12._dp*(TrYdadjYuYuadjYd) + 2*Lam3*TrYeadjYe + 6*Lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = AbsLam5 + 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)    & 
& /8._dp + 24._dp*(Lam2p2) + 2._dp*(Lam3p2) + Lam4p2 - (9*g1p2*Lam2)/5._dp -             & 
&  9*g2p2*Lam2 + 2*Lam3*Lam4 + 12*Lam2*TrYuadjYu - 6._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYuadjYu))*Yu + (YuadjYdYd + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe))*Yd) + 2*(3._dp*(YdadjYdYd) + YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = ((-9*(g1p2 + g2p2) + 12._dp*(TrYdadjYd) + 4._dp*(TrYeadjYe))               & 
& *Ye + 6._dp*(YeadjYeYe))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = (-9*g1p2*M12)/10._dp - (9*g2p2*M12)/2._dp + 2*Lam3*M12 + 4*Lam4*M12 +     & 
&  3*M12*TrYdadjYd + M12*TrYeadjYe + 3*M12*TrYuadjYu + 6*Conjg(Lam5)*Conjg(M12)

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = (-9*g1p2*M112)/10._dp - (9*g2p2*M112)/2._dp + 12*Lam1*M112 +             & 
&  4*Lam3*M222 + 2*Lam4*M222 + 6*M112*TrYdadjYd + 2*M112*TrYeadjYe

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 4*Lam3*M112 + 2*Lam4*M112 - (9*g1p2*M222)/10._dp - (9*g2p2*M222)         & 
& /2._dp + 12*Lam2*M222 + 6*M222*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

Call ParametersToG73(Dg1,Dg2,Dg3,DLam5,DLam1,DLam4,DLam3,DLam2,DYu,DYd,               & 
& DYe,DM12,DM112,DM222,f)

Iname = Iname - 1 
 
End Subroutine rge73  

Subroutine GToParameters75(g,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,              & 
& M12,M112,M222,vd,vu)

Implicit None 
Real(dp), Intent(in) :: g(75) 
Real(dp),Intent(out) :: g1,g2,g3,vd,vu

Complex(dp),Intent(out) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters75' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam5= Cmplx(g(4),g(5),dp) 
Lam1= Cmplx(g(6),g(7),dp) 
Lam4= Cmplx(g(8),g(9),dp) 
Lam3= Cmplx(g(10),g(11),dp) 
Lam2= Cmplx(g(12),g(13),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(68),g(69),dp) 
M112= Cmplx(g(70),g(71),dp) 
M222= Cmplx(g(72),g(73),dp) 
vd= g(74) 
vu= g(75) 
Do i1=1,75 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters75

Subroutine ParametersToG75(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,            & 
& M112,M222,vd,vu,g)

Implicit None 
Real(dp), Intent(out) :: g(75) 
Real(dp), Intent(in) :: g1,g2,g3,vd,vu

Complex(dp), Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG75' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam5,dp)  
g(5) = Aimag(Lam5)  
g(6) = Real(Lam1,dp)  
g(7) = Aimag(Lam1)  
g(8) = Real(Lam4,dp)  
g(9) = Aimag(Lam4)  
g(10) = Real(Lam3,dp)  
g(11) = Aimag(Lam3)  
g(12) = Real(Lam2,dp)  
g(13) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(Yu(i1,i2), dp) 
g(SumI+15) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(Yd(i1,i2), dp) 
g(SumI+33) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(Ye(i1,i2), dp) 
g(SumI+51) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(68) = Real(M12,dp)  
g(69) = Aimag(M12)  
g(70) = Real(M112,dp)  
g(71) = Aimag(M112)  
g(72) = Real(M222,dp)  
g(73) = Aimag(M222)  
g(74) = vd  
g(75) = vu  
Iname = Iname - 1 
 
End Subroutine ParametersToG75

Subroutine rge75(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,vd,betavd1,betavd2,Dvd,vu,betavu1,betavu2,Dvu
Complex(dp) :: Lam5,betaLam51,betaLam52,DLam5,Lam1,betaLam11,betaLam12,               & 
& DLam1,Lam4,betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,              & 
& betaLam21,betaLam22,DLam2,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)        & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),M12,betaM121,betaM122,DM12,M112,betaM1121,           & 
& betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Real(dp) :: AbsLam5
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYd(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),        & 
& adjYuYu(3,3),YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),              & 
& YuadjYuYu(3,3),adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYuYuadjYd(3,3),YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYdadjYuYuadjYd,TrYeadjYeYeadjYe,     & 
& TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lam1p2,Lam2p2,Lam3p2,Lam4p2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge75' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters75(gy,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,               & 
& M112,M222,vd,vu)

AbsLam5 = Conjg(Lam5)*Lam5
Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYd = Matmul(Yu,adjYd) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYd = Matmul(adjYu,YuadjYd) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYuYuadjYd = Matmul(Yd,adjYuYuadjYd) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lam1p2 =Lam1**2 
 Lam2p2 =Lam2**2 
 Lam3p2 =Lam3**2 
 Lam4p2 =Lam4**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 21._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = (-9*g1p2*Lam5)/5._dp - 9*g2p2*Lam5 + 4*Lam1*Lam5 + 4*Lam2*Lam5 +         & 
&  8*Lam3*Lam5 + 12*Lam4*Lam5 + 6*Lam5*TrYdadjYd + 2*Lam5*TrYeadjYe + 6*Lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = AbsLam5 + 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)    & 
& /8._dp + 24._dp*(Lam1p2) + 2._dp*(Lam3p2) + Lam4p2 - (9*g1p2*Lam1)/5._dp -             & 
&  9*g2p2*Lam1 + 2*Lam3*Lam4 + 12*Lam1*TrYdadjYd - 6._dp*(TrYdadjYdYdadjYd)              & 
&  + 4*Lam1*TrYeadjYe - 2._dp*(TrYeadjYeYeadjYe)

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 8._dp*(AbsLam5) + (9*g1p2*g2p2)/5._dp + 4._dp*(Lam4p2) - (9*g1p2*Lam4)   & 
& /5._dp - 9*g2p2*Lam4 + 4*Lam1*Lam4 + 4*Lam2*Lam4 + 8*Lam3*Lam4 + 6*Lam4*TrYdadjYd +    & 
&  12._dp*(TrYdadjYuYuadjYd) + 2*Lam4*TrYeadjYe + 6*Lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 2._dp*(AbsLam5) + 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp +         & 
&  9._dp*(g2p4)/4._dp + 4._dp*(Lam3p2) + 2._dp*(Lam4p2) - (9*g1p2*Lam3)/5._dp -          & 
&  9*g2p2*Lam3 + 12*Lam1*Lam3 + 12*Lam2*Lam3 + 4*Lam1*Lam4 + 4*Lam2*Lam4 +               & 
&  6*Lam3*TrYdadjYd - 12._dp*(TrYdadjYuYuadjYd) + 2*Lam3*TrYeadjYe + 6*Lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = AbsLam5 + 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)    & 
& /8._dp + 24._dp*(Lam2p2) + 2._dp*(Lam3p2) + Lam4p2 - (9*g1p2*Lam2)/5._dp -             & 
&  9*g2p2*Lam2 + 2*Lam3*Lam4 + 12*Lam2*TrYuadjYu - 6._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYuadjYu))*Yu + (YuadjYdYd + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe))*Yd) + 2*(3._dp*(YdadjYdYd) + YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = ((-9*(g1p2 + g2p2) + 12._dp*(TrYdadjYd) + 4._dp*(TrYeadjYe))               & 
& *Ye + 6._dp*(YeadjYeYe))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = (-9*g1p2*M12)/10._dp - (9*g2p2*M12)/2._dp + 2*Lam3*M12 + 4*Lam4*M12 +     & 
&  3*M12*TrYdadjYd + M12*TrYeadjYe + 3*M12*TrYuadjYu + 6*Conjg(Lam5)*Conjg(M12)

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = (-9*g1p2*M112)/10._dp - (9*g2p2*M112)/2._dp + 12*Lam1*M112 +             & 
&  4*Lam3*M222 + 2*Lam4*M222 + 6*M112*TrYdadjYd + 2*M112*TrYeadjYe

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 4*Lam3*M112 + 2*Lam4*M112 - (9*g1p2*M222)/10._dp - (9*g2p2*M222)         & 
& /2._dp + 12*Lam2*M222 + 6*M222*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = -3*TrYdadjYd*vd - TrYeadjYe*vd + (3*(g1p2 + 5._dp*(g2p2))*vd*(3 +          & 
&  Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = -3*TrYuadjYu*vu + (3*(g1p2 + 5._dp*(g2p2))*vu*(3 + Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
Call ParametersToG75(Dg1,Dg2,Dg3,DLam5,DLam1,DLam4,DLam3,DLam2,DYu,DYd,               & 
& DYe,DM12,DM112,DM222,Dvd,Dvu,f)

Iname = Iname - 1 
 
End Subroutine rge75  

End Module RGEs_THDMII 
 
