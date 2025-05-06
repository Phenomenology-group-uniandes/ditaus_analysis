! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 13:20 on 4.4.2025   
! ----------------------------------------------------------------------  
 
 
Module Model_Data_U1T3R 
 
Use Control 
Use Settings 
Use LoopFunctions 
Logical, Save :: CalcLoopDecay_LoopInducedOnly=.False.
 Logical, Save :: CalcLoopDecay_Fu=.True.
Logical, Save :: CalcLoopDecay_Fe=.True.
Logical, Save :: CalcLoopDecay_Fd=.True.
Logical, Save :: CalcLoopDecay_hh=.True.
Logical, Save :: Calc3BodyDecay_Fu=.True.
Logical, Save :: Calc3BodyDecay_Fe=.True.
Logical, Save :: Calc3BodyDecay_Fd=.True.
Real(dp) :: tau_pi0=26033._dp, tau_pip,tau_rho0,tau_rhop,tau_Dp= 1.040E-12_dp,tau_D0,tau_DSp,tau_DSsp, & 
 & tau_eta,tau_etap,tau_omega,tau_phi, tau_KL0,tau_KS0,tau_K0,tau_Kp=1238.0E-11_dp,tau_B0s=1.472E-12_dp, tau_B0d=1.525E-12_dp, tau_B0p,tau_B0c,tau_Bpc,tau_Bs0c, tau_Bp=1.519E-12_dp, & 
 & tau_Bcp,tau_Bcpc,tau_K0c,tau_Kpc,tau_etac,tau_JPsi,tau_Ups,tau_etab  
Real(dp) :: mass_pi0=0.1396_dp, mass_pip,mass_rho0,mass_rhop,mass_Dp,mass_D0=1.8648_dp,mass_DSp,mass_DSsp, & 
 & mass_eta,mass_etap,mass_omega,mass_phi, mass_KL0,mass_KS0,mass_K0=0.4937_dp,mass_Kp=0.493_dp,mass_B0s=5.3663_dp, mass_B0d=5.2795_dp,mass_B0p=5.279_dp,mass_B0c,mass_Bpc,mass_Bs0c, & 
 & mass_Bcp,mass_Bcpc,mass_K0c=0.8959_dp,mass_Kpc,mass_etac,mass_JPsi,mass_Ups,mass_etab  
Real(dp) :: f_k_CONST=0.1598_dp, h_k_CONST, f_eta_q_CONST, f_eta_s_CONST, h_eta_q_CONST, h_eta_s_CONST, & 
 & f_rho_CONST, h_rho_CONST,  f_omega_q_CONST, f_omega_s_CONST, h_omega_q_CONST, h_omega_s_CONST, f_B0d_CONST=0.190_dp, f_B0s_CONST=0.227_dp, & 
 & f_D_CONST= 0.248_dp, f_Bp_CONST =  0.234_dp, f_Kp_CONST = 0.156_dp 
Real(dp) :: MW_SM 
Real(dp) :: Alpha_160, AlphaS_160, SinW2_160, sinW2_MZ 
Real(dp) :: mf_d_160(3), mf_u_160(3), mf_l_160(3), mf_d2_160(3), mf_u2_160(3), mf_l2_160(3) 
Real(dp) :: mf_d2_MZ(3), mf_u2_MZ(3), mf_l2_MZ(3) 
Complex(dp) :: CKM_160(3,3), CKM_MZ(3,3) 
Logical :: TransposedYukawa= .False. 
Logical :: KineticMixing = .True. 
Logical :: KineticMixingSave = .True. 
Logical :: TwoLoopMatching = .True., GuessTwoLoopMatchingBSM=.false. 
Logical :: OneLoopMatching = .True. 
Logical :: TreeLevelUnitarityLimits = .True. 
Real(dp) :: max_scattering_eigenvalue=0._dp
Real(dp) :: TreeUnitarity=1
Real(dp) :: CutSpole=0.25_dp 
Logical :: TrilinearUnitarity = .True. 
Logical :: RunRGEs_unitarity = .false. 
Real(dp) :: max_scattering_eigenvalue_trilinears=0._dp
Real(dp) :: TreeUnitarityTrilinear=1
Real(dp) :: unitarity_s_best=0._dp
Real(dp) :: unitarity_s_min=2000._dp
Real(dp) :: unitarity_s_max=3000._dp
Integer :: unitarity_steps=5
Integer :: TUcutLevel=2
Logical :: WriteTreeLevelTadpoleSolutions = .False. 
Logical :: WriteHiggsDiphotonLoopContributions = .False. 
Logical :: WriteEffHiggsCouplingRatios = .False. 
Real(dp) :: ZHOS_0(2, 2)
Real(dp) :: ZHOS_p2(2, 2)
Real(dp) :: ZAOS_0(2, 2)
Real(dp) :: ZAOS_p2(2, 2)
Complex(dp) :: ZDLOS_0(6, 6)
Complex(dp) :: ZDLOS_p2(6, 6)
Complex(dp) :: ZDROS_0(6, 6)
Complex(dp) :: ZDROS_p2(6, 6)
Complex(dp) :: ZULOS_0(6, 6)
Complex(dp) :: ZULOS_p2(6, 6)
Complex(dp) :: ZUROS_0(6, 6)
Complex(dp) :: ZUROS_p2(6, 6)
Complex(dp) :: ZELOS_0(6, 6)
Complex(dp) :: ZELOS_p2(6, 6)
Complex(dp) :: ZEROS_0(6, 6)
Complex(dp) :: ZEROS_p2(6, 6)
Complex(dp) :: UVOS_0(9, 9)
Complex(dp) :: UVOS_p2(9, 9)
Real(dp) :: mu2HTree 
Real(dp) :: mu2H1L 
Real(dp) :: mu2H2L 
Real(dp) :: mu2PhiTree 
Real(dp) :: mu2Phi1L 
Real(dp) :: mu2Phi2L 
Real(dp) :: mass_uncertainty_Q(32), mass_uncertainty_Yt(32), g_SM_save(62) 
Logical :: GetMassUncertainty = .false. 
Integer :: SolutionTadpoleNr = 1 
Real(dp) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp) :: g1IN,g1XIN,g2IN,g3IN,gXIN,gX1IN,LamHIN,LamPhiHIN,LamPhiIN,mu2HIN,mu2PhiIN

