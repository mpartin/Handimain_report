%--------------------------------------------------------------------------
%USAGE  Message=Conv2Mat(repertoire, Exclusion, FreqInterp)
%REPERTOIRE = Chemin ABSOLU du 1er essai avec extension
%EXCLUSION  = cellules des codes excluant l'essai, si {} tous les essais sont lus. 
%FREQINTERP si 'I' ttes les donn�es seront � la mainFrequency definie en debut de prog
%           si 'N' chque capteur garde sa base de temps
%------------------------------Exemples VICON-----------------------------
%>> conv2mat('C:\MATLAB701\work\Analyse\Conv2MatNew\DataC3D\c3d\tests\110d04 3f.c3d',{},'I')
%---------------------------- Exemples ------------------------------------
% c:\data\xxx1.dat est le chemin absolu du 1er essai de la manip
% exemple:  Message=Conv2Mat('c:\data\xxx1.dat', {}, 'I'); I=interpolation
%      ou   Message=Conv2Mat('c:\data\xxx1.dat', {1 2 3}, 'N'); 'exclusion des codes 1 2 3, N=pas d'interpolation
%--------------------------------------------------------------------------

%**************************************************************************
%               VERSION 2.93  UTILISEE PAR LE PROGRAMME D'ANALYSE 
%                           ../analyse 1.00
%**************************************************************************

%Lit ds un repertoire tous les fichiers '*.dat' (un par essai) g�n�r�s par le logiciels BESTOF (poste homme)
%Cree une structure UNIQUE Matlab nomm�e 'trial' contenant TOUS les essais (infos + data)
%Sauvegarde cette structure ds le meme repertoire sous la forme d'un fichier unique au format Matlab '.mat'.
%son nom est 'nomsujet.mat'

%les data optotrak sont ramen�es ds le repere table si DataRef='O' ou
%'optotrak' (vieilles versions)

function Res=Conv2Mat(Rept, Exclusion, FreqInterp, handles)
%clear global;
clear ReadOptotrakRecord;
global trial;


%*************************************************
% [pathstr,name,ext,versn] =fileparts(Rept);
if verLessThan('matlab', '7.14') %2012a
    [pathstr,name,ext,ver] = fileparts(Rept);
else
    [pathstr,name,ext] = fileparts(Rept);
end
viconExist=0;
if isempty(ext)==1
    Rep=[Rept,PathSep];
    NewRep=[Rep, '*.dat'];
end

%------ Si ext type .dat -> Logiciel acq=Bestof ou VSG -----
if strfind(ext,'.dat')==1
    Rep=[pathstr,PathSep];
    name=name(1:3);
    NewRep=[Rep, name, '*.dat']
end
%------ Si ext type .c3d -> logiciel acq=Vicon -------------
if strfind(ext,'.c3d')==1
    Rep=[pathstr,PathSep];
    name=name(1:3);
    NewRep=[Rep, name, '*.c3d'];
    viconExist=1;
    switch handles.MainVersion
        case handles.HandiMainVersionID
            %--------------------------------------------------------------------------
            %------- existence du fichier contenant les parametres de stimulation? ----
            %---------------- test extension .txt et .stm -----------------------------
            %--------------------------------------------------------------------------
            AbsViconStimFile=[Rep, name, '.txt'];
            FileExist=exist(AbsViconStimFile);
            if FileExist==2 
                ViconHandimainStimFileExist=1;
            else
                AbsViconStimFile=[Rep, name, '.stm'];
                FileExist=exist(AbsViconStimFile);
                if FileExist==2 
                    ViconHandimainStimFileExist=1;
                else
                    errordlg('Vicon stimfile not found','File Error','modal');
                    Res='Conversion annul�e';
                    ViconHandimainStimFileExist=0;
                    return
                end
            end
        otherwise
            ViconHandimainStimFileExist=0;

    end
else
    viconExist=0;
    ViconHandimainStimFileExist=0;
end

%------ Si ext type .txt -> logiciel acq=Zebris -------------
if strfind(ext,'.txt')==1
    Rep=[pathstr,PathSep];
    name=name(1:3);
    NewRep=[Rep, name, '*.txt'];
    zebrisExist=1;
else
    zebrisExist=0;
end
%------ Si ext type .mgm -> logiciel acq=magstim -------------
if strfind(ext,'.mgm')==1
    Rep=[pathstr,PathSep];
    name=name(1:3);
    NewRep=[Rep, name, '*.mgm'];
    MagstimExist=1;
else
    MagstimExist=0;
end
%-----------------------------------------------------------
V= dir(NewRep);
%*************************************************

% Rep=['..',PathSep, Rept,PathSep];
% V= dir([Rep, '*.dat']);

m= size (V);
disp(' ');
St=[num2str(m(1)), ' fichiers pr�sents dans le repertoire ', Rept];
disp(St);disp(' ');

if isempty(V)==1
        disp('PAS DE DATA OU REPERTOIRE INEXISTANT');
        Res='TRAITEMENT STOPPE';
        return;
end

Deb=clock;
% recherche si l'origine des fichiers est le VSG ou Zebris
if(strfind(V(1).name,'_'))
    zebrisExist=0;
    vsgExist=1;
else
    vsgExist=0;
end    
%****** tri ds l'ordre chronologique des essais  *****
disp('tri chronologique des essais ...');
Nom=V(1).name;OldNom=Nom(1,1:3);
labelRTFile='';
for z=1:m(1)
    Nom=V(z).name;NewNom=Nom(1,1:3);
    if (OldNom==NewNom)
        %---- fichiers zebris ------
        if(zebrisExist==1)
            NumEss(str2num(V(z).name(7:strfind(V(z).name,'.')-1)))=z;
        end
        %---- fichiers vicon ------
        if(viconExist==1)
            NumEss(str2num(V(z).name(4:strfind(V(z).name,'.')-1)))=z;
        end
        %---- fichiers VSG -------
        if(vsgExist==1)
            if(V(z).name(4:strfind(V(z).name,'Eye')))
%               fichier EyeTracker
                NumEss(str2num(V(z).name(15:strfind(V(z).name,'.')-1)))=z;
            else
%               fichier comportemental
                labelRTFile=V(z).name;
                m(1)=m(1)-1;
            end
        else    
            NumEss(str2num(V(z).name(4:strfind(V(z).name,'.')-1)))=z;
        end
    else
        disp ('!!! NOM DE FICHIER DIFFERENT !!!!');
        Res='TRAITEMENT STOPPE';
       return;
    end
end
NumEss(find(~NumEss))=[];
for z=1:m(1)
    ListeAlphRep{z}=V(NumEss(z)).name;
end
clear V;
st=['Fichiers in: ', NewNom,'xxx.dat'];disp(st);
Tri=etime(clock,Deb);disp(Tri);
%*****************fin de tri *************************

%**** Codes exclus, records selectionn�es lus ****
CodeExclusion=Exclusion; %les codes d'exclusion. si={} ts les fichiers sont lus
RecExclusion={};%les types de record exclus de la lecture.si={} ts les records du fichier sont lus

%**Lecture de chaque fichier et ajout � la structure trial
trial=[];

trial.AcqSoftware='unknown             ';
if(vsgExist==1)
    trial.AcqSoftware='VSG                 ';
end
if(viconExist==1) 
	trial.AcqSoftware='VIC                 ';
end
if(zebrisExist==1) 
	trial.AcqSoftware='ZEB                 ';
end
if(viconExist==0) & (vsgExist==0) & (zebrisExist==0)%donc BestOf
    trial.AcqSoftware='BestOf              ';                    
end
if(MagstimExist==1)
    trial.AcqSoftware='MAGSTIM             ';
end

%---- interpolation ------
if (FreqInterp=='I') 
    trial.MainTimeBase=1; 
else
    trial.MainTimeBase=0;
end
trial.MainFrequency=1000;


%------ Version Handimain test�e plus haut ----
%------ ViconHandimainStimFileExist=1 si fichier stim vicon pr�sent ----
NbEssais=m(1);
if ViconHandimainStimFileExist
    [R, SeqType, NbParams, SeqParams, ProtocoleType]=ReadViconHandimainStimFile(AbsViconStimFile, NbEssais);
    if R==-1
        errordlg('Incorrect HandiMain stimfile','File Error','modal');
        Res='Conversion annul�e';
        ViconHandimainStimFileExist=0;
        return
    end
end

