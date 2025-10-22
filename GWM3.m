%% Model taked from Cabezas & Whitmore, originally on simulink, and 
%modified by Rodriguez-Gonzalez, including energy concepts from Kotecha
%work

function Z = GWM3(xx)

%% VALORES INICIALES

FISH=0;
% Caso particular
Ito=0; Case=3; pais=0;

time = 100;       % time in years for sustainability analisys 
t=0:time;         % integration steps

% nivel por debajo del cual los elementos del ecosistema natural no se reproducen
belownoreproduction=1e-4; 

% Valores iniciales
P1(1)	=	0.127639522	;
P2(1)	=	6.637479579	;
P3(1)	=	1.181396149	;
H1(1)	=	1.248945367	;
H2(1)	=	0.065892868	;
H3(1)	=	1.073417243	;
C1(1)	=	1.358944396	;
C2(1)	=	0.611883366	;
HH(1)	=	0.4507;
ISmass(1)	=	0.508187978	;
RP(1)	=	20.10894289	;
IRP(1)	=	0.881746274	;
numHH(1)	=	1000	;

P1H1massdeficit(1) = 0;  
P1ISmassdeficit(1) = 0;  
P1HHmassdeficit(1) = 0;  
H1massdeficit(1) = 0;    
ISmassdeficit(1) = 0;    
P1massdeficit(1)= P1H1massdeficit(1)+P1ISmassdeficit(1)+P1HHmassdeficit(1);

percapmass(1)=HH(1)/numHH(1); 
ERP(1)   =   800;                               
EE(1)   =   0;                                  
CO2eq(1) = 300; %ppm 

IP1(1) = 0;
DP1(1) = 0;
IP2(1) = 0;
DP2(1) = 0;
IP3(1) = 0;
DP3(1) = 0;
IH1(1) = 0;
DH1(1) = 0;
IH2(1) = 0;
DH2(1) = 0;
IH3(1) = 0;
DH3(1) = 0;
IC1(1) = 0;
DC1(1) = 0;
IC2(1) = 0;
DC2(1) = 0;
IHH(1) = 0;
DHH(1) = 0;
IIRP(1) = 0;
DIRP(1) = 0;
INRP(1) = 0;
DRP(1)= 0;

%mHH	=	0.01;  

%mHH1p = mHH; 
%mHH2p = mHH / 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETROS DE TEMPERATURA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

atemp(1)= -0.21;    % Anomalia de temperatura
temp(1)=25;         % Temperatura inicial
tempo=25;           % Temperatura optima

% Crecimiento de las plantas
gRPP1p	=	0.003541127	; 
gRPP2p	=	0.009933643;
gRPP3p	=	0.000778772	;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PARAMETROS NATURALES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gP2H2	=	0.058687036;  
gP2H3	=	0.0168;       
gP3H3	=	0.125249403	;
gH2C1	=	0.366996266	;
gH2C2	=	0.052509103	;
gH3C2	=	0.117534846	;
rIRPP2	=	0.021472781	;
rIRPP3	=	0.357331692	;

mP2	=	0.197313146;   
mP3	=	0.186325524	;  
mH2	=	0.0004	;      
mH3	=	0.196123663	;  
mC1	=	0.092105574	;  
mC2	=	0.171458886	;  
mIRPRP	=	0	;      

RPIRP  	=	0.49337505	;  
gP1H2	=	0.079785	;  
gH1C1	=	0.19963	;      
mP1	=	0.001018295	;      
mH1	=	0.009838862	;      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PARAMETROS ECONOMICOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aw  =   0.43853  ;
cw	=	0.135718104	;  
dw	=	4.51E-06	;  

aP1	=	0.4968	;       
bP1	=	0.67631	;       
cP1	=	0.12318	;       
aP1p	=	0.050392    ;
bP1p	=	0.149737492	;
cP1p	=	0.033805381	;
aH1	=	1.4359	;       
bH1	=	0.001	;      
cH1	=	0.252716513	;  
aH1p	=	0.24182	;  
bH1p	=	0.049912497	;
cH1p	=	0.26657	;    
aIS	=	1.17	;      
bIS	=	0.297210307	;  
cIS	=	0.001	;      
aISp	=	0.3109	;  
bISp	=	0.0044	;  
cISp	=	0.3313	;  

dP1H1	=	0.000191077	;   
eP1H1	=	0.049912497	;   
fP1H1	=	0.81332	;       
gP1H1	=	2.9657	;       

dP1HH	=	4.00E-08    ;   
zP1HH	=	6.00E-08	;   
kP1HH	=	1.60E-07	;   
mP1HH	=	6.00E-08	;   
nP1HH	=	0	;           
dH1HH	=	6.00E-08	;   
zH1HH	=	3.13E-05	;   
kH1HH	=	6.00E-08	;   
mH1HH	=	6.00E-08	;   
nH1HH	=	0	;           
dISHH	=	6.00E-08	;   
zISHH	=	5.68E-05	;   
kISHH	=	6.00E-08	;   
mISHH	=	4.00E-08	;   
nISHH	=	2.00E-08	;   

khat	=	.1;%0.09	;  
theta	=	0.101991961	;
lambda	=	0.676677233	;
%mHH	=	0.01;  
P1bar	=	0	;       
H1bar	=	0.4	;       
ISbar	=	0	;       
etaa	=	0.000271386*52;
etab	=	0.00010454*52; 
phi	=	10	;   %valor de enfermedad           
idealpercapmass	=	4.51E-04*10000/numHH(1); 

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ito Processes 

sigmam=2.34e-05;
sigmab=1.56e-03;

epsilonm1=random('normal',0,1,1,time);
epsilonb1=random('normal',0,1,1,time);
epsilonm2=random('normal',0,1,1,time);
epsilonb2=random('normal',0,1,1,time);

%if Ito == 0
    sigmam(:)=0;
    sigmab(:)=0;
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on data taken from International Labor Oragization 
% http://laborsta.ilo.org/STP/guest