Complex(dp) :: YvLIN(3,3),YuLIN(3,3),YvRIN(3,3),YuRIN(3,3),YdLIN(3,3),YeLIN(3,3),YdRIN(3,3),         & 
& YeRIN(3,3),mChiDIN(3,3),mChiEIN(3,3),mChiNuIN(3,3),mChiUIN(3,3)

Real(dp) :: g1MZ,g1XMZ,g2MZ,g3MZ,gXMZ,gX1MZ,LamHMZ,LamPhiHMZ,LamPhiMZ,mu2HMZ,mu2PhiMZ

Complex(dp) :: YvLMZ(3,3),YuLMZ(3,3),YvRMZ(3,3),YuRMZ(3,3),YdLMZ(3,3),YeLMZ(3,3),YdRMZ(3,3),         & 
& YeRMZ(3,3),mChiDMZ(3,3),mChiEMZ(3,3),mChiNuMZ(3,3),mChiUMZ(3,3)

Real(dp) :: g1GUT,g1XGUT,g2GUT,g3GUT,gXGUT,gX1GUT,LamHGUT,LamPhiHGUT,LamPhiGUT,mu2HGUT,mu2PhiGUT

Complex(dp) :: YvLGUT(3,3),YuLGUT(3,3),YvRGUT(3,3),YuRGUT(3,3),YdLGUT(3,3),YeLGUT(3,3),              & 
& YdRGUT(3,3),YeRGUT(3,3),mChiDGUT(3,3),mChiEGUT(3,3),mChiNuGUT(3,3),mChiUGUT(3,3)

Real(dp) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp) :: vH,vPhi

Real(dp) :: vHIN,vPhiIN

Real(dp) :: vHFix,vPhiFix

Real(dp) :: gPFu(6,1500),gTFu(6),BRFu(6,1500),gPFe(6,1497),gTFe(6),BRFe(6,1497),gPFd(6,1500),     & 
& gTFd(6),BRFd(6,1500),gPhh(2,174),gThh(2),BRhh(2,174),gPVZp(1,158),gTVZp,               & 
& BRVZp(1,158)

Real(dp) :: gP1LFu(6,42),gT1LFu(6),BR1LFu(6,42),gP1LFe(6,39),gT1LFe(6),BR1LFe(6,39),              & 
& gP1LFd(6,42),gT1LFd(6),BR1LFd(6,42),gP1Lhh(2,174),gT1Lhh(2),BR1Lhh(2,174),             & 
& gP1LVZp(1,158),gT1LVZp,BR1LVZp(1,158)

Real(dp) :: ratioFd(2,6),ratioFe(2,6),ratioFu(2,6),ratioHp(2),ratioVWp(2)

Complex(dp) :: ratioGG(2),ratioPP(2)

Real(dp) :: ratioPFd(2,6),ratioPFe(2,6),ratioPFu(2,6),ratioPHp(2),ratioPVWp(2)

Complex(dp) :: ratioPGG(2),ratioPPP(2)