%----------------- lecture des essais puis cr�ation dans trial -----------
st=['lecture des ',num2str(m(1)), ' essais et cr�ation de la structure ''trial'' ...'];
disp(st);
Deb=clock;
rec=1;
lu=1;
fid=fopen([Rep  ListeAlphRep{lu}],'rb');
while (fid~=-1)
    OK=ReadAndCreate(Rep,ListeAlphRep{lu},labelRTFile,rec,fid,CodeExclusion,RecExclusion);
    if OK~=0 %non vide ==> on enregistre
        ListeChrono{rec}=ListeAlphRep{lu};
        rec=rec+1;
    end    
    lu=lu+1;
    if lu>m(1) 
        break;
    end
    fid=fopen([Rep  ListeAlphRep{lu}],'rb');
end

%----- si mode handimain et fichier valide
%----- ecrase la cr�ation des champs stim pr�c�dents ---
if ViconHandimainStimFileExist && R~=-1
	trial.ExperimentType=sprintf('%-20s','Handimain');
	trial.ProtocoleType=sprintf('%-20s',ProtocoleType);
	trial.stim.SeqType=SeqType;
	trial.stim.SeqNbOfPar=NbParams;
	trial.stim.SeqParam=SeqParams;
end

Lect=etime(clock, Deb);disp(Lect);
trial.NbEssais=rec-1;

%sauvegarde de la structure trial au format matlab
%test pour format de sortie
Deb=clock;
if(vsgExist==1)
    trial.stim=rmfield(trial.stim,'NbOfSamplesVSG');
end

%------------- sauvegarde de la structuer trial ------------
r=[Rep, NewNom, '.mat'];
disp('sauvegarde de la structure ''trial'' au format matlab U534...');
Vers=version;
if(strfind(Vers(1,1),'6'))
    save (r,'trial');
end
if(strfind(Vers(1,1),'7'))
    save (r,'trial','-v6');
end
% if(strfind(Vers(1,1),'7'))
%     save (r,'trial','-v8');
% end
% end
Sauv=etime(clock, Deb);disp(Sauv);
% St=['Fichier out:  ..', PathSep,'work', PathSep, 'analyse', PathSep,Rept,PathSep,NewNom, '.mat'];disp(St);
St=['Fichier out:  ',Rep,NewNom, '.mat'];disp(St);
Res='TRAITEMENT OK';
return


%*************** Lecture et remplissage de la structure trial
function A = ReadAndCreate(Rep,label,labelRT,index, fid, CodeExclusion, RecExclusion)

%CodeExclusion{} ==> Tableau des codes d'exclusion. Les fichiers possedant
%un de ces codes (AllRec(n).Code) ne sont pas lus.
%%l'argument {} vide n'elimine aucun fichier


%RecExclusion{} ==> tableau 1D. Chq string exclu le record concern�
%ex: RecExclusion={'eog','stim'}; ne lit pas les records eog et syim 
% l'argument {-1} exclu tous les records, seuls les superheasers sont lus
%l'argument {} vide lit tous les records

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%                Lecture SUPER HEADER  (sh.)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
global trial;
global stim;
global eog;
global coih;
global opto;
global spike;
global bird;
global eyetracker;

RecExclusionCode=-1;

%trial=[];
Buffer=[];
if  (strfind(trial.AcqSoftware,'ZEB')==1)
    [Code,data,titre]=loadZebrisFiles(Rep,fid,label,index,CodeExclusion);
end
if  (strfind(trial.AcqSoftware,'VSG')==1)
    [Code,data,RTdata,titre,versionToolBox,distance]=loadEyeTrackerFiles(Rep,fid,label,index,labelRT,CodeExclusion);
end
if  (strfind(trial.AcqSoftware,'VIC')==1)    
    [data,Frequency]=readC3D([Rep  label],index,CodeExclusion);
    Code=0;
end
if  (strfind(trial.AcqSoftware,'BestOf')==1)
    Buffer=char(fread(fid,60,'uchar'))';
    Version=Buffer(1:20);
    AcqSoftware=Buffer(21:40);
    FileName=Buffer(41:60); % trial.FileName(:, :)
    NbOfRecords= fread(fid,1,'int16');
    Buffer=[];
    Buffer=char(fread(fid,40,'uchar'))';
    JMA=Buffer(1:20);
    Heure=Buffer(21:40);
    Buffer=[];
    Buffer=fread(fid,3,'int16');
    OrgTrialNb=Buffer(1);
    TrueTrialNb=Buffer(2);    
    Code=Buffer(3);

%exclusion des fichiers dont SupperHeader.Code est list� ds CodeExclusion
    Buffer=[];
    switch Code
        case CodeExclusion
            A=0; %retourne vide
        return;
    otherwise
        trial.Version='       2.4';
        trial.AcqSoftware=AcqSoftware;
        trial.FileName(index,:)=FileName;
        trial.NbOfRecords=NbOfRecords;
        trial.JMA(index,:)=JMA;
        trial.Heure(index,:)=Heure;
        trial.OrgTrialNb(index)=OrgTrialNb;
        trial.TrueTrialNb(index)=TrueTrialNb;
        trial.Code(index)=Code;
        %trial.Chronologie(OrgTrialNb)=index;
    end
end
if  (strfind(trial.AcqSoftware,'ZEB')==1)
    trial.InfoRecordType(1,:)='stim                '; 
    trial.InfoRecordType(2,:)='zebris              ';
end
if  (strfind(trial.AcqSoftware,'VIC')==1)
    trial.InfoRecordType(1,:)='stim                '; 
    trial.InfoRecordType(2,:)='vicon               ';
end
if  (strfind(trial.AcqSoftware,'VSG')==1)
    trial.InfoRecordType(1,:)='stim                ';
    trial.InfoRecordType(2,:)='eyetracker          ';
end
if  (strfind(trial.AcqSoftware,'BestOf')==1)
    move=fseek(fid, ftell(fid)+104, -1); %saute FileSize, Comment
    %trial.FileSize(index)= fread(fid,1,'int32');
    %trial.Comments(index,1:100)= char(fread(fid,100,'uchar'))';
    FirstLastRc=fread(fid,trial.NbOfRecords,'int32');

    %lecture des records infos
    for j = 1:(trial.NbOfRecords)
        move=fseek(fid,(FirstLastRc(j)-1),-1); % CC commence � 1, Matlab � 0
        if move == 1;display='error dans le pointage vers header'
        end
        trial.InfoRecordType(j,:)=char(fread(fid,20,'uchar'))';
        InfoHeaderAdd(j)=fread(fid,1,'int32');
        % on saute InfoSize
        % on saute InfoComment
    end   
    switch RecExclusionCode
        case RecExclusion 
            A=1; %tous 
            return;
        otherwise 
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%                Lecture des Records Successifs 
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

