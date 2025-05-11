! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:51 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module RGEs_U1T3R 
 
Use Control 
Use Settings 
Use Model_Data_U1T3R 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters227(g,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi)

Implicit None 
Real(dp), Intent(in) :: g(227) 
Real(dp),Intent(out) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(out) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters227' 
 
g1= g(1) 
g1X= g(2) 
g2= g(3) 
g3= g(4) 
gX= g(5) 
gX1= g(6) 
LamH= g(7) 
LamPhiH= g(8) 
LamPhi= g(9) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YvL(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YuL(i1,i2) = Cmplx( g(SumI+28), g(SumI+29), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YvR(i1,i2) = Cmplx( g(SumI+46), g(SumI+47), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YuR(i1,i2) = Cmplx( g(SumI+64), g(SumI+65), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YdL(i1,i2) = Cmplx( g(SumI+82), g(SumI+83), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YeL(i1,i2) = Cmplx( g(SumI+100), g(SumI+101), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YdR(i1,i2) = Cmplx( g(SumI+118), g(SumI+119), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YeR(i1,i2) = Cmplx( g(SumI+136), g(SumI+137), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiD(i1,i2) = Cmplx( g(SumI+154), g(SumI+155), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiE(i1,i2) = Cmplx( g(SumI+172), g(SumI+173), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiNu(i1,i2) = Cmplx( g(SumI+190), g(SumI+191), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiU(i1,i2) = Cmplx( g(SumI+208), g(SumI+209), dp) 
End Do 
 End Do 
 
mu2H= g(226) 
mu2Phi= g(227) 
Do i1=1,227 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters227

Subroutine ParametersToG227(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,              & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,g)

Implicit None 
Real(dp), Intent(out) :: g(227) 
Real(dp), Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp), Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG227' 
 
g(1) = g1  
g(2) = g1X  
g(3) = g2  
g(4) = g3  
g(5) = gX  
g(6) = gX1  
g(7) = LamH  
g(8) = LamPhiH  
g(9) = LamPhi  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(YvL(i1,i2), dp) 
g(SumI+11) = Aimag(YvL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+28) = Real(YuL(i1,i2), dp) 
g(SumI+29) = Aimag(YuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+46) = Real(YvR(i1,i2), dp) 
g(SumI+47) = Aimag(YvR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+64) = Real(YuR(i1,i2), dp) 
g(SumI+65) = Aimag(YuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+82) = Real(YdL(i1,i2), dp) 
g(SumI+83) = Aimag(YdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+100) = Real(YeL(i1,i2), dp) 
g(SumI+101) = Aimag(YeL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+118) = Real(YdR(i1,i2), dp) 
g(SumI+119) = Aimag(YdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+136) = Real(YeR(i1,i2), dp) 
g(SumI+137) = Aimag(YeR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+154) = Real(mChiD(i1,i2), dp) 
g(SumI+155) = Aimag(mChiD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+172) = Real(mChiE(i1,i2), dp) 
g(SumI+173) = Aimag(mChiE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+190) = Real(mChiNu(i1,i2), dp) 
g(SumI+191) = Aimag(mChiNu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+208) = Real(mChiU(i1,i2), dp) 
g(SumI+209) = Aimag(mChiU(i1,i2)) 
End Do 
End Do 

g(226) = mu2H  
g(227) = mu2Phi  
Iname = Iname - 1 
 
End Subroutine ParametersToG227

Subroutine rge227(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g1X,betag1X1,betag1X2,Dg1X,g2,betag21,             & 
& betag22,Dg2,g3,betag31,betag32,Dg3,gX,betagX1,betagX2,DgX,gX1,betagX11,betagX12,       & 
& DgX1,LamH,betaLamH1,betaLamH2,DLamH,LamPhiH,betaLamPhiH1,betaLamPhiH2,DLamPhiH,        & 
& LamPhi,betaLamPhi1,betaLamPhi2,DLamPhi,mu2H,betamu2H1,betamu2H2,Dmu2H,mu2Phi,          & 
& betamu2Phi1,betamu2Phi2,Dmu2Phi
Complex(dp) :: YvL(3,3),betaYvL1(3,3),betaYvL2(3,3),DYvL(3,3),adjYvL(3,3)             & 
& ,YuL(3,3),betaYuL1(3,3),betaYuL2(3,3),DYuL(3,3),adjYuL(3,3),YvR(3,3),betaYvR1(3,3)     & 
& ,betaYvR2(3,3),DYvR(3,3),adjYvR(3,3),YuR(3,3),betaYuR1(3,3),betaYuR2(3,3)              & 
& ,DYuR(3,3),adjYuR(3,3),YdL(3,3),betaYdL1(3,3),betaYdL2(3,3),DYdL(3,3),adjYdL(3,3)      & 
& ,YeL(3,3),betaYeL1(3,3),betaYeL2(3,3),DYeL(3,3),adjYeL(3,3),YdR(3,3),betaYdR1(3,3)     & 
& ,betaYdR2(3,3),DYdR(3,3),adjYdR(3,3),YeR(3,3),betaYeR1(3,3),betaYeR2(3,3)              & 
& ,DYeR(3,3),adjYeR(3,3),mChiD(3,3),betamChiD1(3,3),betamChiD2(3,3),DmChiD(3,3)          & 
& ,adjmChiD(3,3),mChiE(3,3),betamChiE1(3,3),betamChiE2(3,3),DmChiE(3,3),adjmChiE(3,3)    & 
& ,mChiNu(3,3),betamChiNu1(3,3),betamChiNu2(3,3),DmChiNu(3,3),adjmChiNu(3,3)             & 
& ,mChiU(3,3),betamChiU1(3,3),betamChiU2(3,3),DmChiU(3,3),adjmChiU(3,3)
Complex(dp) :: YdLadjYdL(3,3),YdRadjYdR(3,3),YeLadjYeL(3,3),YeRadjYeR(3,3),YuLadjYuL(3,3),           & 
& YuRadjYuR(3,3),YvLadjYvL(3,3),YvRadjYvR(3,3),YvRCmChiNu(3,3),adjYdLYdL(3,3),           & 
& adjYdRYdR(3,3),adjYeLYeL(3,3),adjYeRYeR(3,3),adjYuLYuL(3,3),adjYuRYuR(3,3),            & 
& adjYvLmChiNu(3,3),adjYvLYvL(3,3),adjYvRYvR(3,3),CYdLTpYdL(3,3),CYdRmChiD(3,3),         & 
& CYeLTpYeL(3,3),CYeRmChiE(3,3),CYuLTpYuL(3,3),CYuRmChiU(3,3),CYvLTpYvL(3,3),            & 
& CYvRmChiNu(3,3),CYvRYvL(3,3),TpmChiDCmChiD(3,3),TpmChiECmChiE(3,3),TpmChiUCmChiU(3,3), & 
& TpYdRCYdR(3,3),TpYeRCYeR(3,3),TpYuRCYuR(3,3),TpYvRCYvR(3,3),mChiDCYdLTpYdL(3,3),       & 
& mChiECYeLTpYeL(3,3),mChiNuadjYvRYvR(3,3),mChiNuCYvLTpYvL(3,3),mChiUCYuLTpYuL(3,3),     & 
& YdLadjYdLYdL(3,3),YdLadjYuLYuL(3,3),YdRadjYdRYdR(3,3),YeLadjYeLYeL(3,3),               & 
& YeLadjYvLYvL(3,3),YeRadjYeRYeR(3,3),YuLadjYdLYdL(3,3),YuLadjYuLYuL(3,3),               & 
& YuRadjYuRYuR(3,3),YvLadjYeLYeL(3,3),YvLadjYvLmChiNu(3,3),YvLadjYvLYvL(3,3),            & 
& YvRadjYvRYvR(3,3),YvRCYvLTpYvL(3,3),adjmChiDTpYdRCYdR(3,3),adjmChiETpYeRCYeR(3,3),     & 
& adjmChiUTpYuRCYuR(3,3),adjYdLYdLadjYdL(3,3),adjYdLTpmChiDCmChiD(3,3),adjYdRYdRadjYdR(3,3),& 
& adjYeLYeLadjYeL(3,3),adjYeLTpmChiECmChiE(3,3),adjYeRYeRadjYeR(3,3),adjYuLYuLadjYuL(3,3),& 
& adjYuLTpmChiUCmChiU(3,3),adjYuRYuRadjYuR(3,3),adjYvLYvLadjYvL(3,3),adjYvLTpYvRCYvR(3,3),& 
& adjYvRYvRadjYvR(3,3),adjYvRYvRCmChiNu(3,3),CmChiNuYvLadjYvL(3,3),TpYdRCYdRmChiD(3,3),  & 
& TpYeRCYeRmChiE(3,3),TpYuRCYuRmChiU(3,3),TpYvRCYvRmChiNu(3,3),TpYvRCYvRYvL(3,3),        & 
& mChiDadjmChiDTpYdRCYdR(3,3),mChiEadjmChiETpYeRCYeR(3,3),mChiNuadjYvRYvRCmChiNu(3,3),   & 
& mChiNuCmChiNuYvLadjYvL(3,3),mChiUadjmChiUTpYuRCYuR(3,3),YdLadjYdLYdLadjYdL(3,3),       & 
& YdLadjYdLTpmChiDCmChiD(3,3),YdRadjYdRYdRadjYdR(3,3),YeLadjYeLYeLadjYeL(3,3),           & 
& YeLadjYeLTpmChiECmChiE(3,3),YeRadjYeRYeRadjYeR(3,3),YuLadjYuLYuLadjYuL(3,3),           & 
& YuLadjYuLTpmChiUCmChiU(3,3),YuRadjYuRYuRadjYuR(3,3),YvLadjYvLYvLadjYvL(3,3),           & 
& YvLadjYvLTpYvRCYvR(3,3),YvRadjYvRYvRadjYvR(3,3)

Complex(dp) :: TrYdLadjYdL,TrYdRadjYdR,TrYeLadjYeL,TrYeRadjYeR,TrYuLadjYuL,TrYuRadjYuR,              & 
& TrYvLadjYvL,TrYvRadjYvR,TrmChiDadjmChiDTpYdRCYdR,TrmChiEadjmChiETpYeRCYeR,             & 
& TrmChiNuadjYvRYvRCmChiNu,TrmChiNuCmChiNuYvLadjYvL,TrmChiUadjmChiUTpYuRCYuR,            & 
& TrYdLadjYdLYdLadjYdL,TrYdLadjYdLTpmChiDCmChiD,TrYdRadjYdRYdRadjYdR,TrYeLadjYeLYeLadjYeL,& 
& TrYeLadjYeLTpmChiECmChiE,TrYeRadjYeRYeRadjYeR,TrYuLadjYuLYuLadjYuL,TrYuLadjYuLTpmChiUCmChiU,& 
& TrYuRadjYuRYuRadjYuR,TrYvLadjYvLYvLadjYvL,TrYvLadjYvLTpYvRCYvR,TrYvRadjYvRYvRadjYvR

Real(dp) :: g1p2,g1p3,g1p4,g1Xp2,g2p2,g2p3,g2p4,g3p2,g3p3,gXp2,gXp3,gXp4,gX1p2,LamHp2,            & 
& LamPhip2,LamPhiHp2

Complex(dp) :: sqrt3ov5,sqrt15

Iname = Iname +1 
NameOfUnit(Iname) = 'rge227' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters227(gy,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,             & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi)

Call Adjungate(YvL,adjYvL)
Call Adjungate(YuL,adjYuL)
Call Adjungate(YvR,adjYvR)
Call Adjungate(YuR,adjYuR)
Call Adjungate(YdL,adjYdL)
Call Adjungate(YeL,adjYeL)
Call Adjungate(YdR,adjYdR)
Call Adjungate(YeR,adjYeR)
Call Adjungate(mChiD,adjmChiD)
Call Adjungate(mChiE,adjmChiE)
Call Adjungate(mChiNu,adjmChiNu)
Call Adjungate(mChiU,adjmChiU)
 YdLadjYdL = Matmul(YdL,adjYdL) 
Forall(i2=1:3)  YdLadjYdL(i2,i2) =  Real(YdLadjYdL(i2,i2),dp) 
 YdRadjYdR = Matmul(YdR,adjYdR) 
Forall(i2=1:3)  YdRadjYdR(i2,i2) =  Real(YdRadjYdR(i2,i2),dp) 
 YeLadjYeL = Matmul(YeL,adjYeL) 
Forall(i2=1:3)  YeLadjYeL(i2,i2) =  Real(YeLadjYeL(i2,i2),dp) 
 YeRadjYeR = Matmul(YeR,adjYeR) 
Forall(i2=1:3)  YeRadjYeR(i2,i2) =  Real(YeRadjYeR(i2,i2),dp) 
 YuLadjYuL = Matmul(YuL,adjYuL) 
Forall(i2=1:3)  YuLadjYuL(i2,i2) =  Real(YuLadjYuL(i2,i2),dp) 
 YuRadjYuR = Matmul(YuR,adjYuR) 
Forall(i2=1:3)  YuRadjYuR(i2,i2) =  Real(YuRadjYuR(i2,i2),dp) 
 YvLadjYvL = Matmul(YvL,adjYvL) 
Forall(i2=1:3)  YvLadjYvL(i2,i2) =  Real(YvLadjYvL(i2,i2),dp) 
 YvRadjYvR = Matmul(YvR,adjYvR) 
Forall(i2=1:3)  YvRadjYvR(i2,i2) =  Real(YvRadjYvR(i2,i2),dp) 
 YvRCmChiNu = Matmul(YvR,adjmChiNu) 
 adjYdLYdL = Matmul(adjYdL,YdL) 
Forall(i2=1:3)  adjYdLYdL(i2,i2) =  Real(adjYdLYdL(i2,i2),dp) 
 adjYdRYdR = Matmul(adjYdR,YdR) 
Forall(i2=1:3)  adjYdRYdR(i2,i2) =  Real(adjYdRYdR(i2,i2),dp) 
 adjYeLYeL = Matmul(adjYeL,YeL) 
Forall(i2=1:3)  adjYeLYeL(i2,i2) =  Real(adjYeLYeL(i2,i2),dp) 
 adjYeRYeR = Matmul(adjYeR,YeR) 
Forall(i2=1:3)  adjYeRYeR(i2,i2) =  Real(adjYeRYeR(i2,i2),dp) 
 adjYuLYuL = Matmul(adjYuL,YuL) 
Forall(i2=1:3)  adjYuLYuL(i2,i2) =  Real(adjYuLYuL(i2,i2),dp) 
 adjYuRYuR = Matmul(adjYuR,YuR) 
Forall(i2=1:3)  adjYuRYuR(i2,i2) =  Real(adjYuRYuR(i2,i2),dp) 
 adjYvLmChiNu = Matmul(adjYvL,mChiNu) 
 adjYvLYvL = Matmul(adjYvL,YvL) 
Forall(i2=1:3)  adjYvLYvL(i2,i2) =  Real(adjYvLYvL(i2,i2),dp) 
 adjYvRYvR = Matmul(adjYvR,YvR) 
Forall(i2=1:3)  adjYvRYvR(i2,i2) =  Real(adjYvRYvR(i2,i2),dp) 
 CYdLTpYdL = Matmul(Conjg(YdL),Transpose(YdL)) 
Forall(i2=1:3)  CYdLTpYdL(i2,i2) =  Real(CYdLTpYdL(i2,i2),dp) 
 CYdRmChiD = Matmul(Conjg(YdR),mChiD) 
 CYeLTpYeL = Matmul(Conjg(YeL),Transpose(YeL)) 
Forall(i2=1:3)  CYeLTpYeL(i2,i2) =  Real(CYeLTpYeL(i2,i2),dp) 
 CYeRmChiE = Matmul(Conjg(YeR),mChiE) 
 CYuLTpYuL = Matmul(Conjg(YuL),Transpose(YuL)) 
Forall(i2=1:3)  CYuLTpYuL(i2,i2) =  Real(CYuLTpYuL(i2,i2),dp) 
 CYuRmChiU = Matmul(Conjg(YuR),mChiU) 
 CYvLTpYvL = Matmul(Conjg(YvL),Transpose(YvL)) 
Forall(i2=1:3)  CYvLTpYvL(i2,i2) =  Real(CYvLTpYvL(i2,i2),dp) 
 CYvRmChiNu = Matmul(Conjg(YvR),mChiNu) 
 CYvRYvL = Matmul(Conjg(YvR),YvL) 
 TpmChiDCmChiD = Matmul(Transpose(mChiD),Conjg(mChiD)) 
Forall(i2=1:3)  TpmChiDCmChiD(i2,i2) =  Real(TpmChiDCmChiD(i2,i2),dp) 
 TpmChiECmChiE = Matmul(Transpose(mChiE),Conjg(mChiE)) 
Forall(i2=1:3)  TpmChiECmChiE(i2,i2) =  Real(TpmChiECmChiE(i2,i2),dp) 
 TpmChiUCmChiU = Matmul(Transpose(mChiU),Conjg(mChiU)) 
Forall(i2=1:3)  TpmChiUCmChiU(i2,i2) =  Real(TpmChiUCmChiU(i2,i2),dp) 
 TpYdRCYdR = Matmul(Transpose(YdR),Conjg(YdR)) 
Forall(i2=1:3)  TpYdRCYdR(i2,i2) =  Real(TpYdRCYdR(i2,i2),dp) 
 TpYeRCYeR = Matmul(Transpose(YeR),Conjg(YeR)) 
Forall(i2=1:3)  TpYeRCYeR(i2,i2) =  Real(TpYeRCYeR(i2,i2),dp) 
 TpYuRCYuR = Matmul(Transpose(YuR),Conjg(YuR)) 
Forall(i2=1:3)  TpYuRCYuR(i2,i2) =  Real(TpYuRCYuR(i2,i2),dp) 
 TpYvRCYvR = Matmul(Transpose(YvR),Conjg(YvR)) 
Forall(i2=1:3)  TpYvRCYvR(i2,i2) =  Real(TpYvRCYvR(i2,i2),dp) 
 mChiDCYdLTpYdL = Matmul(mChiD,CYdLTpYdL) 
 mChiECYeLTpYeL = Matmul(mChiE,CYeLTpYeL) 
 mChiNuadjYvRYvR = Matmul(mChiNu,adjYvRYvR) 
 mChiNuCYvLTpYvL = Matmul(mChiNu,CYvLTpYvL) 
 mChiUCYuLTpYuL = Matmul(mChiU,CYuLTpYuL) 
 YdLadjYdLYdL = Matmul(YdL,adjYdLYdL) 
 YdLadjYuLYuL = Matmul(YdL,adjYuLYuL) 
 YdRadjYdRYdR = Matmul(YdR,adjYdRYdR) 
 YeLadjYeLYeL = Matmul(YeL,adjYeLYeL) 
 YeLadjYvLYvL = Matmul(YeL,adjYvLYvL) 
 YeRadjYeRYeR = Matmul(YeR,adjYeRYeR) 
 YuLadjYdLYdL = Matmul(YuL,adjYdLYdL) 
 YuLadjYuLYuL = Matmul(YuL,adjYuLYuL) 
 YuRadjYuRYuR = Matmul(YuR,adjYuRYuR) 
 YvLadjYeLYeL = Matmul(YvL,adjYeLYeL) 
 YvLadjYvLmChiNu = Matmul(YvL,adjYvLmChiNu) 
 YvLadjYvLYvL = Matmul(YvL,adjYvLYvL) 
 YvRadjYvRYvR = Matmul(YvR,adjYvRYvR) 
 YvRCYvLTpYvL = Matmul(YvR,CYvLTpYvL) 
 adjmChiDTpYdRCYdR = Matmul(adjmChiD,TpYdRCYdR) 
 adjmChiETpYeRCYeR = Matmul(adjmChiE,TpYeRCYeR) 
 adjmChiUTpYuRCYuR = Matmul(adjmChiU,TpYuRCYuR) 
 adjYdLYdLadjYdL = Matmul(adjYdL,YdLadjYdL) 
 adjYdLTpmChiDCmChiD = Matmul(adjYdL,TpmChiDCmChiD) 
 adjYdRYdRadjYdR = Matmul(adjYdR,YdRadjYdR) 
 adjYeLYeLadjYeL = Matmul(adjYeL,YeLadjYeL) 
 adjYeLTpmChiECmChiE = Matmul(adjYeL,TpmChiECmChiE) 
 adjYeRYeRadjYeR = Matmul(adjYeR,YeRadjYeR) 
 adjYuLYuLadjYuL = Matmul(adjYuL,YuLadjYuL) 
 adjYuLTpmChiUCmChiU = Matmul(adjYuL,TpmChiUCmChiU) 
 adjYuRYuRadjYuR = Matmul(adjYuR,YuRadjYuR) 
 adjYvLYvLadjYvL = Matmul(adjYvL,YvLadjYvL) 
 adjYvLTpYvRCYvR = Matmul(adjYvL,TpYvRCYvR) 
 adjYvRYvRadjYvR = Matmul(adjYvR,YvRadjYvR) 
 adjYvRYvRCmChiNu = Matmul(adjYvR,YvRCmChiNu) 
 CmChiNuYvLadjYvL = Matmul(adjmChiNu,YvLadjYvL) 
 TpYdRCYdRmChiD = Matmul(Transpose(YdR),CYdRmChiD) 
 TpYeRCYeRmChiE = Matmul(Transpose(YeR),CYeRmChiE) 
 TpYuRCYuRmChiU = Matmul(Transpose(YuR),CYuRmChiU) 
 TpYvRCYvRmChiNu = Matmul(Transpose(YvR),CYvRmChiNu) 
 TpYvRCYvRYvL = Matmul(Transpose(YvR),CYvRYvL) 
 mChiDadjmChiDTpYdRCYdR = Matmul(mChiD,adjmChiDTpYdRCYdR) 
 mChiEadjmChiETpYeRCYeR = Matmul(mChiE,adjmChiETpYeRCYeR) 
 mChiNuadjYvRYvRCmChiNu = Matmul(mChiNu,adjYvRYvRCmChiNu) 
 mChiNuCmChiNuYvLadjYvL = Matmul(mChiNu,CmChiNuYvLadjYvL) 
 mChiUadjmChiUTpYuRCYuR = Matmul(mChiU,adjmChiUTpYuRCYuR) 
 YdLadjYdLYdLadjYdL = Matmul(YdL,adjYdLYdLadjYdL) 
Forall(i2=1:3)  YdLadjYdLYdLadjYdL(i2,i2) =  Real(YdLadjYdLYdLadjYdL(i2,i2),dp) 
 YdLadjYdLTpmChiDCmChiD = Matmul(YdL,adjYdLTpmChiDCmChiD) 
 YdRadjYdRYdRadjYdR = Matmul(YdR,adjYdRYdRadjYdR) 
Forall(i2=1:3)  YdRadjYdRYdRadjYdR(i2,i2) =  Real(YdRadjYdRYdRadjYdR(i2,i2),dp) 
 YeLadjYeLYeLadjYeL = Matmul(YeL,adjYeLYeLadjYeL) 
Forall(i2=1:3)  YeLadjYeLYeLadjYeL(i2,i2) =  Real(YeLadjYeLYeLadjYeL(i2,i2),dp) 
 YeLadjYeLTpmChiECmChiE = Matmul(YeL,adjYeLTpmChiECmChiE) 
 YeRadjYeRYeRadjYeR = Matmul(YeR,adjYeRYeRadjYeR) 
Forall(i2=1:3)  YeRadjYeRYeRadjYeR(i2,i2) =  Real(YeRadjYeRYeRadjYeR(i2,i2),dp) 
 YuLadjYuLYuLadjYuL = Matmul(YuL,adjYuLYuLadjYuL) 
Forall(i2=1:3)  YuLadjYuLYuLadjYuL(i2,i2) =  Real(YuLadjYuLYuLadjYuL(i2,i2),dp) 
 YuLadjYuLTpmChiUCmChiU = Matmul(YuL,adjYuLTpmChiUCmChiU) 
 YuRadjYuRYuRadjYuR = Matmul(YuR,adjYuRYuRadjYuR) 
Forall(i2=1:3)  YuRadjYuRYuRadjYuR(i2,i2) =  Real(YuRadjYuRYuRadjYuR(i2,i2),dp) 
 YvLadjYvLYvLadjYvL = Matmul(YvL,adjYvLYvLadjYvL) 
Forall(i2=1:3)  YvLadjYvLYvLadjYvL(i2,i2) =  Real(YvLadjYvLYvLadjYvL(i2,i2),dp) 
 YvLadjYvLTpYvRCYvR = Matmul(YvL,adjYvLTpYvRCYvR) 
 YvRadjYvRYvRadjYvR = Matmul(YvR,adjYvRYvRadjYvR) 
Forall(i2=1:3)  YvRadjYvRYvRadjYvR(i2,i2) =  Real(YvRadjYvRYvRadjYvR(i2,i2),dp) 
 TrYdLadjYdL = Real(cTrace(YdLadjYdL),dp) 
 TrYdRadjYdR = Real(cTrace(YdRadjYdR),dp) 
 TrYeLadjYeL = Real(cTrace(YeLadjYeL),dp) 
 TrYeRadjYeR = Real(cTrace(YeRadjYeR),dp) 
 TrYuLadjYuL = Real(cTrace(YuLadjYuL),dp) 
 TrYuRadjYuR = Real(cTrace(YuRadjYuR),dp) 
 TrYvLadjYvL = Real(cTrace(YvLadjYvL),dp) 
 TrYvRadjYvR = Real(cTrace(YvRadjYvR),dp) 
 TrmChiDadjmChiDTpYdRCYdR = cTrace(mChiDadjmChiDTpYdRCYdR) 
 TrmChiEadjmChiETpYeRCYeR = cTrace(mChiEadjmChiETpYeRCYeR) 
 TrmChiNuadjYvRYvRCmChiNu = cTrace(mChiNuadjYvRYvRCmChiNu) 
 TrmChiNuCmChiNuYvLadjYvL = cTrace(mChiNuCmChiNuYvLadjYvL) 
 TrmChiUadjmChiUTpYuRCYuR = cTrace(mChiUadjmChiUTpYuRCYuR) 
 TrYdLadjYdLYdLadjYdL = Real(cTrace(YdLadjYdLYdLadjYdL),dp) 
 TrYdLadjYdLTpmChiDCmChiD = cTrace(YdLadjYdLTpmChiDCmChiD) 
 TrYdRadjYdRYdRadjYdR = Real(cTrace(YdRadjYdRYdRadjYdR),dp) 
 TrYeLadjYeLYeLadjYeL = Real(cTrace(YeLadjYeLYeLadjYeL),dp) 
 TrYeLadjYeLTpmChiECmChiE = cTrace(YeLadjYeLTpmChiECmChiE) 
 TrYeRadjYeRYeRadjYeR = Real(cTrace(YeRadjYeRYeRadjYeR),dp) 
 TrYuLadjYuLYuLadjYuL = Real(cTrace(YuLadjYuLYuLadjYuL),dp) 
 TrYuLadjYuLTpmChiUCmChiU = cTrace(YuLadjYuLTpmChiUCmChiU) 
 TrYuRadjYuRYuRadjYuR = Real(cTrace(YuRadjYuRYuRadjYuR),dp) 
 TrYvLadjYvLYvLadjYvL = Real(cTrace(YvLadjYvLYvLadjYvL),dp) 
 TrYvLadjYvLTpYvRCYvR = cTrace(YvLadjYvLTpYvRCYvR) 
 TrYvRadjYvRYvRadjYvR = Real(cTrace(YvRadjYvRYvRadjYvR),dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 sqrt15 =sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g1Xp2 =g1X**2 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gXp2 =gX**2 
 gXp3 =gX**3 
 gXp4 =gX**4 
 gX1p2 =gX1**2 
 LamHp2 =LamH**2 
 LamPhip2 =LamPhi**2 
 LamPhiHp2 =LamPhiH**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = (315._dp*(g1p3) + 96*g1p2*gX1*sqrt15 + 2*g1X*gX1*(245._dp*(gX)             & 
&  + 24*g1X*sqrt15) + g1*(315._dp*(g1Xp2) + 490._dp*(gX1p2) + 48*g1X*gX*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g1X 
!-------------------- 
 
betag1X1  = (g1p2*(315._dp*(g1X) + 48*gX*sqrt15) + g1X*(315._dp*(g1Xp2)               & 
&  + 490._dp*(gXp2) + 96*g1X*gX*sqrt15) + g1*(490*gX*gX1 + 48*g1X*gX1*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betag1X2 = 0

 
Dg1X = oo16pi2*( betag1X1 + oo16pi2 * betag1X2 ) 

 
Else 
Dg1X = oo16pi2* betag1X1 
End If 
 
 
If (.not.KineticMixing) Dg1X  = 0._dp 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gX 
!-------------------- 
 
betagX1  = (315*g1Xp2*gX + 490._dp*(gXp3) + 2*gX*gX1*(245._dp*(gX1) + 24*g1*sqrt15)   & 
&  + g1X*(315*g1*gX1 + 48*gX1p2*sqrt15 + 96*gXp2*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betagX2 = 0

 
DgX = oo16pi2*( betagX1 + oo16pi2 * betagX2 ) 

 
Else 
DgX = oo16pi2* betagX1 
End If 
 
 
!-------------------- 
! gX1 
!-------------------- 
 
betagX11  = (21*g1*g1X*gX)/2._dp + (21*g1p2*gX1)/2._dp + (49*gX1*(gX1p2 +             & 
&  gXp2))/3._dp + 8*g1X*gX*gX1*sqrt3ov5 + 8*g1*(2._dp*(gX1p2) + gXp2)*sqrt3ov5

 
 
If (TwoLoopRGE) Then 
betagX12 = 0

 
DgX1 = oo16pi2*( betagX11 + oo16pi2 * betagX12 ) 

 
Else 
DgX1 = oo16pi2* betagX11 
End If 
 
 
If (.not.KineticMixing) DgX1  = 0._dp 
!-------------------- 
! LamH 
!-------------------- 
 
betaLamH1  = 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)              & 
& /8._dp - (9*g1p2*LamH)/5._dp - (9*g1Xp2*LamH)/5._dp - 9*g2p2*LamH + 24._dp*(LamHp2)    & 
&  + LamPhiHp2 + 12*LamH*TrYdLadjYdL - 6._dp*(TrYdLadjYdLYdLadjYdL) + 4*LamH*TrYeLadjYeL -& 
&  2._dp*(TrYeLadjYeLYeLadjYeL) + 12*LamH*TrYuLadjYuL - 6._dp*(TrYuLadjYuLYuLadjYuL)     & 
&  + 4*LamH*TrYvLadjYvL - 2._dp*(TrYvLadjYvLYvLadjYvL)

 
 
If (TwoLoopRGE) Then 
betaLamH2 = 0

 
DLamH = oo16pi2*( betaLamH1 + oo16pi2 * betaLamH2 ) 

 
Else 
DLamH = oo16pi2* betaLamH1 
End If 
 
 
!-------------------- 
! LamPhiH 
!-------------------- 
 
betaLamPhiH1  = (-9*g1p2*LamPhiH)/10._dp - (9*g1Xp2*LamPhiH)/10._dp - (9*g2p2*LamPhiH)& 
& /2._dp - 6*gX1p2*LamPhiH - 6*gXp2*LamPhiH + 12*LamH*LamPhiH + 8*LamPhi*LamPhiH +       & 
&  4._dp*(LamPhiHp2) + 6*LamPhiH*TrYdLadjYdL + 6*LamPhiH*TrYdRadjYdR + 2*LamPhiH*TrYeLadjYeL +& 
&  2*LamPhiH*TrYeRadjYeR + 6*LamPhiH*TrYuLadjYuL + 6*LamPhiH*TrYuRadjYuR +               & 
&  2*LamPhiH*TrYvLadjYvL - 4._dp*(TrYvLadjYvLTpYvRCYvR) + 2*LamPhiH*TrYvRadjYvR

 
 
If (TwoLoopRGE) Then 
betaLamPhiH2 = 0

 
DLamPhiH = oo16pi2*( betaLamPhiH1 + oo16pi2 * betaLamPhiH2 ) 

 
Else 
DLamPhiH = oo16pi2* betaLamPhiH1 
End If 
 
 
!-------------------- 
! LamPhi 
!-------------------- 
 
betaLamPhi1  = 2*(3._dp*(gXp4) - 6*gX1p2*LamPhi - 6*gXp2*LamPhi + LamPhiHp2 +         & 
&  10._dp*(LamPhip2) + 6*LamPhi*TrYdRadjYdR - 3._dp*(TrYdRadjYdRYdRadjYdR)               & 
&  + 2*LamPhi*TrYeRadjYeR - TrYeRadjYeRYeRadjYeR + 6*LamPhi*TrYuRadjYuR - 3._dp*(TrYuRadjYuRYuRadjYuR)& 
&  + 2*LamPhi*TrYvRadjYvR - TrYvRadjYvRYvRadjYvR)

 
 
If (TwoLoopRGE) Then 
betaLamPhi2 = 0

 
DLamPhi = oo16pi2*( betaLamPhi1 + oo16pi2 * betaLamPhi2 ) 

 
Else 
DLamPhi = oo16pi2* betaLamPhi1 
End If 
 
 
!-------------------- 
! YvL 
!-------------------- 
 
betaYvL1  = (-9._dp*(g1p2)/20._dp - 9._dp*(g1Xp2)/20._dp - 9._dp*(g2p2)               & 
& /4._dp + 3._dp*(TrYdLadjYdL) + TrYeLadjYeL + 3._dp*(TrYuLadjYuL) + TrYvLadjYvL)        & 
& *YvL + (TpYvRCYvRYvL - 3._dp*(YvLadjYeLYeL) + 3._dp*(YvLadjYvLYvL))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYvL2 = 0

 
DYvL = oo16pi2*( betaYvL1 + oo16pi2 * betaYvL2 ) 

 
Else 
DYvL = oo16pi2* betaYvL1 
End If 
 
 
Call Chop(DYvL) 

!-------------------- 
! YuL 
!-------------------- 
 
betaYuL1  = (-17._dp*(g1p2)/20._dp - 17._dp*(g1Xp2)/20._dp - 9._dp*(g2p2)             & 
& /4._dp - 8._dp*(g3p2) + 3._dp*(TrYdLadjYdL) + TrYeLadjYeL + 3._dp*(TrYuLadjYuL)        & 
&  + TrYvLadjYvL)*YuL - (3*(YuLadjYdLYdL - YuLadjYuLYuL))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYuL2 = 0

 
DYuL = oo16pi2*( betaYuL1 + oo16pi2 * betaYuL2 ) 

 
Else 
DYuL = oo16pi2* betaYuL1 
End If 
 
 
Call Chop(DYuL) 

!-------------------- 
! YvR 
!-------------------- 
 
betaYvR1  = (-3._dp*(gX1p2) - 3._dp*(gXp2) + 3._dp*(TrYdRadjYdR) + TrYeRadjYeR +      & 
&  3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YvR + YvRadjYvRYvR + YvRCYvLTpYvL

 
 
If (TwoLoopRGE) Then 
betaYvR2 = 0

 
DYvR = oo16pi2*( betaYvR1 + oo16pi2 * betaYvR2 ) 

 
Else 
DYvR = oo16pi2* betaYvR1 
End If 
 
 
Call Chop(DYvR) 

!-------------------- 
! YuR 
!-------------------- 
 
betaYuR1  = (-8._dp*(g1p2)/5._dp - 8._dp*(g1Xp2)/5._dp - 8._dp*(g3p2) -               & 
&  3._dp*(gX1p2) - 3._dp*(gXp2) - 4*g1X*gX*sqrt3ov5 - 4*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)& 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YuR + YuRadjYuRYuR

 
 
If (TwoLoopRGE) Then 
betaYuR2 = 0

 
DYuR = oo16pi2*( betaYuR1 + oo16pi2 * betaYuR2 ) 

 
Else 
DYuR = oo16pi2* betaYuR1 
End If 
 
 
Call Chop(DYuR) 

!-------------------- 
! YdL 
!-------------------- 
 
betaYdL1  = (-((g1p2 + g1Xp2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdLadjYdL)    & 
&  - 4._dp*(TrYeLadjYeL) - 12._dp*(TrYuLadjYuL) - 4._dp*(TrYvLadjYvL))*YdL)              & 
&  + 6*(YdLadjYdLYdL - YdLadjYuLYuL))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYdL2 = 0

 
DYdL = oo16pi2*( betaYdL1 + oo16pi2 * betaYdL2 ) 

 
Else 
DYdL = oo16pi2* betaYdL1 
End If 
 
 
Call Chop(DYdL) 

!-------------------- 
! YeL 
!-------------------- 
 
betaYeL1  = ((-9._dp*(g1p2) - 9._dp*(g1Xp2) - 9._dp*(g2p2) + 12._dp*(TrYdLadjYdL)     & 
&  + 4._dp*(TrYeLadjYeL) + 12._dp*(TrYuLadjYuL) + 4._dp*(TrYvLadjYvL))*YeL +             & 
&  6*(YeLadjYeLYeL - YeLadjYvLYvL))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYeL2 = 0

 
DYeL = oo16pi2*( betaYeL1 + oo16pi2 * betaYeL2 ) 

 
Else 
DYeL = oo16pi2* betaYeL1 
End If 
 
 
Call Chop(DYeL) 

!-------------------- 
! YdR 
!-------------------- 
 
betaYdR1  = (-2._dp*(g1p2)/5._dp - 2._dp*(g1Xp2)/5._dp - 8._dp*(g3p2) -               & 
&  3._dp*(gX1p2) - 3._dp*(gXp2) - 2*g1X*gX*sqrt3ov5 - 2*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)& 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YdR + YdRadjYdRYdR

 
 
If (TwoLoopRGE) Then 
betaYdR2 = 0

 
DYdR = oo16pi2*( betaYdR1 + oo16pi2 * betaYdR2 ) 

 
Else 
DYdR = oo16pi2* betaYdR1 
End If 
 
 
Call Chop(DYdR) 

!-------------------- 
! YeR 
!-------------------- 
 
betaYeR1  = (-18._dp*(g1p2)/5._dp - 18._dp*(g1Xp2)/5._dp - 3._dp*(gX1p2)              & 
&  - 3._dp*(gXp2) - 6*g1X*gX*sqrt3ov5 - 6*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)          & 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YeR + YeRadjYeRYeR

 
 
If (TwoLoopRGE) Then 
betaYeR2 = 0

 
DYeR = oo16pi2*( betaYeR1 + oo16pi2 * betaYeR2 ) 

 
Else 
DYeR = oo16pi2* betaYeR1 
End If 
 
 
Call Chop(DYeR) 

!-------------------- 
! mChiD 
!-------------------- 
 
betamChiD1  = (-2*(g1p2 + g1Xp2 + 20._dp*(g3p2))*mChiD)/5._dp + mChiDCYdLTpYdL +      & 
&  TpYdRCYdRmChiD/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiD2 = 0

 
DmChiD = oo16pi2*( betamChiD1 + oo16pi2 * betamChiD2 ) 

 
Else 
DmChiD = oo16pi2* betamChiD1 
End If 
 
 
Call Chop(DmChiD) 

!-------------------- 
! mChiE 
!-------------------- 
 
betamChiE1  = (-18*(g1p2 + g1Xp2)*mChiE)/5._dp + mChiECYeLTpYeL + TpYeRCYeRmChiE/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiE2 = 0

 
DmChiE = oo16pi2*( betamChiE1 + oo16pi2 * betamChiE2 ) 

 
Else 
DmChiE = oo16pi2* betamChiE1 
End If 
 
 
Call Chop(DmChiE) 

!-------------------- 
! mChiNu 
!-------------------- 
 
betamChiNu1  = (mChiNuadjYvRYvR + 2._dp*(mChiNuCYvLTpYvL) + TpYvRCYvRmChiNu +         & 
&  2._dp*(YvLadjYvLmChiNu))/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiNu2 = 0

 
DmChiNu = oo16pi2*( betamChiNu1 + oo16pi2 * betamChiNu2 ) 

 
Else 
DmChiNu = oo16pi2* betamChiNu1 
End If 
 
 
Call Chop(DmChiNu) 

!-------------------- 
! mChiU 
!-------------------- 
 
betamChiU1  = (-8*(g1p2 + g1Xp2 + 5._dp*(g3p2))*mChiU)/5._dp + mChiUCYuLTpYuL +       & 
&  TpYuRCYuRmChiU/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiU2 = 0

 
DmChiU = oo16pi2*( betamChiU1 + oo16pi2 * betamChiU2 ) 

 
Else 
DmChiU = oo16pi2* betamChiU1 
End If 
 
 
Call Chop(DmChiU) 

!-------------------- 
! mu2H 
!-------------------- 
 
betamu2H1  = (-9*g1p2*mu2H)/10._dp - (9*g1Xp2*mu2H)/10._dp - (9*g2p2*mu2H)            & 
& /2._dp + 12*LamH*mu2H + 2*LamPhiH*mu2Phi - 4._dp*(TrmChiNuCmChiNuYvLadjYvL)            & 
&  + 6*mu2H*TrYdLadjYdL - 12._dp*(TrYdLadjYdLTpmChiDCmChiD) + 2*mu2H*TrYeLadjYeL -       & 
&  4._dp*(TrYeLadjYeLTpmChiECmChiE) + 6*mu2H*TrYuLadjYuL - 12._dp*(TrYuLadjYuLTpmChiUCmChiU)& 
&  + 2*mu2H*TrYvLadjYvL

 
 
If (TwoLoopRGE) Then 
betamu2H2 = 0

 
Dmu2H = oo16pi2*( betamu2H1 + oo16pi2 * betamu2H2 ) 

 
Else 
Dmu2H = oo16pi2* betamu2H1 
End If 
 
 
!-------------------- 
! mu2Phi 
!-------------------- 
 
betamu2Phi1  = 2*(2*LamPhiH*mu2H - 3*gX1p2*mu2Phi - 3*gXp2*mu2Phi + 4*LamPhi*mu2Phi - & 
&  6._dp*(TrmChiDadjmChiDTpYdRCYdR) - 2._dp*(TrmChiEadjmChiETpYeRCYeR) - 2._dp*(TrmChiNuadjYvRYvRCmChiNu)& 
&  - 6._dp*(TrmChiUadjmChiUTpYuRCYuR) + 3*mu2Phi*TrYdRadjYdR + mu2Phi*TrYeRadjYeR +      & 
&  3*mu2Phi*TrYuRadjYuR + mu2Phi*TrYvRadjYvR)

 
 
If (TwoLoopRGE) Then 
betamu2Phi2 = 0

 
Dmu2Phi = oo16pi2*( betamu2Phi1 + oo16pi2 * betamu2Phi2 ) 

 
Else 
Dmu2Phi = oo16pi2* betamu2Phi1 
End If 
 
 
Call ParametersToG227(Dg1,Dg1X,Dg2,Dg3,DgX,DgX1,DLamH,DLamPhiH,DLamPhi,               & 
& DYvL,DYuL,DYvR,DYuR,DYdL,DYeL,DYdR,DYeR,DmChiD,DmChiE,DmChiNu,DmChiU,Dmu2H,            & 
& Dmu2Phi,f)

Iname = Iname - 1 
 
End Subroutine rge227  

Subroutine GToParameters229(g,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi)

Implicit None 
Real(dp), Intent(in) :: g(229) 
Real(dp),Intent(out) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp),Intent(out) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters229' 
 
g1= g(1) 
g1X= g(2) 
g2= g(3) 
g3= g(4) 
gX= g(5) 
gX1= g(6) 
LamH= g(7) 
LamPhiH= g(8) 
LamPhi= g(9) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YvL(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YuL(i1,i2) = Cmplx( g(SumI+28), g(SumI+29), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YvR(i1,i2) = Cmplx( g(SumI+46), g(SumI+47), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YuR(i1,i2) = Cmplx( g(SumI+64), g(SumI+65), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YdL(i1,i2) = Cmplx( g(SumI+82), g(SumI+83), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YeL(i1,i2) = Cmplx( g(SumI+100), g(SumI+101), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YdR(i1,i2) = Cmplx( g(SumI+118), g(SumI+119), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YeR(i1,i2) = Cmplx( g(SumI+136), g(SumI+137), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiD(i1,i2) = Cmplx( g(SumI+154), g(SumI+155), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiE(i1,i2) = Cmplx( g(SumI+172), g(SumI+173), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiNu(i1,i2) = Cmplx( g(SumI+190), g(SumI+191), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mChiU(i1,i2) = Cmplx( g(SumI+208), g(SumI+209), dp) 
End Do 
 End Do 
 
mu2H= g(226) 
mu2Phi= g(227) 
vH= g(228) 
vPhi= g(229) 
Do i1=1,229 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters229

Subroutine ParametersToG229(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,              & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,g)

Implicit None 
Real(dp), Intent(out) :: g(229) 
Real(dp), Intent(in) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi,vH,vPhi

Complex(dp), Intent(in) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG229' 
 
g(1) = g1  
g(2) = g1X  
g(3) = g2  
g(4) = g3  
g(5) = gX  
g(6) = gX1  
g(7) = LamH  
g(8) = LamPhiH  
g(9) = LamPhi  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(YvL(i1,i2), dp) 
g(SumI+11) = Aimag(YvL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+28) = Real(YuL(i1,i2), dp) 
g(SumI+29) = Aimag(YuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+46) = Real(YvR(i1,i2), dp) 
g(SumI+47) = Aimag(YvR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+64) = Real(YuR(i1,i2), dp) 
g(SumI+65) = Aimag(YuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+82) = Real(YdL(i1,i2), dp) 
g(SumI+83) = Aimag(YdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+100) = Real(YeL(i1,i2), dp) 
g(SumI+101) = Aimag(YeL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+118) = Real(YdR(i1,i2), dp) 
g(SumI+119) = Aimag(YdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+136) = Real(YeR(i1,i2), dp) 
g(SumI+137) = Aimag(YeR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+154) = Real(mChiD(i1,i2), dp) 
g(SumI+155) = Aimag(mChiD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+172) = Real(mChiE(i1,i2), dp) 
g(SumI+173) = Aimag(mChiE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+190) = Real(mChiNu(i1,i2), dp) 
g(SumI+191) = Aimag(mChiNu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+208) = Real(mChiU(i1,i2), dp) 
g(SumI+209) = Aimag(mChiU(i1,i2)) 
End Do 
End Do 

g(226) = mu2H  
g(227) = mu2Phi  
g(228) = vH  
g(229) = vPhi  
Iname = Iname - 1 
 
End Subroutine ParametersToG229

Subroutine rge229(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g1X,betag1X1,betag1X2,Dg1X,g2,betag21,             & 
& betag22,Dg2,g3,betag31,betag32,Dg3,gX,betagX1,betagX2,DgX,gX1,betagX11,betagX12,       & 
& DgX1,LamH,betaLamH1,betaLamH2,DLamH,LamPhiH,betaLamPhiH1,betaLamPhiH2,DLamPhiH,        & 
& LamPhi,betaLamPhi1,betaLamPhi2,DLamPhi,mu2H,betamu2H1,betamu2H2,Dmu2H,mu2Phi,          & 
& betamu2Phi1,betamu2Phi2,Dmu2Phi,vH,betavH1,betavH2,DvH,vPhi,betavPhi1,betavPhi2,DvPhi
Complex(dp) :: YvL(3,3),betaYvL1(3,3),betaYvL2(3,3),DYvL(3,3),adjYvL(3,3)             & 
& ,YuL(3,3),betaYuL1(3,3),betaYuL2(3,3),DYuL(3,3),adjYuL(3,3),YvR(3,3),betaYvR1(3,3)     & 
& ,betaYvR2(3,3),DYvR(3,3),adjYvR(3,3),YuR(3,3),betaYuR1(3,3),betaYuR2(3,3)              & 
& ,DYuR(3,3),adjYuR(3,3),YdL(3,3),betaYdL1(3,3),betaYdL2(3,3),DYdL(3,3),adjYdL(3,3)      & 
& ,YeL(3,3),betaYeL1(3,3),betaYeL2(3,3),DYeL(3,3),adjYeL(3,3),YdR(3,3),betaYdR1(3,3)     & 
& ,betaYdR2(3,3),DYdR(3,3),adjYdR(3,3),YeR(3,3),betaYeR1(3,3),betaYeR2(3,3)              & 
& ,DYeR(3,3),adjYeR(3,3),mChiD(3,3),betamChiD1(3,3),betamChiD2(3,3),DmChiD(3,3)          & 
& ,adjmChiD(3,3),mChiE(3,3),betamChiE1(3,3),betamChiE2(3,3),DmChiE(3,3),adjmChiE(3,3)    & 
& ,mChiNu(3,3),betamChiNu1(3,3),betamChiNu2(3,3),DmChiNu(3,3),adjmChiNu(3,3)             & 
& ,mChiU(3,3),betamChiU1(3,3),betamChiU2(3,3),DmChiU(3,3),adjmChiU(3,3)
Complex(dp) :: YdLadjYdL(3,3),YdRadjYdR(3,3),YeLadjYeL(3,3),YeRadjYeR(3,3),YuLadjYuL(3,3),           & 
& YuRadjYuR(3,3),YvLadjYvL(3,3),YvRadjYvR(3,3),YvRCmChiNu(3,3),adjYdLYdL(3,3),           & 
& adjYdRYdR(3,3),adjYeLYeL(3,3),adjYeRYeR(3,3),adjYuLYuL(3,3),adjYuRYuR(3,3),            & 
& adjYvLmChiNu(3,3),adjYvLYvL(3,3),adjYvRYvR(3,3),CYdLTpYdL(3,3),CYdRmChiD(3,3),         & 
& CYeLTpYeL(3,3),CYeRmChiE(3,3),CYuLTpYuL(3,3),CYuRmChiU(3,3),CYvLTpYvL(3,3),            & 
& CYvRmChiNu(3,3),CYvRYvL(3,3),TpmChiDCmChiD(3,3),TpmChiECmChiE(3,3),TpmChiUCmChiU(3,3), & 
& TpYdRCYdR(3,3),TpYeRCYeR(3,3),TpYuRCYuR(3,3),TpYvRCYvR(3,3),mChiDCYdLTpYdL(3,3),       & 
& mChiECYeLTpYeL(3,3),mChiNuadjYvRYvR(3,3),mChiNuCYvLTpYvL(3,3),mChiUCYuLTpYuL(3,3),     & 
& YdLadjYdLYdL(3,3),YdLadjYuLYuL(3,3),YdRadjYdRYdR(3,3),YeLadjYeLYeL(3,3),               & 
& YeLadjYvLYvL(3,3),YeRadjYeRYeR(3,3),YuLadjYdLYdL(3,3),YuLadjYuLYuL(3,3),               & 
& YuRadjYuRYuR(3,3),YvLadjYeLYeL(3,3),YvLadjYvLmChiNu(3,3),YvLadjYvLYvL(3,3),            & 
& YvRadjYvRYvR(3,3),YvRCYvLTpYvL(3,3),adjmChiDTpYdRCYdR(3,3),adjmChiETpYeRCYeR(3,3),     & 
& adjmChiUTpYuRCYuR(3,3),adjYdLYdLadjYdL(3,3),adjYdLTpmChiDCmChiD(3,3),adjYdRYdRadjYdR(3,3),& 
& adjYeLYeLadjYeL(3,3),adjYeLTpmChiECmChiE(3,3),adjYeRYeRadjYeR(3,3),adjYuLYuLadjYuL(3,3),& 
& adjYuLTpmChiUCmChiU(3,3),adjYuRYuRadjYuR(3,3),adjYvLYvLadjYvL(3,3),adjYvLTpYvRCYvR(3,3),& 
& adjYvRYvRadjYvR(3,3),adjYvRYvRCmChiNu(3,3),CmChiNuYvLadjYvL(3,3),TpYdRCYdRmChiD(3,3),  & 
& TpYeRCYeRmChiE(3,3),TpYuRCYuRmChiU(3,3),TpYvRCYvRmChiNu(3,3),TpYvRCYvRYvL(3,3),        & 
& mChiDadjmChiDTpYdRCYdR(3,3),mChiEadjmChiETpYeRCYeR(3,3),mChiNuadjYvRYvRCmChiNu(3,3),   & 
& mChiNuCmChiNuYvLadjYvL(3,3),mChiUadjmChiUTpYuRCYuR(3,3),YdLadjYdLYdLadjYdL(3,3),       & 
& YdLadjYdLTpmChiDCmChiD(3,3),YdRadjYdRYdRadjYdR(3,3),YeLadjYeLYeLadjYeL(3,3),           & 
& YeLadjYeLTpmChiECmChiE(3,3),YeRadjYeRYeRadjYeR(3,3),YuLadjYuLYuLadjYuL(3,3),           & 
& YuLadjYuLTpmChiUCmChiU(3,3),YuRadjYuRYuRadjYuR(3,3),YvLadjYvLYvLadjYvL(3,3),           & 
& YvLadjYvLTpYvRCYvR(3,3),YvRadjYvRYvRadjYvR(3,3)

Complex(dp) :: TrYdLadjYdL,TrYdRadjYdR,TrYeLadjYeL,TrYeRadjYeR,TrYuLadjYuL,TrYuRadjYuR,              & 
& TrYvLadjYvL,TrYvRadjYvR,TrmChiDadjmChiDTpYdRCYdR,TrmChiEadjmChiETpYeRCYeR,             & 
& TrmChiNuadjYvRYvRCmChiNu,TrmChiNuCmChiNuYvLadjYvL,TrmChiUadjmChiUTpYuRCYuR,            & 
& TrYdLadjYdLYdLadjYdL,TrYdLadjYdLTpmChiDCmChiD,TrYdRadjYdRYdRadjYdR,TrYeLadjYeLYeLadjYeL,& 
& TrYeLadjYeLTpmChiECmChiE,TrYeRadjYeRYeRadjYeR,TrYuLadjYuLYuLadjYuL,TrYuLadjYuLTpmChiUCmChiU,& 
& TrYuRadjYuRYuRadjYuR,TrYvLadjYvLYvLadjYvL,TrYvLadjYvLTpYvRCYvR,TrYvRadjYvRYvRadjYvR

Real(dp) :: g1p2,g1p3,g1p4,g1Xp2,g2p2,g2p3,g2p4,g3p2,g3p3,gXp2,gXp3,gXp4,gX1p2,LamHp2,            & 
& LamPhip2,LamPhiHp2

Complex(dp) :: sqrt3ov5,sqrt15

Iname = Iname +1 
NameOfUnit(Iname) = 'rge229' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters229(gy,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,             & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi)

Call Adjungate(YvL,adjYvL)
Call Adjungate(YuL,adjYuL)
Call Adjungate(YvR,adjYvR)
Call Adjungate(YuR,adjYuR)
Call Adjungate(YdL,adjYdL)
Call Adjungate(YeL,adjYeL)
Call Adjungate(YdR,adjYdR)
Call Adjungate(YeR,adjYeR)
Call Adjungate(mChiD,adjmChiD)
Call Adjungate(mChiE,adjmChiE)
Call Adjungate(mChiNu,adjmChiNu)
Call Adjungate(mChiU,adjmChiU)
 YdLadjYdL = Matmul(YdL,adjYdL) 
Forall(i2=1:3)  YdLadjYdL(i2,i2) =  Real(YdLadjYdL(i2,i2),dp) 
 YdRadjYdR = Matmul(YdR,adjYdR) 
Forall(i2=1:3)  YdRadjYdR(i2,i2) =  Real(YdRadjYdR(i2,i2),dp) 
 YeLadjYeL = Matmul(YeL,adjYeL) 
Forall(i2=1:3)  YeLadjYeL(i2,i2) =  Real(YeLadjYeL(i2,i2),dp) 
 YeRadjYeR = Matmul(YeR,adjYeR) 
Forall(i2=1:3)  YeRadjYeR(i2,i2) =  Real(YeRadjYeR(i2,i2),dp) 
 YuLadjYuL = Matmul(YuL,adjYuL) 
Forall(i2=1:3)  YuLadjYuL(i2,i2) =  Real(YuLadjYuL(i2,i2),dp) 
 YuRadjYuR = Matmul(YuR,adjYuR) 
Forall(i2=1:3)  YuRadjYuR(i2,i2) =  Real(YuRadjYuR(i2,i2),dp) 
 YvLadjYvL = Matmul(YvL,adjYvL) 
Forall(i2=1:3)  YvLadjYvL(i2,i2) =  Real(YvLadjYvL(i2,i2),dp) 
 YvRadjYvR = Matmul(YvR,adjYvR) 
Forall(i2=1:3)  YvRadjYvR(i2,i2) =  Real(YvRadjYvR(i2,i2),dp) 
 YvRCmChiNu = Matmul(YvR,adjmChiNu) 
 adjYdLYdL = Matmul(adjYdL,YdL) 
Forall(i2=1:3)  adjYdLYdL(i2,i2) =  Real(adjYdLYdL(i2,i2),dp) 
 adjYdRYdR = Matmul(adjYdR,YdR) 
Forall(i2=1:3)  adjYdRYdR(i2,i2) =  Real(adjYdRYdR(i2,i2),dp) 
 adjYeLYeL = Matmul(adjYeL,YeL) 
Forall(i2=1:3)  adjYeLYeL(i2,i2) =  Real(adjYeLYeL(i2,i2),dp) 
 adjYeRYeR = Matmul(adjYeR,YeR) 
Forall(i2=1:3)  adjYeRYeR(i2,i2) =  Real(adjYeRYeR(i2,i2),dp) 
 adjYuLYuL = Matmul(adjYuL,YuL) 
Forall(i2=1:3)  adjYuLYuL(i2,i2) =  Real(adjYuLYuL(i2,i2),dp) 
 adjYuRYuR = Matmul(adjYuR,YuR) 
Forall(i2=1:3)  adjYuRYuR(i2,i2) =  Real(adjYuRYuR(i2,i2),dp) 
 adjYvLmChiNu = Matmul(adjYvL,mChiNu) 
 adjYvLYvL = Matmul(adjYvL,YvL) 
Forall(i2=1:3)  adjYvLYvL(i2,i2) =  Real(adjYvLYvL(i2,i2),dp) 
 adjYvRYvR = Matmul(adjYvR,YvR) 
Forall(i2=1:3)  adjYvRYvR(i2,i2) =  Real(adjYvRYvR(i2,i2),dp) 
 CYdLTpYdL = Matmul(Conjg(YdL),Transpose(YdL)) 
Forall(i2=1:3)  CYdLTpYdL(i2,i2) =  Real(CYdLTpYdL(i2,i2),dp) 
 CYdRmChiD = Matmul(Conjg(YdR),mChiD) 
 CYeLTpYeL = Matmul(Conjg(YeL),Transpose(YeL)) 
Forall(i2=1:3)  CYeLTpYeL(i2,i2) =  Real(CYeLTpYeL(i2,i2),dp) 
 CYeRmChiE = Matmul(Conjg(YeR),mChiE) 
 CYuLTpYuL = Matmul(Conjg(YuL),Transpose(YuL)) 
Forall(i2=1:3)  CYuLTpYuL(i2,i2) =  Real(CYuLTpYuL(i2,i2),dp) 
 CYuRmChiU = Matmul(Conjg(YuR),mChiU) 
 CYvLTpYvL = Matmul(Conjg(YvL),Transpose(YvL)) 
Forall(i2=1:3)  CYvLTpYvL(i2,i2) =  Real(CYvLTpYvL(i2,i2),dp) 
 CYvRmChiNu = Matmul(Conjg(YvR),mChiNu) 
 CYvRYvL = Matmul(Conjg(YvR),YvL) 
 TpmChiDCmChiD = Matmul(Transpose(mChiD),Conjg(mChiD)) 
Forall(i2=1:3)  TpmChiDCmChiD(i2,i2) =  Real(TpmChiDCmChiD(i2,i2),dp) 
 TpmChiECmChiE = Matmul(Transpose(mChiE),Conjg(mChiE)) 
Forall(i2=1:3)  TpmChiECmChiE(i2,i2) =  Real(TpmChiECmChiE(i2,i2),dp) 
 TpmChiUCmChiU = Matmul(Transpose(mChiU),Conjg(mChiU)) 
Forall(i2=1:3)  TpmChiUCmChiU(i2,i2) =  Real(TpmChiUCmChiU(i2,i2),dp) 
 TpYdRCYdR = Matmul(Transpose(YdR),Conjg(YdR)) 
Forall(i2=1:3)  TpYdRCYdR(i2,i2) =  Real(TpYdRCYdR(i2,i2),dp) 
 TpYeRCYeR = Matmul(Transpose(YeR),Conjg(YeR)) 
Forall(i2=1:3)  TpYeRCYeR(i2,i2) =  Real(TpYeRCYeR(i2,i2),dp) 
 TpYuRCYuR = Matmul(Transpose(YuR),Conjg(YuR)) 
Forall(i2=1:3)  TpYuRCYuR(i2,i2) =  Real(TpYuRCYuR(i2,i2),dp) 
 TpYvRCYvR = Matmul(Transpose(YvR),Conjg(YvR)) 
Forall(i2=1:3)  TpYvRCYvR(i2,i2) =  Real(TpYvRCYvR(i2,i2),dp) 
 mChiDCYdLTpYdL = Matmul(mChiD,CYdLTpYdL) 
 mChiECYeLTpYeL = Matmul(mChiE,CYeLTpYeL) 
 mChiNuadjYvRYvR = Matmul(mChiNu,adjYvRYvR) 
 mChiNuCYvLTpYvL = Matmul(mChiNu,CYvLTpYvL) 
 mChiUCYuLTpYuL = Matmul(mChiU,CYuLTpYuL) 
 YdLadjYdLYdL = Matmul(YdL,adjYdLYdL) 
 YdLadjYuLYuL = Matmul(YdL,adjYuLYuL) 
 YdRadjYdRYdR = Matmul(YdR,adjYdRYdR) 
 YeLadjYeLYeL = Matmul(YeL,adjYeLYeL) 
 YeLadjYvLYvL = Matmul(YeL,adjYvLYvL) 
 YeRadjYeRYeR = Matmul(YeR,adjYeRYeR) 
 YuLadjYdLYdL = Matmul(YuL,adjYdLYdL) 
 YuLadjYuLYuL = Matmul(YuL,adjYuLYuL) 
 YuRadjYuRYuR = Matmul(YuR,adjYuRYuR) 
 YvLadjYeLYeL = Matmul(YvL,adjYeLYeL) 
 YvLadjYvLmChiNu = Matmul(YvL,adjYvLmChiNu) 
 YvLadjYvLYvL = Matmul(YvL,adjYvLYvL) 
 YvRadjYvRYvR = Matmul(YvR,adjYvRYvR) 
 YvRCYvLTpYvL = Matmul(YvR,CYvLTpYvL) 
 adjmChiDTpYdRCYdR = Matmul(adjmChiD,TpYdRCYdR) 
 adjmChiETpYeRCYeR = Matmul(adjmChiE,TpYeRCYeR) 
 adjmChiUTpYuRCYuR = Matmul(adjmChiU,TpYuRCYuR) 
 adjYdLYdLadjYdL = Matmul(adjYdL,YdLadjYdL) 
 adjYdLTpmChiDCmChiD = Matmul(adjYdL,TpmChiDCmChiD) 
 adjYdRYdRadjYdR = Matmul(adjYdR,YdRadjYdR) 
 adjYeLYeLadjYeL = Matmul(adjYeL,YeLadjYeL) 
 adjYeLTpmChiECmChiE = Matmul(adjYeL,TpmChiECmChiE) 
 adjYeRYeRadjYeR = Matmul(adjYeR,YeRadjYeR) 
 adjYuLYuLadjYuL = Matmul(adjYuL,YuLadjYuL) 
 adjYuLTpmChiUCmChiU = Matmul(adjYuL,TpmChiUCmChiU) 
 adjYuRYuRadjYuR = Matmul(adjYuR,YuRadjYuR) 
 adjYvLYvLadjYvL = Matmul(adjYvL,YvLadjYvL) 
 adjYvLTpYvRCYvR = Matmul(adjYvL,TpYvRCYvR) 
 adjYvRYvRadjYvR = Matmul(adjYvR,YvRadjYvR) 
 adjYvRYvRCmChiNu = Matmul(adjYvR,YvRCmChiNu) 
 CmChiNuYvLadjYvL = Matmul(adjmChiNu,YvLadjYvL) 
 TpYdRCYdRmChiD = Matmul(Transpose(YdR),CYdRmChiD) 
 TpYeRCYeRmChiE = Matmul(Transpose(YeR),CYeRmChiE) 
 TpYuRCYuRmChiU = Matmul(Transpose(YuR),CYuRmChiU) 
 TpYvRCYvRmChiNu = Matmul(Transpose(YvR),CYvRmChiNu) 
 TpYvRCYvRYvL = Matmul(Transpose(YvR),CYvRYvL) 
 mChiDadjmChiDTpYdRCYdR = Matmul(mChiD,adjmChiDTpYdRCYdR) 
 mChiEadjmChiETpYeRCYeR = Matmul(mChiE,adjmChiETpYeRCYeR) 
 mChiNuadjYvRYvRCmChiNu = Matmul(mChiNu,adjYvRYvRCmChiNu) 
 mChiNuCmChiNuYvLadjYvL = Matmul(mChiNu,CmChiNuYvLadjYvL) 
 mChiUadjmChiUTpYuRCYuR = Matmul(mChiU,adjmChiUTpYuRCYuR) 
 YdLadjYdLYdLadjYdL = Matmul(YdL,adjYdLYdLadjYdL) 
Forall(i2=1:3)  YdLadjYdLYdLadjYdL(i2,i2) =  Real(YdLadjYdLYdLadjYdL(i2,i2),dp) 
 YdLadjYdLTpmChiDCmChiD = Matmul(YdL,adjYdLTpmChiDCmChiD) 
 YdRadjYdRYdRadjYdR = Matmul(YdR,adjYdRYdRadjYdR) 
Forall(i2=1:3)  YdRadjYdRYdRadjYdR(i2,i2) =  Real(YdRadjYdRYdRadjYdR(i2,i2),dp) 
 YeLadjYeLYeLadjYeL = Matmul(YeL,adjYeLYeLadjYeL) 
Forall(i2=1:3)  YeLadjYeLYeLadjYeL(i2,i2) =  Real(YeLadjYeLYeLadjYeL(i2,i2),dp) 
 YeLadjYeLTpmChiECmChiE = Matmul(YeL,adjYeLTpmChiECmChiE) 
 YeRadjYeRYeRadjYeR = Matmul(YeR,adjYeRYeRadjYeR) 
Forall(i2=1:3)  YeRadjYeRYeRadjYeR(i2,i2) =  Real(YeRadjYeRYeRadjYeR(i2,i2),dp) 
 YuLadjYuLYuLadjYuL = Matmul(YuL,adjYuLYuLadjYuL) 
Forall(i2=1:3)  YuLadjYuLYuLadjYuL(i2,i2) =  Real(YuLadjYuLYuLadjYuL(i2,i2),dp) 
 YuLadjYuLTpmChiUCmChiU = Matmul(YuL,adjYuLTpmChiUCmChiU) 
 YuRadjYuRYuRadjYuR = Matmul(YuR,adjYuRYuRadjYuR) 
Forall(i2=1:3)  YuRadjYuRYuRadjYuR(i2,i2) =  Real(YuRadjYuRYuRadjYuR(i2,i2),dp) 
 YvLadjYvLYvLadjYvL = Matmul(YvL,adjYvLYvLadjYvL) 
Forall(i2=1:3)  YvLadjYvLYvLadjYvL(i2,i2) =  Real(YvLadjYvLYvLadjYvL(i2,i2),dp) 
 YvLadjYvLTpYvRCYvR = Matmul(YvL,adjYvLTpYvRCYvR) 
 YvRadjYvRYvRadjYvR = Matmul(YvR,adjYvRYvRadjYvR) 
Forall(i2=1:3)  YvRadjYvRYvRadjYvR(i2,i2) =  Real(YvRadjYvRYvRadjYvR(i2,i2),dp) 
 TrYdLadjYdL = Real(cTrace(YdLadjYdL),dp) 
 TrYdRadjYdR = Real(cTrace(YdRadjYdR),dp) 
 TrYeLadjYeL = Real(cTrace(YeLadjYeL),dp) 
 TrYeRadjYeR = Real(cTrace(YeRadjYeR),dp) 
 TrYuLadjYuL = Real(cTrace(YuLadjYuL),dp) 
 TrYuRadjYuR = Real(cTrace(YuRadjYuR),dp) 
 TrYvLadjYvL = Real(cTrace(YvLadjYvL),dp) 
 TrYvRadjYvR = Real(cTrace(YvRadjYvR),dp) 
 TrmChiDadjmChiDTpYdRCYdR = cTrace(mChiDadjmChiDTpYdRCYdR) 
 TrmChiEadjmChiETpYeRCYeR = cTrace(mChiEadjmChiETpYeRCYeR) 
 TrmChiNuadjYvRYvRCmChiNu = cTrace(mChiNuadjYvRYvRCmChiNu) 
 TrmChiNuCmChiNuYvLadjYvL = cTrace(mChiNuCmChiNuYvLadjYvL) 
 TrmChiUadjmChiUTpYuRCYuR = cTrace(mChiUadjmChiUTpYuRCYuR) 
 TrYdLadjYdLYdLadjYdL = Real(cTrace(YdLadjYdLYdLadjYdL),dp) 
 TrYdLadjYdLTpmChiDCmChiD = cTrace(YdLadjYdLTpmChiDCmChiD) 
 TrYdRadjYdRYdRadjYdR = Real(cTrace(YdRadjYdRYdRadjYdR),dp) 
 TrYeLadjYeLYeLadjYeL = Real(cTrace(YeLadjYeLYeLadjYeL),dp) 
 TrYeLadjYeLTpmChiECmChiE = cTrace(YeLadjYeLTpmChiECmChiE) 
 TrYeRadjYeRYeRadjYeR = Real(cTrace(YeRadjYeRYeRadjYeR),dp) 
 TrYuLadjYuLYuLadjYuL = Real(cTrace(YuLadjYuLYuLadjYuL),dp) 
 TrYuLadjYuLTpmChiUCmChiU = cTrace(YuLadjYuLTpmChiUCmChiU) 
 TrYuRadjYuRYuRadjYuR = Real(cTrace(YuRadjYuRYuRadjYuR),dp) 
 TrYvLadjYvLYvLadjYvL = Real(cTrace(YvLadjYvLYvLadjYvL),dp) 
 TrYvLadjYvLTpYvRCYvR = cTrace(YvLadjYvLTpYvRCYvR) 
 TrYvRadjYvRYvRadjYvR = Real(cTrace(YvRadjYvRYvRadjYvR),dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 sqrt15 =sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g1Xp2 =g1X**2 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gXp2 =gX**2 
 gXp3 =gX**3 
 gXp4 =gX**4 
 gX1p2 =gX1**2 
 LamHp2 =LamH**2 
 LamPhip2 =LamPhi**2 
 LamPhiHp2 =LamPhiH**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = (315._dp*(g1p3) + 96*g1p2*gX1*sqrt15 + 2*g1X*gX1*(245._dp*(gX)             & 
&  + 24*g1X*sqrt15) + g1*(315._dp*(g1Xp2) + 490._dp*(gX1p2) + 48*g1X*gX*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g1X 
!-------------------- 
 
betag1X1  = (g1p2*(315._dp*(g1X) + 48*gX*sqrt15) + g1X*(315._dp*(g1Xp2)               & 
&  + 490._dp*(gXp2) + 96*g1X*gX*sqrt15) + g1*(490*gX*gX1 + 48*g1X*gX1*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betag1X2 = 0

 
Dg1X = oo16pi2*( betag1X1 + oo16pi2 * betag1X2 ) 

 
Else 
Dg1X = oo16pi2* betag1X1 
End If 
 
 
If (.not.KineticMixing) Dg1X  = 0._dp 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gX 
!-------------------- 
 
betagX1  = (315*g1Xp2*gX + 490._dp*(gXp3) + 2*gX*gX1*(245._dp*(gX1) + 24*g1*sqrt15)   & 
&  + g1X*(315*g1*gX1 + 48*gX1p2*sqrt15 + 96*gXp2*sqrt15))/30._dp

 
 
If (TwoLoopRGE) Then 
betagX2 = 0

 
DgX = oo16pi2*( betagX1 + oo16pi2 * betagX2 ) 

 
Else 
DgX = oo16pi2* betagX1 
End If 
 
 
!-------------------- 
! gX1 
!-------------------- 
 
betagX11  = (21*g1*g1X*gX)/2._dp + (21*g1p2*gX1)/2._dp + (49*gX1*(gX1p2 +             & 
&  gXp2))/3._dp + 8*g1X*gX*gX1*sqrt3ov5 + 8*g1*(2._dp*(gX1p2) + gXp2)*sqrt3ov5

 
 
If (TwoLoopRGE) Then 
betagX12 = 0

 
DgX1 = oo16pi2*( betagX11 + oo16pi2 * betagX12 ) 

 
Else 
DgX1 = oo16pi2* betagX11 
End If 
 
 
If (.not.KineticMixing) DgX1  = 0._dp 
!-------------------- 
! LamH 
!-------------------- 
 
betaLamH1  = 27._dp*(g1p4)/200._dp + (9*g1p2*g2p2)/20._dp + 9._dp*(g2p4)              & 
& /8._dp - (9*g1p2*LamH)/5._dp - (9*g1Xp2*LamH)/5._dp - 9*g2p2*LamH + 24._dp*(LamHp2)    & 
&  + LamPhiHp2 + 12*LamH*TrYdLadjYdL - 6._dp*(TrYdLadjYdLYdLadjYdL) + 4*LamH*TrYeLadjYeL -& 
&  2._dp*(TrYeLadjYeLYeLadjYeL) + 12*LamH*TrYuLadjYuL - 6._dp*(TrYuLadjYuLYuLadjYuL)     & 
&  + 4*LamH*TrYvLadjYvL - 2._dp*(TrYvLadjYvLYvLadjYvL)

 
 
If (TwoLoopRGE) Then 
betaLamH2 = 0

 
DLamH = oo16pi2*( betaLamH1 + oo16pi2 * betaLamH2 ) 

 
Else 
DLamH = oo16pi2* betaLamH1 
End If 
 
 
!-------------------- 
! LamPhiH 
!-------------------- 
 
betaLamPhiH1  = (-9*g1p2*LamPhiH)/10._dp - (9*g1Xp2*LamPhiH)/10._dp - (9*g2p2*LamPhiH)& 
& /2._dp - 6*gX1p2*LamPhiH - 6*gXp2*LamPhiH + 12*LamH*LamPhiH + 8*LamPhi*LamPhiH +       & 
&  4._dp*(LamPhiHp2) + 6*LamPhiH*TrYdLadjYdL + 6*LamPhiH*TrYdRadjYdR + 2*LamPhiH*TrYeLadjYeL +& 
&  2*LamPhiH*TrYeRadjYeR + 6*LamPhiH*TrYuLadjYuL + 6*LamPhiH*TrYuRadjYuR +               & 
&  2*LamPhiH*TrYvLadjYvL - 4._dp*(TrYvLadjYvLTpYvRCYvR) + 2*LamPhiH*TrYvRadjYvR

 
 
If (TwoLoopRGE) Then 
betaLamPhiH2 = 0

 
DLamPhiH = oo16pi2*( betaLamPhiH1 + oo16pi2 * betaLamPhiH2 ) 

 
Else 
DLamPhiH = oo16pi2* betaLamPhiH1 
End If 
 
 
!-------------------- 
! LamPhi 
!-------------------- 
 
betaLamPhi1  = 2*(3._dp*(gXp4) - 6*gX1p2*LamPhi - 6*gXp2*LamPhi + LamPhiHp2 +         & 
&  10._dp*(LamPhip2) + 6*LamPhi*TrYdRadjYdR - 3._dp*(TrYdRadjYdRYdRadjYdR)               & 
&  + 2*LamPhi*TrYeRadjYeR - TrYeRadjYeRYeRadjYeR + 6*LamPhi*TrYuRadjYuR - 3._dp*(TrYuRadjYuRYuRadjYuR)& 
&  + 2*LamPhi*TrYvRadjYvR - TrYvRadjYvRYvRadjYvR)

 
 
If (TwoLoopRGE) Then 
betaLamPhi2 = 0

 
DLamPhi = oo16pi2*( betaLamPhi1 + oo16pi2 * betaLamPhi2 ) 

 
Else 
DLamPhi = oo16pi2* betaLamPhi1 
End If 
 
 
!-------------------- 
! YvL 
!-------------------- 
 
betaYvL1  = (-9._dp*(g1p2)/20._dp - 9._dp*(g1Xp2)/20._dp - 9._dp*(g2p2)               & 
& /4._dp + 3._dp*(TrYdLadjYdL) + TrYeLadjYeL + 3._dp*(TrYuLadjYuL) + TrYvLadjYvL)        & 
& *YvL + (TpYvRCYvRYvL - 3._dp*(YvLadjYeLYeL) + 3._dp*(YvLadjYvLYvL))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYvL2 = 0

 
DYvL = oo16pi2*( betaYvL1 + oo16pi2 * betaYvL2 ) 

 
Else 
DYvL = oo16pi2* betaYvL1 
End If 
 
 
Call Chop(DYvL) 

!-------------------- 
! YuL 
!-------------------- 
 
betaYuL1  = (-17._dp*(g1p2)/20._dp - 17._dp*(g1Xp2)/20._dp - 9._dp*(g2p2)             & 
& /4._dp - 8._dp*(g3p2) + 3._dp*(TrYdLadjYdL) + TrYeLadjYeL + 3._dp*(TrYuLadjYuL)        & 
&  + TrYvLadjYvL)*YuL - (3*(YuLadjYdLYdL - YuLadjYuLYuL))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYuL2 = 0

 
DYuL = oo16pi2*( betaYuL1 + oo16pi2 * betaYuL2 ) 

 
Else 
DYuL = oo16pi2* betaYuL1 
End If 
 
 
Call Chop(DYuL) 

!-------------------- 
! YvR 
!-------------------- 
 
betaYvR1  = (-3._dp*(gX1p2) - 3._dp*(gXp2) + 3._dp*(TrYdRadjYdR) + TrYeRadjYeR +      & 
&  3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YvR + YvRadjYvRYvR + YvRCYvLTpYvL

 
 
If (TwoLoopRGE) Then 
betaYvR2 = 0

 
DYvR = oo16pi2*( betaYvR1 + oo16pi2 * betaYvR2 ) 

 
Else 
DYvR = oo16pi2* betaYvR1 
End If 
 
 
Call Chop(DYvR) 

!-------------------- 
! YuR 
!-------------------- 
 
betaYuR1  = (-8._dp*(g1p2)/5._dp - 8._dp*(g1Xp2)/5._dp - 8._dp*(g3p2) -               & 
&  3._dp*(gX1p2) - 3._dp*(gXp2) - 4*g1X*gX*sqrt3ov5 - 4*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)& 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YuR + YuRadjYuRYuR

 
 
If (TwoLoopRGE) Then 
betaYuR2 = 0

 
DYuR = oo16pi2*( betaYuR1 + oo16pi2 * betaYuR2 ) 

 
Else 
DYuR = oo16pi2* betaYuR1 
End If 
 
 
Call Chop(DYuR) 

!-------------------- 
! YdL 
!-------------------- 
 
betaYdL1  = (-((g1p2 + g1Xp2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdLadjYdL)    & 
&  - 4._dp*(TrYeLadjYeL) - 12._dp*(TrYuLadjYuL) - 4._dp*(TrYvLadjYvL))*YdL)              & 
&  + 6*(YdLadjYdLYdL - YdLadjYuLYuL))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYdL2 = 0

 
DYdL = oo16pi2*( betaYdL1 + oo16pi2 * betaYdL2 ) 

 
Else 
DYdL = oo16pi2* betaYdL1 
End If 
 
 
Call Chop(DYdL) 

!-------------------- 
! YeL 
!-------------------- 
 
betaYeL1  = ((-9._dp*(g1p2) - 9._dp*(g1Xp2) - 9._dp*(g2p2) + 12._dp*(TrYdLadjYdL)     & 
&  + 4._dp*(TrYeLadjYeL) + 12._dp*(TrYuLadjYuL) + 4._dp*(TrYvLadjYvL))*YeL +             & 
&  6*(YeLadjYeLYeL - YeLadjYvLYvL))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYeL2 = 0

 
DYeL = oo16pi2*( betaYeL1 + oo16pi2 * betaYeL2 ) 

 
Else 
DYeL = oo16pi2* betaYeL1 
End If 
 
 
Call Chop(DYeL) 

!-------------------- 
! YdR 
!-------------------- 
 
betaYdR1  = (-2._dp*(g1p2)/5._dp - 2._dp*(g1Xp2)/5._dp - 8._dp*(g3p2) -               & 
&  3._dp*(gX1p2) - 3._dp*(gXp2) - 2*g1X*gX*sqrt3ov5 - 2*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)& 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YdR + YdRadjYdRYdR

 
 
If (TwoLoopRGE) Then 
betaYdR2 = 0

 
DYdR = oo16pi2*( betaYdR1 + oo16pi2 * betaYdR2 ) 

 
Else 
DYdR = oo16pi2* betaYdR1 
End If 
 
 
Call Chop(DYdR) 

!-------------------- 
! YeR 
!-------------------- 
 
betaYeR1  = (-18._dp*(g1p2)/5._dp - 18._dp*(g1Xp2)/5._dp - 3._dp*(gX1p2)              & 
&  - 3._dp*(gXp2) - 6*g1X*gX*sqrt3ov5 - 6*g1*gX1*sqrt3ov5 + 3._dp*(TrYdRadjYdR)          & 
&  + TrYeRadjYeR + 3._dp*(TrYuRadjYuR) + TrYvRadjYvR)*YeR + YeRadjYeRYeR

 
 
If (TwoLoopRGE) Then 
betaYeR2 = 0

 
DYeR = oo16pi2*( betaYeR1 + oo16pi2 * betaYeR2 ) 

 
Else 
DYeR = oo16pi2* betaYeR1 
End If 
 
 
Call Chop(DYeR) 

!-------------------- 
! mChiD 
!-------------------- 
 
betamChiD1  = (-2*(g1p2 + g1Xp2 + 20._dp*(g3p2))*mChiD)/5._dp + mChiDCYdLTpYdL +      & 
&  TpYdRCYdRmChiD/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiD2 = 0

 
DmChiD = oo16pi2*( betamChiD1 + oo16pi2 * betamChiD2 ) 

 
Else 
DmChiD = oo16pi2* betamChiD1 
End If 
 
 
Call Chop(DmChiD) 

!-------------------- 
! mChiE 
!-------------------- 
 
betamChiE1  = (-18*(g1p2 + g1Xp2)*mChiE)/5._dp + mChiECYeLTpYeL + TpYeRCYeRmChiE/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiE2 = 0

 
DmChiE = oo16pi2*( betamChiE1 + oo16pi2 * betamChiE2 ) 

 
Else 
DmChiE = oo16pi2* betamChiE1 
End If 
 
 
Call Chop(DmChiE) 

!-------------------- 
! mChiNu 
!-------------------- 
 
betamChiNu1  = (mChiNuadjYvRYvR + 2._dp*(mChiNuCYvLTpYvL) + TpYvRCYvRmChiNu +         & 
&  2._dp*(YvLadjYvLmChiNu))/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiNu2 = 0

 
DmChiNu = oo16pi2*( betamChiNu1 + oo16pi2 * betamChiNu2 ) 

 
Else 
DmChiNu = oo16pi2* betamChiNu1 
End If 
 
 
Call Chop(DmChiNu) 

!-------------------- 
! mChiU 
!-------------------- 
 
betamChiU1  = (-8*(g1p2 + g1Xp2 + 5._dp*(g3p2))*mChiU)/5._dp + mChiUCYuLTpYuL +       & 
&  TpYuRCYuRmChiU/2._dp

 
 
If (TwoLoopRGE) Then 
betamChiU2 = 0

 
DmChiU = oo16pi2*( betamChiU1 + oo16pi2 * betamChiU2 ) 

 
Else 
DmChiU = oo16pi2* betamChiU1 
End If 
 
 
Call Chop(DmChiU) 

!-------------------- 
! mu2H 
!-------------------- 
 
betamu2H1  = (-9*g1p2*mu2H)/10._dp - (9*g1Xp2*mu2H)/10._dp - (9*g2p2*mu2H)            & 
& /2._dp + 12*LamH*mu2H + 2*LamPhiH*mu2Phi - 4._dp*(TrmChiNuCmChiNuYvLadjYvL)            & 
&  + 6*mu2H*TrYdLadjYdL - 12._dp*(TrYdLadjYdLTpmChiDCmChiD) + 2*mu2H*TrYeLadjYeL -       & 
&  4._dp*(TrYeLadjYeLTpmChiECmChiE) + 6*mu2H*TrYuLadjYuL - 12._dp*(TrYuLadjYuLTpmChiUCmChiU)& 
&  + 2*mu2H*TrYvLadjYvL

 
 
If (TwoLoopRGE) Then 
betamu2H2 = 0

 
Dmu2H = oo16pi2*( betamu2H1 + oo16pi2 * betamu2H2 ) 

 
Else 
Dmu2H = oo16pi2* betamu2H1 
End If 
 
 
!-------------------- 
! mu2Phi 
!-------------------- 
 
betamu2Phi1  = 2*(2*LamPhiH*mu2H - 3*gX1p2*mu2Phi - 3*gXp2*mu2Phi + 4*LamPhi*mu2Phi - & 
&  6._dp*(TrmChiDadjmChiDTpYdRCYdR) - 2._dp*(TrmChiEadjmChiETpYeRCYeR) - 2._dp*(TrmChiNuadjYvRYvRCmChiNu)& 
&  - 6._dp*(TrmChiUadjmChiUTpYuRCYuR) + 3*mu2Phi*TrYdRadjYdR + mu2Phi*TrYeRadjYeR +      & 
&  3*mu2Phi*TrYuRadjYuR + mu2Phi*TrYvRadjYvR)

 
 
If (TwoLoopRGE) Then 
betamu2Phi2 = 0

 
Dmu2Phi = oo16pi2*( betamu2Phi1 + oo16pi2 * betamu2Phi2 ) 

 
Else 
Dmu2Phi = oo16pi2* betamu2Phi1 
End If 
 
 
!-------------------- 
! vH 
!-------------------- 
 
betavH1  = (vH*(9._dp*(g1p2) + 9._dp*(g1Xp2) + 45._dp*(g2p2) - 60._dp*(TrYdLadjYdL)   & 
&  - 20._dp*(TrYeLadjYeL) - 60._dp*(TrYuLadjYuL) - 20._dp*(TrYvLadjYvL) + 3*g1p2*Xi +    & 
&  3*g1Xp2*Xi + 15*g2p2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavH2 = 0

 
DvH = oo16pi2*( betavH1 + oo16pi2 * betavH2 ) 

 
Else 
DvH = oo16pi2* betavH1 
End If 
 
 
!-------------------- 
! vPhi 
!-------------------- 
 
betavPhi1  = -((3._dp*(TrYdRadjYdR) + TrYeRadjYeR + 3._dp*(TrYuRadjYuR)               & 
&  + TrYvRadjYvR)*vPhi)

 
 
If (TwoLoopRGE) Then 
betavPhi2 = 0

 
DvPhi = oo16pi2*( betavPhi1 + oo16pi2 * betavPhi2 ) 

 
Else 
DvPhi = oo16pi2* betavPhi1 
End If 
 
 
Call ParametersToG229(Dg1,Dg1X,Dg2,Dg3,DgX,DgX1,DLamH,DLamPhiH,DLamPhi,               & 
& DYvL,DYuL,DYvR,DYuR,DYdL,DYeL,DYdR,DYeR,DmChiD,DmChiE,DmChiNu,DmChiU,Dmu2H,            & 
& Dmu2Phi,DvH,DvPhi,f)

Iname = Iname - 1 
 
End Subroutine rge229  

End Module RGEs_U1T3R 
 