Real(dp) :: gForTadpoles(229)
Complex(dp) :: tForTadpoles(2)
Real(dp) :: g1_saveEP 
Real(dp) :: g1X_saveEP 
Real(dp) :: g2_saveEP 
Real(dp) :: gX_saveEP 
Real(dp) :: gX1_saveEP 
Complex(dp) :: YvL_saveEP(3,3) 
Complex(dp) :: YuL_saveEP(3,3) 
Complex(dp) :: YvR_saveEP(3,3) 
Complex(dp) :: YuR_saveEP(3,3) 
Complex(dp) :: YdL_saveEP(3,3) 
Complex(dp) :: YeL_saveEP(3,3) 
Complex(dp) :: YdR_saveEP(3,3) 
Complex(dp) :: YeR_saveEP(3,3) 
Complex(dp) :: mChiD_saveEP(3,3) 
Complex(dp) :: mChiE_saveEP(3,3) 
Complex(dp) :: mChiNu_saveEP(3,3) 
Complex(dp) :: mChiU_saveEP(3,3) 
Logical :: RotateNegativeFermionMasses=.True. 
Logical,save::IgnoreNegativeMasses= .False.
Logical,save::IgnoreMuSignFlip= .False.
Logical,save::IgnoreNegativeMassesMZ= .False.
Logical,save::Write_WHIZARD= .False.
Integer,save::BoundaryCondition=1 
Logical,Save::MZ_input= .False. 
 
Real(dp) :: CS_Higgs_LHC(5,2,5) 
 
Real (dp) :: MhhL(2), Mhh2L(2) 
Real (dp) :: Mhh_s(2), Mhh2_s(2) 
Real (dp) :: MAhL(2), MAh2L(2) 
Real (dp) :: MAh_s(2), MAh2_s(2) 
Real (dp) :: FineTuningResults(0) 
Real (dp) :: FineTuningResultsAllVEVs(0) 
Logical, Save :: OneLoopFT = .False. 
Logical, Save :: CalcFT = .True. 
Logical :: Include_in_loopFd = .true. 
Logical :: Include_in_loopFu = .true. 
Logical :: Include_in_loopFe = .true. 
Logical :: Include_in_loopFv = .true. 
Logical :: Include_in_loopHp = .true. 
Logical :: Include_in_loophh = .true. 
Logical :: Include_in_loopAh = .true. 
Logical :: Include_in_loopVG = .true. 
Logical :: Include_in_loopVP = .true. 
Logical :: Include_in_loopVZ = .true. 
Logical :: Include_in_loopVZp = .true. 
Logical :: Include_in_loopVWp = .true. 
Logical :: Include_in_loopgG = .true. 
Logical :: Include_in_loopgA = .true. 
Logical :: Include_in_loopgZ = .true. 
Logical :: Include_in_loopgZp = .true. 
Logical :: Include_in_loopgWp = .true. 
Logical :: Include_in_loopgWC = .true. 
Logical :: IncludeBoxes = .true. 
Logical :: IncludePenguins = .true. 
Logical :: IncludeWave = .true. 
Logical :: IncludeTriangle = .true. 
Integer,save::YukawaScheme=1
Logical, save :: CheckSugraDetails(10) =.False. & 
                        &, SugraErrors(10) =.False. &
                        &, StrictUnification =.False. &
                        &, UseFixedScale =.False. &
                        &, UseFixedGUTScale =.False. 
Real(dp), save :: GUT_scale 
Real(dp) :: g3running 
Logical, save :: InputValueforg1 =.False. 
Logical, save :: InputValueforg1X =.False. 
Logical, save :: InputValueforg2 =.False. 
Logical, save :: InputValueforg3 =.False. 
Logical, save :: InputValueforgX =.False. 
Logical, save :: InputValueforgX1 =.False. 
Logical, save :: InputValueforLamH =.False. 
Logical, save :: InputValueforLamPhiH =.False. 
Logical, save :: InputValueforLamPhi =.False. 
Logical, save :: InputValueforYvL =.False. 
Logical, save :: InputValueforYuL =.False. 
Logical, save :: InputValueforYvR =.False. 
Logical, save :: InputValueforYuR =.False. 
Logical, save :: InputValueforYdL =.False. 
Logical, save :: InputValueforYeL =.False. 
Logical, save :: InputValueforYdR =.False. 
Logical, save :: InputValueforYeR =.False. 
Logical, save :: InputValueformChiD =.False. 
Logical, save :: InputValueformChiE =.False. 
Logical, save :: InputValueformChiNu =.False. 
Logical, save :: InputValueformChiU =.False. 
Logical, save :: InputValueformu2H =.False. 
Logical, save :: InputValueformu2Phi =.False. 
Logical, save :: InputValueforvPhi =.False. 
Real (dp) :: vSM_Q 
Real(dp), save :: RXiG = 1._dp 
Real(dp), save :: RXiP = 1._dp 
Real(dp), save :: RXiWp = 1._dp 
Real(dp), save :: RXiZ = 1._dp 
Real(dp), save :: RXiZp = 1._dp 
Real(dp) :: nuMasses(9) 
Complex(dp) :: nuMixing(9,9) 
Complex(dp) :: temporaryValue 
Complex(dp) :: mh1sqINPUT
Complex(dp) :: mh2sqINPUT
Complex(dp) :: taINPUT
Complex(dp) :: mZpINPUT
Real(dp) :: vHMZ 
Real(dp) :: vHSUSY 
Real(dp) :: vPhiMZ 
Real(dp) :: vPhiSUSY 
! For HiggsBounds 
Real(dp) :: BR_HpHW(1,2)  = 0._dp
Real(dp) :: BR_HpAW(1,2) = 0._dp
Real(dp) :: BR_tHb = 0._dp 
Real(dp) :: BR_Hcs = 0._dp 
Real(dp) :: BR_Hcb = 0._dp 
Real(dp) :: BR_Htaunu = 0._dp 
Real(dp) :: BR_tWb = 0._dp 
Real(dp) :: BR_HpTB = 0._dp 
Real(dp) :: BR_HpWZ =0._dp 
Real(dp) :: BRHll(2,3,3)  = 0._dp
Real(dp) :: BRAll(2,3,3)   = 0._dp 
 Real(dp) :: BRHHH(2,2)=0._dp