% SOCIETY TYPE A - IDEAL
    % Two Populations modifications (2P):
    % 2P)   IEI 1 Income Equality Index
    % 2P-a) 75-25 total population; 1 = poor, 2 = rich; 
    % 2P-b) 75-25 total wages
    % 2P-c) 75-25 total P1demand & H1demand 
    % 2P-d) 75-25 total ISdemand & EEdemand
    % 2P-e) 75-25 HH
    
    IEI=1;
    numHH1(1)=0.75*numHH(1);    %2P-a)
    numHH2(1)=0.25*numHH(1);    %2P-a)
    HH1(1)=HH(1)*.75;            %2P-e)
    HH2(1)=HH(1)*.25;            %2P-e)
    phi1=phi;       %factor is phi related to deads due healtcare and nutricional issues  
    phi2=phi/2;     %It's assumed that rich people have access to a better healthcare 
    percapmass1(1)=HH1(1)/numHH1(1);
    percapmass2(1)=HH2(1)/numHH2(1);

    % Factors for modification in individual populations variables
    % equation systems formed by:
    % 1) pop1 + pop2 = total pop
    % 2) pop1 - pop2*(ratio of percentages) = 0
    Ab=[numHH1(1)/numHH(1) numHH2(1)/numHH;
        numHH1(1)/numHH(1) -(numHH2(1)/numHH)*(75/25)];  %2P-b,d)
    Ac=[numHH1(1)/numHH(1) numHH2(1)/numHH;
        numHH1(1)/numHH(1) -(numHH2(1)/numHH)*(75/25)];  %2P-c,e)
    Ad=[numHH1(1)/numHH(1) numHH2(1)/numHH;
        numHH1(1)/numHH(1) -(numHH2(1)/numHH)*(75/25)];  %2P-b,d)
    bb=[1 0];
    f2pb=inv(Ab)*bb';
    f2pc=inv(Ac)*bb';
    f2pd=inv(Ad)*bb';
    f2pe=[.75 .25];

% Wages parameters
aw1=aw*f2pb(1);
aw2=aw*f2pb(2);
cw1=cw*f2pb(1);
cw2=cw*f2pb(2);
dw1=dw*f2pb(1);
dw2=dw*f2pb(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on Kotecha & Diwekar (2010)
% Inclusion of energy concepts %En)
% - Energy producer compartment (EE)
% - Energy Resourse Pool compartment (ERP)

%Energy parameters
dEEHH =	6.00E-08; %demand
zEEHH =	5.68E-05; %demand
kEEHH =	6.00E-08; %demand
mEEHH =	4.00E-08; %demand
nEEHH =	2.00E-08; %demand
aEE = aP1;      %price
bEE = bP1;      %price
cEE = 5000*cP1; %price
gammaEEIS = 1;   %(unit of energy / unit of IS)
gammaEEIRP= 0.2; %yield (mass/energy)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Economic Mobility Factor
Wid=0.31;           %Ideal wage from stable simulation without EMF
Wgid=0.31*numHH(1); %Ideal global wage
psi=1;              %Richness distribution factor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Greenhouse Gas emission based on:
%-https://www3.epa.gov/climatechange/ghgemissions/global.html and references
%-Climate Change 2014 Mitigation of Climate Change Working Group III 
% Contribution to the Fifth Assessment Report of the Intergovernmental 
% Panel on Climate Change
%-https://www.co2.earth/ and http://www.esrl.noaa.gov/gmd/aggi/aggi.html     

% 1870-2015:    - CO2eq 300-485 ppm aprox, CO2ppm 290-400
%               - 545 GtC = 2000 GtCO2 (42% air, 28% ocean, 29% land)
%               - 840 GtCO2eq and 185 ppm ---> 0.22024 ppm/GtCO2eq
% 2015:         - 400 ppm CO2, 485 ppm CO2eq
%               - 10.1 GtC = 37 GtCO2eq aprox

ppmCO2eq=0.22024;  % factor para convertir de GtCO2eq a ppm en la atmosfera
GtCO2eqStb= 37; % GtCO2eq aprox emitted in 2015 

% Global emissions 2010:    - 25% Energy and heat production (EE)
%                           - 24% Agriculture forestry and other land use
%                                 (P1, H1 & productions)
%                           -  6% Buildings (numHH)
%                           - 14% Transportation (numHH)
%                           - 21% Industry (IS)
%                           - 10% Other energy (EE)

% Percentage of total emissions per stable value of yGHG
%         P1 H1 numHH P1prod H1prod ISprod EEprod  P2  P3  RP
percCO2eq=[6  6    20      6      6     21     35 -24  -5 -28];
% negatives came from distribution percentages of emissions been equals for
% P1 and P2 %'s are equally weighted 

% Stable Value of variables producers of GHG (yGHG)
yGHGstb= [0.090108316273598     1.243569877687978   996 ...
          0.000770375203888207  0.001427446253809   0.006279712575167 ...
          0.012336856254033     5.247311054647068   1.112128665742525 ...
          22.415707968618005];

GtCO2eq= GtCO2eqStb.*(percCO2eq/100)./yGHGstb;   %gigatonnes of CO2equivalente emitted by mass unit


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%  STARTING SIMULATION LOOP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:time
      %%     
        % Factores de peso para variables de población total                   %2P)
   % alfa1=numHH1(i)/(numHH1(i)+numHH2(i));
   % alfa2=numHH2(i)/(numHH1(i)+numHH2(i));

   

   
    alfa1=numHH1(1)/(numHH1(1)+numHH2(1));
    alfa2=numHH2(1)/(numHH1(1)+numHH2(1));

   
% Demographic params due Case
% Current trends (2014)
   mHH1=(-3.25*log(i+55) + 20.536)/1000  + sigmam*epsilonm1(i)*sqrt(1); 
   mHH2=(-0.0103*(i+55) + 9.4329)/1000 + sigmam*epsilonm2(i)*sqrt(1); 
   aa = mHH1;
   bb = mHH2;
   mHH=mHH1*alfa1+mHH2*alfa2;
   cc = mHH;
   etaa1= (41.975*exp(-0.013*(i+55))+3)/1000;
   %etaa1 = etaa1* xx(7);  % xx es un factor de redimensionamiento 0.9-1.1
   etab1=etab;
   etaa2=(20.831*exp(-0.012*(i+55))+3)/1000;
   %etaa2 = etaa2* xx(8);  % xx es un factor de redimensionamiento 0.9-1.1
   etab2=etab;

        
    %% %%%%%FLUJO DE MATERIA RPP1 RPP2 RPP3 en funcion de la temperatura. %%%%%

        %PLANTAS
   gRPP1=gRPP1p*exp(-((temp(i)-tempo)^2)/100);                  
   gRPP2=gRPP2p*exp(-((temp(i)-tempo)^2)/100);
   gRPP3=gRPP3p*exp(-((temp(i)-tempo)^2)/100);
   %gRPP1=gRPP1p;
   %gRPP2=gRPP2p;
   %gRPP3=gRPP3p;
    
        %HUMANOS     
%     mHH1 = - (mHH1p*(exp(-((temp(i)-tempo)^2)/100))) + (2 * mHH1p);
%     mHH2 = - (mHH2p*(exp(-((temp(i)-tempo)^2)/100))) + (2 * mHH1p * .75);
%     mHH1 = - (mHH1*(exp(-((temp(i)-tempo)^2)/100))) + (2 * mHH1);
%     mHH2 = - (mHH2*(exp(-((temp(i)-tempo)^2)/100))) + (2 * mHH1 * .75);
     %mHH=mHH1*alfa1+mHH2*alfa2;
     mHH = - (mHH.*(exp(-((temp(i)-tempo).^2)./100))) + (2. * mHH);
     
     dd = mHH1;
     ee = mHH2;
     ff = mHH; 
   
     