for aa=1:1:(trial.NbOfRecords)
    %*************************Lecture STIM record ************************
    if strfind(trial.InfoRecordType(aa,:),'stim')==1
        switch 'stim'
            case RecExclusion 
                %trial.stim=[];
            otherwise 
                if  (strfind(trial.AcqSoftware,'ZEB')==1)
                    m=ReadStimZebrisRecord(data, index);  
                end
                if  (strfind(trial.AcqSoftware,'VSG')==1)
                    
                    m=ReadStimVsgRecord(data,RTdata, index);  
                end
                if  (strfind(trial.AcqSoftware,'VIC')==1)            
                    m=ReadStimVicRecord(data, index);   
                end
                if  (strfind(trial.AcqSoftware,'BestOf')==1)
                    move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                    m=ReadStimRecord(fid, index);
                end
        end
    end    
    
    %*************************Lecture OPTOTRAK record ************************
    if strfind(trial.InfoRecordType(aa,:),'optotrak')==1
        switch 'optotrak'
            case RecExclusion 
                %trial.opto=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                m=ReadOptotrakRecord(fid,index);
        end
    end
    
    %*************************Lecture EOG record ************************
    if strfind(trial.InfoRecordType(aa,:),'eog')==1
        switch 'eog'
            case RecExclusion 
                %trial.eog=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                m=ReadEogRecord(fid,index);
        end
    end
    
    %*************************Lecture EYELINK record ************************
    if strfind(trial.InfoRecordType(aa,:),'eyelink')==1
        switch 'eyelink'
            case RecExclusion 
                %trial.eog=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                %m=ReadEyelinkRecord(fid,index);
                m=ReadEyelinkNewRecord(fid,index);
        end
    end
    
    %*************************Lecture COIL record ************************
    if strfind(trial.InfoRecordType(aa,:),'coil')==1
         switch 'coil'
            case RecExclusion 
                %trial.coil=[];
            otherwise  
                 move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
               m=ReadCoilRecord(fid,index);
        end
    end
    
    %*************************Lecture SPIKE record ************************
    if strfind(trial.InfoRecordType(aa,:),'spike')==1
        switch 'spike'
            case RecExclusion 
                %trial.spike=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                m=ReadSpikeRecord(fid,index);
        end
    end
    
    %*************************Lecture BIRD record ************************
    if strfind(trial.InfoRecordType(aa,:),'bird')==1
        switch 'bird'
            case RecExclusion 
                %trial.bird=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                m=ReadBirdRecord(fid,index);
        end
    end
    
    %*************************Lecture GENERIC_ANALOG record ************************
    if strfind(trial.InfoRecordType(aa,:),'generic_analog')==1
        switch 'generic_analog'
            case RecExclusion 
                %trial.bird=[];
            otherwise 
                move=fseek(fid,(InfoHeaderAdd(aa)-1),-1); % pointe vers header
                m=ReadGenericAnalogRecord(fid,index);
        end
    end
    %*************************Lecture EYETRACKER-VSG record ************************
    if strfind(trial.InfoRecordType(aa,:),'eyetracker')==1
        switch 'eyetracker'
            case RecExclusion 
                %trial.bird=[];
            otherwise 
                m=ReadEyetrackerRecord(versionToolBox,distance,titre,data,index);
        end
    end
    %*************************Lecture VICON record ************************
    if strfind(trial.InfoRecordType(aa,:),'vicon')==1
        switch 'vicon'
            case RecExclusion 
                %trial.bird=[];
            otherwise 
                m=ReadViconRecord(data,index);
        end
    end
    %*************************Lecture ZEBRIS record ************************
    if strfind(trial.InfoRecordType(aa,:),'zebris')==1
        switch 'zebris'
            case RecExclusion 
                %trial.bird=[];
            otherwise 
                m=ReadZebrisRecord(data,index,titre);
        end
    end
end
A=[1];
return
%*************************** END ***************************************




%--------------------------------------------------------------------------
%                           SOUS-FONCTIONS
%--------------------------------------------------------------------------
 
%*************************** LECTURE STIM record ***********************      
function m=ReadStimRecord(fid,index)
    global stim;
    global trial;
        % STIMULATION global informations --------------------
        Buffer=char(fread(fid,60,'uchar'))';
        trial.stim.SensorType=Buffer(1:30);
        trial.stim.Version=Buffer(31:60);
        Buffer=[];
        Buffer=fread(fid,2,'int16');
        trial.stim.NbOfStmCh(index)=Buffer(1);
        trial.stim.Frequency=Buffer(2);
            
        %*********** Modif version *****************
        if (strfind(trial.stim.Version,'1.00')==1)
            trial.stim.NbOfSamples(index)=fread(fid,1,'int16');
        end
        if (strfind(trial.stim.Version,'1.01')==1)
            trial.stim.NbOfSamples(index)=fread(fid,1,'int32');
        end
        %*******************************************
        move=fseek(fid, ftell(fid)+118, -1); %saute SeqCarNb, DataSize, Comment, les 3 SeqAdd
        FirstLastRc=fread(fid,trial.stim.NbOfStmCh(index),'int32');
    
        % Presequence-------------------------------------------                
        trial.stim.PreSeqType(index,:)=char(fread(fid,20,'uchar'))';
        trial.stim.PreSeqNbOfPar(index)=fread(fid,1,'int16'); 
        trial.stim.PreSeqParam{index}=(fread(fid,trial.stim.PreSeqNbOfPar(index),'float32'))';
        % Sequence-------------------------------------------
        trial.stim.SeqType(index,:)=char(fread(fid,20,'uchar'))';
        trial.stim.SeqNbOfPar(index)=fread(fid,1,'int16');
        trial.stim.SeqParam{index}=(fread(fid,trial.stim.SeqNbOfPar(index),'float32'))';    
        % PostSequence-------------------------------------------
        trial.stim.PstSeqType(index,:)=char(fread(fid,20,'uchar'))';
        trial.stim.PstSeqNbOfPar(index)=fread(fid,1,'int16');
        trial.stim.PstSeqParam{index}=(fread(fid,trial.stim.PstSeqNbOfPar(index),'float32'))';    

        % STIMULATION Channel informations -----------------------
        for i=1:(trial.stim.NbOfStmCh(index))
            move=fseek(fid,(FirstLastRc(i)-1),-1); % pointe vers header
            Buffer=[];
            Buffer=char(fread(fid,50,'uchar'))';
            trial.stim.InfoStimName(index,i,:)=Buffer(1:20);
            trial.stim.InfoSignalType(index,i,:)=Buffer(21:40);
            trial.stim.InfoUnits(index,i,:)=Buffer(41:50);
                
            InfoChanelDataAdd(i)=char(fread(fid,1,'int32'))';
            %on saute DataSize
            %on saute Comment
        end

    
        % STIMULATION Data Record ----------------------------------
        for i=1:((trial.stim.NbOfStmCh(index)))% !! -3 car channel 3 4 et 5 vide
            move=fseek(fid,(InfoChanelDataAdd(i)-1),-1); 
        
            % si signal numerique
            if (strfind(trial.stim.InfoSignalType(index,i,:),'binary')==1)            
                %*********** gestion version *****************
                if (strfind(trial.stim.Version,'1.00')==1)
                    NbOfStatesEvt=fread(fid,1,'int16')';%nb de fois o� l'evenements chge d'�tat (ex: --> passage seuil =saut cible)
                    DataZip=fread(fid,(2*NbOfStatesEvt),'int16'); 
                end
                if (strfind(trial.stim.Version,'1.01')==1)                    
                    NbOfStatesEvt=fread(fid,1,'int32');%nb de fois o� l'evenements chge d'�tat (ex: --> passage seuil =saut cible)
                    DataZip=fread(fid,(2*NbOfStatesEvt),'int32');
                end
                %*******************************************
                Accu=[];
                nb=NbOfStatesEvt;
                for k=1:nb
                    Nexttab=[];
                    Nexttab(1:DataZip(k*2))=DataZip((k*2)-1);
                    Accu=[Accu, Nexttab];
                end  
            end                       
            %si signal analogique
            if (strfind(trial.stim.InfoSignalType(index,i,:),'analog')==1)
            end           
            ChData(i,:)=Accu;
            Cmd=['trial.stim.RawData', num2str(i), '{index}(:,1)=Accu;'];
            eval(Cmd);
        end 
    m=1;
    return;
    m=stim;
%************************************************************************