Real(dp) :: BRHAA(2,2)= 0._dp 
 Real(dp) :: BRAHH(2,2)=0._dp
Real(dp) :: BRAAA(2,2)  = 0._dp 
 Real(dp) :: BRHHHijk(2,2,2)=0._dp
Real(dp) :: BRHHAijk(2,2,2)=0._dp
Real(dp) :: BRHAAijk(2,2,2)  = 0._dp 
 Real(dp) :: BRAHHijk(2,2,2)=0._dp
Real(dp) :: BRAHAijk(2,2,2)=0._dp
Real(dp) ::  BRAAAijk(2,2,2)  = 0._dp 
 Real(dp) :: BRHHZ(2,2)=0._dp
Real(dp) :: BRHAZ(2,2)  = 0._dp 
 Real(dp) :: BRAHZ(2,2) =0._dp
Real(dp) :: BRAAZ(2,2)  = 0._dp 
 Real(dp) :: BRAHpW(2,1)=0._dp
Real(dp) :: BRHHpW(2,1)  = 0._dp 
 Real(dp) :: BRinvH(2), BRinvA(2)  = 0._dp 
Real(dp) :: rHB_P_VP(2),rHB_S_VP(2)
Real(dp) :: rHB_P_VG(2),rHB_S_VG(2)
Real(dp) :: rHB_P_VZ(2),rHB_S_VZ(2)
Real(dp) :: rHB_P_VWp(2),rHB_S_VWp(2)
Real(dp) :: rHB_P_P_Fd(2,6),rHB_P_S_Fd(2,6),rHB_S_S_Fd(2,6),rHB_S_P_Fd(2,6)
Real(dp) :: rHB_P_P_Fu(2,6),rHB_P_S_Fu(2,6),rHB_S_S_Fu(2,6),rHB_S_P_Fu(2,6)
Real(dp) :: rHB_P_P_Fe(2,6),rHB_P_S_Fe(2,6),rHB_S_S_Fe(2,6),rHB_S_P_Fe(2,6)
Real(dp) :: rHB_P_P_Fv(2,9),rHB_P_S_Fv(2,9),rHB_S_S_Fv(2,9),rHB_S_P_Fv(2,9)
Complex(dp) :: CPL_A_H_Z(2,2)  =0._dp 
 Complex(dp) :: CPL_H_H_Z(2,2) =0._dp 
 Complex(dp) :: CoupHPP(2), CoupHGG(2) =0._dp 
Complex(dp) :: CPL_A_A_Z(2,2) =0._dp 
 Complex(dp) :: CoupAPP(2), CoupAGG(2) =0._dp 
Real(dp) :: HPPloopHp(2)
Real(dp) :: HPPloopVWp(2)
Real(dp) :: HPPloopFd(6,2)
Real(dp) :: HPPloopFu(6,2)
Real(dp) :: HPPloopFe(6,2)

 Real(dp) :: m32, tanbetaMZ 
Complex(dp),Dimension(3,3)::Y_l,Y_d,Y_u,Y_l_mZ,Y_d_mZ,Y_u_mZ&
&,Y_l_0,Y_d_0,Y_u_0
Real(dp),Dimension(3)::gauge,gauge_mZ,gauge_0 
Real(dp)::tanb,vevSM(2),tanb_mZ 
Contains 
 