%% %%%%%%%%%%%%%%% CALCULO DE TEMPERATURA %%%%%%%%%%%%%%%%%%%%%%%%     

    atemp(i+1)=0.010008*CO2eq(i) - 3.21675; 
    temp(i+1)= tempo+atemp(i+1);

%   mHH=mHH1*alfa1+mHH2*alfa2;
      
    %% I. Economics
 
    % Industrial sector sets the wage rate
    %W=max(aw+cw*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda)-dw*numHH(i),0);
    W1=max(aw1+cw1*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda)-dw1*numHH(i),0); %2P-b)
    W2=max(aw2+cw2*(ISbar-(ISmassdeficit(i)+ISmass(i)))/(theta+lambda)-dw2*numHH(i),0); %2P-b)
    W=W1*alfa1 + W2*alfa2;
    
    % Economic Mobility Factor
    EMF=psi*((Wgid-W*numHH(i))/Wgid);
    if EMF*numHH(i)>numHH1(i)
        EMF=numHH1(i)/numHH(i);
    end
    if EMF*numHH(i)<(-numHH2(i))
        EMF=numHH2(i)/numHH(i);
    end


%% Precio y Producccion de sectores economicos P1, H1, IS y EP
    
    % Con base en el salario, las industrias establecen precios y su producción 
    % (cuánto les gustaría producir para maximizar sus ganancias en función de 
    % su suposición de cuál será la demanda de sus productos). Aquí se supone 
    % una forma funcional lineal para el suministro.
        
    if P1(i)==0
        pP1=0;
        P1production=0;
    else
        pP1=max(aP1+bP1*W-cP1*((P1massdeficit(i)+P1(i))-P1bar),0);
        P1production=max(aP1p-bP1p*W-cP1p*((P1massdeficit(i)+P1(i))-P1bar),0);
    end

    if H1(i)==0 
        pH1=0;
        H1production=0;
    else
        pH1=max(aH1+bH1*W-cH1*((H1massdeficit(i)+H1(i))-H1bar),0);
        H1production=max(aH1p-bH1p*W-cH1p*((H1massdeficit(i)+H1(i))-H1bar),0);
    end

    if HH(i) == 0 || numHH(i) <20
        pIS=0;
        ISproduction=0;
    else
        pIS=max(aIS+bIS*W+cIS*(ISbar-(ISmassdeficit(i)+ISmass(i)))/...
            (theta+lambda),0);
        ISproduction=max(aISp-bISp*W+cISp*(ISbar-(ISmassdeficit(i)+ISmass(i)))...
            /(theta+lambda),0);
    end
    
    if HH(i) == 0 || numHH(i) <20                                     % En)
        pEE=0;
    else
        pEE=max(aEE + bEE*W + (cEE/ERP(i)),0);
    end
    
%% II. Demanda 

    %A continuación, se calcula cuánto demandará cada industria a sus 
    %proveedores. Los siguientes están en unidades de masa, a menos que 
    %se indique lo contrario
     
    if H1(i)==0||HH(i)==0||numHH(i)<20
        P1H1demand=0;
        P2H1=0;
    else
        P1H1demand=max(dP1H1-eP1H1*W-fP1H1*pP1-gP1H1*((H1massdeficit(i)+H1(i))...
            -H1bar),0);
        P2H1=khat;
    end
    

    %Las expresiones para P1HH, H1HH e ISHH reflejan restricciones en el 
    %gasto humano. Estas expresiones están en forma explícita. Estos son 
    %per cápita, por lo que deben multiplicarse por la población más tarde
    
    if HH(i)==0||numHH(i)<20
        P1HHdemand=0;
        H1HHdemand=0;
        ISHHdemand=0;
        EEHHdemand=0;
        
    else
        P1HHdemand=max((1/(-1+zP1HH+zH1HH+zISHH))*...
            (-dP1HH-mP1HH*pH1-nP1HH*pIS+kP1HH*pP1-dH1HH*zP1HH-...
            dISHH*zP1HH+mH1HH*pH1*zP1HH-mISHH*pH1*zP1HH-nH1HH*pIS*zP1HH+...
            nISHH*pIS*zP1HH-kH1HH*pP1*zP1HH-kISHH*pP1*zP1HH+dP1HH*zH1HH+...
            mP1HH*pH1*zH1HH+nP1HH*pIS*zH1HH-kP1HH*pP1*zH1HH+dP1HH*zISHH+...
            mP1HH*pH1*zISHH+nP1HH*pIS*zISHH-kP1HH*pP1*zISHH),0)*50;
        
        H1HHdemand=max((1/(-1+zP1HH+zH1HH+zISHH))*...
            (-dH1HH+mH1HH*pH1-nH1HH*pIS-kH1HH*pP1+dH1HH*zP1HH-...
            mH1HH*pH1*zP1HH+nH1HH*pIS*zP1HH+kH1HH*pP1*zP1HH-dISHH*zH1HH-...
            dP1HH*zH1HH-mISHH*pH1*zH1HH-mP1HH*pH1*zH1HH+nISHH*pIS*zH1HH-...
            nP1HH*pIS*zH1HH-kISHH*pP1*zH1HH+kP1HH*pP1*zH1HH+dH1HH*zISHH-...
            mH1HH*pH1*zISHH+nH1HH*pIS*zISHH+kH1HH*pP1*zISHH),0)*50;

        ISHHdemand=max(-((dISHH+mISHH*pH1-nISHH*pIS+kISHH*pP1-...
            dISHH*zP1HH-mISHH*pH1*zP1HH+nISHH*pIS*zP1HH-kISHH*pP1*zP1HH-...
            dISHH*zH1HH-mISHH*pH1*zH1HH+nISHH*pIS*zH1HH-kISHH*pP1*zH1HH+...
            dH1HH*zISHH+dP1HH*zISHH-mH1HH*pH1*zISHH+mP1HH*pH1*zISHH+...
            nH1HH*pIS*zISHH+nP1HH*pIS*zISHH+kH1HH*pP1*zISHH-...
            kP1HH*pP1*zISHH)/(-1+zP1HH+zH1HH+zISHH)),0)*50;
                
        EEHHdemand=max(-((dEEHH+mEEHH*pH1-nEEHH*pEE+kEEHH*pP1-...          % En)
            dEEHH*zP1HH-mEEHH*pH1*zP1HH+nEEHH*pEE*zP1HH-kEEHH*pP1*zP1HH-...
            dEEHH*zH1HH-mEEHH*pH1*zH1HH+nEEHH*pEE*zH1HH-kEEHH*pP1*zH1HH+...
            dH1HH*zEEHH+dP1HH*zEEHH-mH1HH*pH1*zEEHH+mP1HH*pH1*zEEHH+...
            nH1HH*pEE*zEEHH+nP1HH*pEE*zEEHH+kH1HH*pP1*zEEHH-...
            kP1HH*pP1*zEEHH)/(-1+zP1HH+zH1HH+zEEHH)),0)*50;

        
