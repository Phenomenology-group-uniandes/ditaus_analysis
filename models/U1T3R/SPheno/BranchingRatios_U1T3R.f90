! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_U1T3R 
 
Use Control 
Use Settings 
Use Couplings_U1T3R 
Use Model_Data_U1T3R 
Use LoopCouplings_U1T3R 
Use Fu3Decays_U1T3R 
Use Fe3Decays_U1T3R 
Use Fd3Decays_U1T3R 
Use TreeLevelDecays_U1T3R 
Use OneLoopDecays_U1T3R


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,alphaH,MAh,MAh2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,           & 
& TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,             & 
& LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,          & 
& mu2H,mu2Phi,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,               & 
& gPVZp,gTVZp,BRVZp)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(in) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vH,vPhi

Real(dp),Intent(inout) :: gPFu(6,1500),gTFu(6),BRFu(6,1500),gPFe(6,1497),gTFe(6),BRFe(6,1497),gPFd(6,1500),     & 
& gTFd(6),BRFd(6,1500),gPhh(2,174),gThh(2),BRhh(2,174),gPVZp(1,158),gTVZp,               & 
& BRVZp(1,158)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP(2),cplPseudoHiggsGG(2),cplHiggsZZvirt(2),& 
& cplHiggsWWvirt(2)

Real(dp) ::  gTAh(2) 
Real(dp) :: gFuFucFdFd(6,6,6,6),gFuFdcFeFv(6,6,6,9),gFuFucFeFe(6,6,6,6),gFuFucFuFu(6,6,6,6),      & 
& gFuFuFvFv(6,6,9,9),gFeFecFdFd(6,6,6,6),gFeFecFeFe(6,6,6,6),gFeFecFuFu(6,6,6,6),        & 
& gFeFeFvFv(6,6,9,9),gFeFvcFuFd(6,9,6,6),gFdFdcFdFd(6,6,6,6),gFdFdcFeFe(6,6,6,6),        & 
& gFdFdcFuFu(6,6,6,6),gFdFdFvFv(6,6,9,9),gFdFuFvFe(6,6,9,6)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWp

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1Lhh,Mhh,Mhh2,MAh,MAh2,            & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,MVZ,MVZp,MVZ2,MVZp2,MVWp,MVWp2,           & 
& ZH,ZA,ZDL,ZDR,ZUL,ZUR,ZEL,ZER,UV,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,             & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& epsI,deltaM,kont)

End if 


gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& gPFu(:,1:42),gTFu,BRFu(:,1:42))

Do i1=1,6
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& gPFe(:,1:39),gTFe,BRFe(:,1:39))

Do i1=1,6
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
If (OneLoopDecays) Then 
gT1LFe(i1) =Sum(gP1LFe(i1,:)) 
If (gT1LFe(i1).Gt.0._dp) BR1LFe(i1,: ) =gP1LFe(i1,:)/gT1LFe(i1) 
End if
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& gPFd(:,1:42),gTFd,BRFd(:,1:42))

Do i1=1,6
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
If (OneLoopDecays) Then 
gT1LFd(i1) =Sum(gP1LFd(i1,:)) 
If (gT1LFd(i1).Gt.0._dp) BR1LFd(i1,: ) =gP1LFd(i1,:)/gT1LFd(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& gPhh,gThh,BRhh)

Do i1=1,2
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPVZp = 0._dp 
gTVZp = 0._dp 
BRVZp = 0._dp 
Call VZpTwoBodyDecay(-1,DeltaM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& gPVZp,gTVZp,BRVZp)

Do i1=1,1
gTVZp =Sum(gPVZp(i1,:)) 
If (gTVZp.Gt.0._dp) BRVZp(i1,: ) =gPVZp(i1,:)/gTVZp 
End Do 
 

! Set Goldstone Widhts 


If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fu)) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,           & 
& deltaM,.False.,gTFu,gPFu(:,43:1500),BRFu(:,43:1500))

Else 
Call FuThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,           & 
& deltaM,.True.,gTFu,gPFu(:,43:1500),BRFu(:,43:1500))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFuFvFv,epsI,           & 
& deltaM,.False.,gTFu,gPFu(:,43:1500),BRFu(:,43:1500))

End If 
Do i1=1,6
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fe)) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,           & 
& deltaM,.False.,gTFe,gPFe(:,40:1497),BRFe(:,40:1497))

Else 
Call FeThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,           & 
& deltaM,.True.,gTFe,gPFe(:,40:1497),BRFe(:,40:1497))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,           & 
& deltaM,.False.,gTFe,gPFe(:,40:1497),BRFe(:,40:1497))

End If 
Do i1=1,6
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fd)) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,            & 
& deltaM,.False.,gTFd,gPFd(:,43:1500),BRFd(:,43:1500))

Else 
Call FdThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,            & 
& deltaM,.True.,gTFd,gPFd(:,43:1500),BRFd(:,43:1500))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,              & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,            & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,gThh,             & 
& gTVWp,gTVZ,gTVZp,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,            & 
& deltaM,.False.,gTFd,gPFd(:,43:1500),BRFd(:,43:1500))

End If 
Do i1=1,6
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
! No 3-body decays for VZp  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_U1T3R 
 