Real(dp) Function Kronecker(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.eq.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function Kronecker 

Real(dp) Function ThetaStep(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.le.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function ThetaStep 

Real(dp) Function epsTensor(t1,t2,t3) Result(e)
Implicit None
Integer,Intent(in)::t1,t2,t3
If ((t1.eq.1).and.(t2.eq.2).and.(t3.eq.3)) Then
  e=1.
Else If ((t1.eq.2).and.(t2.eq.3).and.(t3.eq.1)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.1).and.(t3.eq.2)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.2).and.(t3.eq.1)) Then
  e=-1.
Else If ((t1.eq.2).and.(t2.eq.1).and.(t3.eq.3)) Then
  e=-1.
Else If ((t1.eq.1).and.(t2.eq.3).and.(t3.eq.2)) Then
  e=-1.
Else
  e=0.
End If
End Function epsTensor
Real(dp) Function gGMSB(ratio) 
Implicit None 
 Real(dp),Intent(in)::ratio 
 gGMSB=(1._dp+ratio)/ratio**2*Log(1._dp+ratio)& 
   &+(1._dp-ratio)/ratio**2*Log(1._dp-ratio) 
End Function gGMSB 
 
Real(dp) Function fGMSB(ratio) 
Implicit None 
Real(dp),Intent(in)::ratio 
If (ratio.lt.0.0001) Then 
 fGMSB = 1._dp 
Else 
 fGMSB=(1._dp+ratio)/ratio**2*(Log(1._dp+ratio)&
  & -2._dp*Li2(ratio/(1._dp+ratio))&
  & +0.5_dp*Li2(2._dp*ratio/(1._dp+ratio)))&
  & +(1._dp-ratio)/ratio**2*(Log(1._dp-ratio)&
  & -2._dp*Li2(ratio/(ratio-1._dp))&
  & +0.5_dp*Li2(2._dp*ratio/(ratio-1._dp)))
End If 
End Function fGMSB 
 
Complex(dp) Recursive Function h(a,b) 
Implicit None 
Real(dp),Intent(in)::a,b 
h=1._dp-(Log(a)*Log(b))/2._dp-&
& ((-(1._dp,-10D-12)+a+b)*(Pi2o6&
& +CLi2(-(((1._dp,-10D-12)-a+b-Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& 2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& +CLi2(-((1._dp+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)-a+b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& -Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)+a-b-&
& Sqrt((1._dp,10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,10D-12)-a+b+Sqrt((1._dp,10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)-a+b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& (2._dp,10.D-12)*(a+b)))/((1._dp,-10D-12)+a-b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))))**2/4._dp))/&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))
End Function h 
 
Complex(dp) Function SQuiver(xQ,yQ) 
Implicit None 
Real(dp),Intent(in)::xQ,yQ 
SQuiver=(-8._dp*xQ**2+4._dp*xQ*yQ**2*atanh(xQ)&
 & -4._dp*(4._dp+yQ**2)*h(1._dp,yQ**2)+(-1._dp+xQ)*(-8._dp+8._dp*xQ+&
 & yQ**2)*h(1._dp,yQ**2/(1._dp-xQ))+8._dp*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 16._dp*xQ*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 8._dp*xQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & yQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(1._dp,yQ**2/(1._dp+xQ))&
 & +4._dp*xQ*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 4._dp*xQ*h(1._dp-xQ,yQ**2)+2._dp*yQ**2*h(1._dp-xQ,yQ**2)-&
 & 4._dp*xQ*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ*h(1._dp+xQ,yQ**2)+2._dp*yQ**2*h(1._dp+xQ,yQ**2)-&
 & yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & xQ*yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*yQ**2*h(yQ**(-2),yQ**(-2))+&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)+&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)-&
 & 8._dp*xQ*CLi2((1._dp,10D-12)*xQ)+&
 & 4._dp*(-1._dp+xQ)*(xQ+yQ**2)*CLi2(xQ/(-(1._dp,10D-12)+xQ))-&
 & (-1._dp+xQ)*yQ**2*CLi2((2._dp*xQ)/(-(1._dp,10D-12)+xQ))+&
 & 2._dp*xQ*CLi2((1._dp,10D-12)*xQ**2)+&
 & 4._dp*(1._dp+xQ)*(xQ-yQ**2)*CLi2(xQ/((1._dp,10D-12)+xQ))+&
 & (1._dp+xQ)*yQ**2*CLi2(((2._dp,10D-12)*xQ)/(1._dp+xQ))+&
 & 2._dp*yQ**2*Log(1._dp-xQ)+&
 & 2._dp*yQ**2*Log(1._dp+xQ))/(2._dp*xQ**2*yQ**2)
End Function SQuiver 
 