%*************************** LECTURE OPTOTRAK record ***********************  
function m=ReadOptotrakRecord(fid,index)

    global opto;
    global trial;
    persistent LastPlaneCoords;
    persistent R;
    persistent OFS_O; 
        
    BadFloatCode=-3.6973e+028;
    
    Buffer=[];
    Buffer=char(fread(fid,60,'uchar'))';
    trial.opto.SensoryType=Buffer(1:20);
    trial.opto.Version=Buffer(21:40);
    trial.opto.Model=Buffer(41:60);
    Buffer=[];
    Buffer=fread(fid,2,'int16');
    trial.opto.NbOfMarkers=Buffer(1);
    trial.opto.FrameFreq=Buffer(2);                       
    %*********** Modif version *****************
    if (strfind(trial.opto.Version,'1.00')==1)
        trial.opto.NbOfFrames(index)=fread(fid,1,'int16');
    end
    if (strfind(trial.opto.Version,'1.01')==1)
        trial.opto.NbOfFrames(index)=fread(fid,1,'int32');
    end
    %*******************************************    
    PlaneCoordsTemp=fread(fid,9,'float32'); %les 3 points du plan
    if  (strfind(trial.AcqSoftware,'PosteSinge')==1)
            PlaneCoords(1:3)=PlaneCoordsTemp(4:6);
            PlaneCoords(4:6)=PlaneCoordsTemp(1:3);
            PlaneCoords(7:9)=PlaneCoordsTemp(7:9);
            PlaneCoords(3)=PlaneCoords(3)*-1;
            PlaneCoords(6)=PlaneCoords(6)*-1;
            PlaneCoords(9)=PlaneCoords(9)*-1;
    else
            PlaneCoords(1:3)=PlaneCoordsTemp(1:3);
            PlaneCoords(4:6)=PlaneCoordsTemp(4:6);
            PlaneCoords(7:9)=PlaneCoordsTemp(7:9);
    end
    %
    Buffer=[];
    Buffer=fread(fid,2,'int16');
    trial.opto.BadFloatExist(index)=Buffer(1);
    trial.opto.BadFrameExist(index)=Buffer(2);
    Buffer=[];
    Buffer=fread(fid,2,'float32');
    trial.opto.BadFloatCode=Buffer(1);
    trial.opto.BadFrameCode=Buffer(2);
    Buffer=[];
    Buffer=char(fread(fid,20,'uchar'))';
    
    %test du dataref 
    trial.opto.DataRef(1,:)=upper(Buffer(1:10));
    OK_O=0;OK_P=0;OK_U=0;
    if (strfind(trial.opto.DataRef,'P')==1) %Dataref='P' les data sont referenc�es sur la diode 2 (3 led du plan)
        OK_P=1;OK_O=0;OK_U=0;
        trial.opto.PlaneMk1(1,:)=PlaneCoords(1:3);
        trial.opto.PlaneMk2(1,:)=PlaneCoords(4:6);
        trial.opto.PlaneMk3(1,:)=PlaneCoords(7:9);
    end
    if (strfind(trial.opto.DataRef,'U')==1) %Dataref='U' les data sont referenc�es sur une diode reference coord. ds PlaneMk1
        OK_U=1;OK_O=0;OK_P=0;
        trial.opto.RefMk(1,:)=PlaneCoords(1:3);
    end   
    if (strfind(trial.opto.DataRef(1,1),'O')==1) %dataref='O' ou'optotrak'
        OK_O=1;OK_P=0;OK_U=0;
        trial.opto.PlaneMk1(1,:)=PlaneCoords(1:3);
        trial.opto.PlaneMk2(1,:)=PlaneCoords(4:6);
        trial.opto.PlaneMk3(1,:)=PlaneCoords(7:9);
        clear trial.opto.DataRef;
        trial.opto.DataRef='P         ';
    else
        if  (strfind(trial.opto.DataRef,'optotrak')==1) 
            OK_O=1;OK_P=0;OK_U=0; 
            trial.opto.PlaneMk1(1,:)=PlaneCoords(1:3);
            trial.opto.PlaneMk2(1,:)=PlaneCoords(4:6);
            trial.opto.PlaneMk3(1,:)=PlaneCoords(7:9);
            clear trial.opto.DataRef;
            trial.opto.DataRef='P         ';
        else 
%             OK_O=0;OK_P=0;OK_U=0; 
        end %ou 'optotrak' vieille version
    end 
    if OK_O==1    %ref optotrak
        if (isempty(LastPlaneCoords)==1) | (LastPlaneCoords~=PlaneCoords)
            LastPlaneCoords=PlaneCoords;
            R=ComputeTransfMatrix(PlaneCoords); %calcul de la matrice de rotation
        end
        %calcul refait because nbframe change dun essai � l'autre chez le
        %singe
        X1(1:trial.opto.NbOfFrames(index))=PlaneCoords(4);
        Y1(1:trial.opto.NbOfFrames(index))=PlaneCoords(5);
        Z1(1:trial.opto.NbOfFrames(index))=PlaneCoords(6);
        OFS_O=R*[X1; Y1; Z1];
        clear X1; clear Y1; clear Z1;
    end
    trial.opto.Units=Buffer(11:20); 
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc= fread(fid,trial.opto.NbOfMarkers,'int32');
    % OPTOTRAK Marker infos -------------------------------------
    for i=1:(trial.opto.NbOfMarkers)
        move=fseek(fid,FirstLastRc(i)-1,-1); % pointe vers header
        if move == 1;display='error dans le pointage vers header'
        end                
        trial.opto.InfoMarkerName(i,:)=char(fread(fid,20,'uchar'))';
        InfoXDataAdd(i)=fread(fid,1,'int32');            
        InfoYDataAdd(i)=fread(fid,1,'int32');            
        InfoZDataAdd(i)=fread(fid,1,'int32');          
        %*********** Modif version *****************
        if (strfind(trial.opto.Version,'1.00')==1)
            trial.opto.InfoNbOfBadFloat(index,i)=fread(fid,1,'int16');            
            trial.opto.InfoNbOfBadFrame(index,i)=fread(fid,1,'int16');            
        end
        if (strfind(trial.opto.Version,'1.01')==1)
            trial.opto.InfoNbOfBadFloat(index,i)=fread(fid,1,'int32');            
            trial.opto.InfoNbOfBadFrame(index,i)=fread(fid,1,'int32');            
        end
        %******************************************* 
        %on saute InfoDataSize, InfoComment
    end

    % OPTOTRAK Markers DATA------------------------------------------ 
    NbFrame=trial.opto.NbOfFrames(index);
    for i=1:(trial.opto.NbOfMarkers)
        move=fseek(fid,InfoXDataAdd(i)-1,-1);
        DataX(1,:)=(fread(fid,NbFrame,'float32'))';
        move=fseek(fid,InfoYDataAdd(i)-1,-1);
        DataY(1,:)=(fread(fid,NbFrame,'float32'))';
        move=fseek(fid,InfoZDataAdd(i)-1,-1);
        DataZ(1,:)=(fread(fid,NbFrame,'float32'))';
        if  (strfind(trial.AcqSoftware,'PosteSinge')==1) 
            DataZ=DataZ.*-1;
        end
        
        clear DataXr; clear DataYr; clear DataZr;       
        if (OK_U==1) %ref zero mk
            %les data sont  ds le ref zero mk--> pas de calcul
            DataXr=DataX;
            DataYr=DataY;
            DataZr=DataZ;
        end
        if (OK_P==1) %ref plan
            %les data sont  ds le ref des 3 diodes--> pas de calcul
            DataXr=DataX;
            DataYr=DataY;
            DataZr=DataZ;
        end
        if (OK_O==1) %ref optotrak
            %[Nx, Ny, Nz]= change_reference_frame(DataX(i,:),DataY(i,:),DataZ(i,:),trial.opto.PlaneMk2,trial.opto.PlaneMk1,trial.opto.PlaneMk3);
            %transformation des data vers le repere table
            DataXYZ=R*[DataX(1,:) ;DataY(1,:); DataZ(1,:)] - OFS_O;
            DataXr(1,:)=DataXYZ(1,:);
            DataYr(1,:)=DataXYZ(2,:);
            DataZr(1,:)=DataXYZ(3,:);            
        end
        if trial.MainTimeBase==1 %mettre � la meme base de temps
            FreqRatio=trial.MainFrequency/trial.opto.FrameFreq;
            %trial.opto.FrameFreq=trial.MainFrequency;
            trial.opto.NbOfFrames(index)=FreqRatio*NbFrame;
            DataXr=interp(DataXr, FreqRatio);Id=find(abs(DataXr)>100000); DataXr(Id)=BadFloatCode; %trial.opto.BadFloatCode;
            DataYr=interp(DataYr, FreqRatio);Id=find(abs(DataYr)>100000); DataYr(Id)=BadFloatCode; %trial.opto.BadFloatCode;
            DataZr=interp(DataZr, FreqRatio);Id=find(abs(DataZr)>100000); DataZr(Id)=BadFloatCode; %trial.opto.BadFloatCode; 
            Si=size(Id);
            trial.opto.InfoNbOfBadFloat(index,i)=Si(2);
            trial.opto.InfoNbOfBadFrame(index,i)=Si(2);
            if isempty(Si)~=1
                trial.opto.BadFloatExist(index)=1;
                trial.opto.BadFrameExist(index)=1;
            end
        end  
        
        %*** modif offset singe 11/2003***
        if  (strfind(trial.AcqSoftware,'PosteSinge')==1) 
            DataXr=DataXr-199;
            DataYr=DataYr-40;
            DataZr=DataZr;
            trial.opto.RefMk.dx=199;
            trial.opto.RefMk.dy=40;
            trial.opto.RefMk.dz=0;
            trial.opto.DataRef='U         ';
       end
        %********************************
        
        Cmd0=['trial.opto.RawData', num2str(i), '{index}'];
        Cmd=[Cmd0, '(:,1)=DataXr;'];
        eval(Cmd);
        Cmd=[Cmd0, '(:,2)=DataYr;'];
        eval(Cmd);
        Cmd=[Cmd0, '(:,3)=DataZr;'];
        eval(Cmd);
   end %i=1:trial.opto.NbOfMarkers
   if trial.MainTimeBase==1 trial.opto.FrameFreq=trial.MainFrequency; end
    m=1;
    return;
   m=opto;