%        xP1HHdemand = 1/3*(-tP1HH*pEE-3*dP1HH+3*kP1HH*pP1-mP1HH*pH1+zH1HH*nP1HH*pIS+zH1HH*tP1HH*pEE-nP1HH*pIS-3*zP1HH*dH1HH-zP1HH*kH1HH*pP1+3*zP1HH*mH1HH*pH1-zP1HH*nH1HH*pIS-zP1HH*tH1HH*pEE+3*zH1HH*dP1HH-3*zH1HH*kP1HH*pP1+zH1HH*mP1HH*pH1-3*zP1HH*dISHH-zP1HH*kISHH*pP1-zP1HH*mISHH*pH1+3*zP1HH*nISHH*pIS-zP1HH*tISHH*pEE+3*zISHH*dP1HH-3*zISHH*kP1HH*pP1+zISHH*mP1HH*pH1+zISHH*nP1HH*pIS+zISHH*tP1HH*pEE-3*zP1HH*dEEHH-zP1HH*kEEHH*pP1-zP1HH*mEEHH*pH1-zP1HH*nEEHH*pIS+3*zP1HH*tEEHH*pEE+3*zEEHH*dP1HH-3*zEEHH*kP1HH*pP1+zEEHH*mP1HH*pH1+zEEHH*nP1HH*pIS+zEEHH*tP1HH*pEE)/(-1+zP1HH+zH1HH+zISHH+zEEHH);
 
%        xH1HHdemand = -1/3*(-3*mH1HH*pH1+zH1HH*nP1HH*pIS+zH1HH*tP1HH*pEE-zISHH*kH1HH*pP1+3*zISHH*mH1HH*pH1+nH1HH*pIS+tH1HH*pEE+3*dH1HH+kH1HH*pP1-3*zP1HH*dH1HH-zP1HH*kH1HH*pP1+3*zP1HH*mH1HH*pH1-zP1HH*nH1HH*pIS-zP1HH*tH1HH*pEE+3*zH1HH*dP1HH-3*zH1HH*kP1HH*pP1+zH1HH*mP1HH*pH1+3*zH1HH*dISHH+zH1HH*kISHH*pP1+zH1HH*mISHH*pH1-3*zH1HH*nISHH*pIS+zH1HH*tISHH*pEE-3*zISHH*dH1HH-zISHH*nH1HH*pIS-zISHH*tH1HH*pEE+zH1HH*kEEHH*pP1-zEEHH*nH1HH*pIS+3*zEEHH*mH1HH*pH1+zH1HH*mEEHH*pH1-3*zH1HH*tEEHH*pEE-zEEHH*kH1HH*pP1-zEEHH*tH1HH*pEE+zH1HH*nEEHH*pIS-3*zEEHH*dH1HH+3*zH1HH*dEEHH)/(-1+zP1HH+zH1HH+zISHH+zEEHH);
 
%        xISHHdemand = -1/3*(zISHH*nEEHH*pIS+zISHH*kEEHH*pP1-tISHH*pEE*zEEHH+3*nISHH*pIS*zEEHH-kISHH*pP1*zEEHH-3*dISHH*zEEHH+zISHH*mEEHH*pH1-3*zISHH*tEEHH*pEE+3*zISHH*dEEHH-mISHH*pH1*zEEHH+mISHH*pH1+zISHH*kH1HH*pP1-3*zISHH*mH1HH*pH1-3*nISHH*pIS+3*dISHH+kISHH*pP1+tISHH*pEE-3*zP1HH*dISHH-zP1HH*kISHH*pP1-zP1HH*mISHH*pH1+3*zP1HH*nISHH*pIS-zP1HH*tISHH*pEE+3*zISHH*dP1HH-3*zISHH*kP1HH*pP1+zISHH*mP1HH*pH1+zISHH*nP1HH*pIS+zISHH*tP1HH*pEE-3*zH1HH*dISHH-zH1HH*kISHH*pP1-zH1HH*mISHH*pH1+3*zH1HH*nISHH*pIS-zH1HH*tISHH*pEE+3*zISHH*dH1HH+zISHH*nH1HH*pIS+zISHH*tH1HH*pEE)/(-1+zP1HH+zH1HH+zISHH+zEEHH);
 
%        xEEHHdemand = -1/3*(-zISHH*nEEHH*pIS-zISHH*kEEHH*pP1+tISHH*pEE*zEEHH-3*nISHH*pIS*zEEHH+kISHH*pP1*zEEHH+3*dISHH*zEEHH-zISHH*mEEHH*pH1+3*zISHH*tEEHH*pEE-3*zISHH*dEEHH+mISHH*pH1*zEEHH+3*dEEHH+kEEHH*pP1+mEEHH*pH1+nEEHH*pIS-3*tEEHH*pEE-3*zP1HH*dEEHH-zP1HH*kEEHH*pP1-zP1HH*mEEHH*pH1-zP1HH*nEEHH*pIS+3*zP1HH*tEEHH*pEE+3*zEEHH*dP1HH-3*zEEHH*kP1HH*pP1+zEEHH*mP1HH*pH1+zEEHH*nP1HH*pIS+zEEHH*tP1HH*pEE-zH1HH*kEEHH*pP1+zEEHH*nH1HH*pIS-3*zEEHH*mH1HH*pH1-zH1HH*mEEHH*pH1+3*zH1HH*tEEHH*pEE+zEEHH*kH1HH*pP1+zEEHH*tH1HH*pEE-zH1HH*nEEHH*pIS+3*zEEHH*dH1HH-3*zH1HH*dEEHH)/(-1+zP1HH+zH1HH+zISHH+zEEHH);

    end
        
        P1HHdemand1=P1HHdemand*f2pc(1);     %2P-c)
        P1HHdemand2=P1HHdemand*f2pc(2);     %2P-c)
        H1HHdemand1=H1HHdemand*f2pc(1);     %2P-c)
        H1HHdemand2=H1HHdemand*f2pc(2);     %2P-c)
        ISHHdemand1=ISHHdemand*f2pd(1);     %2P-d)
        ISHHdemand2=ISHHdemand*f2pd(2);     %2P-d)
        EEHHdemand1=EEHHdemand*f2pd(1);     %2P-d)      % En)        
        EEHHdemand2=EEHHdemand*f2pd(2);     %2P-d)      % En)
       
        P1HHdemand=(P1HHdemand1*alfa1+P1HHdemand2*alfa2);
        H1HHdemand=(H1HHdemand1*alfa1+H1HHdemand2*alfa2);
        ISHHdemand=(ISHHdemand1*alfa1+ISHHdemand2*alfa2);
        EEHHdemand=(EEHHdemand1*alfa1+EEHHdemand2*alfa2);           % En) 
        
    % Energy demands                                                % En)
    EEHHtotdemand=EEHHdemand*numHH(i);
    EEISdemand=ISproduction*gammaEEIS;
       
    
    %Los flujos que involucran mano de obra para evitar que la naturaleza 
    %tome domesticos, es decir, P1H2 y H1C2, deben calcularse.
    if P1(i)==0|| H2(i)==0
        P1H2=0;
    else
        P1H2=max((gRPP1*P1(i)*RP(i)-mP1*P1(i)-P1production),0);
    end
    
    if H1(i)==0||C1(i)==0
        H1C1=0;
    else
        H1C1=max((P1H1demand+P2H1-mH1*H1(i)-H1production),0);
    end
    