Subroutine RGE10_SMa(len,t,gy,f)
 !--------------------------------------------------------
 ! RGEs within the SM assuming the MSbar scheme
 ! 2-loop RGEs for e
 ! 4-loop RGEs for g_3
 ! 2-loop RGEs for lepton masses
 ! 4-loop QCD and 2-loop QED RGES for quark masses
 ! Assumption: the only threhold to be checked is m_b
 ! input: t = Log(Q^2)
 !        gy(i) ... i=1  -> e(Q)
 !                  i=2  -> g_3
 !                  i=3  -> m_e
 !                  i=4  -> m_mu
 !                  i=5  -> m_tau
 !                  i=6  -> m_u
 !                  i=7  -> m_c
 !                  i=8  -> m_d
 !                  i=9  -> m_s
 !                  i=10 -> m_b, is optional
 ! output:
 !   f = d(gy)/d(t)
 ! written by Werner Porod, 03.12.03
 !--------------------------------------------------------
 Implicit None

  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Integer :: i1
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2, q
  Real(dp), Parameter :: b_e1(2) = (/ 76._dp / 9._dp , 80._dp / 9._dp /)    &
       & , b_e2(2) = (/ 460._dp / 27._dp , 464._dp / 27._dp /)              & 
       & , b_e3(2) = (/ 160._dp / 9._dp , 176._dp / 9._dp  /)               & 
       & , b_g1(2) = (/ -25._dp / 3._dp, -23._dp/3._dp /)                   &
       & , b_g2(2) = (/ -154._dp / 3._dp, -116._dp/3._dp /)                 &
       & , b_g3(2) = (/ 20._dp / 3._dp, 22._dp/3._dp /)                     &
       & , b_g4(2) = (/ -21943._dp/54._dp, 9769._dp/54._dp /)               &
       & , b_g5(2) = (/ -4918247._dp/1458._dp-414140._dp*zeta3/81._dp       &
       &             , 598391._dp/1458._dp - 352864._dp*zeta3/81._dp /)     &
       & , g_el1(2) = (/ -6._dp, -6._dp /)                                  &
       & , g_el2(2) = (/ 353._dp / 9._dp,  373._dp / 9._dp /)               & 
       & , g_eu1(2) = (/ -8._dp/3._dp, -8._dp/3._dp /)                      &
       & , g_eu2(2) = (/ 1472._dp / 81._dp, 1552._dp / 81._dp/)             & 
       & , g_eu3(2) = (/ -32._dp / 9._dp,  -32._dp / 9._dp/)                & 
       & , g_ed1(2) = (/ -2._dp/3._dp, -2._dp/3._dp /)                      &
       & , g_ed2(2) = (/ 377._dp / 81._dp,  397._dp / 81._dp /)             & 
       & , g_ed3(2) = (/ -8._dp / 9._dp,  -8._dp / 9._dp /)                 & 
       & , g_q1(2) = (/ - 8._dp , -8._dp /)                                 &
       & , g_q2(2) = (/ -1052._dp / 9._dp ,  -1012._dp / 9._dp /)           &
       & , g_q3(2) = (/ -144674._dp/81._dp + 1280._dp * zeta3 / 3._dp       &
       &              , -128858._dp/81._dp + 1600._dp * zeta3 / 3._dp /)    &
       & , g_q4(2) = (/ -7330357._dp/243._dp + 51584._dp* zeta3/3._dp       &
       &                - 16000._dp*zeta4 / 3._dp + 11200._dp* zeta5 /9._dp &
       &             , -1911065._dp/81._dp + 618400._dp* zeta3/27._dp       &
       &                - 18400._dp*zeta4 / 3._dp - 25600._dp* zeta5 /9._dp  /)

       
  Iname = Iname + 1
  NameOfUnit(Iname) = 'RGE10_SMa'

  q = t

  If (len.Eq.9) Then ! check which beta function (anomalous dimension) to use
   i1 = 1
  Else If (len.Eq.10) Then
   i1 = 2
  Else
   Write(ErrCan,*) "Error in routine "//Trim(NameOfUnit(Iname))
   Write(ErrCan,*) "Length of the vector gy = ",len
   Call TerminateProgram
  End If

  g32 = gy(1)**2
  g34 = gy(1)**4
  g36 = gy(1)**6
  g38 = gy(1)**8
  e2 = gy(2)**2
  e4 = gy(2)**4
  g32e2 = g32 * e2 
 !--------
 ! g_3
 !--------
  f(1) = oo16pi2 * gy(1) * ( b_g1(i1)*g32                                     &
       &                   + oo16pi2 * ( b_g2(i1)*g34 + b_g3(i1)*g32e2        &
       &                               + oo16pi2 * ( b_g4(i1)*g36             &
       &                                           + oo16pi2 * b_g5(i1)*g38 )))
 !--------
 ! e
 !--------
  f(2) = oo16pi2 * gy(2) * ( b_e1(i1) * e2                                &
       &                   + oo16pi2 * (b_e2(i1) * e4 + b_e3(i1) * g32e2 ))
 !-----------------
 ! m_l, l=e,mu,tau
 !-----------------
  f(3:5) =  oo16pi2 * gy(3:5) * (g_el1(i1) * e2 + oo16pi2 *g_el2(i1) * e4)
 !---------
 ! m_u, m_c
 !---------
  f(6:7) = oo16pi2 * gy(6:7) * (g_eu1(i1) * e2 + g_q1(i1) * g32              &
         &                     + oo16pi2 * (g_eu2(i1)*e4 + g_eu3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))
 !---------------
 ! m_d, m_s, m_b
 !---------------
  f(8:len) = oo16pi2 * gy(8:len) * (g_ed1(i1) * e2 + g_q1(i1) * g32          &
         &                     + oo16pi2 * (g_ed2(i1)*e4 + g_ed3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))

  Iname = Iname - 1

 End Subroutine RGE10_SMa