%************************************************************************

%calcul de la matrice de rotation
function [R]=ComputeTransfMatrix(P)
global trial;

x1=P(4); y1=P(5); z1=P(6); %P1 est le planeMk2
x2=P(1); y2=P(2); z2=P(3); %P2 est le planeMk1
x3=P(7); y3=P(8); z3=P(9); %P3 est le planeMk3
    
%Y est definit par axe diode1-diode2
	normY= sqrt( ((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1)) + ((z2-z1)*(z2-z1)) );
	xY= (x2-x1) / normY;
	yY= (y2-y1) / normY;
	zY= (z2-z1) / normY;

%Z coord du vecteur orthogonal au plan de pointage 
%Z definit par produit interieur entre diode1-diode3 et diode1-diode2
	tempx= ((y3-y1) * (z2-z1)) - ((z3-z1) * (y2-y1));
	tempy= ((z3-z1) * (x2-x1)) - ((x3-x1) * (z2-z1));
	tempz= ((x3-x1) * (y2-y1)) - ((y3-y1) * (x2-x1));
	normZ= sqrt( (tempx * tempx) + (tempy * tempy) + (tempz * tempz) );
	xZ= (tempx) / normZ;
	yZ= (tempy) / normZ;
	zZ= (tempz) / normZ;

%X coord du vecteur orthogonal au plan Y-Z; repere direct
	tempx= (yY * zZ) - (zY * yZ);
	tempy= (zY * xZ) - (xY * zZ);
	tempz= (xY * yZ) - (yY * xZ);
	normX= sqrt( (tempx*tempx) + (tempy * tempy) + (tempz * tempz) );
	xX= (tempx) / normX;
	yX= (tempy) / normX;
	zX= (tempz) / normX;
    
    R=[xX yX zX; xY yY zY; xZ yZ zZ];
    return;

%QUELQUES REMARQUES
	%R est la matrice de rotation decrivant les coord de X, Y, Z dans repere ori
	%R=       xX xY xZ
	%		  yX yY yZ
	%		  zX zY zZ     

	%RT, transposee de R est la matrice de rotation decrivant les axes ori dans le repere final
	%RT=      xX yX zX
	%		  xY yY zY
	%		  xZ yZ zZ    

	%soit PE un point defini dans le rep ori son image PT dans le repere final est donne par 
    %le produit des matrice RT et PE PT= RT . PE
	%soit:
			%xPT= (xX*xPE) + (yX*yPE) + (zX*zPE)
			%yPT= (xY*xPE) + (yY*yPE) + (zY*zPE)
			%zPT= (xZ*xPE) + (yZ*yPE) + (zZ*zPE)

%************************************************************************


%*************************** LECTURE EYELINK NEW record ***********************  
%---------------------- Une voie par oeil ----------------------------
function m=ReadEyelinkNewRecord(fid,index)
    global eog;
    global trial;
    
    BadData=-4.9;  %perte info=-4.9volts
    
    
    % EYELINK global information ------------------------
    trial.eyelink.SensoryType=char(fread(fid,20,'uchar'))';
    trial.eyelink.Version=char(fread(fid,20,'uchar'))';
    
    trial.eyelink.Model=char(fread(fid,20,'uchar'))';
    
    %trial.eyelink.NbOfChannels=fread(fid,1,'int16');                    
    NbOfChannels=fread(fid,1,'int16'); %nb de voies enregistrees 1 a 4
    trial.eyelink.NbOfChannels=2;
    trial.eyelink.Frequency=fread(fid,1,'int16');  
    trial.eyelink.NbOfSamples(index)=fread(fid,1,'int32');
            
    trial.eyelink.LoCutFreq=fread(fid,1,'int16');
    trial.eyelink.HiCutFreq=fread(fid,1,'int16');            
    trial.eyelink.FilterType=char(fread(fid,20,'uchar'))'; 
    trial.eyelink.CalibrationMode=char(fread(fid,20,'uchar'))';            
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,NbOfChannels,'int32');

    % EYELINK Channel information ------------------------      
    trial.eyelink.InfoChannelName(1,:)=0;
    trial.eyelink.InfoChannelName(2,:)=0;
    trial.eyelink.InfoChannelName(3,:)=0;
    trial.eyelink.InfoChannelName(4,:)=0;
    for i=1:(NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        ChannelNb=str2num(char(fread(fid,20,'uchar'))');
        trial.eyelink.InfoChannelName(ChannelNb,:)=ChannelNb;
        InfoDataAdd(ChannelNb)=fread(fid,1,'int32');  
        trial.eyelink.InfoDataSize(index,ChannelNb)=fread(fid,1,'int32');  
        trial.eyelink.InfoGain(ChannelNb)=fread(fid,1,'float32');  
        trial.eyelink.InfoUnits(ChannelNb,:)=char(fread(fid,10,'uchar'))';
        %InfoCalibrationData
        for j=1:20
        %trial.eyelink.CalibrationData(1,j,i)=fread(fid,1,'float32');
            CalibrationData(ChannelNb,j)=fread(fid,1,'float32');
        end
        %------- mode K-linear --> un coeff par voie -------------
        if strfind(trial.eyelink.CalibrationMode,'K_linear')==1
            trial.eyelink.CalibrationData(ChannelNb,1)=CalibrationData(ChannelNb,1);
            trial.eyelink.BadData(ChannelNb,1)=BadData * trial.eyelink.CalibrationData(ChannelNb,1);
        end
        %on saute InfoComment
    end
    % EYELINK Channel DATA ------------------------------------------
    ChData=[];
%     trial.eyelink.RawData1{index}=[];
%     trial.eyelink.RawData2{index}=[];
    
    ChannelNb=trial.eyelink.InfoChannelName;
    j=1;
    OeilDr=0;
    OeilGa=0;
    NbOfEyes=0;
    index
    if ChannelNb(1)==1        
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eyelink.NbOfSamples(index),'float32'))'; % RECUPERE Data eog
        trial.eyelink.RawData1{index}(:,1)=ChData;
        j=j+1;
        OeilDr=1;
    else
        trial.eyelink.RawData1{index}(:,1)=0;
    end
    if ChannelNb(2)==2        
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eyelink.NbOfSamples(index),'float32'))'; % RECUPERE Data eog
        trial.eyelink.RawData1{index}(:,2)=ChData;
        j=j+1;
        OeilDr=1;
    else
        trial.eyelink.RawData1{index}(:,2)=0;
    end
    if ChannelNb(3)==3        
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eyelink.NbOfSamples(index),'float32'))'; % RECUPERE Data eog
        trial.eyelink.RawData2{index}(:,1)=ChData;
        j=j+1;
        OeilGa=1;
    else
        trial.eyelink.RawData2{index}(:,1)=0;
    end
    if ChannelNb(4)==4        
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eyelink.NbOfSamples(index),'float32'))'; % RECUPERE Data eog
        trial.eyelink.RawData2{index}(:,2)=ChData;
        j=j+1;
        OeilGa=1;
    else
        trial.eyelink.RawData2{index}(:,2)=0;
    end
    if OeilDr==1 & OeilGa==1 NbOfEyes=2; else NbOfEyes=1; end
    trial.eyelink.NbOfChannels=NbOfEyes;
    m=1;
    return;
%************************************************************************