%Si no hay humanos, el consumo de P1H2 y H1C1 es natural (Lokta-Volterra)
    if HH(i)==0||numHH(i)<20
        P1H2=gP1H2*P1(i)*H2(i);
        H1C1=gH1C1*H1(i)*C1(i);
    end
    
    P1ISdemand=theta*ISproduction;
    RPISdemand=lambda*ISproduction;
    
%% III. Calculate all but next state, according to system equations.
    % (Asegúrese de que se cumple el balance de masa y no tiene
    % compartimentos negativos). 
    
    % P1
    P1RP=max(mP1*P1(i),0);
    RPP1=max(gRPP1*P1(i)*RP(i),0);
    P1H1=P1H1demand;
    P1IS=P1ISdemand;
    P1HH=P1HHdemand*numHH(i);
    %if statement to deal with going negative
    if P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS<0 
        if P1(i)+RPP1-P1RP<0
            P1RP=P1(i)+RPP1;
            P1H2=0;
            P1H1=0;
            P1HH=0;
            P1IS=0;
        else
            totP1demand=P1H2+P1H1+P1HH+P1IS;
            P1avail=P1(i)+RPP1-P1RP;
            P1H2=P1avail*P1H2/totP1demand;
            P1H1=P1avail*P1H1/totP1demand;
            P1HH=P1avail*P1HH/totP1demand;
            P1IS=P1avail-(P1H2+P1H1+P1HH);
        end
    else
        if P1massdeficit(i)<0 %if there is an accumulated deficit between 
            % demand for P1 try to make this up if there is extra stock
            % only what you need to make up deficit
            P1surplus=min(P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS,-P1massdeficit(i));
            P1H1=P1H1+P1surplus*P1H1massdeficit(i)/P1massdeficit(i);
            P1IS=P1IS+P1surplus*P1ISmassdeficit(i)/P1massdeficit(i);
            P1HH=P1HH+P1surplus*P1HHmassdeficit(i)/P1massdeficit(i);
        end
    end
    
    % P2
    P2H2=gP2H2*P2(i)*H2(i);
    P2H3=gP2H3*P2(i)*H3(i);
    P2RP=max(mP2*P2(i),0);
    RPP2=max(gRPP2*RP(i)*P2(i),0);
    IRPP2=max(rIRPP2*P2(i)*IRP(i),0);
    P3RP=max(mP3*P3(i),0);
    P3H3=gP3H3*P3(i)*H3(i);
    RPP3=max(gRPP3*RP(i)*P3(i),0);
    IRPP3=max(rIRPP3*P3(i)*IRP(i),0);
    if IRP(i)<=0 
        IRPP2=0;
        IRPP3=0;
    elseif IRP(i)-IRPP2-IRPP3-max(IRP(i)*mIRPRP,0)+RPIRP<0
        if P2(i)~=0 
            IRPP2=rIRPP2*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end
        if P3(i)~=0 
            IRPP3=rIRPP3*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end
    end
    if P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1<belownoreproduction
        if P2(i)+IRPP2+RPP2-P2RP<belownoreproduction
            P2RP=P2(i)+IRPP2+RPP2;
            P2H2=0;
            P2H3=0;
            P2H1=0;
        else
            totP2demand=P2H2+P2H3+P2H1;
            P2avail=P2(i)+IRPP2+RPP2-P2RP;
            P2H2=P2H2*P2avail/totP2demand;
            P2H3=P2H3*P2avail/totP2demand; 
            P2H1=P2avail-(P2H2+P2H3);
        end
    end
    
    % P3
    if P3(i)+IRPP3+RPP3-P3RP-P3H3<belownoreproduction
        if P3(i)+IRPP3+RPP3-P3RP<belownoreproduction
            P3RP=P3(i)+IRPP3+RPP3;
            P3H3=0;
        else
            totP3demand=P3H3;
            P3avail=P3(i)+IRPP3+RPP3-P3RP;
            P3H3=P3H3*P3avail/totP3demand;
        end
    end
    
    % H1
    H1RP=max(mH1*H1(i),0);
    H1HH=H1HHdemand*numHH(i);
    if H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH<0 
        if H1(i)+P1H1+P2H1-H1RP<0 
            H1RP=H1(i)+P1H1+P2H1;
            H1C1=0;
            H1HH=0;
        else
            totH1demand=H1C1+H1HH;
            H1avail=H1(i)+P1H1+P2H1-H1RP;
            H1C1=H1avail*H1C1/totH1demand;
            H1HH=H1avail-H1C1;
        end
    else
        if H1massdeficit(i)<0 
            H1HH=H1HH+min(H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH,-H1massdeficit(i));
            %only what you need to make up deficit
        end
    end
    
    % H2 
    H2C1=gH2C1*C1(i)*H2(i);
    H2C2=gH2C2*H2(i)*C2(i);
    H2RP=max(mH2*H2(i),0);
    if H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2<belownoreproduction
        if H2(i)+P1H2+P2H2-H2RP<belownoreproduction
            H2RP=H2(i)+P1H2+P2H2;
            H2C1=0;
            H2C2=0;
        else
            totH2demand=H2C1+H2C2;
            H2avail=H2(i)+P1H2+P2H2-H2RP;
            H2C1=H2C1*H2avail/totH2demand;
            H2C2=H2avail-H2C1;
        end
    end

    % H3 
    H3RP=max(mH3*H3(i),0);
    H3C2=gH3C2*H3(i)*C2(i);
    if H3(i)+P2H3+P3H3-H3RP-H3C2<belownoreproduction
        if H3(i)+P2H3+P3H3-H3RP<belownoreproduction
            H3RP=H3(i)+P2H3+P3H3;
            H3C2=0;
        else
            totH3demand=H3C2;
            H3avail=H3(i)+P2H3+P3H3-H3RP;
            H3C2=H3C2*H3avail/totH3demand;
        end
    end

    % C1 
    C1RP=max(mC1*C1(i),0);
    if C1(i)+H1C1+H2C1-C1RP<belownoreproduction
        C1RP=C1(i)+H1C1+H2C1;
    end

    % C2 
    C2RP=max(mC2*C2(i),0);
    if C2(i)+H2C2+H3C2-C2RP<belownoreproduction
        C2RP=C2(i)+H2C2+H3C2;
    end
    
    % HH 
    HHRP=ceil(mHH*numHH(i))*percapmass(i);
    if HHRP>(HH(i)+P1HH+H1HH)
        HHRP=(HH(i)+P1HH+H1HH);
    end

    % RP 
    IRPRP=max(IRP(i)*mIRPRP,0);
    RPIS=min(lambda*P1IS/theta,RPISdemand);
    stockRP=RP(i)+P1RP+P2RP+P3RP+H1RP+H2RP+H3RP+C1RP+C2RP+HHRP+IRPRP;
    if stockRP<0
        stockRP=0;
    end
    if (stockRP-(RPP1+RPP2+RPP3)-RPIRP-RPIS) <= 0 && RPIRP == 0 
        RPdemand=RPP1+RPP2+RPP3+RPISdemand;
        RPP1=RPP1*stockRP/RPdemand;
        RPP2=RPP2*stockRP/RPdemand;
        RPP3=RPP3*stockRP/RPdemand;
        if RPIS~=0
            RPIS=stockRP-(RPP1+RPP2+RPP3);
        else
            RPIS=0;
        end
    end
    P1IS=min(theta*RPIS/lambda,P1IS);
    
   % ERP                                                              % En)         
    if ERP(i)>0
        EEproduction = EEHHtotdemand + EEISdemand;
        EEHHmass = EEHHtotdemand*gammaEEIRP;
        ERPEE=EEproduction*gammaEEIRP;
        if ((ERP(i)-ERPEE)<0)
            ERPEE = ERP(i);
            ERP(i) = 0;
        end
        EEIRP=ERPEE;
    else
        pEE = 0;
        EEproduction = 0;
        EEHHmass = 0;
        ERPIRP = 0;
        EEHHtotdemand = 0;
        EEISdemand = 0;
        EEHHdemand = 0;
    end

    
    %%% III.A. make checks again, to balance flows
    % P1 
    if P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS<0 %if statement to deal with going negative
        if P1(i)+RPP1-P1RP<0
            P1RP=P1(i)+RPP1;
            P1H2=0;
            P1H1=0;
            P1HH=0;
            P1IS=0;
        else
            totP1demand=P1H2+P1H1+P1HH+P1IS;
            P1avail=P1(i)+RPP1-P1RP;
            P1H2=P1avail*P1H2/totP1demand;
            P1H1=P1avail*P1H1/totP1demand;
            P1HH=P1avail*P1HH/totP1demand;
            P1IS=P1avail-(P1H2+P1H1+P1HH);
        end
    else
        if P1massdeficit(i)<0 %if there is an accumulated deficit between 
            % demand for P1 try to%make this up if there is extra stock
            P1surplus=min(P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS,-P1massdeficit(i));
            %only what you need to make up deficit
            P1H1=P1H1+P1surplus*P1H1massdeficit(i)/P1massdeficit(i);
            P1IS=P1IS+P1surplus*P1ISmassdeficit(i)/P1massdeficit(i);
            P1HH=P1HH+P1surplus*P1HHmassdeficit(i)/P1massdeficit(i);
        end
    end
    
    % P2
    if IRP(i)<=0 
        IRPP2=0;
        IRPP3=0;
    elseif IRP(i)-IRPP2-IRPP3-max(IRP*mIRPRP,0)+RPIRP<0
        if P2(i)~=0 
            IRPP2=rIRPP2*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end
        if P3~=0 
            IRPP3=rIRPP3*(IRP(i)-max(IRP(i)*mIRPRP,0)+RPIRP)/(rIRPP2+rIRPP3);
        end
    end
    if P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1<belownoreproduction
        if P2(i)+IRPP2+RPP2-P2RP<belownoreproduction
            P2RP=P2(i)+IRPP2+RPP2;
            P2H2=0;
            P2H3=0;
            P2H1=0;
        else
            totP2demand=P2H2+P2H3+P2H1;
            P2avail=P2(i)+IRPP2+RPP2-P2RP;
            P2H2=P2H2*P2avail/totP2demand;
            P2H3=P2H3*P2avail/totP2demand;
            P2H1=P2avail-(P2H2+P2H3);
        end
    end
    
    % P3
    if P3(i)+IRPP3+RPP3-P3RP-P3H3<belownoreproduction
        if P3(i)+IRPP3+RPP3-P3RP<belownoreproduction
            P3RP=P3(i)+IRPP3+RPP3;P3H3=0;
        else totP3demand=P3H3;
            P3avail=P3(i)+IRPP3+RPP3-P3RP;
            P3H3=P3H3*P3avail/totP3demand;
        end
    end
    
    % H1
    if H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH<0 
        if H1(i)+P1H1+P2H1-H1RP<0 
            H1RP=H1(i)+P1H1+P2H1;
            H1C1=0;
            H1HH=0;
        else
            totH1demand=H1C1+H1HH;
            H1avail=H1(i)+P1H1+P2H1-H1RP;
            H1C1=H1avail*H1C1/totH1demand;
            H1HH=H1avail-H1C1;
        end
    else
        if H1massdeficit(i)<0 
            H1HH=H1HH+min(H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH,-H1massdeficit(i));
            %only what you need to make up deficit
        end
    end
    
    % H2 
    if H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2<belownoreproduction
        if H2(i)+P1H2+P2H2-H2RP<belownoreproduction
            H2RP=H2(i)+P1H2+P2H2;
            H2C1=0;
            H2C2=0;
        else
            totH2demand=H2C1+H2C2;
            H2avail=H2(i)+P1H2+P2H2-H2RP;
            H2C1=H2C1*H2avail/totH2demand;
            H2C2=H2avail-H2C1;
        end
    end

    % H3 
    if H3(i)+P2H3+P3H3-H3RP-H3C2<belownoreproduction
        if H3(i)+P2H3+P3H3-H3RP<belownoreproduction
            H3RP=H3(i)+P2H3+P3H3;
            H3C2=0;
        else
            totH3demand=H3C2;
            H3avail=H3(i)+P2H3+P3H3-H3RP;
            H3C2=H3C2*H3avail/totH3demand;
        end
    end
    
    % C1 
    if C1(i)+H1C1+H2C1-C1RP<belownoreproduction
        C1RP=C1(i)+H1C1+H2C1;
    end

    % C2 
    if C2(i)+H2C2+H3C2-C2RP<belownoreproduction
        C2RP=C2(i)+H2C2+H3C2;
    end
    
    % HH 
    HHRP=ceil(mHH*numHH(i))*percapmass(i);
    if HHRP>(HH(i)+P1HH+H1HH)
        HHRP=(HH(i)+P1HH+H1HH);
    end
    
    %% IV. Demographic
    
    ISHHflow=max((theta+lambda)*ISHHdemand*numHH(i),0);
    ISIRP=ISHHflow;
    if ISmass(i)+P1IS+RPIS-ISIRP<=0
        ISIRP=ISmass(i)+P1IS+RPIS;
    else
        if ISmassdeficit(i)<0&&numHH(i)>=2 %if there is an accumulated deficit
            % between demand for IS by the HH and IS supplied, try to make 
            % this up if there is extra stock
            ISIRP=ISIRP+min(ISmass(i)+P1IS+RPIS-ISIRP,-ISmassdeficit(i));
            %only what you need to make up deficit
        end
    end
    
    if (P1HH+H1HH+ISIRP)==0
        weightedprice=0;
        percapbirths=0;
        percapbirths1=0;
        percapbirths2=0;
    elseif (pP1*P1HH+pH1*H1HH+pIS*ISIRP)==0
        weightedprice=0;
        percapbirths=0;
        percapbirths1=0;
        percapbirths2=0;
    else
        %weightedprice=(pP1*P1HH+pH1*H1HH+pIS*ISIRP)/(P1HH+H1HH+ISIRP);
        weightedprice=(pP1*P1HH+pH1*H1HH+pIS*ISIRP+pEE*EEHHmass)/(P1HH+H1HH+ISIRP+EEHHmass); % En)
        %percapbirths=max(etaa-etab*W/weightedprice+etac*(W/weightedprice)^2,0);
        %percapbirths=max(etaa-etab*sqrt(W/weightedprice),0);        
         percapbirths1=max(etaa1-etab1*sqrt(W/weightedprice)...
                        + sigmab*epsilonb1(i)*sqrt(1),0);       %2P-a)
         percapbirths2=max(etaa2-etab2*sqrt(W/weightedprice)...
                        + sigmab*epsilonb2(i)*sqrt(1),0);       %2P-a)
         percapbirths=percapbirths1*alfa1+percapbirths2*alfa2;        
    end
    
    
    