Subroutine RGE11_SMa(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)

  If (nUp.lt.2.9_dp)  f(8) = 0._dp
  If (nDown.lt.2.9_dp)  f(12) = 0._dp

  f = oo16pi2*f


End Subroutine RGE11_SMa

Subroutine RGE11(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark, a1, a2, a3, nG
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 

  nG = 3._dp
  a1 = gy(12)
  a2 = gy(13)
  a3 = gy(14)


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)



!! running of alpha_i to calculate running sin(w2); equations by Steinhauser
  ! alpha_1
  f(12) = a1**2*(2._dp/5._dp + nG*16._dp/3._dp) + &
    & a1**2*oo4pi2*(18._dp/25._dp*a1 + 18._dp/5._dp*a2 + nG*(76._dp/15._dp*a1 + 12._dp/5._dp*a2 + 176._dp/15._dp*a3))

  ! alpha_2
  f(13) = a2**2*(-86._dp/3._dp + nG*16._dp/3._dp) + &
   & a2**2*oo4pi2*(6._dp/5._dp*a1 - 518._dp/3._dp*a2 + nG*(4._dp/3._dp + 196._dp/3._dp*a2 + 16._dp*a3))

  ! alpha_3
  f(14) = a3**2*(-44._dp + nG*16._dp/3._dp) + &
    & a3**2*oo4pi2*(-408._dp*a3 + nG*(22._dp/15._dp*a1 + 6._dp*a2 + 304._dp/3._dp*a3))

  f = oo16pi2*f


End Subroutine RGE11