%*************************** LECTURE EOG record ***********************  
function m=ReadEogRecord(fid,index)
    global eog;
    global trial;
    
    % EOG global information ------------------------
    trial.eog.SensoryType=char(fread(fid,20,'uchar'))';
    trial.eog.Version=char(fread(fid,20,'uchar'))';
    
    trial.eog.Model=char(fread(fid,20,'uchar'))';
    %test du type EOG   bm623 ou eyelink2
    
    
    trial.eog.NbOfChannels=fread(fid,1,'int16');                    
    trial.eog.Frequency=fread(fid,1,'int16');
            
    %*********** Modif version *****************
    if (strfind(trial.eog.Version,'1.00')==1)
        trial.eog.NbOfSamples(index)=fread(fid,1,'int16');
    end
    if (strfind(trial.eog.Version,'1.01')==1)
        trial.eog.NbOfSamples(index)=fread(fid,1,'int32');
    end
    %*******************************************
            
    trial.eog.LoCutFreq=fread(fid,1,'int16');
    trial.eog.HiCutFreq=fread(fid,1,'int16');            
    trial.eog.FilterType=char(fread(fid,20,'uchar'))';  
    trial.eog.CalibrationMode=char(fread(fid,20,'uchar'))';            
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,trial.eog.NbOfChannels,'int32');

    % EOG Channel information ------------------------                    
    for i=1:(trial.eog.NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        trial.eog.InfoChannelName(i,:)=char(fread(fid,20,'uchar'))';
        InfoDataAdd(i)=fread(fid,1,'int32');  
        trial.eog.InfoDataSize(index,i)=fread(fid,1,'int32');  
        trial.eog.InfoGain(i)=fread(fid,1,'float32');  
        trial.eog.InfoUnits(i,:)=char(fread(fid,10,'uchar'))';
        %InfoCalibrationData
        for j=1:20
            trial.eog.CalibrationData(j)=fread(fid,1,'float32');
        end
        %on saute InfoComment
    end
    % EOG Channel DATA ------------------------------------------
    ChData=[];
    for j=1:(trial.eog.NbOfChannels)
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eog.NbOfSamples(index),'float32'))'; % RECUPERE Data eog   
        Cmd=['trial.eog.RawData', num2str(j), '{index}(:,1)=ChData;'];
        eval(Cmd);      
   end
     m=1;
    return;
%************************************************************************

%*************************** LECTURE EYELINK record ***********************  
function m=ReadEyelinkRecord(fid,index)
    global eog;
    global trial;
    
    BadData=-4.9;  %perte info=-4.9volts
    
    
    % EYELINK global information ------------------------
    trial.eyelink.SensoryType=char(fread(fid,20,'uchar'))';
    trial.eyelink.Version=char(fread(fid,20,'uchar'))';
    
    trial.eyelink.Model=char(fread(fid,20,'uchar'))';
    
    trial.eyelink.NbOfChannels=fread(fid,1,'int16');                    
    trial.eyelink.Frequency=fread(fid,1,'int16');
            
    %*********** Modif version *****************
    if (strfind(trial.eyelink.Version,'1.00')==1)
        trial.eyelink.NbOfSamples(index)=fread(fid,1,'int16');
    end
    if (strfind(trial.eyelink.Version,'1.01')==1)
        trial.eyelink.NbOfSamples(index)=fread(fid,1,'int32');
    end
    %*******************************************
            
    trial.eyelink.LoCutFreq=fread(fid,1,'int16');
    trial.eyelink.HiCutFreq=fread(fid,1,'int16');            
    trial.eyelink.FilterType=char(fread(fid,20,'uchar'))'; 
    trial.eyelink.CalibrationMode=char(fread(fid,20,'uchar'))';            
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,trial.eyelink.NbOfChannels,'int32');

    % EYELINK Channel information ------------------------                    
    for i=1:(trial.eyelink.NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        trial.eyelink.InfoChannelName(i,:)=char(fread(fid,20,'uchar'))';
        InfoDataAdd(i)=fread(fid,1,'int32');  
        trial.eyelink.InfoDataSize(index,i)=fread(fid,1,'int32');  
        trial.eyelink.InfoGain(i)=fread(fid,1,'float32');  
        trial.eyelink.InfoUnits(i,:)=char(fread(fid,10,'uchar'))';
        %InfoCalibrationData
        for j=1:20
        %trial.eyelink.CalibrationData(1,j,i)=fread(fid,1,'float32');
            CalibrationData(i,j)=fread(fid,1,'float32');
        end
        %------- mode K-linear --> un coeff par voie -------------
        if strfind(trial.eyelink.CalibrationMode,'K_linear')==1
            trial.eyelink.CalibrationData(i,1)=CalibrationData(i,1);
            trial.eyelink.BadData(i,1)=BadData * trial.eyelink.CalibrationData(i,1);
        end
        %on saute InfoComment
    end
    % EYELINK Channel DATA ------------------------------------------
    ChData=[];
    for j=1:(trial.eyelink.NbOfChannels)
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.eyelink.NbOfSamples(index),'float32'))'; % RECUPERE Data eog   
        Cmd=['trial.eyelink.RawData', num2str(j), '{index}(:,1)=ChData;'];
        eval(Cmd);      
   end
     m=1;
    return;
%************************************************************************



%*************************** LECTURE GENERIC ANALOG record ***********************  
function m=ReadGenericAnalogRecord(fid,index)
    global eog;
    global trial;

    % EOG global information ------------------------
    trial.gen_analog.SensoryType=char(fread(fid,20,'uchar'))';
    trial.gen_analog.Version=char(fread(fid,20,'uchar'))';
    trial.gen_analog.Model=char(fread(fid,20,'uchar'))';
    trial.gen_analog.NbOfChannels=fread(fid,1,'int16');                    
    trial.gen_analog.Frequency=fread(fid,1,'int16');
            
    %*********** Modif version *****************
    if (strfind(trial.gen_analog.Version,'1.00')==1)
        trial.gen_analog.NbOfSamples(index)=fread(fid,1,'int16');
    end
    if (strfind(trial.gen_analog.Version,'1.01')==1)
        trial.gen_analog.NbOfSamples(index)=fread(fid,1,'int32');
    end
    %*******************************************
            
    trial.gen_analog.LoCutFreq=fread(fid,1,'int16');
    trial.gen_analog.HiCutFreq=fread(fid,1,'int16');            
    trial.gen_analog.FilterType=char(fread(fid,20,'uchar'))';  
    trial.gen_analog.CalibrationMode=char(fread(fid,20,'uchar'))';            
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,trial.gen_analog.NbOfChannels,'int32');

    % EOG Channel information ------------------------                    
    for i=1:(trial.gen_analog.NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        trial.gen_analog.InfoChannelName(i,:)=char(fread(fid,20,'uchar'))';
        InfoDataAdd(i)=fread(fid,1,'int32');  
        trial.gen_analog.InfoDataSize(index,i)=fread(fid,1,'int32');  
        trial.gen_analog.InfoGain(i)=fread(fid,1,'float32');  
        trial.gen_analog.InfoUnits(i,:)=char(fread(fid,10,'uchar'))';
        %on saute InfoCalibrationData
        %on saute InfoComment
    end
    % EOG Channel DATA ------------------------------------------
    ChData=[];
    for j=1:(trial.gen_analog.NbOfChannels)
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.gen_analog.NbOfSamples(index),'float32'))'; % RECUPERE Data eog               
        Cmd=['trial.gen_analog.RawData', num2str(j), '{index}(:,1)=ChData;'];
        eval(Cmd);      
   end
     m=1;
    return;
%************************************************************************