%%%%%% Next Step %%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    
    
    P1(i+1) = P1(i)+RPP1-P1RP-P1H2-P1H1-P1HH-P1IS;
    IP1(i+1) = RPP1;
    DP1(i+1) = P1RP+P1H1+P1H2+P1HH+P1IS;
    
    if P1==0
        P1H1demand=0;
        P1ISdemand=0;
        P1HHdemand=0;
        P1HHdemand1=0;
        P1HHdemand2=0;
    end
    P1H1massdeficit(i+1)=P1H1massdeficit(i)+P1H1-P1H1demand;
    P1ISmassdeficit(i+1)=P1ISmassdeficit(i)+P1IS-P1ISdemand;
    P1HHmassdeficit(i+1)=P1HHmassdeficit(i)+P1HH-P1HHdemand*numHH(i);
    P1massdeficit(i+1)=P1H1massdeficit(i+1)+P1ISmassdeficit(i+1)+...
        P1HHmassdeficit(i+1);
    
    P2(i+1) = P2(i)+IRPP2+RPP2-P2RP-P2H2-P2H3-P2H1;
    IP2(i+1) = RPP2+IRPP2;
    DP2(i+1) = P2RP+P2H1+P2H2+P2H3;
    
    
    
    P3(i+1) = P3(i)+IRPP3+RPP3-P3RP-P3H3;
    IP3(i+1) = RPP3+IRPP3;
    DP3(i+1) = P3RP+P3H3;
    
    
    H1(i+1) = H1(i)+P1H1+P2H1-H1RP-H1C1-H1HH;
    IH1(i+1) = P1H1+P2H1;
    DH1(i+1) = H1RP+H1C1+H1HH;
    
    if H1==0
        H1HHdemand=0;
        H1HHdemand1=0;
        H1HHdemand2=0;
    end
    H1massdeficit(i+1)=H1massdeficit(i)+H1HH-H1HHdemand*numHH(i);
    
    H2(i+1) = H2(i)+P1H2+P2H2-H2RP-H2C1-H2C2;
    IH2(i+1) = P1H2+P2H2;
    DH2(i+1) = H2RP+H2C1+H2C2;
    
    H3(i+1) = H3(i)+P2H3+P3H3-H3RP-H3C2;
    IH3(i+1) = P2H3+P3H3;
    DH3(i+1) = H3RP+H3C2;
    
    C1(i+1)= C1(i)+H1C1+H2C1-C1RP;
    IC1(i+1)= H1C1+H2C1;
    DC1(i+1)=C1RP;
    
    
    C2(i+1)= C2(i)+H2C2+H3C2-C2RP;
    IC2(i+1)= H2C2+H3C2;
    DC2(i+1)= C2RP;
    
    
    HH(i+1) = HH(i)+P1HH+H1HH-HHRP;
    IHH(i+1) = P1HH+H1HH;
    DHH(i+1) = HHRP;
    
        HH1(i+1)=HH(i+1)*f2pe(1);                                    %2P-e)
        HH2(i+1)=HH(i+1)*f2pe(2);                                    %2P-e)
    
    ISmass(i+1)=ISmass(i)+P1IS+RPIS-ISIRP;
    
    ISmassdeficit(i+1) = ISmassdeficit(i)+ISIRP-ISHHflow;
        
    %IRP(i+1) = IRP(i)-IRPP2-IRPP3+RPIRP+ISIRP-IRPRP;
    IRP(i+1) = IRP(i)-IRPP2-IRPP3+RPIRP+ISIRP-IRPRP + EEIRP;
    IIRP(i+1) = RPIRP+ISIRP+EEIRP;
    DIRP(i+1) = IRPP2+IRPP3+IRPRP;
    
    RP(i+1) = stockRP-(RPP1+RPP2+RPP3)-RPIRP-RPIS;
    INRP(i+1) = stockRP;
    DRP(i+1) = RPP1+RPP2+RPP3+RPIRP+RPIS;
    
    ERP(i+1) = ERP(i) - EEIRP;                                         % En)
   
    EE(i+1) = EE(i) + ERPEE - EEIRP;                                   % En)
    
    %numHH(i+1)=max(numHH(i)+ceil(percapbirths*numHH(i))-...
    %    ceil(mHH*numHH(i))-...
    %    ceil(numHH(i)*phi*(percapmass(i)-idealpercapmass)^2),1);
    
    %    numHH1(i+1)=max(numHH1(i)+ceil(percapbirths1*numHH1(i))-...     %2P-a)
    %    ceil(mHH1*numHH1(i))-...
    %    ceil(numHH1(i)*(phi-phi1)*(percapmass1(i)-idealpercapmass)^2)...
    %    -round(EMF*numHH(i)),1);
    
        numHH1(i+1)=max(numHH1(i)+ceil(percapbirths1*numHH1(i))-...     %2P-a)
        ceil(mHH1*numHH1(i))-...
        ceil(numHH1(i)*(phi-phi1)*(percapmass1(i)-idealpercapmass)^2),1);
        
    %    numHH2(i+1)=max(numHH2(i)+ceil(percapbirths2*numHH2(i))-...     %2P-a)
    %    ceil(mHH2*numHH2(i))-...
    %    ceil(numHH2(i)*(phi-phi2)*(percapmass2(i)-idealpercapmass)^2)...
    %    +round(EMF*numHH(i)),1);
    
        numHH2(i+1)=max(numHH2(i)+ceil(percapbirths2*numHH2(i))-...     %2P-a)
        ceil(mHH2*numHH2(i))-...
        ceil(numHH2(i)*(phi-phi2)*(percapmass2(i)-idealpercapmass)^2),1);
    
    %numHH(i+1)=numHH1(i+1) + numHH2(i+1);
    
   
    numHH(i+1)=max(numHH(i)+ceil(percapbirths*numHH(i))-...     %2P-a)
        ceil(mHH*numHH(i))-...
        ceil(numHH(i)*(phi-phi1)*(percapmass(i)-idealpercapmass)^2),1);
    
    
    %percapmass(i+1)=HH(i+1)/numHH(i+1);
     percapmass1(i+1)=HH1(i+1)/numHH1(i+1);                             %2P-a)
     percapmass2(i+1)=HH2(i+1)/numHH2(i+1);                             %2P-a)
    percapmass(i+1)= alfa1*percapmass1(i+1) + alfa2*percapmass2(i+1);
    
    yGHG=[P1(i) H1(i) numHH(i) P1production H1production ISproduction ...
        EEproduction P2(i) P3(i) RP(i)];

    CO2eq(i+1)=CO2eq(i) + sum(yGHG.*GtCO2eq)*ppmCO2eq;  %In ppm

              %1      2       3       4       5       6       7       8