Subroutine RGEAlphaS(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGEAlphaS

Subroutine RGETop(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(3) = gy(3)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGETop
Subroutine SetGUTScale(scale)
Implicit None
Real(dp),Intent(in)::scale
If (scale.Lt.0._dp) Then
UseFixedGUTScale= .False.
Else
UseFixedGUTScale= .True.
GUT_scale=scale
End If
End Subroutine SetGUTScale
 

Subroutine SetRGEScale(scale)
Implicit None
Real(dp),Intent(in)::scale
Real(dp)::old_scale
If (scale.Lt.0._dp) Then
UseFixedScale= .False.
Else
UseFixedScale= .True.
old_scale=SetRenormalizationScale(scale)
End If
End Subroutine SetRGEScale


Logical Function SetStrictUnification(V1)
Implicit None
Logical,Intent(in)::V1
SetStrictUnification= .False.
StrictUnification=V1
SetStrictUnification= .True.
End Function SetStrictUnification


Integer Function SetYukawaScheme(V1)
Implicit None
Integer,Intent(in)::V1
SetYukawaScheme=YukawaScheme
YukawaScheme=V1
End Function SetYukawaScheme


Subroutine Set_All_Parameters_0() 
Implicit None 
Y_l= 0._dp 
Y_d= 0._dp 
Y_u= 0._dp 
Y_l_mZ= 0._dp 
Y_d_mZ= 0._dp 
Y_u_mZ= 0._dp 
Y_l_0= 0._dp 
Y_d_0= 0._dp 
Y_u_0= 0._dp 
gauge= 0._dp 
gauge_mZ= 0._dp 
gauge_0 = 0._dp 
tanb= 0._dp 
vevSM= 0._dp 
tanb_mZ = 0._dp 
GUT_scale = 0._dp 
HPPloopHp = 0._dp 
HPPloopVWp = 0._dp 
HPPloopFd = 0._dp 
HPPloopFu = 0._dp 
HPPloopFe = 0._dp 
g1IN = 0._dp 
g1XIN = 0._dp 
g2IN = 0._dp 
g3IN = 0._dp 
gXIN = 0._dp 
gX1IN = 0._dp 
LamHIN = 0._dp 
LamPhiHIN = 0._dp 
LamPhiIN = 0._dp 
YvLIN = 0._dp 
YuLIN = 0._dp 
YvRIN = 0._dp 
YuRIN = 0._dp 
YdLIN = 0._dp 
YeLIN = 0._dp 
YdRIN = 0._dp 
YeRIN = 0._dp 
mChiDIN = 0._dp 
mChiEIN = 0._dp 
mChiNuIN = 0._dp 
mChiUIN = 0._dp 
mu2HIN = 0._dp 
mu2PhiIN = 0._dp 
g1 = 0._dp 
g1MZ = 0._dp 
g1X = 0._dp 
g1XMZ = 0._dp 
g2 = 0._dp 
g2MZ = 0._dp 
g3 = 0._dp 
g3MZ = 0._dp 
gX = 0._dp 
gXMZ = 0._dp 
gX1 = 0._dp 
gX1MZ = 0._dp 
LamH = 0._dp 
LamHMZ = 0._dp 
LamPhiH = 0._dp 
LamPhiHMZ = 0._dp 
LamPhi = 0._dp 
LamPhiMZ = 0._dp 
YvL = 0._dp 
YvLMZ = 0._dp 
YuL = 0._dp 
YuLMZ = 0._dp 
YvR = 0._dp 
YvRMZ = 0._dp 
YuR = 0._dp 
YuRMZ = 0._dp 
YdL = 0._dp 
YdLMZ = 0._dp 
YeL = 0._dp 
YeLMZ = 0._dp 
YdR = 0._dp 
YdRMZ = 0._dp 
YeR = 0._dp 
YeRMZ = 0._dp 
mChiD = 0._dp 
mChiDMZ = 0._dp 
mChiE = 0._dp 
mChiEMZ = 0._dp 
mChiNu = 0._dp 
mChiNuMZ = 0._dp 
mChiU = 0._dp 
mChiUMZ = 0._dp 
mu2H = 0._dp 
mu2HMZ = 0._dp 
mu2Phi = 0._dp 
mu2PhiMZ = 0._dp 
vHIN = 0._dp 
vPhiIN = 0._dp 
alphaH = 0._dp 
MAh = 0._dp 
MAh2 = 0._dp 
MFd = 0._dp 
MFd2 = 0._dp 
MFe = 0._dp 
MFe2 = 0._dp 
MFu = 0._dp 
MFu2 = 0._dp 
MFv = 0._dp 
MFv2 = 0._dp 
Mhh = 0._dp 
Mhh2 = 0._dp 
MHp = 0._dp 
MHp2 = 0._dp 
MVWp = 0._dp 
MVWp2 = 0._dp 
MVZ = 0._dp 
MVZ2 = 0._dp 
MVZp = 0._dp 
MVZp2 = 0._dp 
TW = 0._dp 
TWp = 0._dp 
ZDR = 0._dp 
ZER = 0._dp 
ZUR = 0._dp 
UV = 0._dp 
ZDL = 0._dp 
ZEL = 0._dp 
ZUL = 0._dp 
ZA = 0._dp 
ZH = 0._dp 
ZW = 0._dp 
ZZ = 0._dp 
vH = 0._dp 
vPhi = 0._dp 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
gPVZp = 0._dp 
gTVZp = 0._dp 
BRVZp = 0._dp 
ratioFd =  0._dp  
ratioFe =  0._dp  
ratioFu =  0._dp  
ratioHp =  0._dp  
ratioVWp =  0._dp  
ratioGG =  0._dp  
ratioPP =  0._dp  
ratioPFd =  0._dp  
ratioPFe =  0._dp  
ratioPFu =  0._dp  
ratioPHp =  0._dp  
ratioPVWp =  0._dp  
ratioPGG =  0._dp  
ratioPPP =  0._dp  
mh1sqINPUT=(0._dp,0._dp) 
mh2sqINPUT=(0._dp,0._dp) 
taINPUT=(0._dp,0._dp) 
mZpINPUT=(0._dp,0._dp) 
End Subroutine Set_All_Parameters_0 
 


Subroutine SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,           & 
& g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,               & 
& mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,MZsuffix)

Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: vH,vPhi

Logical,Intent(in)::MZsuffix 
Real(dp), Intent(in) :: g1SM, g2SM, g3SM, vSM 
Complex(dp),Intent(in) :: YuSM(3,3),YdSM(3,3),YeSM(3,3) 
If (MZsuffix) Then 
  g1MZ = g1SM 
  g2MZ = g2SM 
  g3MZ = g3SM 
  g1XMZ = 0 
  gX1MZ = 0 
  vHMZ = vSM 
Else 
  g1 = g1SM 
  g2 = g2SM 
  g3 = g3SM 
  g1X = 0 
  gX1 = 0 
  vH = vSM 
End if 
End Subroutine SetMatchingConditions 
End Module Model_Data_U1T3R