%*************************** LECTURE COIL record ***********************  
function m=ReadCoilRecord(fid,index)
    global coil;
    global trial;

    % coil global information ------------------------
    trial.coil.SensoryType(1,:)=char(fread(fid,20,'uchar'))';
    trial.coil.Version(1,:)=char(fread(fid,20,'uchar'))';
    trial.coil.Model(1,:)=char(fread(fid,20,'uchar'))';
    trial.coil.NbOfChannels=fread(fid,1,'int16');                    
    trial.coil.Frequency=fread(fid,1,'int16');
            
    %*********** Modif version *****************
    if (strfind(trial.coil.Version(1,:),'1.00')==1)
        trial.coil.NbOfSamples(index)=fread(fid,1,'int16');
    end
    if (strfind(trial.coil.Version(1,:),'1.01')==1)
        trial.coil.NbOfSamples(index)=fread(fid,1,'int32');
    end
    %*******************************************
            
    trial.coil.LoCutFreq=fread(fid,1,'int16');
    trial.coil.HiCutFreq=fread(fid,1,'int16');            
    trial.coil.FilterType(1,:)=char(fread(fid,20,'uchar'))';            
    trial.coil.CalibrationMode(1,:)=char(fread(fid,20,'uchar'))';   
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,trial.coil.NbOfChannels,'int32');
        
    % COIL Channel information ------------------------                    
    for i=1:(trial.coil.NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        trial.coil.InfoChannelName(i,:)=char(fread(fid,20,'uchar'))';
        InfoDataAdd(i)=fread(fid,1,'int32');  
        trial.coil.InfoDataSize(index,i)=fread(fid,1,'int32');  
        trial.coil.InfoGain(i)=fread(fid,1,'float32');  
        trial.coil.InfoUnits(i,:)=char(fread(fid,10,'uchar'))';
        %on saute InfoCalibrationData
        %on saute InfoComment
    end
    
    % COIL Channel DATA ------------------------------------------
    ChData=[];    
    %******** modif singe 11/2003********
    if  (strfind(trial.AcqSoftware,'PosteSinge')==1)    
        move=fseek(fid,InfoDataAdd(1)-1,-1);
        ChData1(1,:)=(fread(fid,trial.coil.NbOfSamples(index),'float32'))'; % RECUPERE Data coil
        move=fseek(fid,InfoDataAdd(2)-1,-1);
        ChData2(1,:)=(fread(fid,trial.coil.NbOfSamples(index),'float32'))'; % RECUPERE Data coil
        %        %**** conv en deg *****
        ChData2(1,:)=(ChData2(1,:)./0.0971)+0.0257;
        ChData1(1,:)=(ChData1(1,:)./(0.1028-(0.0156.*ChData2(1,:))))-0.02;
        trial.coil.RawData1{index}(:,1)=ChData1;
        trial.coil.RawData2{index}(:,1)=ChData2;
    else %poste homme....
        for j=1:(trial.coil.NbOfChannels)
            move=fseek(fid,InfoDataAdd(j)-1,-1);
            ChData(1,:)=(fread(fid,trial.coil.NbOfSamples(index),'float32'))'; % RECUPERE Data coil
            Cmd=['trial.coil.RawData', num2str(j), '{index}(:,1)=ChData;'];
            eval(Cmd);      
        end
    end
    %*************fin modif **************
    
     m=1;
    return;
%************************************************************************


%*************************** LECTURE SPIKE record ***********************  
function m=ReadSpikeRecord(fid,index)
    global spike;
    global trial;
    
    % SPIKE global information ------------------------
    trial.spike.SensoryType(1,:)=char(fread(fid,20,'uchar'))';
    trial.spike.Version(1,:)=char(fread(fid,20,'uchar'))';
    trial.spike.Model(1,:)=char(fread(fid,20,'uchar'))';
    trial.spike.NbOfChannels=fread(fid,1,'int16');                    
    trial.spike.Frequency=fread(fid,1,'int16');
            
    %*********** Modif version *****************
    if (strfind(trial.spike.Version(1,:),'1.00')==1)
        trial.spike.NbOfSamples(index)=fread(fid,1,'int16');
        %NbOfSamples=fread(fid,1,'int16');
    end
    if (strfind(trial.spike.Version(1,:),'1.01')==1)
        trial.spike.NbOfSamples(index)=fread(fid,1,'int32');
        %NbOfSamples=fread(fid,1,'int32');
    end
    %*******************************************
            
    trial.spike.LoCutFreq=fread(fid,1,'int16');
    trial.spike.HiCutFreq=fread(fid,1,'int16');            
    trial.spike.FilterType(1,:)=char(fread(fid,20,'uchar'))';            
    trial.spike.CalibrationMode(1,:)=char(fread(fid,20,'uchar'))';   
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc=fread(fid,trial.spike.NbOfChannels,'int32');
        
    % SPIKE Channel information ------------------------                    
    for i=1:(trial.spike.NbOfChannels)
        move=fseek(fid,FirstLastRc(i)-1,-1);
        if move==1;display='error dans le pointage vers header'
        end  
        trial.spike.InfoChannelName(i,:)=char(fread(fid,20,'uchar'))';
        InfoDataAdd(i)=fread(fid,1,'int32');  
        trial.spike.InfoDataSize(index,i)=fread(fid,1,'int32');  
        trial.spike.InfoGain(i)=fread(fid,1,'float32');  
        trial.spike.InfoUnits(i,:)=char(fread(fid,10,'uchar'))';
        %on saute InfoCalibrationData
        %on saute InfoComment
    end
    
    % SPIKE Channel DATA ------------------------------------------
    ChData=[];
    for j=1:(trial.spike.NbOfChannels)
        
        move=fseek(fid,InfoDataAdd(j)-1,-1);
        ChData(1,:)=(fread(fid,trial.spike.NbOfSamples(index),'float32'))'; % RECUPERE spike data
        Cmd=['trial.spike.RawData', num2str(j), '{index}(:,1)=ChData;'];
        eval(Cmd);      
        
        %move=fseek(fid,InfoDataAdd(j)-1,-1);
        %ChData(1,:)=(fread(fid,NbOfSamples,'float32'))'; % RECUPERE  spike data
        %Indices=find(ChData);
        %Temps=ChData(Indices);     
        %Cmd=['trial.spike.RawData', num2str(j), '{index}(:,1)=Temps;'];       
        %eval(Cmd);
        %Ta=size(Temps);
        %trial.spike.NbOfSpikes{index}(j)=Ta(2);
    end
     m=1;
    return;
%************************************************************************


%*************************** LECTURE BIRD record ***********************  
function m=ReadBirdRecord(fid,index)
    global bird;
    global trial;

    BadDataCode=-3.6973e+028;
    
    Buffer=[];
    Buffer=char(fread(fid,60,'uchar'))';
    trial.bird.SensoryType=Buffer(1:20);
    trial.bird.Version=Buffer(21:40);
    trial.bird.Model=Buffer(41:60);
    Buffer=[];
    Buffer=fread(fid,2,'int16');
    trial.bird.NbOfMarkers=Buffer(1);
    trial.bird.FrameFreq=Buffer(2);               
    trial.bird.NbOfFrames(index)=fread(fid,1,'int32');
    PlaneCoords=fread(fid,3,'float32');
    trial.bird.ZeroMk(1,:)=PlaneCoords(1:3);

    trial.bird.BadDatatExist=fread(fid,1,'int16');
    trial.bird.BadDataCode=fread(fid,1,'float32');

    Buffer=[];
    Buffer=char(fread(fid,40,'uchar'))';
    
    %test du dataref
    trial.bird.DataRef(1,:)=upper(Buffer(1:10));
    if (strfind(trial.bird.DataRef,'B')==1) %dataref='B' Bird
        OK_BIRD=1;OK_USER=0;
    end 
    if (strfind(trial.bird.DataRef,'U')==1) %dataref='U' user ref
        OK_BIRD=0;OK_USER=1;
    end 
    
    %test du RecordMode
    %seul le cas P est trait�
    trial.bird.RecordMode(1,:)=upper(Buffer(11:20));
    if (strfind(trial.bird.RecordMode,'P')==1) %dataref='P' bird Position (XYZ)
        OK_P=1;OK_A=0;OK_M=0;OK_Q=0;
    end 
    trial.bird.PositionUnit(1,:)=Buffer(21:30);
    trial.bird.AngleUnit(1,:)=Buffer(31:40); 
    move=fseek(fid, ftell(fid)+108, -1); %saute DataSize, Comment, UnusedAdd
    FirstLastRc= fread(fid,trial.bird.NbOfMarkers,'int32');

    % BIRD Marker infos -------------------------------------
    for i=1:(trial.bird.NbOfMarkers)
        move=fseek(fid,FirstLastRc(i)-1,-1); % pointe vers header
        if move == 1;display='error dans le pointage vers header'
        end                
        trial.bird.InfoMarkerName(i,:)=char(fread(fid,20,'uchar'))';
        InfoXYZDataAdd(i)=fread(fid,1,'int32');            
        trial.bird.InfoNbOfBadData(index,i)=fread(fid,1,'int32');            
        %on saute InfoDataSize, InfoComment
    end
    
    %extraction en fonction de la nature des data
    %P=position seul cas trait�
     % BIRD Markers DATA------------------------------------------ 
    if (OK_P==1)  %positions
        NbFrame=trial.bird.NbOfFrames(index)*3;
        for i=1:(trial.bird.NbOfMarkers)
            move=fseek(fid,InfoXYZDataAdd(i)-1,-1);
            DataXr(1,:)=(fread(fid,trial.bird.NbOfFrames(index),'float32'))';
            DataYr(1,:)=(fread(fid,trial.bird.NbOfFrames(index),'float32'))';
            DataZr(1,:)=(fread(fid,trial.bird.NbOfFrames(index),'float32'))';
            DataX=DataYr;
            DataY=DataXr;
            DataZ=DataZr;
        end
        if (OK_BIRD==1) %ref BIRD
            DataX=DataXr;
            DataY=DataYr;
            DataZ=DataZr;
        end
        if (OK_USER==1) %ref REF mk
            DataX=DataXr;
            DataY=DataYr;
            DataZ=DataZr;
        end        
        %interp pour une meme base de temps
        if trial.MainTimeBase==1 %si param 'I'
                FreqRatio=trial.MainFrequency/trial.bird.FrameFreq;
                trial.bird.FrameFreq=trial.MainFrequency;
                trial.bird.NbOfFrames(index)=FreqRatio*trial.bird.NbOfFrames(index);
                DataX=interp(DataXr, FreqRatio);
                DataY=interp(DataYr, FreqRatio);
                DataZ=interp(DataZr, FreqRatio); 
        end
    end
    %************* sauvegarde ds les champs *****************************
    Cmd0=['trial.bird.RawData', num2str(i), '{index}'];
    Cmd=[Cmd0, '(:,1)=DataX;'];
    eval(Cmd);
    Cmd=[Cmd0, '(:,2)=DataY;'];
    eval(Cmd);
    Cmd=[Cmd0, '(:,3)=DataZ;'];
    eval(Cmd);
    m=1;
    return;
%************************************************************************


% %************************************************************************
% %************** fonction de convertion vers logiciel canadien ***********
% %************************************************************************
% function Res=MakeConv( r)
% 
% global trial;
% 
% dtchnl=[];
% NbEssais=trial.NbEssais;
% NbCh=0;
% for nb=1:trial.NbOfRecords
%     %*************************Lecture STIM record ************************
%     if strfind(trial.InfoRecordType(nb,:),'stim')==1
%         for ch=1:trial.stim.NbOfStmCh(1)
%             NbCh=NbCh+1;
%             Cmd=['trial.stim.RawData', num2str(ch)];
%             Tempo{NbCh}= eval(Cmd);
%         end
%     end    
%     
%     %*************************Lecture OPTOTRAK record ************************
%     if strfind(trial.InfoRecordType(nb,:),'optotrak')==1
%         for ch=1:trial.opto.NbOfMarkers(1)
%             Cmd=['trial.opto.RawData', num2str(ch),''];
%             Temp= eval(Cmd);
%             for i=1:NbEssais
%                 TempX{i}= Temp{i}(:,1);
%                 TempY{i}= Temp{i}(:,2);
%                 TempZ{i}= Temp{i}(:,3);
%             end
%             NbCh=NbCh+1; Tempo{NbCh}=TempX;
%             NbCh=NbCh+1; Tempo{NbCh}=TempY; 
%             NbCh=NbCh+1; Tempo{NbCh}=TempZ; 
%         end
%     end
%     
%     %*************************Lecture EOG record ************************
%     if strfind(trial.InfoRecordType(nb,:),'eog')==1
%         for ch=1:trial.eog.NbOfChannels(1)
%             NbCh=NbCh+1;
%             Cmd=['trial.eog.RawData', num2str(ch)];
%             Tempo{NbCh}= eval(Cmd);
%         end
%     end
%     
%     %*************************Lecture COIL record ************************
%     if strfind(trial.InfoRecordType(nb,:),'coil')==1
%         for ch=1:trial.coil.NbOfChannels(1)
%             NbCh=NbCh+1;
%             Cmd=['trial.coil.RawData', num2str(ch)];
%             Tempo{NbCh}= eval(Cmd);
%         end
%     end
%     
%     %*************************Lecture SPIKE record ************************
%     if strfind(trial.InfoRecordType(nb,:),'spike')==1
%         for ch=1:trial.spike.NbOfChannels(1)
%             NbCh=NbCh+1;
%             Cmd=['trial.spike.RawData', num2str(ch)];
%             Tempo{NbCh}= eval(Cmd);
%         end
%     end
%     
%     %*************************Lecture BIRD record ************************
%     if strfind(trial.InfoRecordType(nb,:),'bird')==1
%         for ch=1:trial.bird.NbOfMarkers(1)
%             Cmd=['trial.bird.RawData', num2str(ch)];
%             Temp= eval(Cmd);
%             for i=1:NbEssais
%                 TempX{i}= Temp{i}(:,1);
%                 TempY{i}= Temp{i}(:,2);
%                 TempZ{i}= Temp{i}(:,3);
%             end
%             NbCh=NbCh+1; Tempo{NbCh}=TempX;
%             NbCh=NbCh+1; Tempo{NbCh}=TempY; 
%             NbCh=NbCh+1; Tempo{NbCh}=TempZ; 
%         end
%     end
%     
%     %*************************Lecture GENERIC_ANALOG record ************************
%     if strfind(trial.InfoRecordType(nb,:),'generic_analog')==1
%         for ch=1:trial.gen_analog.NbOfChannels(1)
%             NbCh=NbCh+1;
%             Cmd=['trial.generic_analog.RawData', num2str(ch)];
%             Tempo{NbCh}= eval(Cmd);
%         end
%     end
% end
% 
% MaxSample=max(trial.stim.NbOfSamples); %nb de sample max de la session
% Frequency=trial.MainFrequency;
% Sweeptime=MaxSample/Frequency;
% NbSamples=Sweeptime*Frequency;
% 
% %********* structure T_hdchnl tempo*********
% T_hdchnl.npoints=0;
% T_hdchnl.point=0;
% T_hdchnl.sweeptime=Sweeptime;       %variable
% T_hdchnl.nomstim='';
% T_hdchnl.numero=1;
% T_hdchnl.adname='';                 %variable
% T_hdchnl.spcode=0;
% T_hdchnl.rate=Frequency;            %variable
% T_hdchnl.nsmpls=NbSamples;          %variable
% T_hdchnl.usercode=0;
% T_hdchnl.comment='no';
% T_hdchnl.frontcut=0;
% 
% %********* structure T_vg tempo ********
% T_vg.mc=1;
% T_vg.itype=1;
% T_vg.coless=1;
% T_vg.basedir=[];
% T_vg.affiche=2822;
% T_vg.la_pos=[];
% T_vg.sauve=1;
% T_vg.ajout=0;
% T_vg.valeur=0;
% T_vg.prenom='ttt'; %trial.FileName;   %variable
% T_vg.foname=[];
% T_vg.finame=[];
% T_vg.ess=NbEssais;            %variable
% T_vg.nad=NbCh;             %variable
% T_vg.ses=0;            
% T_vg.nst=0;
% T_vg.rearcut=0;
% T_vg.numcondit=0;
% T_vg.niveau=0;
% T_vg.affniv=0;
% T_vg.otype=1;
% T_vg.peinture=0;
% T_vg.xy=0;
% T_vg.pt=1;
% T_vg.zoom=1;
% T_vg.ligne=0;
% T_vg.colcan=1;
% T_vg.colcat=0;
% T_vg.legende=1;
% T_vg.defniv=0;
% T_vg.permute=0;
% T_vg.x=1;
% T_vg.ver=5.2500;
% T_vg.can=1;
% T_vg.tri=1;
% T_vg.lesnoms=[];
% T_vg.lesess=[];
% T_vg.lescats='';
% T_vg.y=1;
% T_vg.loq=1;
% T_vg.xlim=0;
% T_vg.ylim=0;
% T_vg.trich=0;
% T_vg.deroul=[0.01 0.05];
% T_vg.comment=[];
% T_vg.letemps=0;
% T_vg.nextkey=0;
% T_vg.key=0;
%    
% %********* structure vg *********
% vg=T_vg;
% Str=trial.FileName(1,:);
% Str=Str(1:3);
% vg.prenom=Str;
% dtchnl=zeros(MaxSample,NbCh,NbEssais);
% for k=1:NbEssais
%     NbSamp=trial.stim.NbOfSamples(k);
%     for j=1:NbCh
%         %********* structure dtchnl *********
%         dtchnl(1:NbSamp,j,k)=Tempo{j}{k};
%         
%         %********* structure hdchnl tempo*********
%         hdchnl(j,k)=T_hdchnl;
%         hdchnl(j,k).sweeptime=NbSamp/Frequency;
%         hdchnl(j,k).nsmpls=NbSamp;
%         hdchnl(j,k).adname=num2str(trial.OrgTrialNb(k));
%         hdchnl(j,k).numero=trial.OrgTrialNb(k);
%         
%     end
% end
% 
% save(r, 'dtchnl', 'hdchnl', 'vg');
% Res=1;
% return