%    x(i,:)=[P1RP    P1H1    P1H2    P1IS    P1HH    P2RP    P2H1    P2H2 ...
%             %9      10      11      12      13      14      15      16
%            P2H3    P3RP    P3H3    H1RP    H1C1    H1HH    H2RP    H2C1 ...
%             %17     18      19      20      21      22      23      24
%            H2C2    H3RP    H3C2    C1RP    C2RP    HHRP    ISIRP   RPP1 ...
%             %25     26      27      28      29      30      31
%            RPP2    RPP3    RPIS    IRPP2   IRPP3   IRPRP   P1HHdemand ...
%             %32             33              34              35              
%            H1HHdemand      ISHHdemand      P1ISdemand      RPISdemand ...
%             %36             37              38              39      40      
%            P1production    H1production    ISproduction     pP1     pH1 ...
%             %41     42              43              44
%             pIS    percapbirths    weightedprice     W];

    x(i,:)=[P1RP    P1H1    P1H2    P1IS    P1HH    P2RP    P2H1    P2H2...
            P2H3    P3RP    P3H3    H1RP    H1C1    H1HH    H2RP    H2C1 ...
            H2C2    H3RP    H3C2    C1RP    C2RP    HHRP    ISIRP   RPP1 ...
            RPP2    RPP3    RPIS    IRPP2   IRPP3   IRPRP   P1HHdemand ...
            H1HHdemand      ISHHdemand      P1ISdemand      RPISdemand ...
            P1production    H1production    ISproduction     pP1     pH1 ...
            pIS    percapbirths    weightedprice     W ...
            W1 W2 P1HHdemand1 P1HHdemand2 H1HHdemand1 H1HHdemand2 ...
            ISHHdemand1 ISHHdemand2 EEHHdemand1 EEHHdemand2 pEE ...
            EEHHdemand EEHHtotdemand EEISdemand EEproduction EEHHmass ...
            EEIRP percapbirths1 percapbirths2 mHH1 mHH2 EMF round(EMF*numHH(i)) ...
            gRPP1 gRPP2 gRPP3 mHH aa bb cc dd ee ff];
            
         %Z = -W(end);
         

                              %71
