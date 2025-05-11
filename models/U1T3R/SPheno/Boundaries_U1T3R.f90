! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 12:54 on 7.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Boundaries_U1T3R 
 
Use Control 
Use Settings 
Use LoopCouplings_U1T3R 
Use LoopMasses_U1T3R 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_U1T3R 
Use RGEs_U1T3R 
Use RunSM_U1T3R 
 
Use Tadpoles_U1T3R 
Use RGEs_SM_HC 
Use LoopMasses_SM_HC 
Use CouplingsForDecays_U1T3R 
Use StandardModel 
 

 
Integer, save :: YukScen 
Real(dp), save :: Lambda, MlambdaS,F_GMSB 
Real(dp),save::mGUT_save,sinW2_Q_mZ&
&, mf_l_Q_SM(3),mf_d_Q_SM(3),mf_u_Q_SM(3) & 
&, mf_l_MS_SM(3),mf_d_MS_SM(3),mf_u_MS_SM(3) 
Complex(dp),save::Yl_mZ(3,3),Yu_mZ(3,3),Yd_mZ(3,3),Yl_Q(3,3),Yu_Q(3,3),Yd_Q(3,3)
Real(dp),Save::vevs_DR_save(2), vSM_save
Real(dp),Save::rMS_save
real(dp) :: delta_rhomatch,delta_rwmatch,delta_emmatch,newWscale,MVWm_scale
Contains 
 
Subroutine BoundarySM(i_run,Lambda_SM,delta0,g_SM,kont)

Implicit None 
Real(dp), Intent(out)::g_SM(62)
Integer, Intent(in) :: i_run 
Real(dp) :: mHiggs 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Complex(dp) ::uU_L_T(3,3),uU_R_T(3,3),uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), MuSM, adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp), Intent(in) :: Lambda_SM 
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp) :: Q2, logQ 


Real(dp) :: VEVSM1,VEVSM2,VEVSM1MZ,VEVSM2MZ 
Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3),smdr_lambda 
Iname=Iname+1
NameOfUnit(Iname)='BoundarySM'
mZ2=mZ**2 ! to correct for temporary settings in BoundaryBSM
sinW2 = 1 - mW**2/mZ**2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
If (i_run.Eq.1) Then
   vSM = 248.42485568930796_dp 
   Y_l=0._dp
   yl_MZ=0._dp
   yd_MZ=0._dp
   yu_MZ=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
       yl_MZ(i1,i1)=sqrt2*mf_l_mZ(i1)/vSM 
       yd_MZ(i1,i1)=sqrt2*mf_d_mZ(i1)/vSM 
       yu_MZ(i1,i1)=sqrt2*mf_u_mZ(i1)/vSM 
   End Do
   g1SM=0.3572555504761069_dp
   g2SM=0.6509845147468623_dp
   g3SM=1.2118095750036533_dp
   alphamz=g1SM**2*g2sm**2/(g1sm**2+g2sm**2)*oo4pi
   alpha3=g3sm**2*oo4pi
   smdr_lambda=2._dp*(0.1399865180248392_dp,0._dp)
   yu_mz(3,3) = 0.9701349914178578_dp
   sinW2_Q=g1sm**2/(g1sm**2+g2sm**2)
   sinW2_old=sinW2_Q
Else
   vSM = vSM_save 
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   alphaMZ = AlphaEW_MS_SM(mZ,mf_d,mf_u,mf_l) 
 
   alpha3 = AlphaS_MS_SM(mZ,mf_d,mf_u) 
   smdr_lambda=lambda_SM
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
End If
mHiggs= sqrt(smdr_lambda)*vSM 
MuSM = 0.5_dp*smdr_lambda*vSM**2 
mw=smmwfit(mHiggs,mf_u(3),alpha3) 
mw2=mW**2 
sinW2 = 1 - mW**2/mZ**2 
   If (.not.OneLoopMatching) alpha3= AlphaS_mZ 
   If (.not.OneLoopMatching) alphaMZ = Alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*rho_2(mHiggs/mf_u(3)) 
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
TW= Asin(Sqrt(sinw2_Q)) 
mHiggs= sqrt(smdr_lambda)*vSM 
MuSM = 0.5_dp*smdr_lambda*vSM**2 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,smdr_lambda,-YuSM,YdSM,YeSM,kont,              & 
& dmZ2,dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,smdr_lambda,-YuSM,YdSM,YeSM,kont,              & 
& dmZ2,dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q)  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) 
vSM=sqrt(vev2) 
mHiggs= sqrt(smdr_lambda)*vSM 
MuSM = 0.5_dp*smdr_lambda*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,smdr_lambda,-YuSM,YdSM,YeSM,kont,              & 
& dmZ2,dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
rho=1._dp/(1._dp-delta_rho)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta= 0._dp 
delta_rho0=0._dp
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
mw=smmwfit(mHiggs,mf_u(3),alpha3) 
mw2=mW**2 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

mw=smmwfit(mHiggs,mf_u(3),alpha3) 
mw2=mW**2 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ)  
vSM=sqrt(vev2) 


! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
  mf_l_MS_SM=mf_l_MZ
  mf_d_MS_SM=mf_d_MZ
  mf_u_MS_SM=mf_u_MZ
  mf_l_Q=mf_l_MS_SM
  mf_d_Q=mf_d_MS_SM
  mf_u_Q=mf_u_MS_SM
  YdSM=0._dp
  YuSM=0._dp
  YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_MS_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_MS_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_MS_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
  mf_l_Q=mf_l2
  mf_d_Q=mf_d2
  mf_u_Q=mf_u2
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM


! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements


! Full one-loop corrections
Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,smdr_lambda,-YuSM,YdSM,YeSM,sigR_d,          & 
& sigL_d,sigSR_d,sigSL_d,sigR_u,sigL_u,sigSR_u,sigSL_u,sigR_l,sigL_l,sigSR_l,            & 
& sigSL_l,kont)

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/mf_u_Q(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*mf_u_q(3)*(4._dp+3._dp*LogQ) &
&-mf_u_q(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
Else  
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*mf_u_q(3)*(4._dp+3._dp*LogQ) &
& -oo16pi2*mf_u_q(3)*((2821._dp + 2028._dp*LogQ + 396._dp*LogQ**2 + 16._dp*Pi**2*(1._dp + 2._dp*log2) - 48._dp*Zeta3)*gSU3**4/18._dp) &
&-mf_u_q(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
End if 
SigQCD=oo16pi2*SigQCD

mf_u_MS_SM(3)=mf_u(3)+SigQCD



! Obtain Yukawas
Call Yukawas(mf_u_MS_SM,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas(mf_d_MS_SM,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas(mf_l_MS_SM,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call FermionMass(YdSM,vSM,mf_d_Q,uD_L_T,uD_R_T,kont) 
Call FermionMass(YeSM,vSM,mf_l_Q,uL_L_T,uL_R_T,kont)
Call FermionMass(YuSM,vSM,mf_u_Q,uU_L_T,uU_R_T,kont)


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge
Call ParametersToG62_SM(g1SM,g2SM,g3SM,Lambda_SM,YuSM,YdSM,YeSM,MuSM,vSM,g_SM)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas(mf,vev,uL,uR,SigS,SigL,SigR,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invY
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
Y=Y*vev*oosqrt2
If (ReSum) Then
kont=0
Call chop(Y)
invY=Y
Call gaussj(kont,invY,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invY)-Transpose(SigL)-Matmul(Y,Matmul(SigR,invY))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Y=Matmul(invf,mass)
Else
Y=mass+SigS+Matmul(Transpose(SigL),Y)+Matmul(Y,SigR)
End If
Y=sqrt2*Y/vev
Call chop(y)
End Subroutine Yukawas

End Subroutine BoundarySM 
 
Subroutine BoundaryBSM(i_run,g_SM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,             & 
& ZER,ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,           & 
& LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,           & 
& delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:) 
Real(dp),Intent(in) :: g_SM(62) 
Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(inout) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(inout) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vH,vPhi

Complex(dp) :: cplAhcHpVWp(2),cplhhcHpVWp(2),cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,          & 
& cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP(2,2),cplcFdFdVPL(6,6),& 
& cplcFdFdVPR(6,6),cplcFeFeVPL(6,6),cplcFeFeVPR(6,6),cplcFuFuVPL(6,6),cplcFuFuVPR(6,6),  & 
& cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ(2),cplhhVPVZp(2),  & 
& cplHpcVWpVP,cplcVWpVPVWp,cplAhAhVPVP(2,2),cplhhhhVPVP(2,2),cplcVWpVPVPVWp1,            & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplAhhhVZ(2,2),cplcFdFdVZL(6,6),cplcFdFdVZR(6,6),      & 
& cplcFeFeVZL(6,6),cplcFeFeVZR(6,6),cplcFuFuVZL(6,6),cplcFuFuVZR(6,6),cplFvFvVZL(9,9),   & 
& cplFvFvVZR(9,9),cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplhhVZVZp(2),cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ(2,2),cplhhhhVZVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,        & 
& cplcVWpVWpVZVZ3,cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,        & 
& cplcVWpVWpVZpVZp3,cplAhHpcVWp(2),cplcFdFucVWpL(6,6),cplcFdFucVWpR(6,6),cplcFeFvcVWpL(6,9),& 
& cplcFeFvcVWpR(6,9),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,           & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp(2),cplhhcVWpVWp(2),cplAhAhcVWpVWp(2,2),       & 
& cplhhhhcVWpVWp(2,2),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,          & 
& cplAhAhVPVZ(2,2),cplhhhhVPVZ(2,2),cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,        & 
& cplcVWpVPVWpVZ3,cplAhAhVPVZp(2,2),cplhhhhVPVZp(2,2),cplHpcHpVPVZp,cplcVWpVPVWpVZp1,    & 
& cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp(2,2),cplhhhhVZVZp(2,2),cplHpcHpVZVZp,   & 
& cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3

Complex(dp) :: cplcUFdFdAhL(6,6,2),cplcUFdFdAhR(6,6,2),cplcUFdFdhhL(6,6,2),cplcUFdFdhhR(6,6,2),      & 
& cplcUFdFdVGL(6,6),cplcUFdFdVGR(6,6),cplcUFdFdVPL(6,6),cplcUFdFdVPR(6,6),               & 
& cplcUFdFdVZL(6,6),cplcUFdFdVZR(6,6),cplcUFdFdVZpL(6,6),cplcUFdFdVZpR(6,6),             & 
& cplcUFdFucHpL(6,6),cplcUFdFucHpR(6,6),cplcUFdFucVWpL(6,6),cplcUFdFucVWpR(6,6),         & 
& cplcUFuFuAhL(6,6,2),cplcUFuFuAhR(6,6,2),cplcUFuFdHpL(6,6),cplcUFuFdHpR(6,6),           & 
& cplcUFuFdVWpL(6,6),cplcUFuFdVWpR(6,6),cplcUFuFuhhL(6,6,2),cplcUFuFuhhR(6,6,2),         & 
& cplcUFuFuVGL(6,6),cplcUFuFuVGR(6,6),cplcUFuFuVPL(6,6),cplcUFuFuVPR(6,6),               & 
& cplcUFuFuVZL(6,6),cplcUFuFuVZR(6,6),cplcUFuFuVZpL(6,6),cplcUFuFuVZpR(6,6),             & 
& cplcUFeFeAhL(6,6,2),cplcUFeFeAhR(6,6,2),cplcUFeFehhL(6,6,2),cplcUFeFehhR(6,6,2),       & 
& cplcUFeFeVPL(6,6),cplcUFeFeVPR(6,6),cplcUFeFeVZL(6,6),cplcUFeFeVZR(6,6),               & 
& cplcUFeFeVZpL(6,6),cplcUFeFeVZpR(6,6),cplcUFeFvcHpL(6,9),cplcUFeFvcHpR(6,9),           & 
& cplcUFeFvcVWpL(6,9),cplcUFeFvcVWpR(6,9)

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(6,6),uU_R(6,6),uD_L(6,6),uD_R(6,6), NoMatrix(3,3) &
&,uL_L(6,6),uL_R(6,6)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaQ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_Q,CosW2SinW2,gauge(3),delta,delta_SM,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp) :: mz2save,mw2save,rMS_save,rMS_SM_save,alpha_DR,mz2_dr,mw2_dr,sw2cw2_sm,vev2_dr
complex(dp) :: treelambda,dmZ2_SM_DR,dmw2_SM_DR
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dMZ2_SM, dMW2_SM, dMW2_0_SM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(6,6),SigSL_u(6,6),sigR_u(6,6),SigL_u(6,6)
Complex(dp) :: SigSR_d(6,6),SigSL_d(6,6),SigR_d(6,6),SigL_d(6,6)
Complex(dp) :: SigSR_l(6,6),SigSL_l(6,6),sigR_l(6,6),SigL_l(6,6)
Complex(dp) :: SigSR_u_SM(3,3),SigSL_u_SM(3,3),sigR_u_SM(3,3),SigL_u_SM(3,3)
Complex(dp) :: SigSR_d_SM(3,3),SigSL_d_SM(3,3),SigR_d_SM(3,3),SigL_d_SM(3,3)
Complex(dp) :: SigSR_l_SM(3,3),SigSL_l_SM(3,3),sigR_l_SM(3,3),SigL_l_SM(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Real(dp) :: g1_MS, g2_MS,g3_MS,v_MS, mf_d_MS(3), mf_u_MS(3), mf_e_MS(3) 
Complex(dp) :: Yu_MS(3,3),Yd_MS(3,3),Ye_MS(3,3), Mu_MS, Lam_MS, MuSM 
Complex(dp) :: uU_L_MS(3,3),uU_R_MS(3,3)&
&,uD_L_MS(3,3),uD_R_MS(3,3),uL_L_MS(3,3),uL_R_MS(3,3), CKM_MS(3,3), delta_r_SM
Complex(dp) :: uU_L_T(6,6),uU_R_T(6,6)&
&,uD_L_T(6,6),uD_R_T(6,6),uL_L_T(6,6),uL_R_T(6,6)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ, sinTW_MS, alphaEW_MS, alphaS_MS, mudim, mz2_MS, mw2_MS 


Real(dp) :: VEVSM1,VEVSM2,VEVSM1MZ,VEVSM2MZ 
Complex(dp) ::MassFu(6,6),MassFd(6,6),MassFe(6,6) 
Real(dp),Parameter::id6R(6,6)=& 
   & Reshape(Source=(/& 
   & 1,0,0,0,0,0,& 
 &0,1,0,0,0,0,& 
 &0,0,1,0,0,0,& 
 &0,0,0,1,0,0,& 
 &0,0,0,0,1,0,& 
 &0,0,0,0,0,1& 
 &/),shape=(/6,6/)) 
Complex(dp),Parameter::id6C(6,6)=& 
   & Reshape(Source=(/& 
   & 1,0,0,0,0,0,& 
 &0,1,0,0,0,0,& 
 &0,0,1,0,0,0,& 
 &0,0,0,1,0,0,& 
 &0,0,0,0,1,0,& 
 &0,0,0,0,0,1& 
 &/),shape=(/6,6/)) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryBSM'
rMS_SM = rMS 
tanb = tanbetaMZ 
sinW2 = 1 - mW**2/mZ**2 
mudim = GetRenormalizationScale() 
mudim = sqrt(mudim) 
Call GToParameters62_SM(g_SM,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,Mu_MS,v_MS) 
sinTW_MS = g1_MS/sqrt(g1_MS**2+g2_MS**2) 
sinW2_Q = sinTW_MS**2 
alphaEW_MS = (sinTW_MS*g2_MS)**2/(4._dp*Pi) 
alphaS_MS = g3_MS**2/(4._dp*Pi) 
mz2_MS = (g1_MS**2+g2_MS**2)/(4._dp)*(v_MS**2) 
mw2_MS = (g2_MS**2)/(4._dp)*(v_MS**2) 
rMS_save=rMS
mz2save = mz2
mz2 = mz2_ms
rMS=1._dp
rMS_SM=1._dp
Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,-Yu_MS,Yd_MS,Ye_MS,kont,            & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

rMS=rMS_save
rMS_SM=rMS
Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,-Yu_MS,Yd_MS,Ye_MS,kont,            & 
& dmZ2_SM_DR,dmW2_SM_DR,dmW2_0_SM)

mz2_dr=mz2_ms+dmz2_sm_dr-dmz2_sm
mw2_dr=mw2_ms+dmw2_sm_dr-dmw2_sm
sw2cw2_sm=g1_MS**2*g2_MS**2/(g1_MS**2+g2_MS**2)**2+(1._dp-rMS)*(alphaEW_MS/(6._dp*Pi)*(1._dp-sinw2_q)*(2._dp*sinw2_q-1._dp))
alpha_dr=alphaew_MS+(1._dp-rMS)*alphaew_MS**2/(6._dp*Pi)
vev2_dr=mz2_dr*sw2cw2_sm/(pi*alpha_dr)
sinW2_Q=0.5_dp-Sqrt(0.25_dp-sw2cw2_sm)
   Call FermionMass(Yd_MS,v_MS,mf_d_MS,uD_L_MS,uD_R_MS,kont)
   Call FermionMass(Ye_MS,v_MS,mf_e_MS,uL_L_MS,uL_R_MS,kont)
   Call FermionMass(Yu_MS,v_MS,mf_u_MS,uU_L_MS,uU_R_MS,kont)
   CKM_MS = MatMul(uU_R_MS,Transpose(Conjg(uD_R_MS))) 
!-----------------
!sin(theta_W)^2
!-----------------
!vSM = v_MS 
vSM = sqrt(vev2_dr) 
   sinW2_old=sinW2_Q
   mf_l2=mf_e_MS**2
   mf_d2=mf_d_MS**2
   mf_u2=mf_u_MS**2
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaQ = AlphaEw_T(alphaEW_MS,mudim,Abs(MHp),Abs(MVWp),Abs(MFd),Abs(MFu),Abs(MFe)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaS_T(alphaS_MS,mudim,Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = alphaS_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
If (i_run.eq.1) Then 
 YeSM=Yl_MZ
 YdSM=Yd_MZ
 YuSM=Yu_MZ
Else 
 YeSM=Yl_Q
 YdSM=Yd_Q
 YuSM=Yu_Q
End if 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 
mZ2 = MVZ2 
mW2 = MVWp2 
MVZ= Sqrt(MVZ2) 
MVWp2 = mW2 
MVWp= Sqrt(MVWp2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
If (.not.MatchZWpoleMasses) Then 
Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,  & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,               & 
& cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,             & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,            & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplAhAhVPVZp,cplhhhhVPVZp,             & 
& cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp,         & 
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

treelambda = Mhh2(1)/vSM**2
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,treelambda,-YuSM,YdSM,YeSM,kont,               & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_DR,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWp2 = mW2_run 
MVWp= Sqrt(MVWp2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=Sqrt(vev2)
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,  & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,               & 
& cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,             & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,            & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplAhAhVPVZp,cplhhhhVPVZp,             & 
& cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp,         & 
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

treelambda = Mhh2(1)/vSM**2
rMS_SM_save=rMS_SM
rMS_SM=rMS
Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,treelambda,-YuSM,YdSM,YeSM,kont,               & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_DR,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWp2 = mW2_run 
MVWp= Sqrt(MVWp2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q *CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

mW2 = MVWp2
mZ2 = MVZ2
Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,  & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,               & 
& cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,             & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,            & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplAhAhVPVZp,cplhhhhVPVZp,             & 
& cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp,         & 
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

Call Pi1LoopVWp(mW2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,            & 
& Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,dmW2)

Call Pi1LoopVWp(0._dp,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,               & 
& MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,  & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,dmW2_0)

treelambda = Mhh2(1)/vSM**2
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,treelambda,-YuSM,YdSM,YeSM,kont,               & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
dmW2 = dmW2 - dmW2_SM
dmW2_0 = dmW2_0 - dmW2_0_SM
If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=MW2*(g1SM**2+g2SM**2)/g2SM**2/MZ2-1._dp
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2_Q,sinW2_Q,rho,MAh,MFe,MFv,Mhh,MHp,MVZp,g1,g1X,g2,gX,               & 
& gX1,TW,TWp,ZER,UV,ZEL,YeL,YeR,YvL,YvR,ZA,ZH,delta)

Call DeltaVB_SM(sinW2_Q,sinW2_Q,g2SM,rho,delta_SM)

 delta=delta-delta_SM 
Else 
 delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_rho0=MW2*(g1SM**2+g2SM**2)/g2SM**2/MZ2-1._dp
delta_r=(1._dp+delta_rho0)*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
delta_rhomatch=Real(dmZ2,dp)/mZ2-(1._dp+delta_rho0)*Real(dmW2,dp)/mW2
delta_rwmatch=Real(dmW2_0,dp)/mW2-Real(dmW2,dp)/mW2+delta
delta_emmatch= DeltaAlphaEW_T(g1sm**2*g2sm**2*oo4pi/(g1sm**2+g2sm**2),mudim,Abs(MHp),Abs(MVWp),Abs(MFd),Abs(MFu),Abs(MFe)) 
 
CosW2SinW2=sw2cw2_sm*(1._dp+delta_emmatch+delta_r)/(1._dp+delta_rho0)
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

newWscale=sinW2_Q/(1._dp-2._dp*sinW2_Q)*((1._dp/sinW2_Q -1._dp)*(delta_rho0+delta_rhomatch)-delta_rwmatch-delta_emmatch)
mZ2 = mZ2save 
If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at renormalisation scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
Else 
Call CouplingsForVectorBosons(g2,ZA,ZH,g1,TW,g1X,TWp,vH,gX1,ZDL,ZDR,ZEL,              & 
& ZER,ZUL,ZUR,UV,gX,vPhi,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,      & 
& cplcHpVWpVZ,cplcHpVWpVZp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVP,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplhhVPVZ,cplhhVPVZp,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplAhAhVPVP,cplhhhhVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,  & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplhhVZVZp,cplHpcVWpVZ,      & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& cplHpcVWpVZp,cplcVWpVWpVZp,cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,      & 
& cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,cplcgWCgZcVWp,cplcgWCgZpcVWp,               & 
& cplhhHpcVWp,cplhhcVWpVWp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,cplcVWpcVWpVWpVWp1,             & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplAhAhVPVZ,cplhhhhVPVZ,cplHpcHpVPVZ,            & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplAhAhVPVZp,cplhhhhVPVZp,             & 
& cplHpcHpVPVZp,cplcVWpVPVWpVZp1,cplcVWpVPVWpVZp2,cplcVWpVPVWpVZp3,cplAhAhVZVZp,         & 
& cplhhhhVZVZp,cplHpcHpVZVZp,cplcVWpVWpVZVZp1,cplcVWpVWpVZVZp2,cplcVWpVWpVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZp,MVZp2,MHp,MHp2,MVWp,MVWp2,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpcHpVZ,cplHpcVWpVZ,cplcVWpVWpVZ,       & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,  & 
& kont,dmZ2)

Call Pi1LoopVWp(mW2,MHp,MHp2,MAh,MAh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,            & 
& Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,cplAhHpcVWp,cplcFdFucVWpL,cplcFdFucVWpR,       & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZpgWpcVWp,  & 
& cplcgWCgZcVWp,cplcgWCgZpcVWp,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,         & 
& cplHpcVWpVZp,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZp,cplAhAhcVWpVWp,cplhhhhcVWpVWp,    & 
& cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcVWpVWpVZpVZp1,cplcVWpVWpVZpVZp2,cplcVWpVWpVZpVZp3,kont,dmW2)

Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,kont,             & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

If (.not.OneLoopMatching) dmZ2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_0_SM = 0._dp 
mZ2_run=mZ2_DR-dmZ2+dmz2_SM
mW2_run=mw2_DR-dmW2+dmw2_SM
sinW2_Q=1._dp-mW2_run/MZ2_run
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM=sqrt(4._dp*mz2_run/(g1SM**2+g2SM**2))
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

vev2=4._dp*mz2_run/(g1SM**2+g2SM**2) -(0) 
vSM=sqrt(vev2) 
End If 
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHp=MVWp
MHp2=MVWp2
If (.not.MatchZWpoleMasses) Then 
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Else 
mW2=(1._dp-sinW2_Q)*MZ2 
mW=Sqrt(mW2)
End If 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM_Q = vSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id6C
uU_R=id6C
uD_L=id6C
uD_R=id6C
uL_L=id6C
uL_R=id6C
If (GenerationMixing) Then
    Call Adjungate(CKM_MS,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM_MS
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_e_MS*(1._dp-alphaQ/(4._dp*Pi))
   mf_d_Q_SM=mf_d_MS*(1._dp-alpha3/(3._dp*pi)&
           &-43._dp*alpha3**2/(144._dp*Pi2) - alphaQ/(36._dp*Pi))
   mf_u_Q_SM(1:3)=mf_u_MS(1:3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
Else 
   mf_l_Q_SM=mf_e_MS
   mf_d_Q_SM=mf_d_MS
   mf_u_Q_SM=mf_u_MS
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(YdL,YdR,ZA,ZDL,ZDR,ZH,g3,g1,g2,gX1,TW,gX,g1X,             & 
& TWp,YuL,ZUL,ZUR,YuR,YeL,YeR,ZEL,ZER,YvL,UV,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,     & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,   & 
& cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,      & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFeFeAhL,       & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,   & 
& cplcUFeFvcVWpR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,            & 
& MHp2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,          & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,sigR_l,sigL_l,               & 
& sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHp,            & 
& MHp2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,          & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR, & 
& sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,            & 
& Mhh2,MVZ,MVZ2,MVZp,MVZp2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,          & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,sigR_d_SM,            & 
& sigL_d_SM,sigSR_d_SM,sigSL_d_SM,sigR_u_SM,sigL_u_SM,sigSR_u_SM,sigSL_u_SM,             & 
& sigR_l_SM,sigL_l_SM,sigSR_l_SM,sigSL_l_SM,kont)

sigR_l(1:3,1:3) = sigR_l(1:3,1:3) - sigR_l_SM
sigL_l(1:3,1:3) = sigL_l(1:3,1:3) - sigL_l_SM
sigSR_l(1:3,1:3) = sigSR_l(1:3,1:3) - sigSR_l_SM
sigSL_l(1:3,1:3) = sigSL_l(1:3,1:3) - sigSL_l_SM
sigR_d(1:3,1:3) = sigR_d(1:3,1:3) - sigR_d_SM
sigL_d(1:3,1:3) = sigL_d(1:3,1:3) - sigL_d_SM
sigSR_d(1:3,1:3) = sigSR_d(1:3,1:3) - sigSR_d_SM
sigSL_d(1:3,1:3) = sigSL_d(1:3,1:3) - sigSL_d_SM
sigR_u(1:3,1:3) = sigR_u(1:3,1:3) - sigR_u_SM
sigL_u(1:3,1:3) = sigL_u(1:3,1:3) - sigL_u_SM
sigSR_u(1:3,1:3) = sigSR_u(1:3,1:3) - sigSR_u_SM
sigSL_u(1:3,1:3) = sigSL_u(1:3,1:3) - sigSL_u_SM


If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,6
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,6
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,6
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas6(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If
Call Yukawas6(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If 
Call Yukawas6(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(mChiE,YeL,YeR,vH,vPhi,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(mChiU,YuL,YuR,vH,vPhi,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(mChiD,YdL,YdR,vH,vPhi,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_Q=YeSM
Yd_Q=YdSM
Yu_Q=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)

! sinW2_Q_mZ=sinW2_Q
! vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
Select Case(BoundaryCondition) 
End Select 

! ----------------------- 
 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gX = 1*gX 
g1X = Sqrt(5._dp/3._dp)*g1X 
gX1 = 1*gX1 
! ----------------------- 
 
Call ParametersToG227(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,            & 
& YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,gMZ)

rMS_SM = 1._dp 
mZ2 = mz2save 
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas6(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(6),vev
Complex(dp),Dimension(6,6),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(6,6)
Complex(dp),Intent(out)::Y(3,3)
Complex(dp) :: Ysave(3,3) 
Integer::i1, i2, ierr
Logical::converged=.false.
Complex(dp),Dimension(6,6) :: mass, uLa, uRa, f, invf, invMass2, Ytemp, & 
 &  uLnew, uRnew, mat2(6,6), mat1(6,6)
Real(dp) :: Mf2_t(6),test2(2),diff(3,3)
Ysave=1._dp 

Do i2=1,100 
  mat1=MassMatrix-SigS-MatMul(SigL,MassMatrix)-MatMul(MassMatrix,SigR) 
  mat2=Matmul(Transpose(Conjg(mat1)),mat1)
  Call EigenSystem(mat2,Mf2_t,uRnew,ierr,test2) 
  mat2=Matmul(mat1,Transpose(Conjg(mat1)))
  Call EigenSystem(mat2,Mf2_t,uLnew,ierr,test2)

  uLnew(1:3,1:3)=uL(1:3,1:3) 
  uRnew(1:3,1:3)=uR(1:3,1:3) 
  mass=0._dp
   Do i1=1,3 
    mass(i1,i1)=mf(i1) 
   End Do

   Do i1=4,6 
    mass(i1,i1)= sqrt(Mf2_t(i1)) 
   End Do

  mass=Matmul(Transpose(uLnew),Matmul(mass,uRnew))
  Ytemp=mass+SigS+Matmul(SigL,MassMatrix)+Matmul(MassMatrix,SigR)
  Y=sqrt2*Ytemp(1:3,1:3)/vev 
  Call chop(y)
  MassMatrix(1:3,1:3)=Ytemp(1:3,1:3)
  diff=Abs(Y-Ysave)
  Where (diff.gt.1.E-10_dp) diff=diff/Y
  Ysave=Y
 If (Maxval(diff).lt.10E-7_dp) Exit
End do 

End Subroutine Yukawas6

End Subroutine BoundaryBSM 
 
Subroutine Match_and_Run(delta0,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,              & 
& ZUR,UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,            & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,mGut,kont,            & 
& WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: g_SM(62) 
Real(dp) :: delta0,deltaG0, gA(227), gB(227)
Real(dp) :: gC(229),  gD(229) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(2), lambda_SM, lambda_MZ 
Real(dp) :: comp(2), tanbQ, vev2 
Complex(dp) :: cplAhAhUhh(2,2,2),cplAhUhhVP(2,2),cplAhUhhVZ(2,2),cplAhUhhVZp(2,2),cplcFdFdUhhL(6,6,2),& 
& cplcFdFdUhhR(6,6,2),cplcFeFeUhhL(6,6,2),cplcFeFeUhhR(6,6,2),cplcFuFuUhhL(6,6,2),       & 
& cplcFuFuUhhR(6,6,2),cplFvFvUhhL(9,9,2),cplFvFvUhhR(9,9,2),cplcgWpgWpUhh(2),            & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplcgZpgZUhh(2),cplcgZgZpUhh(2),cplcgZpgZpUhh(2),      & 
& cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpcVWp(2),cplUhhVPVZ(2),cplUhhVPVZp(2),         & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplUhhVZVZp(2),cplUhhVZpVZp(2),cplAhAhUhhUhh(2,2,2,2),  & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVPVP(2,2),cplUhhUhhcVWpVWp(2,2),   & 
& cplUhhUhhVZVZ(2,2),cplUhhUhhVZpVZp(2,2)

Real(dp),Intent(inout) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(inout) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Real(dp),Intent(inout) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(inout) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp) ::mass_new(32),mass_old(32),diff_m(32)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2, mh_SM 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Match_and_Run'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+1) = Mhh
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+1) = MAh
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+0) = MHp
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Lambda_MZ = 0.1_dp 
rMS_save=rMS 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
rMS = 1._dp
rMS_SM = 1._dp
Call BoundarySM(j,Lambda_MZ,delta0,g_SM,kont)

rMS = rMS_save
g_SM_save = g_SM 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
g_SM(1) = Sqrt(5._dp/3._dp)*g_SM(1) 
Call odeint(g_SM,62,tz,0._dp,delta0,dt,0._dp,rge62_SM,kont)

g_SM(1) = Sqrt(3._dp/5._dp)*g_SM(1) 
If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundaryBSM(j,g_SM,alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,              & 
& UV,ZDL,ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,            & 
& YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
mGUT = 1._dp 
Call GToParameters227(gB,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,             & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi)


 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vPhi = vPhiIN 
 g1X = g1XIN 
 gX = gXIN 
 gX1 = gX1IN 
 LamH = LamHIN 
 LamPhiH = LamPhiHIN 
 LamPhi = LamPhiIN 
 YvL = YvLIN 
 YuL = YuLIN 
 YvR = YvRIN 
 YuR = YuRIN 
 YdL = YdLIN 
 YeL = YeLIN 
 YdR = YdRIN 
 YeR = YeRIN 
 mChiD = mChiDIN 
 mChiE = mChiEIN 
 mChiNu = mChiNuIN 
 mChiU = mChiUIN 
 mu2H = mu2HIN 
 mu2Phi = mu2PhiIN 
 gX = gXIN
gX1 = gX1IN
g1X = g1XIN
vPhi = mZpINPUT/gX
vH = 2*Sqrt(mW2/g2**2)
LamH = (mh1sqINPUT + mh2sqINPUT*taINPUT**2)/(2._dp*(1 + taINPUT**2)*vH**2)
LamPhi = (mh2sqINPUT + mh1sqINPUT*taINPUT**2)/(2._dp*(1 + taINPUT**2)*vPhi**2)
LamPhiH = ((-1._dp*(mh1sqINPUT) + mh2sqINPUT)*taINPUT)/((1 + taINPUT**2)*vH*vPhi)
YdL = YdLIN
YuL = YuLIN
YeL = YeLIN
YvL = YvLIN
YdR = YdRIN
YuR = YuRIN
YeR = YeRIN
YvR = YvRIN
mChiU = mChiUIN
mChiD = mChiDIN
mChiE = mChiEIN
mChiNu = mChiNuIN
End if
 
 ! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gX = 1*gX 
g1X = Sqrt(3._dp/5._dp)*g1X 
gX1 = 1*gX1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
Call OneLoopMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+1) = Mhh
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+1) = MAh
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+0) = MHp
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (j.lt.niter) Then 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp 
g_SM(1)=g_SM(1)*sqrt(5._dp/3._dp) 
g_SM(4)=Mhh2(1)/g_SM(62)**2 
Call odeint(g_SM,62,0._dp,tz,delta0,dt,0._dp,rge62_SM,kont) 
g_SM(1)=g_SM(1)/sqrt(5._dp/3._dp) 
Lambda_MZ=g_SM(4) 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

If (((Calculate_mh_within_SM).and.(Mhh(2).gt.300._dp)).OR.(Force_mh_within_SM))Then
Write(*,*) "Calculate Higgs mass within effective SM " 
Call Get_mh_pole_SM(g_SM,mudim,delta0,Mhh2(1),mh_SM) 
Mhh2(1) = mh_SM**2 
Mhh(1) = mh_SM 
End if
If (MatchZWpoleMasses) newWscale=0._dp
MVwm_scale=smmwfit(Mhh(1),MFu(3),alphas_MZ)*(1._dp+0.5_dp*newWscale)
MVWp = MVwm_scale
MVWp2 = MVwm_scale**2
mW = MVwm_scale
mW2 = MVwm_scale**2
MHp=MVWp
MHp2=MVWp2
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Match_and_Run
 
Subroutine FirstGuess(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,            & 
& ZEL,ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,kont)

Implicit None 
Real(dp),Intent(out) :: g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,mu2H,mu2Phi

Complex(dp),Intent(out) :: YvL(3,3),YuL(3,3),YvR(3,3),YuR(3,3),YdL(3,3),YeL(3,3),YdR(3,3),YeR(3,3),              & 
& mChiD(3,3),mChiE(3,3),mChiNu(3,3),mChiU(3,3)

Real(dp),Intent(out) :: alphaH,MAh(2),MAh2(2),MFd(6),MFd2(6),MFe(6),MFe2(6),MFu(6),MFu2(6),MFv(9),            & 
& MFv2(9),Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZA(2,2),         & 
& ZH(2,2),ZZ(3,3)

Complex(dp),Intent(out) :: ZDR(6,6),ZER(6,6),ZUR(6,6),UV(9,9),ZDL(6,6),ZEL(6,6),ZUL(6,6),ZW(2,2)

Integer,Intent(inout)::kont
Integer :: i1, i2
Real(dp),Intent(inout) :: vH,vPhi

Real(dp)::vev,vevs(2),vev2,mgut,mudim,mudimNew,sigma(2),cosW,cosW2,sinW2 
Complex(dp):: YeSM(3,3), YdSM(3,3), YuSM(3,3) 
Real(dp) :: k_fac, g1SM, g2SM, g3SM, vSM 
Real(dp), Parameter :: oo2pi=1._dp/(2._dp*pi),oo6pi=oo2pi/3._dp 
Real(dp):: gA(227), gB(227), Scale_Save 
Logical::TwoLoopRGE_save, UseFixedScale_save 
Real(dp) :: VEVSM1,VEVSM2,VEVSM1MZ,VEVSM2MZ 
Iname=Iname+1 
NameOfUnit(Iname)="FirstGuess" 
If (HighScaleModel.eq."LOW") UseFixedGUTScale = .true. 

KineticMixingSave = KineticMixing 
KineticMixing = .False. 
If (.not.KineticMixing) Then 
g1X = 0._dp 
gX1 = 0._dp 
End if 
mW2=mZ2*(0.5_dp+Sqrt(0.25_dp-Alpha_Mz*pi/(sqrt2*G_F*mZ2)))
mW=Sqrt(mW2) 
cosW2=mw2/mZ2 
sinW2=1._dp-cosW2 
cosW=Sqrt(cosW2) 
 
g1SM=Sqrt(3._dp/5._dp)*Sqrt(20._dp*pi*alpha_mZ/(3._dp*(1._dp-sinW2))) 
g2SM=Sqrt(4._dp*pi*alpha_mZ/(sinW2)) 
g3SM=Sqrt(4._dp*pi*alphas_mZ) 
vSM=2._dp*mW/g2SM 
YeSM=0._dp 
YdSM=0._dp 
YuSM=0._dp 
Do i1=1,3 
  YeSM(i1,i1)=sqrt2*mf_L_mZ(i1)/vSM 
  If (i1.Eq.3) Then! top and bottom are special: 
  ! TanBeta Aufsummierung fehlt bei Yd!! 
  YuSM(i1,i1)=sqrt2*mf_U(i1)/vSM& 
    &*(1._dp-oo3pi*alphas_mZ*(5._dp+3._dp*Log(mZ2/mf_u2(3)))) 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/(vSM * (1._dp + 0.015*tanb)) 
Else 
  YuSM(i1,i1)=sqrt2*mf_U_mZ(i1)/vSM 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/vSM 
End If  
End Do 
If (GenerationMixing) Then 
  If (YukawaScheme.Eq.1) Then 
    YuSM=Matmul(Transpose(CKM),YuSM) 
  Else 
    YdSM=Matmul(Conjg(CKM),YdSM) 
  End If 
End If 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vH,vPhi,g1,              & 
& g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,            & 
& mChiE,mChiNu,mChiU,mu2H,mu2Phi,.False.)


 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vPhi = vPhiIN 
 g1X = g1XIN 
 gX = gXIN 
 gX1 = gX1IN 
 LamH = LamHIN 
 LamPhiH = LamPhiHIN 
 LamPhi = LamPhiIN 
 YvL = YvLIN 
 YuL = YuLIN 
 YvR = YvRIN 
 YuR = YuRIN 
 YdL = YdLIN 
 YeL = YeLIN 
 YdR = YdRIN 
 YeR = YeRIN 
 mChiD = mChiDIN 
 mChiE = mChiEIN 
 mChiNu = mChiNuIN 
 mChiU = mChiUIN 
 mu2H = mu2HIN 
 mu2Phi = mu2PhiIN 
 gX = gXIN
gX1 = gX1IN
g1X = g1XIN
vPhi = mZpINPUT/gX
vH = 2*Sqrt(mW2/g2**2)
LamH = (mh1sqINPUT + mh2sqINPUT*taINPUT**2)/(2._dp*(1 + taINPUT**2)*vH**2)
LamPhi = (mh2sqINPUT + mh1sqINPUT*taINPUT**2)/(2._dp*(1 + taINPUT**2)*vPhi**2)
LamPhiH = ((-1._dp*(mh1sqINPUT) + mh2sqINPUT)*taINPUT)/((1 + taINPUT**2)*vH*vPhi)
YdL = YdLIN
YuL = YuLIN
YeL = YeLIN
YvL = YvLIN
YdR = YdRIN
YuR = YuRIN
YeR = YeRIN
YvR = YvRIN
mChiU = mChiUIN
mChiD = mChiDIN
mChiE = mChiEIN
mChiNu = mChiNuIN
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,               & 
& YuL,YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,vH,vPhi,              & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(alphaH,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,              & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDR,ZER,ZUR,UV,ZDL,ZEL,            & 
& ZUL,ZA,ZH,ZW,ZZ,vH,vPhi,g1,g1X,g2,g3,gX,gX1,LamH,LamPhiH,LamPhi,YvL,YuL,               & 
& YvR,YuR,YdL,YeL,YdR,YeR,mChiD,mChiE,mChiNu,mChiU,mu2H,mu2Phi,GenerationMixing,kont)

MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
Iname=Iname-1 
End subroutine FirstGuess 
End Module Boundaries_U1T3R 