end
   %1   2   3   4   5   6   7   8   9    10    11   12    13
y=[P1' P2' P3' H1' H2' H3' C1' C2' HH' ISmass' RP'  IRP' numHH' ...
    percapmass' P1H1massdeficit' P1ISmassdeficit' P1HHmassdeficit'...
    H1massdeficit'  ISmassdeficit' numHH1' numHH2' HH1' HH2' ERP' EE' ...
    CO2eq' temp' IP1' DP1' IP2' DP2' IP3' DP3' IH1' DH1' IH2' DH2' IH3' DH3'...
    IC1' DC1' IC2' DC2' IH3' DH3' IIRP' DIRP' INRP' DRP'];

  %   26    27   28   29   30   31   32   33   34   35   36   37   38   39
  % CO2eq' temp' IP1' DP1' IP2' DP2' IP3' DP3' IH1' DH1' IH2' DH2' IH3' DH3'
  
  %  40   41   42   43   44   45    46   47     48   49
  %  IC1' DC1' IC2' DC2' IH3' DH3' IIRP' DIRP' INRP' DRP'
  
FISHER

% Z1 correspondiente a la beneficio de la dimensión ambiental
 Z1 = temp(end);           %max (función original)


% Z2 correspondiente a la beneficio de la dimensión económica
 Z2 = std(P1) + std(H1) + std(ISmass) + std(EEIRP);
 

% Función promedio de cada evaluacion/funcion, como el final de la simulacion, tienen la misma importancia al optimizar, estabilizando lo mayor posible la información de fisher y aun así obteniendo grandes resultados.
 %Z = sum((FI - mean(FI)).^2) + 100*sum((FI(end) - mean(FI)).^2);     %MEJORES RESULTADOS FI

% Z3 correspondiente a la beneficio de la dimensión social
 Z3 = -sum(HH);

% Z multiobjetivo final
 Z = sqrt((Z1-29.5055)^2+(Z2-0.011)^2+(Z3-(-38.9265))^2);

end