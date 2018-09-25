%******************************************************************
%   VERSION UTILISANT LE FICHIER MATLAB CREE PAR LE PROGRAMME
%                   pg_dev_102_light
%******************************************************************
%********************************************************************
%      MODIF VERSION LIGNE 127g
%********************************************************************

function varargout = Main(varargin)
% MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 14-Nov-2016 10:23:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    varargin{:}
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --------------------------------------------------------------------
function mnuVersion_Callback(hObject, eventdata, handles)

switch handles.MainVersion
    case handles.BasicVersionID
        Label= 'de base';
    case handles.FullVersionID
        Label= 'compl�te';
    case handles.NewFullVersionID
        Label= 'compl�te';
    case handles.HandiMainVersionID
        Label= 'HandiMain';
    otherwise
        Label='inconnue';
end
h=helpdlg( Label,'Version ');


% --- Executes just before Main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
global trial
global ChannelsProperties;
global PathSep
global Version
global MainVersion
global HandiMainVersionID;
global BasicVersionID;
global FullVersionID;
global MarkerList
global MatfilePath
global WorkDir
%-----------------------

WorkDir='C:\';


%----- la liste des Mk, leurs caracteristiques pour la version Handimain -----
MarkerList={};
MarkerList{1}.ChNb=1;
MarkerList{1}.Name='index';
MarkerList{1}.Color='r';
MarkerList{2}.ChNb=2;
MarkerList{2}.Name='pouce';
MarkerList{2}.Color='b';
MarkerList{3}.ChNb=3;
MarkerList{3}.Name='poignet';
MarkerList{3}.Color='g';
MarkerList{4}.ChNb=4;
MarkerList{4}.Name='coude';
MarkerList{4}.Color='k';
MarkerList{5}.ChNb=5;
MarkerList{5}.Name='epaule';
MarkerList{5}.Color='y';
MarkerList{6}.ChNb=5;
MarkerList{6}.Name='epaule';
MarkerList{6}.Color='m';
MarkerList{7}.ChNb=5;
MarkerList{7}.Name='epaule';
MarkerList{7}.Color='c';
%-----------------------------------------------------

%---- les versions dispo ----
BasicVersionID=0;
FullVersionID=100;
NewFullVersionID=200; 
HandiMainVersionID=10;
%----------------------------
PathSep='/';
Version='17/4/2012';

MatfilePath=pwd;

%**************************************************************************
%**************************************************************************
%************************* VERSION EN COURS ******************************* 
%**************************************************************************
%**************************************************************************
MainVersion=HandiMainVersionID; 
MainVersion=BasicVersionID; % 3D seulement
MainVersion=FullVersionID; 
MainVersion=HandiMainVersionID; 
MainVersion=NewFullVersionID; 
%**************************************************************************




%%global DelaiOeil;
handles.output = hObject;
handles.MainVersion=MainVersion;
handles.BasicVersionID=BasicVersionID;
handles.FullVersionID=FullVersionID;
handles.NewFullVersionID=NewFullVersionID;
handles.HandiMainVersionID=HandiMainVersionID;

%------ version matlab ---------
% V=ver('matlab');
% VersionMatlab=V.Version;
% Pos=strfind(VersionMatlab,'.');
% VersionMatlab(Pos)=[];
% VersionMatlab=VersionMatlab(1:2);
% VersionMatlabNum=str2num(VersionMatlab);
%------------------------------

% %-----tool bar ---------
% ht = uitoolbar(handles.figMain);
% clear a;
% a(:,:,1) = rand(20);
% a(:,:,2) = rand(20);
% a(:,:,3) = rand(20);
% a = imread('icone','bmp');
% A = ind2rgb(a,colormap);
% htt = uitoggletool(ht,'CData',A,'TooltipString','Rename');
% 
% clear a;
% a = [.05:.05:0.95];
% b(:,:,1) = repmat(a,19,1)';
% b(:,:,2) = repmat(a,19,1);
% b(:,:,3) = repmat(flipdim(a,2),19,1);
% hpt = uipushtool(ht,'CData',b,'TooltipString','Move');
% 
% clear a;
% a(:,:,1) = rand(20);
% a(:,:,2) = rand(20);
% a(:,:,3) = rand(20);
% htt1 = uitoggletool(ht,'CData',a,'TooltipString','Delete');
%------------------------
DisableAll(handles);
% Update handles structure
guidata(hObject, handles);
trial=[]; ChannelsProperties=[];
DataDir='';
set(handles.Untitled_1,'Enable', 'Off'); %separateur
set(handles.chkXselect,'visible','off');    
set(handles.chkYselect,'visible','off');    
set(handles.chkZselect,'visible','off');   
set(handles.chkTselect,'visible','off');   
set(handles.btnVoieUp,'Visible','off');
set(handles.btnVoieDown,'Visible','off');
set(handles.chkCursors, 'value', 1);
set(handles.chkPan, 'visible','on');

set(handles.mnuTraitements,'enable', 'off');
set(handles.mnuEyetrackerFiltrage,'enable', 'on');
set(handles.mnuEyetrackerVitesse,'enable', 'on');
set(handles.mnuEyetrackerConv,'enable', 'on');
set(handles.mnuRecaler,'enable', 'off');

set(handles.mnuEdit,'enable', 'off');
set(handles.mnuEffVoie,'enable', 'off');
set(handles.mnuSynchroMode,'enable', 'on');
set(handles.mnuExport,'enable', 'off');
set(handles.mnuSave,'enable', 'off');
set(handles.uiSaveFile,'enable', 'off');

set(handles.Untitled_1,'enable', 'off');
set(handles.Untitled_4,'enable', 'off');
set(handles.mnuCat,'enable', 'Off');
set(handles.mnuVisu3D,'enable', 'off');
set(handles.mnuMode,'enable', 'off');
set(handles.mnuCancelMode,'enable', 'off');
set(handles.mnuCancelMode,'Label', '');
set(handles.mnuOnePt,'enable', 'off');
set(handles.mnuHandi2Word,'Enable', 'off');
a=1;

%--------- effacement menus inutiles -------
%----------- modif menus --------------
switch MainVersion
    case {BasicVersionID, HandiMainVersionID}
        delete(handles.mnuGenericAnalog);
        delete(handles.mnuExploration);
        delete(handles.mnuOeil);
        delete(handles.mnuEog);
        delete(handles.mnuCoil);
        delete(handles.mnuEyetracker);
        delete(handles.mnuEyelink);
        delete(handles.mnuTetaVecteurVitesse);
        delete(handles.mnu_zebris);
        delete(handles.mnuOptotrak);
        delete(handles.mnuNewOptotrak);
        delete(handles.mnuVicon);
        delete(handles.mnuBird);
        delete(handles.mnuSpike);
        delete(handles.mnuMep);
        delete(handles.mnuCat);
        delete(handles.mnuMode);
        delete(handles.mnuTronquer);
        delete(handles.mnuCouper);
        delete(handles.mnuExport);
%         delete(handles.btnMvtOpt);
        delete(handles.frame7);% 
        delete(handles.radRenVoie);% delete(handles.);
        delete(handles.radRenEssai);% delete(handles.);
        delete(handles.radRenComp);% delete(handles.);
        delete(handles.lblTra);
        delete(handles.lblCur);
        delete(handles.txtYnormRange);
        delete(handles.mnuVisu3D);
        set(handles.mnu3D, 'Label', 'Cin�matique');
        set(handles.mnu3DCinematique, 'Label', 'Marqueur');
        set(handles.mnu3DModule, 'Label', 'Pince');
        set(handles.mnuHandi2Word,'Enable', 'on');
        set(handles.mnuHandi2Word,'Enable', 'on');
    case FullVersionID
    case NewFullVersionID
        delete(handles.mnuEffVoie);
        delete(handles.mnuVisu3D);
        delete(handles.txtYnormRange);
        delete(handles.frame7);% 
        delete(handles.radRenVoie);% delete(handles.);
        delete(handles.radRenEssai);% delete(handles.);
        delete(handles.radRenComp);% delete(handles.);
        delete(handles.lblTra);
        delete(handles.lblCur);
        delete(handles.mnuCat);
        delete(handles.mnuMode);
    otherwise
end

% delete(handles.);
% delete(handles.);
% delete(handles.);
% delete(handles.);

% set(handles.mnuTraitements,'UIContextMenu',handles.mnuCxt);

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function lstRecType_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes during object creation, after setting all properties.
function lstFile_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function txtDisp_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





%*******************************************************************
%                   FONCTIONS
%*******************************************************************
function exist=IsRecord(Rec)
global ChannelsProperties;

S=size(ChannelsProperties.ChannelInfos);S=S(2);
for i=1:S
    Rep=strfind(ChannelsProperties.ChannelInfos(i).ParentField, Rec);
    if isempty(Rep)~=1 exist=1; break; else exist=0; end
end


% ----------INUTILISEE----------------------------
function exp=load_experiment(dir_path)
dir_path='..',PathSep,'data-merge',PathSep;
Filename=[dir_path,'exp.mat'];
load(Filename);


% ------------------------------------------------------------
function liste=GetChList()
global trial;
liste=trial.InfoRecordType;


% ------------------------------------------------------------
function h=load_listbox( ListeFilename, ListeEssaisChrono, ListeIndMain, Sel, handles)
h=handles;
h.file_names = ListeFilename; %sorted_names;
h.ListeEssaisChrono=ListeEssaisChrono;
h.ListeIndMain=ListeIndMain;
set(h.lstFile,'String',h.file_names,...
	'Value',Sel)
guidata(handles.figMain,h);

% ------------------------------------------------------------
function load_Reclistbox(Liste, handles, Sel)
h=handles;
h.rec_names = Liste; %orted_names;
set(handles.lstRecType,'String',h.rec_names,...
	'Value',Sel)



%**************************************************************************
function ClearStimTxt(handles)
set(handles.txtPrePar,'String', '');
set(handles.txtSeqPar,'String', '');
set(handles.txtPstPar,'String', '');
set(handles.txtPre,'String', '');
set(handles.txtSeq,'String', '');
set(handles.txtPst,'String', '');

%**************************************************************************
function ClearParTxt(handles)
set(handles.txtEvent,'String', '');
set(handles.txtEssai,'String', '');
set(handles.txtVoie,'String', '');
set(handles.txtXdata,'String', '');
set(handles.txtYdata,'String', '');
set(handles.txtDuree,'String', '');
set(handles.txtFreqEch,'String', '');

%**************************************************************************
function SetStimTxt(handles, Curve, pos_curve)
global trial;
global DummyParamCode;
global SoftOrg;
DummyParamCode='-99';
DummyParamStr=' x ';
%------------ param pre sequence --------------------------
SeqType=trial.stim.PreSeqType(Curve.NumEssai(pos_curve),:);
StimParams=num2str(trial.stim.PreSeqParam{Curve.NumEssai(pos_curve)});
Index=strfind(StimParams,DummyParamCode);
for i=1:size(Index,2)
    StimParams(Index(i):Index(i)+size(DummyParamCode,2)-1)=DummyParamStr;
end
set(handles.txtPrePar,'String', StimParams);
set(handles.txtPre,'String', SeqType);

if strfind(SoftOrg,'m&h')==1
    %------------ param sequence cas plateforme M&H--------------------------
    SeqType=trial.stim.SeqType(Curve.NumEssai(pos_curve),:);
    %---StimParams est une liste de string----
    NbParams=trial.stim.SeqNbOfPar(Curve.NumEssai(pos_curve));
%     StimParams=num2str(trial.stim.SeqParam{Curve.NumEssai(pos_curve)});
%     Index=strfind(StimParams,DummyParamCode);
    StimParams='';
%     for i=1:NbParams
%         StimParams=[StimParams, deblank(trial.stim.SeqParam{i,Curve.NumEssai(pos_curve)}), '   '];
%     end
    StimParams=deblank(trial.stim.SeqParam{Curve.NumEssai(pos_curve)});
    StimParams=deblank(StimParams);
    set(handles.txtSeqPar,'String', StimParams);
    set(handles.txtSeq,'String', SeqType);
else
    %------------ param sequence cas g�n�ral--------------------------
    SeqType=trial.stim.SeqType(Curve.NumEssai(pos_curve),:);
    %---StimParams est une liste d'entiers----
    StimParams=num2str(trial.stim.SeqParam{Curve.NumEssai(pos_curve)});
    Index=strfind(StimParams,DummyParamCode);
    for i=1:size(Index,2)
        StimParams(Index(i):Index(i)+size(DummyParamCode,2)-1)=DummyParamStr;
    end
    set(handles.txtSeqPar,'String', StimParams);
    set(handles.txtSeq,'String', SeqType);
end
%------------ param post sequence --------------------------
SeqType=trial.stim.PstSeqType(Curve.NumEssai(pos_curve),:);
StimParams=num2str(trial.stim.PstSeqParam{Curve.NumEssai(pos_curve)});
%------ recherche des dummy code -------
Index=strfind(StimParams,DummyParamCode);
for i=1:size(Index,2)
    StimParams(Index(i):Index(i)+size(DummyParamCode,2)-1)=DummyParamStr;
end
set(handles.txtPstPar,'String', StimParams);
set(handles.txtPst,'String', SeqType);



%*********************************************************************
%**********      MOUSE ---> SELECTION D'UNE COURBE      **************
%*********************************************************************
function CurveMouseDown(hObject, Event, Cursor, Curve, handles )
% function CurveMouseDown(hObject, Event, handles )
global ChannelsProperties;
global trial;
global DetectPince3D;

% global Cursor;
% global Curve;


Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
Xlim=get(handles.figData,'Xlim');
%-------- etat des check ---------
if ishandle(handles.radCursModif) ModifOK=get(handles.radCursModif,'Value'); else ModifOK=0; end
if ishandle(handles.radAjoutCur) AjoutCurOK=get(handles.radAjoutCur,'Value'); else AjoutCurOK=0; end
if ishandle(handles.radSuppCur) SuppCurOK=get(handles.radSuppCur,'Value'); else SuppCurOK=0; end
if ishandle(handles.radAjoutMvt) AjoutMvtOK=get(handles.radAjoutMvt,'Value'); else AjoutMvtOK; end
if ishandle(handles.radSuppMvt) SuppMvtOK=get(handles.radSuppMvt,'Value'); else SuppMvtOK=0; end
if ishandle(handles.radDeplMvt) DeplMvtOK=get(handles.radDeplMvt,'Value'); else DeplMvtOK=0; end
if ishandle(handles.radReadMouse) LectOK=get(handles.radReadMouse,'Value'); else LectOK=0; end
if ishandle(handles.radRenVoie) RenameVoieOK=get(handles.radRenVoie,'Value'); else RenameVoieOK=0; end
if ishandle(handles.radRenEssai)RenameEssaiOK=get(handles.radRenEssai,'Value'); else RenameEssaiOK=0; end
if ishandle(handles.radRenComp) RenameCompOK=get(handles.radRenComp,'Value'); else RenameCompOK=0; end
% set(handles.btnMvtOpt,'enable','on');


%trouver la courbe selectionn�e trial.etc
pos_curve=find(Curve.hCurve==hObject);
XLim=(trial.stim.NbOfSamples(Curve.NumEssai(pos_curve))-1)*trial.MainFrequency/trial.stim.Frequency;
%***** recup des noms evnt, voie, channel ****
%*** pour info sur visu ****
% CurrentCurve.NumEssai=Curve.NumEssai(pos_curve);
% CurrentCurve.NumEssai=
EssaiName=num2str(trial.OrgTrialNb(Curve.NumEssai(pos_curve)));
ChName=['Essai: ',EssaiName];
PlotName=Curve.PlotName{pos_curve};
%PlotName=ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).PlotName(Curve.PlotNb(pos_curve));
FreqRatio=ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio;
CurveName=ChannelsProperties.ChannelList{Curve.SelNb(pos_curve)};
FreqEch=int16(round(trial.MainFrequency/FreqRatio));
ClearParTxt(handles);
set(handles.txtEssai,'String', ChName);
set(handles.txtVoie,'String', CurveName);
set(handles.txtComp,'String', [upper(PlotName)]);
set(handles.txtComp,'ForegroundColor', Curve.PlotColor{pos_curve});
set(handles.txtComp,'FontWeight', 'bold');
set(handles.txtDuree,'String', ['Duree= ',num2str(XLim), 'ms']);
handles.CurrentCurves=Curve;% courbes � l'�cran
handles.SelectedCurve=pos_curve;%courbe selectionn�e
if strfind(Curve.FieldName{pos_curve},'Pince') %mvt 3D
    str='pince ';
else
    str='Mvt ';
end
if ishandle(handles.btnMvtOpt) set(handles.btnMvtOpt,'String', [str,Curve.ParentField{pos_curve}]); end %modif 19/7/2011

set(handles.txtFreqEch,'String', ['Ech: ', num2str(FreqEch), 'Hz']);
h=handles;
guidata(h.figMain,h);

ValMouse=get(gca, 'CurrentPoint');
Xdata=ValMouse(1,1);
set(handles.txtXdata,'String',['T=', num2str(Xdata,5), 'ms']);
%**recup data de la voie selectionn�e***
CurveDataCmd=['trial.', Curve.ParentField{pos_curve}, '.', Curve.FieldName{pos_curve}(1,:),num2str(Curve.Ch(pos_curve)), '{', num2str(Curve.NumEssai(pos_curve)) ,'}(:,', num2str(Curve.PlotNb(pos_curve)),');'];
% if ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio>1
%     CurveData=eval(CurveDataCmd);
%     CurveData = interp(CurveData,ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio);
% else
%     CurveData=eval(CurveDataCmd);
% end
% % Ydata=CurveData(round(Xdata)+1); 

CurveData=eval(CurveDataCmd);
FreqRatio=ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio;
CursorXpos=round(Xdata/FreqRatio)+1;


Ydata=CurveData(round(CursorXpos)); 
set(handles.txtYdata,'String',['Data=', num2str(Ydata,5)]);
set(handles.txtEvent,'String', 'Point courant');

%------- affichage des params de la stimulation-----
ClearStimTxt(handles);
SetStimTxt(handles, Curve, pos_curve);
%---------------------------------------------------
if ishandle(handles.mnuSynchroMode)
    DataStruct=get(handles.mnuSynchroMode,'UserData');
    if DataStruct.Sync==1  return; end
end
if get(handles.chkZoom, 'value')==1 return; end

but=3;
%-----------------------------------------------------
%              RENOMMER UNE VOIE, UNE COMPOSANTE
%-----------------------------------------------------
if RenameVoieOK==1 | RenameCompOK==1
    set(hObject,'Selected','on');
    set(hObject,'SelectionHighlight','on');
    if RenameVoieOK==1 ParamsIn.ChName=CurveName; end
    if RenameCompOK==1 ParamsIn.ChName=PlotName; end
    OutStruct=RenommerVoie(ParamsIn);
    if OutStruct.Rep==1
        set(hObject,'Selected','off');
        if RenameVoieOK==1
            set(handles.txtVoie,'String', OutStruct.NewName);
            ChannelsProperties.ChannelList{Curve.SelNb(pos_curve)}=OutStruct.NewName;
            load_Reclistbox(ChannelsProperties.ChannelList, handles, Rec_selected);
        end
        if RenameCompOK==1
            set(handles.txtComp,'String', OutStruct.NewName(1));
            ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).PlotName(Curve.PlotNb(pos_curve))=OutStruct.NewName(1);
        end
    else
        set(hObject,'Selected','off');
    end
    return;
end
%-----------------------------------------------------
%                 RENOMMER UN ESSAI
%-----------------------------------------------------
if RenameEssaiOK==1 
    IndListSelect = get(handles.lstFile,'Value');
    list_entries =handles.ListeIndMain(IndListSelect);
    set(hObject,'Selected','on');
    set(hObject,'SelectionHighlight','on');
    ParamsIn.ChName=handles.file_names(Curve.NumEssai(pos_curve),:); %CurveName;
    OutStruct=RenommerVoie(ParamsIn);
    if OutStruct.Rep==1
        set(hObject,'Selected','off');
        handles.file_names(Curve.NumEssai(pos_curve),:)=OutStruct.NewName%         set(handles.txtVoie,'String', OutStruct.NewName);
%         ChannelsProperties.ChannelList{Rec_selected(pos_curve)}=OutStruct.NewName;
%         load_Reclistbox(ChannelsProperties.ChannelList, handles);
    else
        set(hObject,'Selected','off');
    end
    return;
end
%-----------------------------------------------------
%                 AJOUTER UN CURSEUR
%-----------------------------------------------------
if (AjoutCurOK==1 )
    %trouver la courbe selectionn�e trial.etc
    %Il s'agit dune courbe Vitesse (Vit...) ???
    %if strfind(Curve.FieldName{pos_curve}(1,:),'Vit')==1
        set(hObject,'Selected','on');
        set(hObject,'SelectionHighlight','on');
        CurveOK=1;
        %else
      %VitCurveOK=0;
      %end
        while but ~= 1 %1=btn gauche
            [xi,~,but] = ginput(1);
            if but==3 %3=btn droit=echappement
                break;
            end
        end
        %trouver avec xi le temps correspondant en ms
        if (xi<=XLim) && (xi>0) && (but==1)
            NewX=round(xi);
            Cmd0=['Add_', Curve.ParentField{pos_curve}, 'Cursor(handles, Cursor, 0, Curve, pos_curve, NewX);' ];
            eval(Cmd0);
        end
        set(hObject,'Selected','off');
        ClearParTxt(handles);
        ClearStimTxt(handles);
        [Cv, Cr]=AfficheCourbes(handles);
%     if (SuppMvtOK==1 | DeplMvtOK==1)
%         Cursor.toto=1;
%     end
end

%-----------------------------------------------------
%                 AJOUTER UN MOUVEMENT
%-----------------------------------------------------
if (AjoutMvtOK==1 )
    %trouver la courbe selectionn�e trial.etc
    %Il s'agit dune courbe Vitesse (Vit...) ???
    if strfind(Curve.FieldName{pos_curve}(1,:),'Vit')==1
        set(hObject,'Selected','on');
        set(hObject,'SelectionHighlight','on');
        VitCurveOK=1;
    else
      %set(handles.txtEssai,'String', 'Il faut un champ Vitesse');
      VitCurveOK=0;
    end
    if VitCurveOK==1
        while but ~= 1 %1=btn gauche
            [xi,yi,but] = ginput(1);
            if but==3 %3=btn droit=echappement
                break;
            end
        end
        %trouver avec xi le temps correspondant en ms
        %if (AjoutMvtOK==1) & (xi<=XLim) & (xi>0) & (but==1)
        if (AjoutMvtOK==1) & (but==1)
            NewX=round(xi);
%             Cmd0=['Add_', Curve.ParentField{pos}, 'Mvt(', 'Cursor, Curve, Curve.ParentField{pos}, Curve.FieldName{pos}', ',', num2str(Curve.NumEssai(pos)), ',', 'Curve.Ch(pos)', ',', num2str(Curve.SelNb(pos)), ',', num2str(NewX), ');' ];
            Cmd0=['Add_', Curve.ParentField{pos_curve}, 'Mvt(handles, Cursor, 0, Curve, pos_curve, NewX);' ];
            eval(Cmd0);
        end
        set(hObject,'Selected','off');
        ClearParTxt(handles);
        ClearStimTxt(handles);
        [Cv, Cr]=AfficheCourbes(handles);
    end
    if (SuppMvtOK==1 | DeplMvtOK==1)
        Cursor.toto=1;
    end
end
%************** fin detection MouseDown sur courbe ******************


%*********************************************************************
%**********      MOUSE ---> SELECTION D'UNE COURBE      **************
%*********************************************************************
% function FigureMouseDown(hObject, Event, Cursor, Curve, handles )
% global trial
% 
% Z=1;


%********************* AJOUT DE CURSEUR******************************
%*********************************************************************
function Add_stimCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='stim';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_eogCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='eog';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_eyelinkCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='eyelink';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_eyetrackerCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='eyetracker';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_coilCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='coil';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_birdCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='bird';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_optoCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='opto';
CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************inactive********************************
function CreateCur(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );
global ChannelsProperties;
global trial;



%*******************  AJOUT DE MOUVEMENT ****************************

%*********************************************************************
function Add_eogMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eog';
Action='add';
CreateEyeXMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_eyelinkMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eyelink';
Action='add';
CreateEyeXYMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_eyetrackerMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eyetracker';
Action='add';
CreateEyeXYMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_optoMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='opto';
Action='add';
Create3DMvtNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Add_viconMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='vicon';
Action='add';
Create3DMvtNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%********************************a revoir*******************************
function Add_coilMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX) %tous des float
SrcField='coil';
Action='add';
CreateEyeMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************a revoir********************************
function Add_birdMvt(handles, Cursor, Cursor_pos,Curve, Curve_pos, NewX ) %tous des float
SrcField='bird';
Action='add';
Create3DMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );


%*********************************************************************
%**********      MOUSE ---> SELECTION D'UN EVENT        **************
%*********************************************************************
function EventMouseDown(hObject, Event, Cursor, Curve, handles )
% function EventMouseDown(hObject, Event, handles )
global ChannelsProperties;
global trial;
% global Cursor;
% global Curve;


Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
Xlim=get(handles.figData,'Xlim');
%--------------- lecture des check ---------------
if ishandle(handles.mnuSynchroMode)
    DataStruct=get(handles.mnuSynchroMode,'UserData');
    SynchroOK=DataStruct.Sync;
else
    SynchroOK=0;
end
% if SynchroOK==1
%     return
% end
ModifOK=get(handles.radCursModif,'Value');
AjoutCurOK=get(handles.radAjoutCur,'Value');
SuppCurOK=get(handles.radSuppCur,'Value');
AjoutMvtOK=get(handles.radAjoutMvt,'Value');
SuppMvtOK=get(handles.radSuppMvt,'Value');
DeplMvtOK=get(handles.radDeplMvt,'Value');
LectOK=get(handles.radReadMouse,'Value');
RenameCursorOK=get(handles.radRenCur,'Value');
% set(handles.btnMvtOpt,'enable','on');

%--------------- Messages -------------
if SuppMvtOK==1 set(handles.txtMessage,'String','supp mvt'); end
if AjoutMvtOK==1 set(handles.txtMessage,'String','Ajout mvt'); end
if ModifOK==1 set(handles.txtMessage,'String','Amenez le pointeur sur le nouvel emplacement et validez'); end
if LectOK==1 set(handles.txtMessage,'String','selectionnez le point X � mesurer '); end
if DeplMvtOK==1 set(handles.txtMessage,'String','D�placement du mvt '); end

but=3;
pos=find(Cursor.hCursor==hObject);
pos_cursor=find(Cursor.hCursor==hObject);
pos_curve=find((Curve.SelNb==Cursor.SelNb(pos_cursor)) & (Curve.NumEssai==Cursor.NumEssai(pos_cursor)) & (Curve.PlotNb==Cursor.PlotNb(pos_cursor)) );
S=size(pos_curve); S=S(2);
if S>1 pos_curve=pos_curve(1); end %cas du 3D
VitCurveOK=0;

%------- Lecture des champs noms, evnt, voie, channel pour affichage sur visu ----------------
EssaiName=num2str(trial.OrgTrialNb(Cursor.NumEssai(pos)));
ChName=[Cursor.Parent{pos},num2str(Cursor.Ch(pos)),Curve.FieldName{pos_curve}(1,:)];
ChName=Cursor.ChannelName{pos};
CursorName=Cursor.Label{pos};
PlotName=Curve.PlotName{pos_curve};
ClearParTxt(handles);
set(handles.txtComp,'String', [upper(PlotName)]);
set(handles.txtComp,'ForegroundColor', Curve.PlotColor{pos_curve});
set(handles.txtComp,'FontWeight', 'bold');
set(handles.txtEvent,'String', CursorName);
set(handles.txtEssai,'String', ['Essai: ',EssaiName]);
set(handles.txtVoie,'String',ChName);
set(handles.txtXdata,'String',['T=', num2str(Cursor.X(pos),5), 'ms']);

%**recup data de la voie de l'event selectionn�***
CurveDataCmd=['trial.', Curve.ParentField{pos_curve}, '.', Curve.FieldName{pos_curve}(1,:),num2str(Curve.Ch(pos_curve)), '{', num2str(Curve.NumEssai(pos_curve)) ,'}(:,', num2str(Curve.PlotNb(pos_curve)),');'];
% if ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio>1
%     CurveData=eval(CurveDataCmd);
%     CurveData = interp(CurveData,ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio);
% else
%     CurveData=eval(CurveDataCmd);
% end

CurveData=eval(CurveDataCmd);
FreqRatio=ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).FreqRatio;
CursorXposIndex=round(Cursor.X(pos)/FreqRatio)+1;

%--- Index=Temps + 1 ------
%-- A l'index 1 correspond le temps 0 ---
Ydata=CurveData(CursorXposIndex); 
set(handles.txtYdata,'String',['Data=', num2str(Ydata,5)]);
XLim=trial.stim.NbOfSamples(Cursor.NumEssai(pos_cursor));
set(handles.txtDuree,'String', ['Duree= ',num2str(XLim), 'ms']);
if ishandle(handles.btnMvtOpt) set(handles.btnMvtOpt,'String', ['Mvt ',Curve.ParentField{pos_curve}]); end %modif 19/7/2011
ClearStimTxt(handles);
SetStimTxt(handles, Curve, pos_curve);
NbComp=ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).NbOfPlotByCh;
if get(handles.chkZoom, 'value')==1 return; end

%***************** synchronisation ******************
if SynchroOK==1
    CmdPar=[];
    set(hObject,'Selected','on');
    set(hObject,'SelectionHighlight','on');
    set(hObject,'UserData',[]);
    CmdPar=['trial.',ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).Event(Curve.PlotNb(pos_curve)).ParentField, num2str(Curve.Ch(pos_curve))];
    Params=eval(CmdPar);
    %pr ts les essais le temps de l'evt choisi
    for i=1:trial.NbEssais
        cmdP=['Tempo(i)=Params', '{i}.',CursorName,';'];
        eval(cmdP);
    end
    DataStruct.Params=Tempo;
    DataStruct.ParamField=CursorName;
    set(handles.mnuSynchroMode,'UserData', DataStruct);
    [Cv, Cr]=AfficheCourbes(handles);
    return;
end

%***************** renommer un curseur **************
if RenameCursorOK==1
    set(hObject,'Selected','on');
    set(hObject,'SelectionHighlight','on');
    ParamsIn.ChName=CursorName;
    OutStruct=RenommerVoie(ParamsIn);
    if OutStruct.Rep==1
        a=1;
%         ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).Event(Cursor.PlotNb(pos_cursor)).Label=OutStruct.NewName;
        ChannelsProperties.ChannelInfos(Curve.SelNb(pos_curve)).Event(pos_cursor).Label=OutStruct.NewName;
        set(handles.txtEvent,'String', OutStruct.NewName);
        set(hObject,'Selected','off');
        [Cv, Cr]=AfficheCourbes(handles);% 
    else
        set(hObject,'Selected','off');
    end
    return;
end


%-------- supprimer un curseur -------
%--------curseurs stim uniquement
if (SuppCurOK==1)
    if strfind(lower(Cursor.Parent{pos_cursor}(1,:)),'stim')==1 %curseurs stim uniquement
        rep=questdlg( 'Voulez vous effacer?', 'Confirmation effacement', 'Oui', 'Non', 'Non');
        if strcmp('Oui',rep)==1
            Cmd0=['Supp_', Curve.ParentField{pos_curve}, 'Cursor(handles, Cursor, pos_cursor, Curve, pos_curve);' ];
            eval(Cmd0);
            [Cv, Cr]=AfficheCourbes(handles);
        end
    end
end

%------ appui mouse drag -------------------------
%------ modifier, deplacer, supprimer un mvt -----
if (ModifOK==1  | DeplMvtOK==1 | SuppMvtOK==1)
    VitCurveOK=1;
    if DeplMvtOK==1 | SuppMvtOK==1
        %Il s'agit dune courbe Vitesse et un evt pic ???
        if strfind(Curve.FieldName{pos_curve}(1,:),'Vit')==1  & isempty(strfind(Cursor.ParamFieldName{pos_cursor},'Pic'))~=1
            if Curve.PlotNb(pos_curve)==NbComp
                set(hObject,'Selected','on');
                set(hObject,'SelectionHighlight','on');
                VitCurveOK=1;
            else
                VitCurveOK=0;
            end
        else
            %set(handles.txtEssai,'String', 'Il faut un event Vitesse');
            VitCurveOK=0;
        end
    end
    if VitCurveOK==1
        %***** recup des noms evnt, voie, channel ****
        %*** pour info sur visu ****
        set(hObject,'Selected','on');
        set(hObject,'SelectionHighlight','on');
        if SuppMvtOK==0
            while but ~= 1 %1=btn gauche
                [xi,yi,but] = ginput(1); % apparition de la croix pour selection et attente click
                if but==3 %3=btn droit
                    set(hObject,'Selected','off');
                    break;
                end
            end
        end
    end
end

%--------------- deplacement d'un curseur-----------
%-------------- mouse drop -----------------
if ModifOK==1 %---06/2006---
    if but==1 
        %----- Nb echantillons de la courbe en cours----
        Xtemp=get(Curve.hCurve(pos_curve), 'XData');XLim=Xtemp(end);
        %---- New cursor hors limite ? ------
        if (xi<=XLim)& (xi>0) 
            pos_cursor=find(Cursor.hCursor==hObject);
            NewX=round(xi);
            Cmd0=['Move_', Cursor.Parent{pos_cursor}, 'Cursor(handles, Cursor, pos_cursor, Curve, pos_curve, NewX);' ];
            eval(Cmd0);
            set(hObject,'Selected','off');
            [Cv, Cr]=AfficheCourbes(handles);
        else
            set(hObject,'Selected','off');
        end       
    end
    set(handles.txtMessage,'String','selectionnez le curseur � d�placer');
end
%--------------- lecture des curseurs---------------
% if LectOK==1 %
%     if but==1 
%         if (xi<=Xlim(2))& (xi>Xlim(1)) 
%             pos_cursor=find(Cursor.hCursor==hObject);
%             NewX=round(xi);
%             Cmd=['trial.', Cursor.ParentField{pos_cursor}, '{', num2str(Cursor.NumEssai(pos_cursor)), '}.',  Cursor.ParamFieldName{pos_cursor}];
%             X=NewX-eval(Cmd);
%             Texte=['X=',num2str(X), 'ms'];
%             set(handles.txtX,'String',Texte);
%         end
%     end
%     set(handles.txtMessage,'String','selectionnez le point X reference T=0 ');
% end

%--------------- Deplacement d'un mouvement ---------------
%----------------- mouse drop ------------------------
if DeplMvtOK==1 %
    if but==1 
        %----- Nb echantillons de la courbe en cours----
        Xtemp=get(Curve.hCurve(pos_curve), 'XData');XLim=Xtemp(end);
        %---- New cursor hors limite ? ------
        if (xi<=XLim)& (xi>0) 
            pos_cursor=find(Cursor.hCursor==hObject);
            NewX=round(xi);
            set(hObject,'Visible','off');
            CurrentComp=Cursor.PlotNb(pos_cursor);
%             CurrentEssai=Cursor.NumEssai(pos_cursor);
%             Ind=find(Curve.NumEssai==CurrentEssai);
            PositionCurveIndex=find(Curve.PlotNb==CurrentComp);
            CurrentPositionCurve=intersect(PositionCurveIndex,pos_curve);
            %CurrentPositionCurve=find(PositionCurveIndex==pos_curve);    
            %CurrentPositionCurve=PositionCurveIndex(CurrentPositionCurve);
%             FieldName=lower(Curve.FieldName);
            FieldName=lower(Curve.FieldName{pos_curve}(1,:));
            if strcmp(FieldName, 'vit')
                str='Mvt';
            else
                if strcmp(FieldName, 'vitpince')
                    str='MvtPince';
                end
            end
            Cmd0=['Move_', Curve.ParentField{CurrentPositionCurve}, str,'(handles, Cursor, pos_cursor, Curve, CurrentPositionCurve, NewX);' ];%NewX=temps
            %Cmd0=['Move_', Curve.ParentField{pos_curve}, 'Mvt(handles, Cursor, pos_cursor, Curve, pos_curve, NewX);' ];%NewX=temps
            eval(Cmd0);
            set(hObject,'Selected','off');
            [Cv, Cr]=AfficheCourbes(handles);
        else
            set(hObject,'Selected','off');
        end
    end
end

%--------------- effacement d'un mouvement ---------------
%----------------- mouse click----------------------------
%VitCurveOK=1  -->  suppression d'un event sur une coube vitesse
if SuppMvtOK==1 & VitCurveOK==1
    pos_cursor=find(Cursor.hCursor==hObject);
    pos_curve=find((Curve.SelNb==Cursor.SelNb(pos_cursor)) & (Curve.NumEssai==Cursor.NumEssai(pos_cursor)) );
    ParamsIn.Name='truc';
    OutStruct=ConfirmEffacer(ParamsIn);
    if OutStruct.Rep==1
        set(hObject,'Visible','off');
        
        CurrentComp=Cursor.PlotNb(pos_cursor);
        PositionCurveIndex=find(Curve.PlotNb==CurrentComp);
        CurrentPositionCurve=intersect(PositionCurveIndex,pos_curve);

        %Cmd0=['Supp_', Curve.ParentField{pos_curve}, 'Mvt(handles, Cursor, pos_cursor, Curve, pos_curve);' ];
        Cmd0=['Supp_', Curve.ParentField{CurrentPositionCurve}, 'Mvt(handles, Cursor, pos_cursor, Curve, CurrentPositionCurve);' ];%NewX=temps
        eval(Cmd0);
        set(hObject,'Selected','off');
        [Cv, Cr]=AfficheCourbes(handles);
    else
        set(hObject,'Selected','off');
    end
end
if VitCurveOK==1
%ClearParTxt(handles);
end
%**************** fin detection mousedown sur event ******************

%************************SUPPRESSION CURSEURS *********************
%*********************PAS OPERATIONNEL****************************
function Supp_stimCursor(handles, Cursor, pos_cursor, Curve, pos_curve);
SrcField='stim';
SuppStimCursor(handles, SrcField, Cursor, pos_cursor, Curve, pos_curve );

%*********************************************************************
function SuppStimCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos )
global ChannelsProperties;
global trial;
%cmd_base=['trial.', SrcField, '.ParamEvtCh', num2str(Curve.Ch(Curve_pos)), '{', num2str(Curve.NumEssai(Curve_pos)), '}'];
cmd_base=['trial.', SrcField, '.ParamEvtCh', num2str(Curve.Ch(Curve_pos))];
Ps=eval([cmd_base, ';']);
%recherche du num de mvt
MvtField=Cursor.ParamFieldName{Cursor_pos};
NbEssais=trial.NbEssais;
for n=1:NbEssais
    NbEvts=Ps{n}.NbEvts;
    %--- verif si event existe ------
    if isfield(Ps{n},MvtField)==1
        Ps{n}.NbEvts=NbEvts-1;
        Cmd=['Ps{n}=rmfield(Ps{n}',',''', MvtField,''');'];
        eval(Cmd);
    end
end
eval([cmd_base, '=Ps;']);


%************************SUPPRESSION MOUVEMENTS *********************

%*********************************************************************
function Supp_optoMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='opto';
Supp3DMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );

%*********************************************************************
function Supp_viconMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='vicon';
Supp3DMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );


%*********************************************************************
function Supp_eogMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='eog';
SuppEyeXMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );

%*********************************************************************
function Supp_eyelinkMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='eyelink';
SuppEyeXYMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );

%*********************************************************************
function Supp_eyetrackerMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='eyetracker';
SuppEyeXYMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );

%***************************A REVOIR**********************************
function Supp_coilMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='coil';
SuppEyeMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );

%*****************************A REVOIR***********************************
function Supp_birdMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos ) %tous des float
SrcField='bird';
Supp3DMvt(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos );


% %------------------------fin effacement-------------------------


%************** DEPLACEMENT DES MOUVEMENTS *************************

%*****************************06/2006****************************************
function Move_optoMvtPince(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='opto';
Action='move';
Create3DMvtPinceNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_viconMvtPince(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='vicon';
FieldName=Curve.FieldName(Curve_pos);
%si VitPince --> Deplacement Create3Dpince sinon Create3DMvt
Action='move';
Create3DMvtPinceNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

function Move_optoMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='opto';
Action='move';
Create3DMvtNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_viconMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='vicon';
FieldName=Curve.FieldName(Curve_pos);
%si VitPince --> Deplacement Create3Dpince sinon Create3DMvt
Action='move';
Create3DMvtNew(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_eogMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eog';
Action='move';
CreateEyeXMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_eyelinkMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eyelink';
Action='move';
CreateEyeXYMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_eyetrackerMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='eyetracker';
Action='move';
CreateEyeXYMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*****************************a revoir*********************************
function Move_coilMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='coil';
Action='move';
% CreateEyeMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%***************************a revoir ***********************************
function Move_birdMvt(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX )
SrcField='bird';
Action='move';
% Create3DMvt(handles, SrcField, Action, Cursor, Cursor_pos, Curve, Curve_pos, NewX );



%***************** DEPLACEMENT DES CURSEURS***************************
%*********************************************************************
function Move_stimCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='stim';

%********************************************************************
function Move_mepCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='mep';
MoveMEPCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%********************************************************************
function MoveMEPCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX )%NewX=temps en ms
global trial;
%------Params et voies associ�s -------   
cmd=['trial.', SrcField, '.ParamMEPCh', num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
MvtField=Cursor.ParamFieldName{Cursor_pos};
eval([cmd,'.',MvtField,'=NewX;']);
%--------------------- Params et voies associ�s ---------------------    
cmd=['trial.', SrcField, '.ParamMEPCh', num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
%on recupere les signaux associ�s
RelatedField=eval([cmd,'.RelatedData{1};']); Position=eval([RelatedField, '{', num2str(Cursor.NumEssai(Cursor_pos)), '}']);
% RelatedField=eval([cmd,'.RelatedData{2};']); Vitesse=eval([RelatedField, '{', num2str(Cursor.NumEssai(Cursor_pos)), '}']);
NbSamples=size(Position);NbSamples=NbSamples(1);
Ps=eval([cmd, ';']);
%------------ Num du mvt en cours -------------
MvtField=Cursor.ParamFieldName{Cursor_pos}; S=size(MvtField);
eval(['Ps.', Cursor.ParamFieldName{Cursor_pos}, '=NewX+1;']);
MvtNb=MvtField(S(2)); MvtNb=num2str(MvtNb);
%---------------------pour le mvt en cours-----------------------------
%recup des mk temporels pour recalcule des params non temporels ---------
eval(['Ps.TpsMEPMax', MvtNb, '=Ps.TpsMEPMax', MvtNb,';']);
eval(['Ps.TpsMEPMin', MvtNb, '=Ps.TpsMEPMin', MvtNb,';']);
eval(['Ps.TpsDebMEP', MvtNb, '=Ps.TpsDebMEP', MvtNb,';']);
eval(['Ps.TpsFinMEP', MvtNb, '=Ps.TpsFinMEP', MvtNb,';']);
%on restocke les params ds trial
eval([cmd,'=Ps;']);


%*********************************************************************
function Move_eogCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='eog';
MoveEyeXYCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_eyelinkCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='eyelink';
MoveEyeXYCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*********************************************************************
function Move_eyetrackerCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='eyetracker';
MoveEyeXYCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*******************************a revoir*******************************
function Move_coilCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='coil';
% MoveEyeCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );


%***************************a revoir***********************************
function MoveEyeCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX )%NewX=temps en ms
global ChannelsProperties;
global trial;
%global DelaiOeil;


%*********************************************************************
function MoveEyeXYCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX )%NewX=temps en ms
global trial;
%------Params et voies associ�s -------   
cmd=['trial.', SrcField, '.ParamMvtCh', num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
MvtField=Cursor.ParamFieldName{Cursor_pos};
eval([cmd,'.',MvtField,'=NewX;']);
%--------------------- Params et voies associ�s ---------------------    
cmd=['trial.', SrcField, '.ParamMvtCh', num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
%on recupere les signaux associ�s
RelatedField=eval([cmd,'.RelatedData{1};']); Position=eval([RelatedField, '{', num2str(Cursor.NumEssai(Cursor_pos)), '}']);
RelatedField=eval([cmd,'.RelatedData{2};']); Vitesse=eval([RelatedField, '{', num2str(Cursor.NumEssai(Cursor_pos)), '}']);
NbSamples=size(Position);NbSamples=NbSamples(1);
Ps=eval([cmd, ';']);
%------------ Num du mvt en cours -------------
MvtField=Cursor.ParamFieldName{Cursor_pos}; S=size(MvtField);
eval(['Ps.', Cursor.ParamFieldName{Cursor_pos}, '=NewX+1;']);
MvtNb=MvtField(S(2)); MvtNb=num2str(MvtNb);
%---------------------pour le mvt en cours-----------------------------
%recup des mk temporels pour recalcule des params non temporels ---------
eval(['Ps.TpsDebMvt', MvtNb, '=Ps.TpsDebMvt', MvtNb,';']);
eval(['Ps.TpsFinMvt', MvtNb, '=Ps.TpsFinMvt', MvtNb,';']);
eval(['Ps.TpsPicVitMvt', MvtNb, '=Ps.TpsPicVitMvt', MvtNb,';']);
eval(['Ps.Tps0DebMvt', MvtNb, '=Ps.Tps0DebMvt', MvtNb,';']);
eval(['Ps.Tps0FinMvt', MvtNb, '=Ps.Tps0FinMvt', MvtNb,';']);
%recalcul des data aux nouveaux temps 
eval(['Ps.Pos0DebMvt', MvtNb, '=Position(Ps.Tps0DebMvt', MvtNb, '+1);']);
eval(['Ps.Pos0FinMvt', MvtNb, '=Position(Ps.Tps0FinMvt', MvtNb, '+1);']);
eval(['Ps.PicVitMvt', MvtNb, '=Vitesse(Ps.TpsPicVitMvt', MvtNb, '+1);']);
%on restocke les params ds trial
eval([cmd,'=Ps;']);



%**********************************06/2006***********************************
function Move_optoCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='opto';
Move3DCursorNew(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%**********************************06/2006***********************************
function Move_viconCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='vicon';
Move3DCursorNew(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );

%*****************************a revoir**********************************
function Move_birdCursor(handles, Cursor, Cursor_pos, Curve, Curve_pos, NewX ) %tous des float
SrcField='bird';
% Move3DCursor(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX );


%------------------------------ Nouvelle version 3D 06/2006--------------------------
function Move3DCursorNew(handles, SrcField, Cursor, Cursor_pos, Curve, Curve_pos, NewX )%NewX=temps en ms
global trial;
FreqRatio=eval('trial.MainFrequency')/eval(['trial.', SrcField, '.FrameFreq']);
NewX=round(NewX/FreqRatio)*FreqRatio; % NewX doit etre un multiple de FreqRatio
%Positionnement curseur � un temps minimum en ms (3 ech.)
Tmin=3*FreqRatio;
if NewX<=Tmin NewX=Tmin; end
%------Load du nouveau params ------- 
cmd=['trial.', SrcField, '.',Cursor.ParentFieldName{Cursor_pos}(1:end), num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
%cmd=['trial.', SrcField, '.ParamCineMk', num2str(Cursor.Ch(Cursor_pos)), '{', num2str(Cursor.NumEssai(Cursor_pos)), '}'];
MvtField=Cursor.ParamFieldName{Cursor_pos};
eval([cmd,'.',MvtField,'=NewX;']);





%*********************************************************************
%****************      FONCTIONS GENERIQUES        *******************
%*********************************************************************
%*********************************************************************
function ChProperties=SetMk2New(st,k)
global ChannelsProperties;
ChannelsProperties.ChannelInfos(k).NbOfEvents=ChannelsProperties.ChannelInfos(k).NbOfEvents+1;
S=ChannelsProperties.ChannelInfos(k).NbOfEvents;
ChannelsProperties.ChannelInfos(k).Event(S).color=st.color;
ChannelsProperties.ChannelInfos(k).Event(S).ParentField=st.ParentField;
ChannelsProperties.ChannelInfos(k).Event(S).VisuDataField=st.VisuDataField;
ChannelsProperties.ChannelInfos(k).Event(S).DataField=st.DataField;
ChannelsProperties.ChannelInfos(k).Event(S).Style=st.Style;
ChannelsProperties.ChannelInfos(k).Event(S).Size=st.Size;
ChannelsProperties.ChannelInfos(k).Event(S).LineWidth=st.LineWidth;
ChannelsProperties.ChannelInfos(k).Event(S).Label=st.Label;

% --------------------------------------------------------------------
function Ind=FindField(ChProp, DataFieldAccessList, ParentField, ChNb)
for k=1:ChProp.ListeSize
        Data3(k)=strcmp(ChProp.DataFieldAccessList{k}(1,:), DataFieldAccessList);
        Data2(k)=strcmp(ChProp.ChannelInfos(k).ParentField(1,:), ParentField);
        Data1(k)=strcmp(num2str(ChProp.ChannelInfos(k).ChannelNb), num2str(ChNb));
end
Ind=find(Data1 & Data2 & Data3);


% --------------------------------------------------------------------
function Ind=OldFindField(ChProp, Field)
for k=1:ChProp.ListeSize
        Data(k)=strcmp(ChProp.ChannelInfos(k).ParentField(1,:),Field);
end
Ind=find(Data);


% --------------------------------------------------------------------
function ChProperties=SetMk2(st,Ind)
global ChannelsProperties;
k=1;
while strcmp(ChannelsProperties.DataFieldAccessList{Ind(k)}(1,:),st.VisuDataField)~=1
    k=k+1;
end
ChannelsProperties.ChannelInfos(Ind(k)).NbOfEvents=ChannelsProperties.ChannelInfos(Ind(k)).NbOfEvents+1;
S=ChannelsProperties.ChannelInfos(Ind(k)).NbOfEvents;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).color=st.color;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).ParentField=st.ParentField;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).VisuDataField=st.VisuDataField;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).DataField=st.DataField;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).Style=st.Style;
ChannelsProperties.ChannelInfos(Ind(k)).Event(S).LineWidth=st.LineWidth;


% --------------------------------------------------------------------
function [NewList, Sel]=MarkBadTrials(handles)
global ChannelsProperties;
global trial;

%return
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
list_entries = get(handles.lstFile,'Value');
%list_size=size(list_entries);
Rec_nb = size(Rec_selected);
%Liste=trial.FileName;
Liste=handles.file_names;
%modif
NewList=handles.file_names;
Sel=list_entries;
%return;
for i=1:Rec_nb(2)
    source=ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField;
    switch source
        case 'opto'
            ChNb=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelNb;
            BadFloat=find(trial.opto.InfoNbOfBadFloat(:,ChNb)>0);
            BadFrame=find(trial.opto.InfoNbOfBadFrame(:,ChNb)>0);
            BadTrials=union(BadFloat, BadFrame);
            BadTrials=BadTrials';
            if isempty(BadTrials)==0 %non vide
                Lg=size(BadTrials);
                Rep=Liste(BadTrials(1));
                if Rep(1)~=' '
                    for j=1:Lg(2)
                        A=[];
                        A(1,:)=Liste(BadTrials(j),1:7);
                        A=['          ',A,'   '];
                        Liste(BadTrials(j),:)=A; %'faux                ';
                    end
                 end
            end
        case 'eyetracker'
            Liste=trial.FileName;
        otherwise
            Liste=trial.FileName;
    end    
end
NewList=Liste;
Sel=list_entries;




%*******************************************************************
%                   CALLBACK
%*******************************************************************

% --------------------------------------------------------------------
%--------- Appel suite a une selection d'une ou plusieurs voies--------
function lstRecType_Callback(hObject, eventdata, handles)
global ChannelsProperties;
Rec_selected=get(handles.lstRecType,'Value');
S=size(Rec_selected);S=S(2);
for i=1:S
    if S>1 %Plus d'une voie selectionn�e --> on affiche pas les check
        set(handles.chkXselect,'visible','off');    
        set(handles.chkYselect,'visible','off');    
        set(handles.chkZselect,'visible','off'); 
        set(handles.chkTselect,'visible','off'); 
        break;
    end
    Capt=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
    set(handles.chkXselect,'visible','on');    
    set(handles.chkYselect,'visible','on');    
    set(handles.chkZselect,'visible','on'); 
    set(handles.chkXselect,'enable','on');
    set(handles.chkYselect,'enable','on');
    set(handles.chkZselect,'enable','on');
    set(handles.chkXselect,'string','X');
    set(handles.chkYselect,'string','Y');
    set(handles.chkZselect,'string','Z');
    switch Capt
    case {'vicon', 'opto','eyelink','eyetracker','stim'}
        %les chk X, Y, Z sont lus ds ChannelsProperties puis rendus visibles
        Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
        NbOfPlot=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
        set(handles.chkTselect,'visible','off');    
        set(handles.chkXselect,'visible','off');    
        set(handles.chkYselect,'visible','off');    
        set(handles.chkZselect,'visible','off');
        if NbOfPlot>=1
            set(handles.chkXselect,'visible','on');    
            if NbOfPlot==1
                set(handles.chkXselect,'enable','off');
            else
                set(handles.chkXselect,'enable','on');
                CompStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).PlotName(1,:);
                ColorStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).ChannelCol(1,:);
                set(handles.chkXselect,'string',CompStr);
                set(handles.chkXselect,'ForegroundColor',ColorStr);
                if Comp2Plot(1)==1 
                    set(handles.chkXselect,'value',1);
                else
                    set(handles.chkXselect,'value',0);
                end
            end
        end
        if NbOfPlot>=2
            set(handles.chkYselect,'visible','on');    
            CompStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).PlotName(2,:);
            ColorStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).ChannelCol(2,:);
            set(handles.chkYselect,'string',CompStr);
            set(handles.chkYselect,'ForegroundColor',ColorStr);
            if Comp2Plot(2)==1 
                set(handles.chkYselect,'value',1);
            else
                set(handles.chkYselect,'value',0);
            end
        end
        if NbOfPlot>=3
            set(handles.chkZselect,'visible','on');    
            CompStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).PlotName(3,:);
            ColorStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).ChannelCol(3,:);
            set(handles.chkZselect,'string',CompStr);
            set(handles.chkZselect,'ForegroundColor',ColorStr);
            if Comp2Plot(3)==1 
                set(handles.chkZselect,'value',1);
            else
                set(handles.chkZselect,'value',0);
            end
        end
        if NbOfPlot>=4
            set(handles.chkTselect,'visible','on');    
            CompStr=ChannelsProperties.ChannelInfos(Rec_selected(1)).PlotName(4,:);
            set(handles.chkTselect,'string',CompStr);
            if Comp2Plot(4)==1 
                set(handles.chkTselect,'value',1);
            else
                set(handles.chkTselect,'value',0);
            end
        end
%         end
        break;    
    case 'bird'
        %les chk X, Y, Z sont lus ds ChannelsProperties puis rendus visibles
        Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
        NbOfPlot=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
        if NbOfPlot~=1
            if Comp2Plot(1)==1 
                set(handles.chkXselect,'value',1);
            else
                set(handles.chkXselect,'value',0);
            end
            if Comp2Plot(2)==1 
                set(handles.chkYselect,'value',1);
            else
                set(handles.chkYselect,'value',0);
            end
            if Comp2Plot(3)==1 
                set(handles.chkZselect,'value',1);
            else
                set(handles.chkZselect,'value',0);
            end
            set(handles.chkXselect,'visible','on');    
            set(handles.chkYselect,'visible','on');    
            set(handles.chkZselect,'visible','on');
            set(handles.chkXselect,'string','X');
            set(handles.chkYselect,'string','Y');
            set(handles.chkYselect,'string','Z');
        else
            set(handles.chkXselect,'visible','off');    
            set(handles.chkYselect,'visible','off');    
            set(handles.chkZselect,'visible','off');
        end
        break;
    otherwise
        %les chk X, Y et Z sont rendus visibles
        set(handles.chkXselect,'visible','off');    
        set(handles.chkYselect,'visible','off');    
        set(handles.chkZselect,'visible','off');    
    end    
end
[ListeFilename, Sel]=MarkBadTrials(handles);
ListeEssaisChrono=handles.ListeEssaisChrono;
ListeIndMain=handles.ListeIndMain;
h=load_listbox(ListeFilename, ListeEssaisChrono, ListeIndMain, Sel, handles);
[Cv, Cr]=AfficheCourbes(h);
SetInfos(Cv, Cr, handles);
% %set(handles.figData, 'XLimMode', 'auto');

% ******** a chaque selection d'un ou plusieurs essais *********
function lstFile_Callback(hObject, eventdata, handles)
[Cv, Cr]=AfficheCourbes(handles);
SetInfos(Cv, Cr, handles);

%**********************************************************************
function SetInfos(Cv, Cr, handles)
global ChannelsProperties;
global trial;
global SoftOrg;

Essais_selected=get(handles.lstFile,'Value');E=size(Essais_selected);E=E(2);
Voies_selected=get(handles.lstRecType,'Value');V=size(Voies_selected);V=V(2);
if E==1 %Plusieurs essais selectionn�s?
    EssaiName=num2str(trial.OrgTrialNb(Cv.NumEssai(1)));
    EssaiName=['Essai: ',EssaiName];
    set(handles.txtEssai,'String', EssaiName);
    
    %---- soft m&h recup stimline ----
    if strfind(SoftOrg,'m&h')==1
        StimLine=num2str(trial.TrueTrialNb(Cv.NumEssai(1)));    
        StimLineNb=['Stim line: ',StimLine];
    else
        StimLineNb=[''];
    end
    set(handles.txtStimLine,'String', StimLineNb);
    %---------------------------------
    
    XLim=trial.stim.NbOfSamples(Cv.NumEssai(1))*trial.MainFrequency/trial.stim.Frequency;
    set(handles.txtDuree,'String', ['Duree= ',num2str(XLim), 'ms']);
    SetStimTxt(handles, Cv, 1);
    set(handles.txtXdata,'String','');
    set(handles.txtYdata,'String','');    
    set(handles.txtEvent,'String','');
else
    ClearParTxt(handles);
    ClearStimTxt(handles);
end
if V==1 %Plusieurs voies selectionn�es?
    CurveName=ChannelsProperties.ChannelList{Cv.SelNb(1)};
    set(handles.txtVoie,'String', CurveName);
    FreqEch=int16(round(trial.MainFrequency/ChannelsProperties.ChannelInfos(Cv.SelNb(1)).FreqRatio));
    set(handles.txtFreqEch,'String', ['Freq. ech: ', num2str(FreqEch), 'Hz']);
else
    set(handles.txtVoie,'String', '');
    set(handles.txtFreqEch,'String', '');
end
set(handles.txtComp,'String', '');



% --------------------------------------------------------------------
function chkYnorm_Callback(hObject, eventdata, handles)
if get(handles.chkYnorm,'value')==1 set(handles.txtCurrentScale, 'enable', 'off'); else set(handles.txtCurrentScale, 'enable', 'on'); end
[Cv, Cr]=AfficheCourbes(handles);


% --------------------------------------------------------------------
function txtDisp_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Valeur=get(handles.txtDisp,'String');
ChannelsProperties.Samples2Disp=str2num(Valeur); %ms
[Cv, Cr]=AfficheCourbes(handles);


% --------------------------------------------------------------------
function mnuFile_Callback(hObject, eventdata, handles)
% hObject    handle to mnuFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
%--------- ouverture d'un fichier .mat ---------------
function mnuOpen_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
global MatfilePath;
global DataFilename;
global Categories;
global DetectOeil;
global Detect3D;
global DetectPince3D;
global VisibleCursor;
global AlreadyAnalysed;
global SoftOrg;
global MarkerList;
global WorkDir
global PathSep

% %----- la liste des Mk pour la version Handimain -----
% MarkerList={};
% MarkerList{1}.Name='index';
% MarkerList{1}.ChNb=1;
% MarkerList{2}.Name='pouce';
% MarkerList{2}.ChNb=2;
% MarkerList{3}.Name='poignet';
% MarkerList{3}.ChNb=3;
% MarkerList{4}.Name='coude';
% MarkerList{4}.ChNb=4;
% MarkerList{5}.Name='epaule';
% MarkerList{5}.ChNb=5;
% %-----------------------------------------------------


%--------- test de l'OS -------
if ispc
    PathSep='\';
end
if ismac || isunix
    PathSep='/';
end
%------------------------------      



%les data sont cherchees au niveau du repertoire work\analyse
Exepath=pwd;
%cd ..;
CurPath=pwd;
%fin modif
Dirpath=[CurPath, PathSep, 'users', PathSep];
%cd (Dirpath); 
[filename, pathname] = uigetfile('*.mat', 'Find an M-file');
DataFilename=filename;
if isequal(filename,0)|isequal(pathname,0)
    cd (Exepath); %on restitu le pwd
    return;
end
AbsFilename=[pathname, filename];
handles.AbsFilename=AbsFilename;
handles.PathSep=PathSep;
%cd (Exepath); %on restitu le pwd
%AbsFilename(1,:)=OpenFile; %ancienne version

%********* on reinitialise tout ********
VisibleCursor=1;

ClearParTxt(handles);
ClearStimTxt(handles);
trial=[];
ChannelsProperties=[];
Categories=[];
DetectOeil=[];
Detect3D=[];
%****oeil
DetectOeil.PicAuto=1;
DetectOeil.GblSeuilRel=5;
DetectOeil.GblSeuilAbs=5;
DetectOeil.GblTempsForce=20; %ms
DetectOeil.NbPtsMoyPos=1; %Nb points moyenn�s pour calcul position
DetectOeil.GblDelai=50; %ms
DetectOeil.SeuilMode='A';
DetectOeil.LocSeuilRel=5;
DetectOeil.LocSeuilAbs=20;
%****main
Detect3D.PicAuto=1;
Detect3D.GblSeuilRel=5;
Detect3D.GblTempsForce=200; %ms
Detect3D.GblSeuilAbs=80;
Detect3D.GblDelai=200; %ms
Detect3D.SeuilMode='A';
Detect3D.LocSeuilRel=5;
Detect3D.LocSeuilAbs=20;
%****pince
DetectPince3D.PicAuto=1;
DetectPince3D.GblSeuilRel=5;
DetectPince3D.GblTempsForce=200; %ms
DetectPince3D.GblSeuilAbs=80;
DetectPince3D.GblSeuilDownCoeff=0.25;
DetectPince3D.GblDelai=200; %ms
DetectPince3D.SeuilMode='A';
DetectPince3D.LocSeuilRel=5;
DetectPince3D.LocSeuilAbs=20;


%***********Les radio bouton ***********
set(handles.radSuppMvt,'Enable','On');set(handles.radSuppMvt,'Value',0);
set(handles.radAjoutMvt,'Enable','On');set(handles.radAjoutMvt,'Value',0);
set(handles.radDeplMvt,'Enable','On');set(handles.radDeplMvt,'Value',0);
set(handles.radCursModif,'Enable','On');set(handles.radCursModif,'Value',0);
set(handles.radRenCur,'Enable','On');set(handles.radRenCur,'Value',0);    
if ishandle(handles.radRenVoie) 
    set(handles.radRenVoie,'Enable','On');
    set(handles.radRenVoie,'Value',0);
end
if ishandle(handles.radRenEssai) 
    set(handles.radRenEssai,'Enable','On');set(handles.radRenEssai,'Value',0);
end
if verLessThan('matlab', '7.14') %2012a
    [path,name,ext,ver] = fileparts(AbsFilename);
else
    [path,name,ext] = fileparts(AbsFilename);
end
MatfilePath=path;
AbsFilename=[path,PathSep, name,'.mat'];
%-------- chargement du fichier .mat ------------
load(AbsFilename);
if isempty(trial)
	errordlg('Fichier vide ou incompatible', [name '.mat'], 'modal');
	return
end
%----------Si handimain recherche fichier stim .txt ----------
% switch handles.MainVersion
%     case handles.HandiMainVersionID
%         if isfield(trial,'vicon')
%             AbsViconStimFile=[path,PathSep, name,'.txt'];
%             ViconStimFile=ReadViconStimFile(AbsViconStimFile);
%         end
%     otherwise
% end
%test version du trial
Rep=TestMainVersion;
if Rep==0 return; end

trial.MainFrequency=1000; %normalement charg� par le load...
ListeFilename=trial.FileName;
%ListeEssaisChrono=[1:trial.NbEssais];
ListeEssaisChrono=trial.OrgTrialNb; %les num des essais
ListeIndMain=[1:trial.NbEssais];

%s'il n'existe pas de ChannelsProperties(donn�es brutes)
%----- on le cree---------
if (isempty(ChannelsProperties)==1)
    InitChList(handles);
else
    ChannelsPropertiesVersion;
end

AlreadyAnalysed=IsAlreadyAnalysed();

load_Reclistbox(ChannelsProperties.ChannelList, handles, 1);
ChannelList=GetChList;
Sel=1;
cla;
h=load_listbox(ListeFilename, ListeEssaisChrono, ListeIndMain, Sel, handles);
handles=guidata(handles.figMain);
Nom=[];
Nom=['Matlab filename:      ',upper(name)];
Lc{1}='*** ALL ***';
set(h.lstCat,'String',Lc,...
	'Value',Sel)
NbTotalEssais=size(trial.TrueTrialNb,2);
NbTotalEssaisStr=num2str(NbTotalEssais);
Titre=[Nom, '                ',NbTotalEssaisStr, ' essais'];
set(h.figMain,'Name',Titre); %barre de titre
%chk comp mis a 1
if ishandle(handles.chkXselect) set(handles.chkXselect,'value',0); end   
if ishandle(handles.chkYselect) set(handles.chkYselect,'value',0); end    
if ishandle(handles.chkZselect) set(handles.chkZselect,'value',0); end
if ishandle(handles.chkTselect) set(handles.chkTselect,'value',0); end
if ishandle(handles.chkXselect) set(handles.chkXselect,'visible','off'); end    
if ishandle(handles.chkYselect) set(handles.chkYselect,'visible','off'); end    
if ishandle(handles.chkZselect) set(handles.chkZselect,'visible','off'); end   
if ishandle(handles.chkTselect) set(handles.chkTselect,'visible','off'); end   

if ishandle(handles.btnMvtOpt) set(handles.btnMvtOpt,'Visible','on'); end
if ishandle(handles.btnMvtOpt) set(handles.btnMvtOpt,'enable','on'); end
if ishandle(handles.btnMvtOpt) set(handles.btnMvtOpt,'string','none'); end

% %----------- test de VERSION ----
if handles.MainVersion==handles.HandiMainVersionID
    if ishandle(handles.btnVoieUp) set(handles.btnVoieUp,'Visible','off'); end
    if ishandle(handles.btnVoieDown) set(handles.btnVoieDown,'Visible','off'); end
else
    if ishandle(handles.btnVoieUp) set(handles.btnVoieUp,'Visible','on'); end
    if ishandle(handles.btnVoieDown) set(handles.btnVoieDown,'Visible','on'); end
end

% %----- Test si Data 3D et Calcul Pince ----------
% if isfield(trial, 'vicon')==1 
%     VICON_OK=1;
%     FieldSrc='vicon';
%     FreqRatio=trial.MainFrequency/trial.vicon.FrameFreq;
%     if (isfield(trial.vicon,'ModulePince1'))
%         PINCE_OK=1;
%     end
% else
%     VICON_OK=0;
% end
% if isfield(trial, 'opto')==1 
%     OPTO_OK=1;
%     FieldSrc='opto';
%     FreqRatio=trial.MainFrequency/trial.opto.FrameFreq;
%     if (isfield(trial.opto,'ModulePince1'))
%         PINCE_OK=1;
%     end
% else
%     OPTO_OK=0;
% end

%******* test logiciel source *****
if  (strfind(lower(trial.AcqSoftware),lower('PosteSinge'))==1) 
    if ishandle(handles.mnuRecaler) set(handles.mnuRecaler,'enable', 'off'); end
end
if (strfind(lower(trial.AcqSoftware),lower('BestOf'))==1)
    if ishandle(handles.mnuRecaler) set(handles.mnuRecaler,'enable', 'on'); end
end
if (strfind(lower(trial.AcqSoftware),lower('VSG'))==1)
    if ishandle(handles.mnuRecaler) set(handles.mnuRecaler,'enable', 'on'); end
end
%****************************
EnableAll(handles);

if ishandle(handles.mnuTraitements) set(handles.mnuTraitements,'enable', 'on'); end
if ishandle(handles.mnuEdit) set(handles.mnuEdit,'enable', 'on'); end
if ishandle(handles.mnuSave)
    set(handles.mnuSave,'enable', 'on');
    set(handles.uiSaveFile,'enable', 'on');
end 
if ishandle(handles.mnuExport) set(handles.mnuExport,'enable', 'on'); end
if ishandle(handles.mnuVisu3D) set(handles.mnuVisu3D,'enable', 'on'); end
if ishandle(handles.mnuMode) set(handles.mnuMode,'enable', 'on'); end
if ishandle(handles.mnuCancelMode) set(handles.mnuCancelMode,'enable', 'off'); end
if ishandle(handles.mnuCancelMode) set(handles.mnuCancelMode,'Visible', 'Off'); end

if ishandle(handles.lstFile) set(handles.lstFile, 'enable', 'on'); end
if ishandle(handles.lstRecType) set(handles.lstRecType, 'enable', 'on'); end

%--------RAZ mode MOYENNE------
UD=get(gca, 'UserData');
UD.Func='';
UD.Bornes.h=[];
UD.Bornes.X=[];
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', '');
%--------RAZ mode ZOOM------
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
%---- mode SYNCHRO OFF ---------
DataStruct.Sync=0;
DataStruct.Params=[];
DataStruct.ParamField=[];
if ishandle(handles.mnuSynchroMode) set(handles.mnuSynchroMode,'UserData',DataStruct); end
if ishandle(handles.mnuSynchroMode) set(handles.mnuSynchroMode,'Label','Synchro'); end
%----- effecement du mesures.def -----
deffile=[MatfilePath, PathSep,'default.mes'];
fid=fopen(deffile, 'w');
fclose(fid);
set(handles.lblFonction,'String','');
%---- echelle des temps en auto ------
set(handles.figData, 'XLimMode', 'auto');
guidata(hObject, handles);
%*******************************************************************

%------- test si une analyse a d�j �t� faite --------
 function OK_Flag=IsAlreadyAnalysed()
 global trial;
 
     RecordType=[];
     for i=1:trial.NbOfRecords
         RecordStr=deblank(trial.InfoRecordType(i,:));
         if strcmpi(RecordStr,'stim')
            RecordType= 'stim';
            trial.stim.famille=RecordType;
            CurrentRecord=trial.stim;
         end
         if strcmpi(RecordStr,'vicon')
            RecordType='3D';
            trial.vicon.famille=RecordType;
            CurrentRecord=trial.vicon;
            ParamRecord='1';
         end
         if strcmpi(RecordStr,'optotrak') %---- optotrak, zebris ----
             RecordType='3D';
            trial.opto.famille=RecordType;
            CurrentRecord=trial.opto;
         end
         if strcmpi(RecordStr,'eog')
            RecordType='eye';
            trial.eog.famille=RecordType;
            CurrentRecord=trial.eog;
         end
         if strcmpi(RecordStr,'eyelink')
            RecordType='eye';
            trial.eyelink.famille=RecordType;
            CurrentRecord=trial.eyelink;
         end
         if strcmpi(RecordStr,'eyetracker')
            RecordType='eye';
            trial.eyetracker.famille=RecordType;
            CurrentRecord=trial.eyetracker;
         end
         
         %------ pour chq record on cherche si un traitement existe --------
         if strcmpi(RecordType,'eye')
            NbOfCh=CurrentRecord.NbOfChannels;
            ParamRecord='ParamMvtCh';
         end
         if strcmpi(RecordType,'3D')
            NbOfCh=CurrentRecord.NbOfMarkers;
            ParamRecord='ParamCineMk';
         end
         if strcmpi(RecordType,'stim')
            NbOfCh=CurrentRecord.NbOfStmCh(1);
            ParamRecord='ParamEvtCh';
         end      
         for k=1:NbOfCh
         	res(i,k)=isfield(CurrentRecord, [ParamRecord,num2str(k)]);
         end
         
%          if strcmpi(RecordType,'3D')
%             ParamRecord='ParamPince1';
%             res(i,k)=isfield(CurrentRecord, [ParamRecord,num2str(k)]);
%          end
         %---------------------------------------------------------------
     end
     if ~isempty(find(res==1))
        OK_Flag=1;
     else
        OK_Flag=0;
     end
 return

%*******************************************************************

function mnuSave_Callback(hObject, eventdata, handles)
global MatfilePath;
global ChannelsProperties;
global DataFilename
global trial;
global Categories;
global DetectOeil;
global Workrep

 %appel dialog box
OutStruct=SaveFile(handles);
if strcmp(OutStruct.rep,'Annuler')==1
    return;
end
if strcmp(OutStruct.Filename,'')
    return;
end
h=OutStruct.Filename;
if verLessThan('matlab', '7.14') %2012a
    [path,name,ext,ver] = fileparts(h);
else
    [path,name,ext] = fileparts(h);
end
if isempty (ext)
    ext='.mat';
end
h=[deblank(name), ext];

%----------- modif barre titre -----------
Nom=['Matlab filename:      ',upper(name)];
NbTotalEssais=size(trial.TrueTrialNb,2);
NbTotalEssaisStr=num2str(NbTotalEssais);
Titre=[Nom, '                ',NbTotalEssaisStr, ' essais'];
DataFilename=h;
set(handles.figMain,'Name',Titre); %barre de titre
%------------------------------------------

DetectOeil.NbPtsMoyPos=str2num(OutStruct.NbPtsMoyPos);
Save_All_OK=OutStruct.All;
Save_Cat_OK=OutStruct.Cat;
Save_Pars_OK=OutStruct.Pars;
AscTag=OutStruct.AscTag;
AbsFile=[MatfilePath, PathSep, h];
UserFormat='DP';
%------------ sauvegarde trial et channelproperties ----------
save (AbsFile,'trial','ChannelsProperties');
%------- sauvegarde params------------
if OutStruct.SaveAscii==1 SaveAsciiPar( AbsFile, trial, AscTag, OutStruct.Format); end
if isempty(Categories)==1 return; end
%-------- sauvegarde des cat data et channelproperties
NewSaveAllCat(Categories, h, trial);


% ********************************************************************
function mnuQuit_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;

% %---- Purge ds channelproperties des events inexistants ----
% if ChannelsProperties.CleanEvents==1
%     for i=1:ChannelsProperties.ListeSize
%         if ChannelsProperties.ChannelInfos(i).CleanEvents~=0
%             %--- chercher ts les mvts en doublon et les eliminer ---
%             
%             %--- chercher le nb max d'evt et eliminer l'excedent ---
%             
%         end
%     end
%     ChannelsProperties.CleanEvents=0; %on reset le flag
% end

str='Voulez sauver vos traitements ?';
Res=questdlg(str,'Quitter le programme','Yes','No','Yes');
if strcmp(Res, 'Yes')~=1
    delete(handles.figMain);
else
    mnuSave_Callback(hObject, eventdata, handles)
end


% ********************************************************************
function Purge
global ChannelsProperties;
global trial;

for i=1:ChannelsProperties.ListeSize %nb de voies 
    for j=1:trial.NbEssais
    end
end

% ********************************************************************
function mnuTraitements_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global AlreadyAnalysed;

Fils=get(handles.mnuTraitements,'Children');
set(Fils, 'Enable','Off');
if ishandle(handles.mnuMesures) set(handles.mnuMesures, 'Enable', 'On'); end
if ishandle(handles.mnuInter) set(handles.mnuInter, 'Enable', 'On'); end
if ishandle(handles.mnuTronquer) set(handles.mnuTronquer, 'Enable', 'Off'); end
if ishandle(handles.mnuCouper) set(handles.mnuCouper, 'Enable', 'Off'); end
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);

%verif que les rec selectionn�s sont de meme type (eog, opto, ...) et le
sourceOld=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
if strcmpi(sourceOld,'eyetracker')
    if ishandle(handles.mnuCouper) set(handles.mnuCouper, 'Enable', 'On'); end
else
    if ishandle(handles.mnuCouper) set(handles.mnuCouper, 'Enable', 'Off'); end
end
for i=1:Rec_nb(2)
    sourceNew=ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField;
    if strcmp(sourceOld, sourceNew)
        sourceOld=sourceNew;
    else
        return;
    end
end
%verif que les rec selectionn�s sont de meme champ (RawData, ..;)
%source=ChannelsProperties.ChannelInfos(Rec_selected).ParentField;
switch sourceOld
    case 'stim'
        set(handles.mnuStim, 'Enable', 'On');
    case 'eog'
        set(handles.mnuEog, 'Enable', 'On');
        set(handles.mnuOeil, 'Enable', 'On');
    case 'eyelink'
        set(handles.mnuEyelink, 'Enable', 'On');
        set(handles.mnuOeil, 'Enable', 'On');
    case 'coil'
        set(handles.mnuCoil, 'Enable', 'On');
    case 'eyetracker'
        set(handles.mnuEyetracker, 'Enable', 'On');
        set(handles.mnuOeil, 'Enable', 'On');
    case 'opto'
        if ishandle(handles.mnuNewOptotrak) set(handles.mnuNewOptotrak, 'Enable', 'On'); end
        set(handles.mnu3D, 'Enable', 'On');
        set(handles.mnuGraphiques, 'Enable', 'On');
        if (strcmpi('windata',deblank(trial.AcqSoftware))~=1) %si ca vient du zebris
            if ishandle(handles.mnu_zebris) set(handles.mnu_zebris,'Enable', 'Off'); end
        else
            if ishandle(handles.mnu_zebris) set(handles.mnu_zebris,'Enable', 'On'); end
        end
%         set(handles.mnu3D, 'Enable', 'On');
    case 'vicon'
        if ishandle(handles.mnuVicon) set(handles.mnuVicon, 'Enable', 'On');  end 
        set(handles.mnuGraphiques, 'Enable', 'On');
        set(handles.mnu3D, 'Enable', 'On');
    case 'bird'
        set(handles.mnuBird, 'Enable', 'On');
        set(handles.mnu3D, 'Enable', 'On');
    case 'gen_analog'
        set(handles.mnuGenericAnalog, 'Enable', 'On');
    case 'spike'
        set(handles.mnuSpike, 'Enable', 'On');
    case 'mep'
        set(handles.mnuMep, 'Enable', 'On');
end    

% --------------------------------------------------------------------
function mnuEog_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);

% --------------------------------------------------------------------
function mnuOptotrak_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
TT=size(Rec_selected,2);
if TT~=2 set(handles.mnu3D, 'Enable', 'On'); else set(handles.mnu3D, 'Enable', 'On'); end

% UD=get(handles.mnuOptotrak,'UserData');
% if isempty(UD)==1 set(handles.mnuRecaler,'Enable', 'on'); else   set(handles.mnuRecaler,'Enable', 'off'); end

% --------------------------------------------------------------------
function mnuNewOptotrak_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
TT=size(Rec_selected,2);
if TT~=2 set(handles.mnuModule, 'Enable', 'Off'); else set(handles.mnuModule, 'Enable', 'On'); end
% hObject    handle to mnu3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function mnuVicon_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
TT=size(Rec_selected,2);
if TT~=2 set(handles.mnuPince, 'Enable', 'Off'); else set(handles.mnuPince, 'Enable', 'On'); end
% hObject    handle to mnuVicon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function mnuSynchroMode_Callback(hObject, eventdata, handles)

DataStruct=get(handles.mnuSynchroMode,'UserData');
if DataStruct.Sync==0
    set(handles.mnuSynchroMode,'Label','Synchro');
    DataStruct.Sync=1;
    DataStruct.Params=[];
    DataStruct.ParamField=[];
    set(handles.mnuSynchroMode,'UserData',DataStruct);
    set(handles.radReadMouse,'Enable','Off');
    set(handles.radSuppMvt,'Enable','Off');
    set(handles.radAjoutMvt,'Enable','Off');
    set(handles.radDeplMvt,'Enable','Off');
    set(handles.radCursModif,'Enable','Off');
    set(handles.radAjoutCur,'Enable','Off');
    set(handles.radSuppCur,'Enable','Off');
    set(handles.radRenCur,'Enable','Off');
    set(handles.radRenVoie,'Enable','Off');
    set(handles.radRenEssai,'Enable','Off');
    set(handles.radRenEssai,'Enable','Off');
    set(handles.radRenComp,'Enable','Off');
    set(handles.mnuVisu3D,'Enable','Off');
    set(handles.lblFonction,'String','mode SYNCHRO');
    
    UD=[];
    OutStruct=OptSynchro(handles, UD);%dialogbox
    if strfind(OutStruct.String, 'OK')==1
        UD=get(gca,'UserData');
        UD.SynchroMode.LimBas=OutStruct.LimBas;
        UD.SynchroMode.Duree=OutStruct.Duree;
        set(gca,'UserData',UD);
    %     set(gca, 'XLimMode', 'manual');
    %     set(gca, 'XLim', [1 str2num(UD.SynchroMode.Duree)]);
    else
        %set(gca, 'XLimMode', 'auto');
    end
    
else
    set(handles.mnuSynchroMode,'Label','Synchro');
    DataStruct.Sync=0;
    DataStruct.Params=[];
    DataStruct.ParamField=[];
    set(handles.mnuSynchroMode,'UserData',DataStruct);
    set(handles.radReadMouse,'Enable','On');
    set(handles.radSuppMvt,'Enable','On');
    set(handles.radAjoutMvt,'Enable','On');
    set(handles.radDeplMvt,'Enable','On');
    set(handles.radCursModif,'Enable','On');
    set(handles.radAjoutCur,'Enable','On');
    set(handles.radSuppCur,'Enable','On');
    set(handles.radRenCur,'Enable','On');
    set(handles.radRenVoie,'Enable','On');
    set(handles.radRenEssai,'Enable','On');
    set(handles.radRenEssai,'Enable','On');
    set(handles.radRenComp,'Enable','On');
    set(handles.mnuVisu3D,'Enable','On');
    set(gca, 'XLimMode', 'auto');
    [Cv, Cr]=AfficheCourbes(handles);
end    
% guidata(gcf, handles);


% --------------------------------------------------------------------
function mnuStim_Callback(hObject, eventdata, handles)
h = [handles.radSuppMvt];set(h,'Value',0);
h = [handles.radAjoutMvt];set(h,'Value',0);
h = [handles.radDeplMvt];set(h,'Value',0);


% --------------------------------------------------------------------
function mnuBird_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnuGenericAnalog_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnuCoil_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnuSpike_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnuEyetracker_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnuEyelink_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnuEyetrackerFiltrage_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=FiltrageEyelink(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuEyetrackerVitesse_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=VitEyelink(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));

% --------------------------------------------------------------------
function mnuEyetrackerConv_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=ConvEyetrackerData(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuEyelinkFiltrage_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=FiltrageEyelink(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuEyelinkCyclope_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=OeilCyclopeEyelink(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));

% ------------------------inactif-------------------------------------
function mnuEyelinkModifCoeffCalib_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
answer = inputdlg('Multiplicateur','Conversion eyelink data');
CoeffMult=str2num(answer{1});
ChList=ModifEyelinkData(hObject, handles, CoeffMult);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuEogVitesse_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
% ChList=VitEog(hObject, handles);
ChList=VitEogNew(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuEogConv_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=ConvEogData(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));

% --------------------------------------------------------------------
function mnuEyelinkVitesse_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=VitEyelink(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------inactif-----------------------------------
function mnuBirdCinematique_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=ParamsCinematique(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% ------------------------inactif----------------------------------
function mnuCoilVitesse_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
% ChList=VitEogNew(hObject, handles);
% load_Reclistbox(ChList, handles, Rec_selected(1));



% --------------------------------------------------------------------
function mnuCreateEvtCh_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=CreateEvtCh(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));


% --------------------------------------------------------------------
function mnuViconCinematique_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=NewParamsCinematique(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));
% --------------------------------------------------------------------



% --------------------------------------------------------------------
function mnu3DCinematique_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
%---- appel calcul optcinematique------
ChList=NewParamsCinematique(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));
% --------------------------------------------------------------------


% --------------------------------------------------------------------
function mnu3DModule_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
%---- appel calcul pince ------
ChList=CalculPince(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));
% --------------------------------------------------------------------


% --------------------------------------------------------------------
function mnuPince_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ChList=CalculPince(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));
% --------------------------------------------------------------------

% --------------------------------------------------------------------
function mnuTetaVecteurVitesse_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
%---- appel calcul optcinematique------
ChList=CalculTetaVecteurVitesse(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));



% --------------------------------------------------------------------
function mnuExport_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------


% --------------------------------------------------------------------
function mnuParams_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
% --------------------------------------------------------------------


% --- Executes during object creation, after setting all properties.
function txtMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
% --------------------------------------------------------------------



% --------------------------------------------------------------------
function txtMessage_Callback(hObject, eventdata, handles)
% hObject    handle to txtMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMessage as text
%        str2double(get(hObject,'String')) returns contents of txtMessage as a double
% --------------------------------------------------------------------


% --------------------------------------------------------------------
function mnuRecaler_Callback(hObject, eventdata, handles)
%set(handles.mnuRecaler,'UIContextMenu',handles.mnuCxt);
% --------------------------------------------------------------------

% --------------------------------------------------------------------
function mnuManuel_Callback(hObject, eventdata, handles)
RecalageOpto(handles);
[Cv, Cr]=AfficheCourbes(handles);
% --------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function lstCat_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
% --------------------------------------------------------------------


% --------------------------------------------------------------------
function mnuCat_Callback(hObject, eventdata, handles)
% hObject    handle to mnuCat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------


% ------------------------------------------------------------
function load_LstCat(Liste, Sel, handles)
handles.file_names = Liste; %Liste; %orted_names;
guidata(handles.figMain,handles);
set(handles.lstCat,'String',Liste,...
	'Value',Sel)


% ------------------------------------------------------------
% --- Executes on selection change in lstCat.
function lstCat_Callback(hObject, eventdata, handles)
global trial;
global Categories;
Cat_list = get(handles.lstCat,'String');
Cat_selected=get(handles.lstCat,'Value');
if Cat_selected==1 %tous les essais
    IndiceMain=[1:trial.NbEssais];%renvoie les indices tableau ds le trial.OrgTrialNb 
    ListeFilename=trial.FileName; 
    ListeEssaisChrono=trial.OrgTrialNb;
else %la cat selectionn�e
    IndiceMain=Categories.Essais(Cat_selected-1);%renvoie les indices tableau ds le trial.OrgTrialNb 
    ListeFilename=trial.FileName(IndiceMain{1},:);
    ListeEssaisChrono=trial.OrgTrialNb(IndiceMain{1});
    IndiceMain=(IndiceMain{1})';
end
h=load_listbox(ListeFilename, ListeEssaisChrono, IndiceMain, 1, handles);
AfficheCourbes(h);


% --------------------------------------------------------------------
function mnuNewCat_Callback(hObject, eventdata, handles)
global trial;
global Categories;
St=[];
%tous les tripl�s sont consideres comme identiques 
%on prend donc le premier pr extraire les 3 seq type
Sequ(1,:)=trial.stim.PreSeqType(1,:);
Sequ(2,:)=trial.stim.SeqType(1,:);
Sequ(3,:)=trial.stim.PstSeqType(1,:);
NbPars(1)=trial.stim.PreSeqNbOfPar(1);
NbPars(2)=trial.stim.SeqNbOfPar(1);
NbPars(3)=trial.stim.PstSeqNbOfPar(1);

%on recup pr tous les essais les param de chq seq 
if (NbPars(1))~=0 %preseq
    for i=1:trial.NbEssais
        PreParams{i}=trial.stim.PreSeqParam{i}(1,:);
    end
end
if (NbPars(2))~=0 %seq
    for i=1:trial.NbEssais
        SeqParams{i}=trial.stim.SeqParam{i}(1,:);
    end
end
if (NbPars(3))~=0 %pstseq
    for i=1:trial.NbEssais
        PstParams{i}=trial.stim.PstSeqParam{i}(1,:);
    end
end
Triple.Sequ=Sequ;
Triple.NbPars=NbPars;
Categories=NewCat(Triple);%on recup ttes les cat  ds Categories.NumEss => une cell par categorie avec la liste des essais
%                                                   Categories.Noms => Nom de chaque categorie
Lc{1}='*** ALL ***';
LocListe=[Lc Categories.Noms];
load_LstCat(LocListe, 1, handles);



% --------------------------------------------------------------------
function mnuCatInfos_Callback(hObject, eventdata, handles)



%****************** sauvegarde ASCII ******************
function SaveAsciiPar ( filename, Trial, AscTag, UserFormat)
global ChannelsProperties;

UserFormat=lower(UserFormat);
if strcmp(UserFormat,'gaze_dp_mp')==1
    Gaze_DP_MP_OK=1;
    ExportGazeParams(filename, Trial, AscTag);
    return
end
for i=1:Trial.NbOfRecords 
    %==================stim=======================
   %----- un seul fichier pour TOUTES les voies ------
    if strfind(Trial.InfoRecordType(i,:),'stim')==1
        ExportStimParams('stim', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
    end
    
   %================eog (4 voies max)=============
   %------------- 1 fichier PAR channel----------
   if strfind(Trial.InfoRecordType(i,:),'eog')==1
        ExportEogParams('eog', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
   end
    
   %===============eyelink (2 voies max)===============
   %------------- 1 fichier PAR channel----------
   if strfind(Trial.InfoRecordType(i,:),'eyelink')==1
        ExportEyelinkParams('eyelink', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
   end
    
   %===============eyetracker (1 voie max)==============
   %--------------- 1 seul fichier----------
    if strfind(Trial.InfoRecordType(i,:),'eyetracker')==1
    	ExportEyelinkParams('eyetracker', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
    end
    
   %==================optotrak ======================
   %----- un seul fichier pour TOUS les marqueurs ------
    if strfind(Trial.InfoRecordType(i,:),'opto')==1
        ExportOptoParams('opto', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
    end
    
    %=================vicon =================
    %----- un seul fichier pour TOUS les marqueurs ------
    if strfind(Trial.InfoRecordType(i,:),'vicon')==1
        ExportOptoParams('vicon', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
    end
    
    %=================Mep =================
    %----- un seul fichier  ------
    if strfind(Trial.InfoRecordType(i,:),'mep')==1
        ExportMepParams('mep', 0, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
    end
    
   %----------------coil a revoir ------------------    
    if strfind(Trial.InfoRecordType(i,:),'coil')==1
        Fieldname='ParamMvtCh';
        for j=1:Trial.coil.NbOfChannels
            Cmd=[Fieldname, num2str(j)];
            if isfield(Trial.coil, Cmd)==1
                Params=eval(['Trial.coil.', Cmd, ';']);
                ExportEogParams('coil', j, filename, Trial.OrgTrialNb, Params, AscTag);
            end
        end
    end
   %----------------bird a revoir------------------
    if strfind(Trial.InfoRecordType(i,:),'bird')==1
        Fieldname='ParamCineMk';
        for j=1:Trial.bird.NbOfMarkers
            Cmd=[Fieldname, num2str(j)];
            if isfield(Trial.bird, Cmd)==1
                Params=eval(['Trial.bird.', Cmd, ';']);
                ExportOptoParams('bird', j, filename, Trial.OrgTrialNb, 0, AscTag, UserFormat);
            end            
        end
    end
end    




%*****************************************************************************
function NewSaveAllCat(AllCat, OrgFilename, Exp)
global ChannelsProperties;
global MatfilePath;
% [path,name,ext,ver] = fileparts(OrgFilename);
if verLessThan('matlab', '7.14') %2012a
    [path,name,ext,ver] = fileparts(OrgFilename);
else
    [path,name,ext] = fileparts(OrgFilename);
end
NbCat=size(AllCat.Essais);NbCat=NbCat(2);
for i=1:NbCat
    Filename=[name, '_', AllCat.Noms{i}];
    CatFilename=[MatfilePath, PathSep, Filename];
    trial=MakeSubset(Exp, AllCat.Essais{i});
    save (CatFilename,'trial','ChannelsProperties');
    SaveAsciiPar(CatFilename, trial);
end


% %*****************************************************************************
% %recree un trial contenant  les Essais
% %Ce tab donne la liste des INDICES du tableau original (Maintab) charg� avec Open
% function NewTrial=MakeSubset(TrialCopy, Essais)
% global ChannelsProperties;
% global SoftOrg;
% 
% NewTrial=TrialCopy;
% 
% %----------------------- Save header -----------------------
% NewTrial.Version=TrialCopy.Version;
% NewTrial.AcqSoftware=TrialCopy.AcqSoftware;
% NewTrial.FileName=TrialCopy.FileName(Essais,:);
% NewTrial.NbOfRecords=TrialCopy.NbOfRecords;
% NewTrial.JMA=TrialCopy.JMA(Essais,:);
% NewTrial.Heure=TrialCopy.Heure(Essais,:);
% NewTrial.OrgTrialNb=TrialCopy.OrgTrialNb(Essais);
% NewTrial.TrueTrialNb=TrialCopy.TrueTrialNb(Essais);
% NewTrial.Code=TrialCopy.Code(Essais);
% NewTrial.InfoRecordType=TrialCopy.InfoRecordType;
% for i=1:TrialCopy.NbOfRecords
%     
%     %---------- Save STIM header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'stim')==1
%         Cmd='trial.stim=[];'; eval(Cmd);
%         NewTrial.stim.SensorType=TrialCopy.stim.SensorType;
%         NewTrial.stim.Version=TrialCopy.stim.Version;
%         NewTrial.stim.NbOfStmCh=TrialCopy.stim.NbOfStmCh(Essais);
%         NewTrial.stim.Frequency=TrialCopy.stim.Frequency;
%         NewTrial.stim.NbOfSamples=TrialCopy.stim.NbOfSamples(Essais);
%         NewTrial.stim.PreSeqType=TrialCopy.stim.PreSeqType(Essais,:);
%         NewTrial.stim.PreSeqNbOfPar=TrialCopy.stim.PreSeqNbOfPar(Essais);
%         NewTrial.stim.PreSeqParam=TrialCopy.stim.PreSeqParam(Essais);
%         NewTrial.stim.SeqType=TrialCopy.stim.SeqType(Essais,:);
%         NewTrial.stim.SeqNbOfPar=TrialCopy.stim.SeqNbOfPar(Essais);
%         NewTrial.stim.SeqParam=TrialCopy.stim.SeqParam(Essais);
%         NewTrial.stim.PstSeqType=TrialCopy.stim.PstSeqType(Essais,:);
%         NewTrial.stim.PstSeqNbOfPar=TrialCopy.stim.PstSeqNbOfPar(Essais);
%         NewTrial.stim.PstSeqParam=TrialCopy.stim.PstSeqParam(Essais);
%         if (isempty(strfind(SoftOrg,'m&h'))~=1 || isempty(strfind(SoftOrg,'biopac'))~=1)
%             NewTrial.stim.InfoStimName=TrialCopy.stim.InfoStimName(Essais:end,:);
%             NewTrial.stim.InfoSignalType=TrialCopy.stim.InfoSignalType(Essais:end,:);
%             NewTrial.stim.InfoUnits=TrialCopy.stim.InfoUnits(Essais:end,:);
%         else
%             NewTrial.stim.InfoStimName=TrialCopy.stim.InfoStimName(Essais,:);
%             NewTrial.stim.InfoSignalType=TrialCopy.stim.InfoSignalType(Essais);
%             NewTrial.stim.InfoUnits=TrialCopy.stim.InfoUnits(Essais,:);
%         end
%     end
%     
%     %---------- Save OPTO header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'optotrak')==1
%         Cmd='trial.opto=[];'; eval(Cmd);
%         NewTrial.opto.SensoryType=TrialCopy.opto.SensoryType;
%         NewTrial.opto.Version=TrialCopy.opto.Version;
%         NewTrial.opto.Model=TrialCopy.opto.Model;
%         NewTrial.opto.NbOfMarkers=TrialCopy.opto.NbOfMarkers;
%         NewTrial.opto.FrameFreq=TrialCopy.opto.FrameFreq;
%         NewTrial.opto.NbOfFrames=TrialCopy.opto.NbOfFrames(Essais);
%         NewTrial.opto.DataRef=TrialCopy.opto.DataRef;
%         if TrialCopy.opto.DataRef=='O' |  TrialCopy.opto.DataRef=='P'          
%             NewTrial.opto.PlaneMk1=TrialCopy.opto.PlaneMk1;
%             NewTrial.opto.PlaneMk2=TrialCopy.opto.PlaneMk2;
%             NewTrial.opto.PlaneMk3=TrialCopy.opto.PlaneMk3;
%         end
%         NewTrial.opto.BadFloatExist=TrialCopy.opto.BadFloatExist(Essais);
%         NewTrial.opto.BadFrameExist=TrialCopy.opto.BadFrameExist(Essais);
%         NewTrial.opto.BadFloatCode=TrialCopy.opto.BadFloatCode;
%         NewTrial.opto.BadFrameCode=TrialCopy.opto.BadFrameCode;
%         NewTrial.opto.Units=TrialCopy.opto.Units;
%         NewTrial.opto.InfoMarkerName=TrialCopy.opto.InfoMarkerName;
%         NewTrial.opto.InfoNbOfBadFloat=TrialCopy.opto.InfoNbOfBadFloat(Essais,:);
%         NewTrial.opto.InfoNbOfBadFrame=TrialCopy.opto.InfoNbOfBadFrame(Essais,:);
%     end
%     %---------- Save VICON header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'vicon')==1
%         Cmd='trial.opto=[];'; eval(Cmd);
%         NewTrial.vicon.SensoryType=TrialCopy.vicon.SensoryType;
%         NewTrial.vicon.Version=TrialCopy.vicon.Version;
%         NewTrial.vicon.Model=TrialCopy.vicon.Model;
%         NewTrial.vicon.NbOfMarkers=TrialCopy.vicon.NbOfMarkers;
%         NewTrial.vicon.FrameFreq=TrialCopy.vicon.FrameFreq;
%         NewTrial.vicon.NbOfFrames=TrialCopy.vicon.NbOfFrames(Essais);
%         NewTrial.vicon.BadFloatCode=TrialCopy.vicon.BadFloatCode;
%         NewTrial.vicon.BadFrameCode=TrialCopy.vicon.BadFrameCode;
%         NewTrial.vicon.InfoUnits=TrialCopy.vicon.InfoUnits;
%         NewTrial.vicon.InfoMarkerName=TrialCopy.vicon.InfoMarkerName;
%         NewTrial.vicon.InfoGain=TrialCopy.vicon.InfoGain;
%     end
%     %---------- Save BIRD header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'bird')==1
%         Cmd='trial.bird=[];'; eval(Cmd);
%         NewTrial.bird.SensoryType=TrialCopy.bird.SensoryType;
%         NewTrial.bird.Version=TrialCopy.bird.Version;
%         NewTrial.bird.Model=TrialCopy.bird.Model;
%         NewTrial.bird.NbOfMarkers=TrialCopy.bird.NbOfMarkers;
%         NewTrial.bird.FrameFreq=TrialCopy.bird.FrameFreq;
%         NewTrial.bird.NbOfFrames=TrialCopy.bird.NbOfFrames(Essais);
%         NewTrial.bird.PlaneMk1=TrialCopy.bird.PlaneMk1;
%         NewTrial.bird.PlaneMk2=TrialCopy.bird.PlaneMk2;
%         NewTrial.bird.PlaneMk3=TrialCopy.bird.PlaneMk3;
%         NewTrial.bird.BadFloatExist=TrialCopy.bird.BadFloatExist(Essais);
%         NewTrial.bird.BadFrameExist=TrialCopy.bird.BadFrameExist(Essais);
%         NewTrial.bird.BadFloatCode=TrialCopy.bird.BadFloatCode;
%         NewTrial.bird.BadFrameCode=TrialCopy.bird.BadFrameCode;
%         NewTrial.bird.DataRef=TrialCopy.bird.DataRef;
%         NewTrial.bird.Units=TrialCopy.bird.Units;
%         NewTrial.bird.InfoMarkerName=TrialCopy.bird.InfoMarkerName;
%         NewTrial.bird.InfoNbOfBadFloat=TrialCopy.bird.InfoNbOfBadFloat(Essais,:);
%         NewTrial.bird.InfoNbOfBadFrame=TrialCopy.bird.InfoNbOfBadFrame(Essais,:);
%     end
%     
%     %---------- Save EOG header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'eog')==1
%         Cmd='trial.eog=[];'; eval(Cmd);
%         NewTrial.eog.SensoryType=TrialCopy.eog.SensoryType;
%         NewTrial.eog.Version=TrialCopy.eog.Version;
%         NewTrial.eog.Model=TrialCopy.eog.Model;
%         NewTrial.eog.NbOfChannels=TrialCopy.eog.NbOfChannels;
%         NewTrial.eog.Frequency=TrialCopy.eog.Frequency;
%         NewTrial.eog.NbOfSamples=TrialCopy.eog.NbOfSamples(Essais);
%         NewTrial.eog.LoCutFreq=TrialCopy.eog.LoCutFreq;
%         NewTrial.eog.HiCutFreq=TrialCopy.eog.HiCutFreq;
%         NewTrial.eog.FilterType=TrialCopy.eog.FilterType;
%         NewTrial.eog.CalibrationMode=TrialCopy.eog.CalibrationMode;
%         NewTrial.eog.InfoChannelName=TrialCopy.eog.InfoChannelName;
%         NewTrial.eog.InfoDataSize=TrialCopy.eog.InfoDataSize(Essais);
%         NewTrial.eog.InfoGain=TrialCopy.eog.InfoGain;
%         NewTrial.eog.InfoUnits=TrialCopy.eog.InfoUnits;
%     end
%     
%     %---------- Save EYELINK header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'eyelink')==1
%         Cmd='trial.eyelink=[];'; eval(Cmd);
%         NewTrial.eyelink.SensoryType=TrialCopy.eyelink.SensoryType;
%         NewTrial.eyelink.Version=TrialCopy.eyelink.Version;
%         NewTrial.eyelink.Model=TrialCopy.eyelink.Model;
%         NewTrial.eyelink.NbOfChannels=TrialCopy.eyelink.NbOfChannels;
%         NewTrial.eyelink.Frequency=TrialCopy.eyelink.Frequency;
%         NewTrial.eyelink.NbOfSamples=TrialCopy.eyelink.NbOfSamples(Essais);
%         NewTrial.eyelink.LoCutFreq=TrialCopy.eyelink.LoCutFreq;
%         NewTrial.eyelink.HiCutFreq=TrialCopy.eyelink.HiCutFreq;
%         NewTrial.eyelink.FilterType=TrialCopy.eyelink.FilterType;
%         NewTrial.eyelink.CalibrationMode=TrialCopy.eyelink.CalibrationMode;
%         NewTrial.eyelink.InfoChannelName=TrialCopy.eyelink.InfoChannelName;
%         NewTrial.eyelink.InfoDataSize=TrialCopy.eyelink.InfoDataSize(Essais);
%         NewTrial.eyelink.InfoGain=TrialCopy.eyelink.InfoGain;
%         NewTrial.eyelink.InfoUnits=TrialCopy.eyelink.InfoUnits;
%     end
%     
%     %---------- Save EYETRACKER header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'eyetracker')==1
%         Cmd='trial.eyetracker=[];'; eval(Cmd);
%         NewTrial.eyetracker.SensoryType=TrialCopy.eyetracker.SensoryType;
%         NewTrial.eyetracker.Version=TrialCopy.eyetracker.Version;
%         NewTrial.eyetracker.Model=TrialCopy.eyetracker.Model;
%         NewTrial.eyetracker.NbOfChannels=TrialCopy.eyetracker.NbOfChannels;
%         NewTrial.eyetracker.Frequency=TrialCopy.eyetracker.Frequency;
%         NewTrial.eyetracker.NbOfSamples=TrialCopy.eyetracker.NbOfSamples(Essais);
%         NewTrial.eyetracker.LoCutFreq=TrialCopy.eyetracker.LoCutFreq;
%         NewTrial.eyetracker.HiCutFreq=TrialCopy.eyetracker.HiCutFreq;
%         NewTrial.eyetracker.FilterType=TrialCopy.eyetracker.FilterType;
%         NewTrial.eyetracker.CalibrationMode=TrialCopy.eyetracker.CalibrationMode;
%         NewTrial.eyetracker.InfoChannelName=TrialCopy.eyetracker.InfoChannelName;
% %         NewTrial.eyetracker.InfoDataSize=TrialCopy.eyetracker.InfoDataSize(Essais);
%         NewTrial.eyetracker.InfoGain=TrialCopy.eyetracker.InfoGain;
%         NewTrial.eyetracker.InfoUnits=TrialCopy.eyetracker.InfoUnits;
%     end
% 
%     %---------- Save GENERIC_ANALOG header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'generic_analog')==1
%         Cmd='trial.gen_analog=[];'; eval(Cmd);
%         NewTrial.gen_analog.SensoryType=TrialCopy.gen_analog.SensoryType;
%         NewTrial.gen_analog.Version=TrialCopy.gen_analog.Version;
%         NewTrial.gen_analog.Model=TrialCopy.gen_analog.Model;
%         NewTrial.gen_analog.NbOfChannels=TrialCopy.gen_analog.NbOfChannels;
%         NewTrial.gen_analog.Frequency=TrialCopy.gen_analog.Frequency;
%         NewTrial.gen_analog.NbOfSamples=TrialCopy.gen_analog.NbOfSamples(Essais);
%         NewTrial.gen_analog.LoCutFreq=TrialCopy.gen_analog.LoCutFreq;
%         NewTrial.gen_analog.HiCutFreq=TrialCopy.gen_analog.HiCutFreq;
%         NewTrial.gen_analog.FilterType=TrialCopy.gen_analog.FilterType;
%         NewTrial.gen_analog.CalibrationMode=TrialCopy.gen_analog.CalibrationMode;
%         NewTrial.gen_analog.InfoChannelName=TrialCopy.gen_analog.InfoChannelName;
%         NewTrial.gen_analog.InfoDataSize=TrialCopy.gen_analog.InfoDataSize(Essais);
%         NewTrial.gen_analog.InfoGain=TrialCopy.gen_analog.InfoGain;
%         NewTrial.gen_analog.InfoUnits=TrialCopy.gen_analog.InfoUnits;
%     end
%     
%     %---------- Save COIL header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'coil')==1
%         Cmd='trial.coil=[];'; eval(Cmd);
%         NewTrial.coil.SensoryType=TrialCopy.coil.SensoryType;
%         NewTrial.coil.Version=TrialCopy.coil.Version;
%         NewTrial.coil.Model=TrialCopy.coil.Model;
%         NewTrial.coil.NbOfChannels=TrialCopy.coil.NbOfChannels;
%         NewTrial.coil.Frequency=TrialCopy.coil.Frequency;
%         NewTrial.coil.NbOfSamples=TrialCopy.coil.NbOfSamples(Essais);
%         NewTrial.coil.LoCutFreq=TrialCopy.coil.LoCutFreq;
%         NewTrial.coil.HiCutFreq=TrialCopy.coil.HiCutFreq;
%         NewTrial.coil.FilterType=TrialCopy.coil.FilterType;
%         NewTrial.coil.CalibrationMode=TrialCopy.coil.CalibrationMode;
%         NewTrial.coil.InfoChannelName=TrialCopy.coil.InfoChannelName;
%         NewTrial.coil.InfoDataSize=TrialCopy.coil.InfoDataSize(Essais);
%         NewTrial.coil.InfoGain=TrialCopy.coil.InfoGain;
%         NewTrial.coil.InfoUnits=TrialCopy.coil.InfoUnits;
%     end
%     
%     %---------- Save SPIKE header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'spike')==1
%         Cmd='trial.spike=[];'; eval(Cmd);
%         NewTrial.spike.SensoryType=TrialCopy.spike.SensoryType;
%         NewTrial.spike.Version=TrialCopy.spike.Version;
%         NewTrial.spike.Model=TrialCopy.spike.Model;
%         NewTrial.spike.NbOfChannels=TrialCopy.spike.NbOfChannels;
%         NewTrial.spike.Frequency=TrialCopy.spike.Frequency;
%         NewTrial.spike.NbOfSamples=TrialCopy.spike.NbOfSamples(Essais);
%         NewTrial.spike.LoCutFreq=TrialCopy.spike.LoCutFreq;
%         NewTrial.spike.HiCutFreq=TrialCopy.spike.HiCutFreq;
%         NewTrial.spike.FilterType=TrialCopy.spike.FilterType;
%         NewTrial.spike.CalibrationMode=TrialCopy.spike.CalibrationMode;
%         NewTrial.spike.InfoChannelName=TrialCopy.spike.InfoChannelName;
%         NewTrial.spike.InfoDataSize=TrialCopy.spike.InfoDataSize(Essais);
%         NewTrial.spike.InfoGain=TrialCopy.spike.InfoGain;
%         NewTrial.spike.InfoUnits=TrialCopy.spike.InfoUnits;
%     end
% end
% 
% S=size(NewTrial.OrgTrialNb);S=S(2);
% NewTrial.NbEssais=S ; %TrialCopy.NbEssais;
% NewTrial.MainFrequency=TrialCopy.MainFrequency;
% 
% %----- SAUVEGARDE DES DATA de toutes les voies list�es
% for j=1:ChannelsProperties.ListeSize
%     NbOfEvents=ChannelsProperties.ChannelInfos(j).NbOfEvents;
%     Parent=ChannelsProperties.ChannelInfos(j).ParentField;
%     DataField=ChannelsProperties.DataFieldAccessList{j}(1,:);
%     
%     %sauvegarde du champ parameters (s'il existe NbOfEvents>0) de chq voie list�e 
%     ChNb=ChannelsProperties.ChannelInfos(j).ChannelNb;    
%     %si le champ params existe
%     if NbOfEvents>0
%         Cmd0=[ChannelsProperties.ChannelInfos(j).Event(1).ParentField, num2str(ChNb)];
%         CmdDest=['NewTrial.', Cmd0];
%         CmdSrc=['TrialCopy.', Cmd0, '(Essais);'];
%         Cmd=[CmdDest, '=', CmdSrc];
%         eval(Cmd);
%     end
%     
%     Cmd=[ Parent, '.', DataField, num2str(ChNb)];
%     %si le champ precdt 'CmdDest' existe on saute
%     CmdDest=['NewTrial.',Cmd];
%     CmdSrc=['TrialCopy.',Cmd, '(Essais);'];
%     Cmd=[CmdDest, '=', CmdSrc]; eval(Cmd);
%     %fin si
% end
% %---------------- fin MakeSubset --------------


% % --------------------------------------------------------------------
% function SaveCat(Filename, Essais, TrialCopy)
% %global trial;
% global ChannelsProperties;
% global MatfilePath;
% 
% %Essais=Cat.Essais;
% %----------------------- Save header -----------------------
% trial.Version=TrialCopy.Version;
% trial.AcqSoftware=TrialCopy.AcqSoftware;
% trial.FileName=TrialCopy.FileName(Essais,:);
% trial.NbOfRecords=TrialCopy.NbOfRecords;
% trial.JMA=TrialCopy.JMA(Essais,:);
% trial.Heure=TrialCopy.Heure(Essais,:);
% trial.OrgTrialNb=TrialCopy.OrgTrialNb(Essais);
% trial.TrueTrialNb=TrialCopy.TrueTrialNb(Essais);
% trial.Code=TrialCopy.Code(Essais);
% trial.InfoRecordType=TrialCopy.InfoRecordType;
% for i=1:TrialCopy.NbOfRecords
%     
%     %---------- Save STIM header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'stim')==1
%         Cmd='trial.stim=[];'; eval(Cmd);
%         trial.stim.SensorType=TrialCopy.stim.SensorType;
%         trial.stim.Version=TrialCopy.stim.Version;
%         trial.stim.NbOfStmCh=TrialCopy.stim.NbOfStmCh(Essais);
%         trial.stim.Frequency=TrialCopy.stim.Frequency;
%         trial.stim.NbOfSamples=TrialCopy.stim.NbOfSamples(Essais);
%         trial.stim.PreSeqType=TrialCopy.stim.PreSeqType(Essais,:);
%         trial.stim.PreSeqNbOfPar=TrialCopy.stim.PreSeqNbOfPar(Essais);
%         trial.stim.PreSeqParam=TrialCopy.stim.PreSeqParam(Essais);
%         trial.stim.SeqType=TrialCopy.stim.SeqType(Essais,:);
%         trial.stim.SeqNbOfPar=TrialCopy.stim.SeqNbOfPar(Essais);
%         trial.stim.SeqParam=TrialCopy.stim.SeqParam(Essais);
%         trial.stim.PstSeqType=TrialCopy.stim.PstSeqType(Essais,:);
%         trial.stim.PstSeqNbOfPar=TrialCopy.stim.PstSeqNbOfPar(Essais);
%         trial.stim.PstSeqParam=TrialCopy.stim.PstSeqParam(Essais);
%         trial.stim.InfoStimName=TrialCopy.stim.InfoStimName(Essais,:);
%         trial.stim.InfoSignalType=TrialCopy.stim.InfoSignalType(Essais);
%         trial.stim.InfoUnits=TrialCopy.stim.InfoUnits(Essais,:);
%     end
%     
%     %---------- Save OPTO header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'optotrak')==1
%         Cmd='trial.opto=[];'; eval(Cmd);
%         trial.opto.SensoryType=TrialCopy.opto.SensoryType;
%         trial.opto.Version=TrialCopy.opto.Version;
%         trial.opto.Model=TrialCopy.opto.Model;
%         trial.opto.NbOfMarkers=TrialCopy.opto.NbOfMarkers;
%         trial.opto.FrameFreq=TrialCopy.opto.FrameFreq;
%         trial.opto.NbOfFrames=TrialCopy.opto.NbOfFrames(Essais);
%         trial.opto.PlaneMk1=TrialCopy.opto.PlaneMk1;
%         trial.opto.PlaneMk2=TrialCopy.opto.PlaneMk2;
%         trial.opto.PlaneMk3=TrialCopy.opto.PlaneMk3;
%         trial.opto.BadFloatExist=TrialCopy.opto.BadFloatExist(Essais);
%         trial.opto.BadFrameExist=TrialCopy.opto.BadFrameExist(Essais);
%         trial.opto.BadFloatCode=TrialCopy.opto.BadFloatCode;
%         trial.opto.BadFrameCode=TrialCopy.opto.BadFrameCode;
%         trial.opto.DataRef=TrialCopy.opto.DataRef;
%         trial.opto.Units=TrialCopy.opto.Units;
%         trial.opto.InfoMarkerName=TrialCopy.opto.InfoMarkerName;
%         trial.opto.InfoNbOfBadFloat=TrialCopy.opto.InfoNbOfBadFloat(Essais);
%         trial.opto.InfoNbOfBadFrame=TrialCopy.opto.InfoNbOfBadFrame(Essais);
%     end
%     if strfind(TrialCopy.InfoRecordType(i,:),'vicon')==1
%         Cmd='trial.vicon=[];'; eval(Cmd);
%         trial.vicon.SensoryType=TrialCopy.vicon.SensoryType;
%         trial.vicon.Version=TrialCopy.vicon.Version;
%         trial.vicon.Model=TrialCopy.vicon.Model;
%         trial.vicon.NbOfMarkers=TrialCopy.vicon.NbOfMarkers;
%         trial.vicon.FrameFreq=TrialCopy.vicon.FrameFreq;
%         trial.vicon.NbOfFrames=TrialCopy.vicon.NbOfFrames(Essais);
%         trial.vicon.PlaneMk1=TrialCopy.vicon.PlaneMk1;
%         trial.vicon.PlaneMk2=TrialCopy.vicon.PlaneMk2;
%         trial.vicon.PlaneMk3=TrialCopy.vicon.PlaneMk3;
%         trial.vicon.BadFloatExist=TrialCopy.vicon.BadFloatExist(Essais);
%         trial.vicon.BadFrameExist=TrialCopy.vicon.BadFrameExist(Essais);
%         trial.vicon.BadFloatCode=TrialCopy.vicon.BadFloatCode;
%         trial.vicon.BadFrameCode=TrialCopy.vicon.BadFrameCode;
%         trial.vicon.DataRef=TrialCopy.vicon.DataRef;
%         trial.vicon.Units=TrialCopy.vicon.Units;
%         trial.vicon.InfoMarkerName=TrialCopy.vicon.InfoMarkerName;
%         trial.vicon.InfoNbOfBadFloat=TrialCopy.vicon.InfoNbOfBadFloat(Essais);
%         trial.vicon.InfoNbOfBadFrame=TrialCopy.vicon.InfoNbOfBadFrame(Essais);
%     end
%     %---------- Save EOG header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'eog')==1
%         Cmd='trial.eog=[];'; eval(Cmd);
%         trial.eog.SensoryType=TrialCopy.eog.SensoryType;
%         trial.eog.Version=TrialCopy.eog.Version;
%         trial.eog.Model=TrialCopy.eog.Model;
%         trial.eog.NbOfChannels=TrialCopy.eog.NbOfChannels;
%         trial.eog.Frequency=TrialCopy.eog.Frequency;
%         trial.eog.NbOfSamples=TrialCopy.eog.NbOfSamples(Essais);
%         trial.eog.LoCutFreq=TrialCopy.eog.LoCutFreq;
%         trial.eog.HiCutFreq=TrialCopy.eog.HiCutFreq;
%         trial.eog.FilterType=TrialCopy.eog.FilterType;
%         trial.eog.CalibrationMode=TrialCopy.eog.CalibrationMode;
%         trial.eog.InfoChannelName=TrialCopy.eog.InfoChannelName;
%         trial.eog.InfoDataSize=TrialCopy.eog.InfoDataSize(Essais);
%         trial.eog.InfoGain=TrialCopy.eog.InfoGain;
%         trial.eog.InfoUnits=TrialCopy.eog.InfoUnits;
%     end
%     
%     %---------- Save EYETRACKER header record --------------------
%     if strfind(TrialCopy.InfoRecordType(i,:),'eyetracker')==1
%         Cmd='trial.eyetracker=[];'; eval(Cmd);
%         trial.eyetracker.SensoryType=TrialCopy.eyetracker.SensoryType;
%         trial.eyetracker.Version=TrialCopy.eyetracker.Version;
%         trial.eyetracker.Model=TrialCopy.eyetracker.Model;
%         trial.eyetracker.NbOfChannels=TrialCopy.eyetracker.NbOfChannels;
%         trial.eyetracker.Frequency=TrialCopy.eyetracker.Frequency;
%         trial.eyetracker.NbOfSamples=TrialCopy.eyetracker.NbOfSamples(Essais);
%         trial.eyetracker.LoCutFreq=TrialCopy.eyetracker.LoCutFreq;
%         trial.eyetracker.HiCutFreq=TrialCopy.eyetracker.HiCutFreq;
%         trial.eyetracker.FilterType=TrialCopy.eyetracker.FilterType;
%         trial.eyetracker.CalibrationMode=TrialCopy.eyetracker.CalibrationMode;
%         trial.eyetracker.InfoChannelName=TrialCopy.eyetracker.InfoChannelName;
%         trial.eyetracker.InfoDataSize=TrialCopy.eyetracker.InfoDataSize(Essais);
%         trial.eyetracker.InfoGain=TrialCopy.eyetracker.InfoGain;
%         trial.eyetracker.InfoUnits=TrialCopy.eyetracker.InfoUnits;
%     end
% end
% 
% S=size(trial.OrgTrialNb);S=S(2);
% trial.NbEssais=S ; %TrialCopy.NbEssais;
% trial.MainFrequency=TrialCopy.MainFrequency;
% 
% 
% %----- SAUVEGARDE DES DATA
% for j=1:ChannelsProperties.ListeSize
%     NbOfEvents=ChannelsProperties.ChannelInfos(j).NbOfEvents;
%     Parent=ChannelsProperties.ChannelInfos(j).ParentField;
%     DataField=ChannelsProperties.DataFieldAccessList{j}(1,:);
%     
%     %sauvegarde des champs events s'ils existent
%     for k=1:NbOfEvents
%         Cmd=[ChannelsProperties.ChannelInfos(j).Event(k).ParentField, '.', ChannelsProperties.ChannelInfos(j).Event(k).DataField];
%         CmdDest=['trial.', Cmd];
%         CmdSrc=['TrialCopy.', Cmd, '(Essais);'];
%         Cmd=[CmdDest, '=', CmdSrc]; eval(Cmd);
%     end
%     
%     Cmd=[ Parent, '.', DataField];
%     %si le champ precdt 'CmdDest' existe on saute
%     CmdDest=['trial.',Cmd];
%     CmdSrc=['TrialCopy.',Cmd, '(Essais);'];
%     Cmd=[CmdDest, '=', CmdSrc]; eval(Cmd);
%     %fin si
% end
% 
% %---- sauvegarde du fichier matlab----------
% CatFilename=[MatfilePath, PathSep, Filename];
% save (CatFilename,'trial','ChannelsProperties');
% s=1;
% 

% ------------------------------ effacer un essai ------------------------------
function mnuEffEssai_Callback(hObject, eventdata, handles)
global trial;
global Categories;

ParamsIn.Name='truc';
% OutStruct=ConfirmEffacer(ParamsIn);
button = questdlg('Voulez vous supprimer','Suppression','Yes')
% if OutStruct.Rep==0 return; end
if (strcmpi(button,'No')==1 || strcmpi(button,'cancel')==1) return; end
%test si del s'effectu sur la liste principale sinon return
Cat_selected=get(handles.lstCat,'Value');
if Cat_selected~=1 
    return;
end

FirstListIndexEntries = get(handles.lstFile,'Value');
hd=handles;
for i=1:size(FirstListIndexEntries,2)
    CurListIndexEntries = get(hd.lstFile,'Value');
    S=size(hd.ListeIndMain);S=S(2); %longueur restante
    if S==1
        errordlg('Dernier essai');
        return; 
    end
    hd.ListeIndMain(CurListIndexEntries(1))=[];
    Liste=hd.ListeIndMain;
    trial=MakeSubset(trial, Liste);%Liste=liste des INDICES du tableau charg� avec open (fichier en cours) � garder
    ListeEssaisChrono=trial.OrgTrialNb;
    IndiceMain=[1:trial.NbEssais];
    ListeFilename=trial.FileName;
    if size(CurListIndexEntries,2)==1 %il n'en resre qu'un � effacer
        if (CurListIndexEntries(1)==S) %et c'est le dernier de la liste
            Sel=CurListIndexEntries(1)-1;
        else
            Sel=CurListIndexEntries;
        end
    else
        CurListIndexEntries(1)=[];
        Sel=CurListIndexEntries - 1;
    end
    h=load_listbox(ListeFilename, ListeEssaisChrono, IndiceMain, Sel, hd);
    hd=h;

    %------------------- pas actif -------------------
    %mise a jour des categories(if exist)
    if isempty(Categories)~=1
        S=size(Categories.Essais); S=S(2);
        for i=1:S %nb de categories
            for j=1:T %nb d'essais � virer
                res=find(Categories.Essais{i}==MainInd2Del(j));
                if isempty(res)~=1
                    Categories.Essais{i}(res)=[];
                else
                end
                %on cherche ts les indices > ind � virer et on enleve 1
                res=find(Categories.Essais{i}>MainInd2Del(j));
                L=Categories.Essais{i}(res);
                Categories.Essais{i}(res)=L-1;
            end
        end
    end
    AfficheCourbes(hd);
end
%--------------------effacer une voie---------------------
function mnuEffVoie_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;


Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);Rec_nb=Rec_nb(2);
if (Rec_nb>1)
    errordlg('Une voie � la fois');
    return; 
end%on efface un channel � la fois
ParamsIn.Name='truc';
OutStruct=ConfirmEffacer(ParamsIn);
if OutStruct.Rep==0 return; end

%recherche du champ complet � effacer
Parent=ChannelsProperties.ChannelInfos(Rec_selected).ParentField;
DataField=ChannelsProperties.DataFieldAccessList{Rec_selected}(1,:);
ChNb=ChannelsProperties.ChannelInfos(Rec_selected).ChannelNb;

%mise a jour header de chaque record
if strcmp(DataField,'RawData')==1
    if strcmp(Parent,'stim')==1
        if trial.stim.NbOfStmCh==1
            errordlg('On ne peut pas effacer la derni�re voie');
            return;
        end
        trial.stim.NbOfStmCh=trial.stim.NbOfStmCh-1;
        trial.stim.InfoStimName(ChNb,:)=[];
    end  
    if strcmp(Parent,'gen_analog')==1
        errordlg('Generic analog ne peut etre effac�');
        return;
        trial.gen_analog.NbOfChannels=trial.gen_analog.NbOfChannels-1;
    end
    if strcmp(Parent,'eog')==1
        if trial.stim.NbOfMarkers==1
            errordlg('On ne peut pas effacer la derni�re voie');
            return;
        end
        trial.opto.NbOfMarkers=trial.opto.NbOfMarkers-1;
        trial.opto.InfoMarkerName(ChNb,:)=[];
    end
    if strcmp(Parent,'eyelink')==1
        errordlg('Eyelink ne peut etre effac�');
        return;
        trial.eyelink.NbOfChannels=trial.eyelink.NbOfChannels-1;
    end
    if strcmp(Parent,'coil')==1
        errordlg('Coil ne peut etre effac�');
        return;
        trial.coil.NbOfChannels=trial.coil.NbOfChannels-1;
    end
    if strcmp(Parent,'opto')==1
        if trial.opto.NbOfMarkers==1
            errordlg('On ne peut pas effacer la derni�re voie');
            return;
        end
        trial.opto.NbOfMarkers=trial.opto.NbOfMarkers-1;
        trial.opto.InfoMarkerName(ChNb,:)=[];
    end
    if strcmp(Parent,'vicon')==1
        if trial.vicon.NbOfMarkers==1
            errordlg('On ne peut pas effacer la derni�re voie');
            return;
        end
        trial.vicon.NbOfChannels=trial.vicon.NbOfMarkers-1;
        trial.vicon.InfoMarkerName(ChNb)=[];
    end
    if strcmp(Parent,'bird')==1
        errordlg('Bird ne peut etre effac�');
        return;
        trial.bird.NbOfMarkers=trial.bird.NbOfMarkers-1;
    end
    if strcmp(Parent,'spike')==1
        errordlg('Eyelink ne peut etre effac�');
        return;
        trial.spike.NbOfChannels=trial.spike.NbOfChannels-1;
    end
    if strcmp(Parent,'eyetracker')==1 
        errordlg('Eyetracker ne peut etre effac�');
        return;
        trial.spike.NbOfChannels=trial.eyetracker.NbOfChannels-1;
    end
end

%effacement champ rawdata n
Cmd0=['trial.', Parent];
Cmd=[Cmd0, '=rmfield(', Cmd0, ',''' DataField,  num2str(ChNb), ''');'];
eval(Cmd); %on efface

%mise � jour de la struct. ChannelsProperties
ChProp=ChannelsProperties;
ChProp.DataFieldAccessList(Rec_selected)=[];
ChProp.ChannelInfos(Rec_selected)=[];
ChProp.ChannelList(Rec_selected)=[];
ChProp.ListeSize=ChannelsProperties.ListeSize-1;
ChannelsProperties=ChProp;

List_selected=get(handles.lstFile,'Value');
%reload rec_list
load_Reclistbox(ChannelsProperties.ChannelList, handles, ChProp.ListeSize);

set(handles.lstFile, 'Value', List_selected);







% --- Executes on button press in radSuppMvt.
function radSuppMvt_Callback(hObject, eventdata, handles)

if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
%set(handles.btnMvtOpt,'Visible','off');

% --- Executes on button press in radAjoutMvt.
function radAjoutMvt_Callback(hObject, eventdata, handles)
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','on');
% set(handles.lblFonction,'String','AJOUT de MVT ');


% --- Executes on button press in radCursModif.
function radCursModif_Callback(hObject, eventdata, handles)
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end

if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');
% set(handles.lblFonction,'String','DEPLACEMENT de CURSEUR ');




% --- Executes on button press in radAjoutCur.
function radAjoutCur_Callback(hObject, eventdata, handles)

if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end


% set(handles.lblFonction,'String','AJOUT de CURSEUR');
% set(handles.btnMvtOpt,'Visible','off');


% --- Executes on button press in radDeplMvt.
function radDeplMvt_Callback(~, ~, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','on');
% set(handles.lblFonction,'String','DEPLACEMENT de MVT');


% --- Executes on button press in radSuppCur.
function radSuppCur_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');
% set(handles.lblFonction,'String','SUPPRESSION de CURSEUR');


% --- Executes on button press in radReadMouse.
function radReadMouse_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');
%mutual_exclude(h);
% set(handles.txtMessage,'String','selectionnez le point X reference T=0 ');

% --- Executes on button press in radRenCur.
function radRenCur_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');
set(handles.lblFonction,'String','');

% --- Executes on button press in radRenVoie.
function radRenVoie_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');

% --- Executes on button press in radRenEssai.
function radRenEssai_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenComp) h = [handles.radRenComp];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');

% --- Executes on button press in radRenComp.
function radRenComp_Callback(hObject, eventdata, handles)
    
if ishandle(handles.radReadMouse) h = [handles.radReadMouse];set(h,'Value',0); end
if ishandle(handles.radSuppMvt) h = [handles.radSuppMvt];set(h,'Value',0); end
if ishandle(handles.radAjoutMvt) h = [handles.radAjoutMvt];set(h,'Value',0); end
if ishandle(handles.radDeplMvt) h = [handles.radDeplMvt];set(h,'Value',0); end
if ishandle(handles.radCursModif) h = [handles.radCursModif];set(h,'Value',0); end
if ishandle(handles.radAjoutCur) h = [handles.radAjoutCur];set(h,'Value',0); end
if ishandle(handles.radSuppCur) h = [handles.radSuppCur];set(h,'Value',0); end
if ishandle(handles.radRenCur) h = [handles.radRenCur];set(h,'Value',0); end
if ishandle(handles.radRenVoie) h = [handles.radRenVoie];set(h,'Value',0); end
if ishandle(handles.radRenEssai) h = [handles.radRenEssai];set(h,'Value',0); end
% set(handles.btnMvtOpt,'Visible','off');

% --- Executes on button press in chkTselect.
function chkTselect_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_selected=get(handles.lstRecType,'Value');
Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
NbComp=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
Comp2Plot(1)=get(handles.chkXselect,'Value');
Comp2Plot(2)=get(handles.chkYselect,'Value');
Comp2Plot(3)=get(handles.chkZselect,'Value');
Comp2Plot(4)=get(handles.chkTselect,'Value');
Comp2Plot=Comp2Plot(1:NbComp);
if (any(Comp2Plot)==1)
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot=Comp2Plot;
	[Cv, Cr]=AfficheCourbes(handles);
else
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot(4)=1;
	set(handles.chkTselect,'value',1);
end


% --- Executes on button press in chkXselect.
function chkXselect_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_selected=get(handles.lstRecType,'Value');
Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
NbComp=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
Comp2Plot(1)=get(handles.chkXselect,'Value');
Comp2Plot(2)=get(handles.chkYselect,'Value');
Comp2Plot(3)=get(handles.chkZselect,'Value');
Comp2Plot(4)=get(handles.chkTselect,'Value');
Comp2Plot=Comp2Plot(1:NbComp);
if (any(Comp2Plot)==1)
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot=Comp2Plot;
	[Cv, Cr]=AfficheCourbes(handles);
else
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot(1)=1;
	set(handles.chkXselect,'value',1);
end


% --- Executes on button press in chkYselect.
function chkYselect_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_selected=get(handles.lstRecType,'Value');
Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
NbComp=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
Comp2Plot(1)=get(handles.chkXselect,'Value');
Comp2Plot(2)=get(handles.chkYselect,'Value');
Comp2Plot(3)=get(handles.chkZselect,'Value');
Comp2Plot(4)=get(handles.chkTselect,'Value');
Comp2Plot=Comp2Plot(1:NbComp);
if (any(Comp2Plot)==1)
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot=Comp2Plot;
	[Cv, Cr]=AfficheCourbes(handles);
else
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot(2)=1;
	set(handles.chkYselect,'value',1);
end



% --- Executes on button press in chkZselect.
function chkZselect_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_selected=get(handles.lstRecType,'Value');
Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot;
NbComp=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;

Comp2Plot(1)=get(handles.chkXselect,'Value');
Comp2Plot(2)=get(handles.chkYselect,'Value');
Comp2Plot(3)=get(handles.chkZselect,'Value');
Comp2Plot(4)=get(handles.chkTselect,'Value');
Comp2Plot=Comp2Plot(1:NbComp);
if (any(Comp2Plot)==1)
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot=Comp2Plot;
	[Cv, Cr]=AfficheCourbes(handles);
else
    ChannelsProperties.ChannelInfos(Rec_selected(1)).Comp2Plot(3)=1;
	set(handles.chkZselect,'value',1);
end


% --- Executes on button press in btnMvtOpt.
function btnMvtOpt_Callback(hObject, eventdata, handles)
global trial;
global DetectOeil;
global Detect3D;
global DetectPince3D;
global ChannelsProperties;


if isfield(handles, 'CurrentCurves')~=1
    msgbox('Selectionner une courbe', '','warn', 'modal');
    return
end
CurrentCurves=handles.CurrentCurves;% courbes � l'�cran
CurrentFielName=CurrentCurves.FieldName{handles.SelectedCurve};
CurrentParentField=CurrentCurves.ParentField{handles.SelectedCurve};

InParams=[];
LabelBtn=get(handles.btnMvtOpt,'string');
if isempty(strfind(LabelBtn,'coil'))~=1
    InParams.Label='coil';
    InParams.PicAuto=DetectOeil.PicAuto;
    InParams.SeuilMode=DetectOeil.SeuilMode;
    InParams.SeuilAbs=DetectOeil.GblSeuilAbs;
    InParams.SeuilRel=DetectOeil.GblSeuilRel;
end
if isempty(strfind(LabelBtn,'eog'))~=1
    InParams.Label='eog';
    InParams.PicAuto=DetectOeil.PicAuto;
    InParams.SeuilMode=DetectOeil.SeuilMode;
    InParams.SeuilAbs=DetectOeil.GblSeuilAbs;
    InParams.SeuilRel=DetectOeil.GblSeuilRel;
end
if isempty(strfind(LabelBtn,'eyelink'))~=1
    InParams.Label='eyelink';
    InParams.PicAuto=DetectOeil.PicAuto;
    InParams.SeuilMode=DetectOeil.SeuilMode;
    InParams.SeuilAbs=DetectOeil.GblSeuilAbs;
    InParams.SeuilRel=DetectOeil.GblSeuilRel;
end
if isempty(strfind(LabelBtn,'eyetracker'))~=1
    InParams.Label='eyetracker';
    InParams.PicAuto=DetectOeil.PicAuto;
    InParams.SeuilMode=DetectOeil.SeuilMode;
    InParams.SeuilAbs=DetectOeil.GblSeuilAbs;
    InParams.SeuilRel=DetectOeil.GblSeuilRel;
end
if isempty(strfind(LabelBtn,'gen_analog'))~=1
    InParams.Label='gen_analog';
    InParams.PicAuto=DetectOeil.PicAuto;
    InParams.SeuilMode=DetectOeil.SeuilMode;
    InParams.SeuilAbs=DetectOeil.GblSeuilAbs;
    InParams.SeuilRel=DetectOeil.GblSeuilRel;
end
if isempty(strfind(LabelBtn,'opto'))~=1
    %test si mvt 3D ou pince
%     if strcmpi('rawdata',CurrentFielName) %mvt 3D
%     end
    if strfind(CurrentFielName,'Pince') %pince
        InParams.Label='opto';
        InParams.Mvt=2; %pince
        InParams.PicAuto=Detect3D.PicAuto;
        InParams.SeuilMode=Detect3D.SeuilMode;
        InParams.SeuilAbs=Detect3D.GblSeuilAbs;
        InParams.SeuilRel=Detect3D.GblSeuilRel;
        InParams.TempsForce=Detect3D.GblTempsForce;
    else
        InParams.Label='opto';
        InParams.Mvt=1; %mvt 3D
        InParams.PicAuto=Detect3D.PicAuto;
        InParams.SeuilMode=Detect3D.SeuilMode;
        InParams.SeuilAbs=Detect3D.GblSeuilAbs;
        InParams.SeuilRel=Detect3D.GblSeuilRel;
        InParams.TempsForce=Detect3D.GblTempsForce;
    end
end
if isempty(strfind(LabelBtn,'vicon'))~=1
    %test si mvt 3D ou pince
%     if strcmpi('rawdata',CurrentFielName) %mvt 3D
%         InParams.Label='vicon';
%         InParams.Mvt=1; %mvt 3D
%         InParams.PicAuto=Detect3D.PicAuto;
%         InParams.SeuilMode=Detect3D.SeuilMode;
%         InParams.SeuilAbs=Detect3D.GblSeuilAbs;
%         InParams.SeuilRel=Detect3D.GblSeuilRel;
%         InParams.TempsForce=Detect3D.GblTempsForce;
%     end
    if strfind(CurrentFielName,'Pince') %pince
        InParams.Label='vicon';
        InParams.Mvt=2; %pince
        InParams.PicAuto=DetectPince3D.PicAuto;
        InParams.SeuilMode=DetectPince3D.SeuilMode;
        InParams.SeuilAbs=DetectPince3D.GblSeuilAbs;
        InParams.SeuilRel=DetectPince3D.GblSeuilRel;
        InParams.TempsForce=DetectPince3D.GblTempsForce;
    else
        InParams.Label='vicon';
        InParams.Mvt=1; %mvt 3D
        InParams.PicAuto=Detect3D.PicAuto;
        InParams.SeuilMode=Detect3D.SeuilMode;
        InParams.SeuilAbs=Detect3D.GblSeuilAbs;
        InParams.SeuilRel=Detect3D.GblSeuilRel;
        InParams.TempsForce=Detect3D.GblTempsForce;
    end    
end
if isempty(strfind(LabelBtn,'bird'))~=1
    %test si mvt 3D ou pince
    InParams.Label='bird';
    InParams.PicAuto=Detect3D.PicAuto;
    InParams.SeuilMode=Detect3D.SeuilMode;
    InParams.SeuilAbs=Detect3D.GblSeuilAbs;
    InParams.SeuilRel=Detect3D.GblSeuilRel;
    InParams.TempsForce=Detect3D.GblTempsForce;
end
if isempty(strfind(LabelBtn,'spike'))~=1 return; end
if isempty(strfind(LabelBtn,'stim'))~=1 return; end

%------ appel dlgbox mode detection mvt------------
if isempty(InParams)
    warndlg('Il faut selectionner une courbe', 'Param�tres de calcul des curseurs', 'modal');
    return
else
    OutStruct=OptDetectMvt(InParams);
end
%--------------------------------------------------

if OutStruct.Rep==0 return; end %si cancel
%si OK
if isempty(strfind(LabelBtn,'coil'))~=1
    %OutStruct.Seuil='coil';
    DetectOeil.PicAuto=OutStruct.PicAuto;
    DetectOeil.SeuilMode=OutStruct.SeuilMode;
    DetectOeil.GblSeuilAbs=OutStruct.SeuilAbs;
    DetectOeil.GblSeuilRel=OutStruct.SeuilRel;
end
if isempty(strfind(LabelBtn,'eog'))~=1
    %OutStruct.Seuil='eog';
    DetectOeil.PicAuto=OutStruct.PicAuto;
    DetectOeil.SeuilMode=OutStruct.SeuilMode;
    DetectOeil.GblSeuilAbs=OutStruct.SeuilAbs;
    DetectOeil.GblSeuilRel=OutStruct.SeuilRel;
end
if isempty(strfind(LabelBtn,'eyelink'))~=1
    %OutStruct.Seuil='eog';
    DetectOeil.PicAuto=OutStruct.PicAuto;
    DetectOeil.SeuilMode=OutStruct.SeuilMode;
    DetectOeil.GblSeuilAbs=OutStruct.SeuilAbs;
    DetectOeil.GblSeuilRel=OutStruct.SeuilRel;
end
if isempty(strfind(LabelBtn,'eyetracker'))~=1
    %OutStruct.Seuil='eyetracker';
    DetectOeil.PicAuto=OutStruct.PicAuto;
    DetectOeil.SeuilMode=OutStruct.SeuilMode;
    DetectOeil.GblSeuilAbs=OutStruct.SeuilAbs;
    DetectOeil.GblSeuilRel=OutStruct.SeuilRel;
end
if isempty(strfind(LabelBtn,'gen_analog'))~=1
    %OutStruct.Seuil='gen_analog';
    DetectOeil.PicAuto=OutStruct.PicAuto;
    DetectOeil.SeuilMode=OutStruct.SeuilMode;
    DetectOeil.GblSeuilAbs=OutStruct.SeuilAbs;
    DetectOeil.GblSeuilRel=OutStruct.SeuilRel;
end
if isempty(strfind(LabelBtn,'opto'))~=1
%     if strcmpi('rawdata',CurrentFielName) %mvt 3D
%         Detect3D.PicAuto=OutStruct.PicAuto;
%         Detect3D.SeuilMode=OutStruct.SeuilMode;
%         Detect3D.GblSeuilAbs=OutStruct.SeuilAbs;
%         Detect3D.GblSeuilRel=OutStruct.SeuilRel;
%         Detect3D.GblTempsForce=OutStruct.TempsForce;
%     end
    if strfind(CurrentFielName,'Pince') %pince
        DetectPince3D.PicAuto=OutStruct.PicAuto;
        DetectPince3D.SeuilMode=OutStruct.SeuilMode;
        DetectPince3D.GblSeuilAbs=OutStruct.SeuilAbs;
        DetectPince3D.GblSeuilRel=OutStruct.SeuilRel;
        DetectPince3D.GblTempsForce=OutStruct.TempsForce;
    else
        Detect3D.PicAuto=OutStruct.PicAuto;
        Detect3D.SeuilMode=OutStruct.SeuilMode;
        Detect3D.GblSeuilAbs=OutStruct.SeuilAbs;
        Detect3D.GblSeuilRel=OutStruct.SeuilRel;
        Detect3D.GblTempsForce=OutStruct.TempsForce;
    end
end
if isempty(strfind(LabelBtn,'vicon'))~=1
%     if strcmpi('rawdata',CurrentFielName) %mvt 3D
%         Detect3D.PicAuto=OutStruct.PicAuto;
%         Detect3D.SeuilMode=OutStruct.SeuilMode;
%         Detect3D.GblSeuilAbs=OutStruct.SeuilAbs;
%         Detect3D.GblSeuilRel=OutStruct.SeuilRel;
%         Detect3D.GblTempsForce=OutStruct.TempsForce;
%     end
    if strfind(CurrentFielName,'Pince') %pince
        DetectPince3D.PicAuto=OutStruct.PicAuto;
        DetectPince3D.SeuilMode=OutStruct.SeuilMode;
        DetectPince3D.GblSeuilAbs=OutStruct.SeuilAbs;
        DetectPince3D.GblSeuilRel=OutStruct.SeuilRel;
        DetectPince3D.GblTempsForce=OutStruct.TempsForce;
    else
        Detect3D.PicAuto=OutStruct.PicAuto;
        Detect3D.SeuilMode=OutStruct.SeuilMode;
        Detect3D.GblSeuilAbs=OutStruct.SeuilAbs;
        Detect3D.GblSeuilRel=OutStruct.SeuilRel;
        Detect3D.GblTempsForce=OutStruct.TempsForce;
    end
end
if isempty(strfind(LabelBtn,'bird'))~=1
    %OutStruct.Seuil='bird';
    Detect3D.PicAuto=OutStruct.PicAuto;
    Detect3D.SeuilMode=OutStruct.SeuilMode;
    Detect3D.GblSeuilAbs=OutStruct.SeuilAbs;
    Detect3D.GblSeuilRel=OutStruct.SeuilRel;
    Detect3D.GblTempsForce=OutStruct.TempsForce;
end


% --- Executes on button press in btnVoieUp.
function btnVoieUp_Callback(hObject, eventdata, handles)
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);Rec_nb=Rec_nb(2);
if Rec_nb>1 | isempty(Rec_list)==1 return; end
if Rec_selected==1 return; end
ReOrdonneChProp(handles, 'up', Rec_selected, ChannelsProperties.ListeSize);


% --- Executes on button press in btnVoieUp.
function btnVoieDown_Callback(hObject, eventdata, handles)
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);Rec_nb=Rec_nb(2);
if Rec_nb>1 | isempty(Rec_list)==1 return; end
if Rec_selected==ChannelsProperties.ListeSize return; end
ReOrdonneChProp(handles, 'down', Rec_selected, ChannelsProperties.ListeSize);



function ReOrdonneChProp(handles, Sens, Rec_selected, ListSize)
global ChannelsProperties;
if strcmp(Sens,'up')==1
    %-------------------------------------
    ChProp.DataFieldAccessList=ChannelsProperties.DataFieldAccessList{Rec_selected-1};
    ChProp.ChannelList=ChannelsProperties.ChannelList{Rec_selected-1};
    ChProp.ChannelInfos=ChannelsProperties.ChannelInfos(Rec_selected-1);
    ChProp.RelatedFields=ChannelsProperties.RelatedFields{Rec_selected-1};
    %------------------------------------
    ChannelsProperties.DataFieldAccessList{Rec_selected-1}=ChannelsProperties.DataFieldAccessList{Rec_selected};
    ChannelsProperties.ChannelList{Rec_selected-1}=ChannelsProperties.ChannelList{Rec_selected};
    ChannelsProperties.ChannelInfos(Rec_selected-1)=ChannelsProperties.ChannelInfos(Rec_selected);
    ChannelsProperties.RelatedFields{Rec_selected-1}=ChannelsProperties.RelatedFields{Rec_selected};
    %-------------------------------------
    ChannelsProperties.DataFieldAccessList{Rec_selected}=ChProp.DataFieldAccessList;
    ChannelsProperties.ChannelList{Rec_selected}=ChProp.ChannelList;
    ChannelsProperties.ChannelInfos(Rec_selected)=ChProp.ChannelInfos;
    ChannelsProperties.RelatedFields{Rec_selected}=ChProp.RelatedFields;
    %-------------------------------------
    load_Reclistbox(ChannelsProperties.ChannelList, handles, Rec_selected-1);
end
if strcmp(Sens,'down')==1
    %------------------------------------
    ChProp.DataFieldAccessList=ChannelsProperties.DataFieldAccessList{Rec_selected+1};
    ChProp.ChannelList=ChannelsProperties.ChannelList{Rec_selected+1};
    ChProp.ChannelInfos=ChannelsProperties.ChannelInfos(Rec_selected+1);
    ChProp.RelatedFields=ChannelsProperties.RelatedFields{Rec_selected+1};
    %------------------------------------
    ChannelsProperties.DataFieldAccessList{Rec_selected+1}=ChannelsProperties.DataFieldAccessList{Rec_selected};
    ChannelsProperties.ChannelList{Rec_selected+1}=ChannelsProperties.ChannelList{Rec_selected};
    ChannelsProperties.ChannelInfos(Rec_selected+1)=ChannelsProperties.ChannelInfos(Rec_selected);
    ChannelsProperties.RelatedFields{Rec_selected+1}=ChannelsProperties.RelatedFields{Rec_selected};
    %------------------------------------    
    ChannelsProperties.DataFieldAccessList{Rec_selected}=ChProp.DataFieldAccessList;
    ChannelsProperties.ChannelList{Rec_selected}=ChProp.ChannelList;
    ChannelsProperties.ChannelInfos(Rec_selected)=ChProp.ChannelInfos;
    ChannelsProperties.RelatedFields{Rec_selected}=ChProp.RelatedFields;
    %------------------------------------
    load_Reclistbox(ChannelsProperties.ChannelList, handles, Rec_selected+1);
end


%**********************************************************************
function txtCurrentScale_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


%**********************************************************************
function txtCurrentScale_Callback(hObject, eventdata, handles)
global ChannelsProperties;

Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
Last_Rec=Rec_selected(Rec_nb(2));
YNorm=get(handles.chkYnorm,'Value');
Limstr=(get(handles.txtCurrentScale,'string'));
Lim=str2num(Limstr);
S=size(Lim);
if isempty(Lim)==1
    if YNorm==1
        Lim=[-1.5 1.5];
    else
        Lim=eval(ChannelsProperties.ChannelInfos(Last_Rec).ChannelVlim);
    end
    set(handles.txtCurrentScale, 'string', [num2str(Lim(1)),'  ', num2str(Lim(2))]);
    return;
end 
if S(2)~= 2 
    if YNorm==1
        Lim=[-1.5 1.5];
    else
        Lim=eval(ChannelsProperties.ChannelInfos(Last_Rec).ChannelVlim);
    end
    set(handles.txtCurrentScale, 'string', [num2str(Lim(1)),'  ', num2str(Lim(2))]);
    return;
end    % Lim=[-100 100];
ChannelsProperties.ChannelInfos(Last_Rec).ChannelVlim=['[',Limstr ,']'];
set(handles.figData,'Ylim',Lim);


% function AxeMouseDown(hObject, Event, Cursor, Curve, handles )
% a=1;


%---------------------- fonction keypressed-------------------
function KeyboardPress(hObject, Event, Cursor, Curve, handles )
global VisibleCursor;
if (Event.Character=='+') VisibleCursor=VisibleCursor+3; end
if (Event.Character=='-') VisibleCursor=VisibleCursor-3; end
if VisibleCursor<=0 VisibleCursor=1; end
[Cv, Cr]=AfficheCourbes(handles);
%-------------------------------------------------------------


% --------------------------------------------------------------------
function mnuVisu3D_Callback(hObject, eventdata, handles)
Visu2D;



%********************************************************
function DisableAll(handles) 
if ishandle(handles.radReadMouse) set(handles.radReadMouse,'Enable','Off'); end
if ishandle(handles.radSuppMvt) set(handles.radSuppMvt,'Enable','Off'); end
if ishandle(handles.radAjoutMvt) set(handles.radAjoutMvt,'Enable','Off'); end
if ishandle(handles.radDeplMvt) set(handles.radDeplMvt,'Enable','Off'); end
if ishandle(handles.radCursModif) set(handles.radCursModif,'Enable','Off'); end
if ishandle(handles.radAjoutCur) set(handles.radAjoutCur,'Enable','Off'); end
if ishandle(handles.radSuppCur) set(handles.radSuppCur,'Enable','Off'); end
if ishandle(handles.radRenCur) set(handles.radRenCur,'Enable','Off'); end
if ishandle(handles.radRenVoie) set(handles.radRenVoie,'Enable','Off'); end
if ishandle(handles.radRenEssai) set(handles.radRenEssai,'Enable','Off'); end
if ishandle(handles.radRenComp) set(handles.radRenComp,'Enable','Off'); end
if ishandle(handles.mnuVisu3D) set(handles.mnuVisu3D,'Enable','Off'); end
if ishandle(handles.chkZoom) set(handles.chkZoom,'Enable','Off'); end

    
%*****************************************************
function EnableAll(handles)
    if ishandle(handles.radReadMouse) set(handles.radReadMouse,'Enable','On'); end
    if ishandle(handles.radSuppMvt) set(handles.radSuppMvt,'Enable','On'); end
    if ishandle(handles.radAjoutMvt) set(handles.radAjoutMvt,'Enable','On'); end
    if ishandle(handles.radDeplMvt) set(handles.radDeplMvt,'Enable','On'); end
    if ishandle(handles.radCursModif) set(handles.radCursModif,'Enable','On'); end
    if ishandle(handles.radAjoutCur) set(handles.radAjoutCur,'Enable','On'); end
    if ishandle(handles.radSuppCur) set(handles.radSuppCur,'Enable','On'); end
    if ishandle(handles.radCursModif) set(handles.radCursModif,'Enable','On'); end
    if ishandle(handles.radRenCur) set(handles.radRenCur,'Enable','On'); end    
    if ishandle(handles.radRenVoie)  set(handles.radRenVoie,'Enable','On'); end %set(handles.radRenVoie,'Value',0);
    if ishandle(handles.radRenEssai)  set(handles.radRenEssai,'Enable','On'); end %set(handles.radRenEssai,'Value',0);
    if ishandle(handles.radRenComp)  set(handles.radRenComp,'Enable','On'); end
    
%     set(handles.mnuVisu3D,'Enable','On');
    set(handles.chkZoom,'Enable','On');





%********************************************************
function mnuCancelMode_Callback(hObject, eventdata, handles)
global trial;

EnableAll(handles);
if ishandle(handles.mnuTraitements) set(handles.mnuTraitements,'enable', 'on'); end
if ishandle(handles.lstFile) set(handles.lstFile, 'enable', 'on'); end
if ishandle(handles.lstRecType) set(handles.lstRecType, 'enable', 'on'); end
if ishandle(handles.txtCurrentScale) set(handles.txtCurrentScale,'enable', 'on'); end
if ishandle(handles.txtYnormRange) set(handles.txtYnormRange,'enable', 'on'); end
if ishandle(handles.chkCursors) set(handles.chkCursors,'enable', 'on'); end
if ishandle(handles.chkPoints) set(handles.chkPoints,'enable', 'on'); end
if ishandle(handles.chkYnorm) set(handles.chkYnorm,'enable', 'on'); end
if ishandle(handles.mnuMode) set(handles.mnuMode,'enable', 'on'); end
if ishandle(handles.chkXselect) set(handles.chkXselect,'enable','on'); end
if ishandle(handles.chkYselect) set(handles.chkYselect,'enable','on'); end
if ishandle(handles.chkZselect) set(handles.chkZselect,'enable','on'); end
if ishandle(handles.chkTselect) set(handles.chkTselect,'enable','on'); end
if ishandle(handles.mnuFile) set(handles.mnuFile,'enable','on'); end
if ishandle(handles.mnuEdit) set(handles.mnuEdit,'enable','on'); end
if ishandle(handles.mnuInter) set(handles.mnuInter,'enable','on'); end

UD=get(gca, 'UserData');

% %--------RAZ mode ZOOM------
% set(handles.chkZoom,'Value', 0);
% chkZoom_Callback(hObject, eventdata, handles);
% %--------RAZ mode PAN------
% set(handles.chkPan,'Value', 0);
% chkPan_Callback(hObject, eventdata, handles);


%*******************************************
%        mode DECOUPAGE en essais          
%*******************************************
%----- effacement des marqueurs affich�s-----
if strcmpi(UD.Func, 'Couper')
    %---- autorise un seul essai s�lectionn� ---------
    set(handles.lstFile, 'max', 10);
    set(handles.lstFile, 'min', 1);
    %-------------------------------------------------
    TrialDescFlag=isfield(trial, 'TrialCutDesc');
    DataPresentes=0;
    if TrialDescFlag
        for ch=1:trial.NbEssais
            if ~isempty(trial.TrialCutDesc{1,ch}.handles)
                Rep=ishandle(trial.TrialCutDesc{1,ch}.handles);
                if ~isempty(find(Rep==1, 1))
                    delete(trial.TrialCutDesc{1,ch}.handles);
                    trial.TrialCutDesc{1,ch}.handles=[];                    
                end
                DataPresentes=1;
            end
        end
    end
    if DataPresentes
        Res=questdlg('Voulez vous cr�er le nouveau fichier ', 'D�coupage en essais','Yes','No','Yes');
        if strcmpi(Res, 'yes')
            %les data sont cherchees au niveau du repertoire work\analyse
            Exepath=pwd;
            %cd ..;
            CurPath=pwd;
            %fin modif
            Dirpath=[CurPath,PathSep,'users',PathSep];
            %cd (Dirpath); 
            [filename, pathname] = uiputfile('*.mat', 'Save cut file');
            DataFilename=filename;
            if isequal(filename,0)|isequal(pathname,0)
                cd (Exepath); %on restitu le pwd
            else
                AbsFilename=[pathname, filename];
                SaveCutFile(handles, AbsFilename, trial);
                trial=rmfield(trial, 'TrialCutDesc');
            end
        end
        
    end
    %effacement de la listbox
%     if ~isempty(UD.ListHandle)
%         delete(UD.ListHandle);
%     end
end
%******** Fin decoupage en essais **********

%---- effacement menu quit --------
set(handles.mnuCancelMode, 'Label', '');
set(handles.mnuCancelMode, 'Visible', 'Off');
set(handles.mnuCancelMode, 'Enable', 'Off');

%-------- supprime tte fonction en cours ------
set(handles.lblFonction,'String','');
UD.Func='';
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Par1='';
UD.Par2='';
UD.Par3=1;
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', '');


%----------------- cr�ation d'un nouveau fichier contenant les nouveaux essais --------
function SaveCutFile(handles, Filename, trial)

NewTrial=trial;
NewNbEssais=0;
for j=1:trial.NbEssais
    if ~isempty(trial.TrialCutDesc{1,j}.bornes)
        NewNbEssais=size(trial.TrialCutDesc{1,j}.bornes,1) + NewNbEssais; %nb de lignes=nb de coordonn�es XY
    else
        NewNbEssais=NewNbEssais+1;
    end
end

NewNbEssais=0;
NewNumEssai=0;
for j=1:trial.NbEssais
    if ~isempty(trial.TrialCutDesc{1,j}.bornes)
        NbEssaisLoc=size(trial.TrialCutDesc{1,j}.bornes,1); %nb de lignes=nb de coordonn�es XY
    else
        NbEssaisLoc=1;
%         trial.TrialCutDesc{1,j}.bornes(1,1)=1;
%         trial.TrialCutDesc{1,j}.bornes(1,2)=trial.eyetracker.NbOfSamples(j);
    end
    trial.TrialCutDesc{1,j}.NbEssaisLoc=NbEssaisLoc;
    %----- Modif header --------
    for k=1:NbEssaisLoc
        NewNumEssai=NewNumEssai+1;
        str=[num2str(NewNumEssai) '-' deblank(trial.FileName(j,1:20)) '-' num2str(k)];
        NewTrial.FileName(NewNumEssai,1:20)=sprintf('%-20s',str);
        NewTrial.JMA(NewNumEssai,1:20)=trial.JMA(1,:);
        NewTrial.Heure(NewNumEssai,1:20)=trial.Heure(1,:);
        NewTrial.OrgTrialNb(NewNumEssai)=NewNumEssai;
        NewTrial.TrueTrialNb(NewNumEssai)=NewNumEssai;
        NewTrial.Code(NewNumEssai)=0;
    end
    NewNbEssais=NewNbEssais+NbEssaisLoc;
end
NewTrial=rmfield(NewTrial, 'TrialCutDesc');
NewTrial.NbEssais=NewNbEssais;
%----------------------------------------

%-------------Modifs records ------
for i=1:trial.NbOfRecords
    S=deblank(trial.InfoRecordType(i,:));
    if strcmpi(S,'stim')
        FreqRatio=1;
        for k=1:trial.stim.NbOfStmCh
            EssaiCourant=0;
            for l=1:trial.NbEssais
                    for m=1:trial.TrialCutDesc{1,l}.NbEssaisLoc
                        EssaiCourant=EssaiCourant+1; 
                        if isempty(trial.TrialCutDesc{1,l}.bornes)
                            bornes=[1,trial.stim.NbOfSamples(l)];
                        else
                            bornes=trial.TrialCutDesc{1,l}.bornes(m,:);
                        end
                        NewTrial.stim.NbOfSamples(1,EssaiCourant)=bornes(1,2)-bornes(1,1)+1;
                        cmd=['LastIndex=size(trial.stim.RawData',num2str(k), '{1,l},1);']; eval(cmd);
                        if bornes(1,2)>LastIndex
                            bornes(1,2)=LastIndex;
                        end
                        cmd=['trial.stim.RawData',num2str(k), '{1,l}(bornes(1,1):bornes(1,2));'];
                        EssaiCoupe=eval(cmd);
                        cmd=['NewTrial.stim.RawData',num2str(k),'{1,EssaiCourant}=EssaiCoupe;'];
                        eval(cmd);
                        NewTrial.stim.Image{1,EssaiCourant}=trial.stim.Image{1,l};
                        NewTrial.stim.NbOfStmCh(EssaiCourant)=trial.stim.NbOfStmCh(l);
                        NewTrial.stim.PreSeqType(EssaiCourant,:)=trial.stim.PreSeqType(l,:);
                        NewTrial.stim.PreSeqNbOfPar(EssaiCourant)=trial.stim.PreSeqNbOfPar(l);
                        NewTrial.stim.PreSeqParam(EssaiCourant)=trial.stim.PreSeqParam(l);
                        NewTrial.stim.SeqType(EssaiCourant,:)=trial.stim.SeqType(l,:);
                        NewTrial.stim.SeqNbOfPar(EssaiCourant)=trial.stim.SeqNbOfPar(l);
                        NewTrial.stim.SeqParam(EssaiCourant)=trial.stim.SeqParam(l);
                        NewTrial.stim.PstSeqType(EssaiCourant,:)=trial.stim.PstSeqType(l,:);
                        NewTrial.stim.PstSeqNbOfPar(EssaiCourant)=trial.stim.PstSeqNbOfPar(l);
                        NewTrial.stim.PstSeqParam(EssaiCourant)=trial.stim.PstSeqParam(l);
                        NewTrial.stim.InfoStimName(EssaiCourant,k,: )=trial.stim.InfoStimName(l,k,:);
                        NewTrial.stim.InfoSignalType(EssaiCourant,1,: )=trial.stim.InfoSignalType(l,1,:);
                        NewTrial.stim.InfoUnits(EssaiCourant,1,: )=trial.stim.InfoUnits(l,1,:);
                    end
            end   
        end        
    end
    if strcmpi(S,'eyetracker')
        FreqRatio=trial.MainFrequency/trial.eyetracker.Frequency;
        for k=1:trial.eyetracker.NbOfChannels
            EssaiCourant=0;
            for l=1:trial.NbEssais
                    for m=1:trial.TrialCutDesc{1,l}.NbEssaisLoc
                        EssaiCourant=EssaiCourant+1;
                        if isempty(trial.TrialCutDesc{1,l}.bornes)
                            bornes=[1,trial.eyetracker.NbOfSamples(l)];
                        else
                            bornes=trial.TrialCutDesc{1,l}.bornes(m,:);
                        end
                        NewTrial.eyetracker.NbOfSamples(1,EssaiCourant)=bornes(1,2)-bornes(1,1)+1;
                        cmd=['LastIndex=size(trial.eyetracker.RawData',num2str(k), '{1,l},1);']; eval(cmd);
                        if bornes(1,2)>LastIndex
                            bornes(1,2)=LastIndex;
                        end
                        cmd=['trial.eyetracker.RawData',num2str(k), '{1,l}(bornes(1,1):bornes(1,2),:);'];
                        EssaiCoupe=eval(cmd);
                        cmd=['NewTrial.eyetracker.RawData',num2str(k),'{1,EssaiCourant}=EssaiCoupe;'];
                        eval(cmd);
                    end
            end   
        end
    end
end
trial=rmfield(trial, 'TrialCutDesc');
trial=NewTrial;
save (Filename,'trial');
return

%---------------- Activ� par la pose de bornes temporelles -----------
%---- Dans les fonctions interpolation, mode moyenne, mode difference, d�coupage d'essais-------
function MouseDown(hObject, Event, handles )
global ChannelsProperties;
global trial;
global MatfilePath;
global DataFilename;

COUPER_OK=0;
MOY_OK=0;
INTERP_OK=0;
DIFF_OK=0;
PT_OK=0;

    
%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
S=size(Rec_selected); S=S(2);
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Une seule courbe � la fois', '');
    return;
end
NumEssai=trial.OrgTrialNb(list_entries);
ChNb=ChannelsProperties.ChannelInfos(Rec_selected(1)).ChannelNb;
UD=get(gca, 'UserData');
if strcmp(UD.Func,'Moy')==1 MOY_OK=1; end
if strcmp(UD.Func,'Diff')==1 DIFF_OK=1; end
if strcmp(UD.Func,'Interp')==1 INTERP_OK=1; end
if strcmp(UD.Func,'Couper')==1 COUPER_OK=1; end
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
NbOfPlot=ChannelsProperties.ChannelInfos(Rec_selected(1)).NbOfPlotByCh;
FreqRatio=ChannelsProperties.ChannelInfos(Rec_selected(1)).FreqRatio;
% if strfind(ParentField,'opto')==1
%     if strfind(AccessField,'RawData')==1
%     end
% else
%     warndlg('Ce n''est pas un essai optotrak', '');
%     return;    
% end
Bornes=UD.Bornes;
if isempty(Bornes.h)==1
    PtNb=1;
else
    PtNb=2;
end
CmdSrc0=['trial.',ParentField, '.', AccessField, num2str(ChNb),'{', num2str(IndListSelect),'}'];
XYZLocal=eval([CmdSrc0, ';']);
LongueurData=size(XYZLocal);LongueurData=LongueurData(1);
TailleAffich=get(gca,'XLim'); TailleAffich=TailleAffich(2);
ValMouse.x=get(gca, 'CurrentPoint');
XmousCe=ValMouse.x(1,1);
%tests si bornes ds la fenetre
Xmouse=round(Xmouse/FreqRatio)*FreqRatio;
if Xmouse<=0 Xmouse=0; end %modif 1/8/2012 Xmouse=1
if round(Xmouse/FreqRatio)>LongueurData Xmouse=LongueurData*FreqRatio; end
IndexNewX=round(Xmouse/FreqRatio)+1; %  IndexNewX doit etre un multiple de FreqRatio
if IndexNewX<=0 IndexNewX=1; end
if IndexNewX>LongueurData IndexNewX=LongueurData;    end
    
UD.Bornes.X(PtNb)=IndexNewX; %Xmouse;
set(gca, 'UserData',UD);
CurX=[Xmouse,Xmouse];
CurY=[30000,-30000];
UD.Bornes.h(PtNb)=plot(CurX,CurY, 'color','y','xor','LineWidth',1, 'LineStyle','--');
%UD.Bornes.h(PtNb)=plot(CurX,CurY, 'color','y', 'EraseMode','xor','LineWidth',1, 'LineStyle','--');
if PtNb==1
    HHoff=findobj('enable', 'off');UD.HHoff=HHoff;
    HHon=findobj('enable', 'on'); UD.HHon=HHon;
    set(HHon,'enable', 'off');
    set(handles.chkPan, 'enable','On');
    %set(handles.mnuCancelMode,'enable','on');
    if INTERP_OK==1 FuncStr='Interpolation - Selectionner 2eme borne'; end
    if MOY_OK==1 FuncStr='Moyenne - Selectionner 2eme borne'; end
    if DIFF_OK==1 FuncStr='Difference - Selectionner 2eme borne'; end
    if COUPER_OK==1 FuncStr='Couper - Selectionner 2eme borne'; end
    set(handles.lblFonction,'string',FuncStr); 
    set(handles.lblFonction,'enable','on');
end
if PtNb==2 
    set(UD.HHoff,'enable', 'off');
    set(UD.HHon,'enable', 'on');
    %set(handles.mnuVisu3D,'enable','on');
        

    %---------------------- DECOUPAGE en essais ---------------------------
    if strcmp(UD.Func,'Couper')==1
        BorneInf=round(min(UD.Bornes.X))*FreqRatio-1; % en ms
        BorneSup=round(max(UD.Bornes.X))*FreqRatio-1; % en ms
%         TrialDescFlag=isfield(trial, 'TrialCutDesc');
        
        if BorneInf>0
%             MoyBornes=mean(XYZLocal(BorneInf:BorneSup,:));
            Str=[num2str(BorneInf), '   ',num2str(BorneSup)];
            Res=questdlg(Str,'Memorisation de la s�lection?','Yes','No','Yes');
            delete(UD.Bornes.h);
            if strcmp(Res,'Yes')==1 
                ch=IndListSelect;
                NewIndex=size(trial.TrialCutDesc{1,ch}.bornes,1)+1;
                trial.TrialCutDesc{1,ch}.bornes(NewIndex,:)=sort([BorneInf,BorneSup]);
                hDebut=plot(BorneInf,0,'Marker', '^','Color', 'g');
                hFin=plot(BorneSup,0,'Marker', '^','Color', 'y');
                trial.TrialCutDesc{1,ch}.handles(NewIndex,:)=[hDebut hFin];
                NomDesEssais=get(handles.lstFile,'String');
                NomEssai=NomDesEssais(ch,:);
                trial.TrialCutDesc{1,ch}.Nom(1,:)=NomEssai;
                %---- tri des essais par ordre chrono ----
                A=trial.TrialCutDesc{1,ch}.bornes;
                [B,ID]=sort(A);
                TRI=[];
                TRI(:,1)=B(:,1);
                TRI(:,2)=A(ID(:,1),2);
                trial.TrialCutDesc{1,ch}.bornes=TRI;
                %-----------------------------------------
%                 strTrialCutDesc=num2str(trial.TrialCutDesc{1,ch}.bornes);
%                 hList=guihandles(UD.ListHandle);
%                 set(hList.lstFileCutDesc,'String',strTrialCutDesc,'Value',1);                
%                 deffile=[MatfilePath, PathSep, DataFilename, '_CutDescr_', num2str(NumEssai), '.mes'];
%                 fid=fopen(deffile, 'a+');
%                 Par=1;
%                 NumEssai=1;
%                 fprintf(fid, '%d\t%d\t',NumEssai,Par);
%                 fprintf(fid, '%d\t%d\n',BorneInf,BorneSup);
%                 fclose(fid);
            else
            end
        else
            delete(UD.Bornes.h);
        end
    end

    %MOYENNE
    if strcmp(UD.Func,'Moy')==1
        BorneInf=round(min(UD.Bornes.X));
        BorneSup=round(max(UD.Bornes.X));
        if BorneInf>0
            MoyBornes=mean(XYZLocal(BorneInf:BorneSup,:));
            MoyStr=['Essai: ',num2str(NumEssai),'    ',num2str(MoyBornes)];
            Res=questdlg(MoyStr,'Memorisation de la moyenne?','Yes','No','Yes');
            delete(UD.Bornes.h);
            if strcmp(Res,'Yes')==1 
                deffile=[MatfilePath, PathSep,'default.mes'];
                fid=fopen(deffile, 'a+');
                S=size(MoyBornes);S=S(2);
                Par=trial.stim.SeqParam{NumEssai}(1);
                fprintf(fid, '%d\t%d\t',NumEssai,Par);
                for i=1:S
                    fprintf(fid, '%4.3f\t',MoyBornes(i) );
                end
                fprintf(fid, '\t%s\n','moy');
                fclose(fid);
            else
            end
        else
            delete(UD.Bornes.h);
        end
    end
    
    %DIFFERENCE
    if strcmp(UD.Func,'Diff')==1
        BorneInf=round(min(UD.Bornes.X));
        BorneSup=round(max(UD.Bornes.X));
        if BorneInf>0
            DiffBornes=XYZLocal(BorneSup,:)-XYZLocal(BorneInf,:);
            DiffStr=['Essai: ',num2str(NumEssai),'    ',num2str(DiffBornes)];
            Res=questdlg(DiffStr,'Memorisation de la difference?','Yes','No','Yes');
            delete(UD.Bornes.h);
            if strcmp(Res,'Yes')==1 
                deffile=[MatfilePath, PathSep, 'default.mes'];
                fid=fopen(deffile, 'a+');
                S=size(DiffBornes);S=S(2);
                Par=trial.stim.SeqParam{NumEssai}(1);
                fprintf(fid, '%d\t%d\t',NumEssai,Par);
                for i=1:S
                    fprintf(fid, '%4.2f\t',DiffBornes(i) );
                end
                fprintf(fid, '\t%s\n','diff');
                fclose(fid);
            else
            end
        else
            delete(UD.Bornes.h);
        end
    end
    
    %POINT
    if strcmp(UD.Func,'Pt')==1
        BorneInf=round(min(UD.Bornes.X));
        BorneSup=round(max(UD.Bornes.X));
        if BorneInf>0
            DiffBornes=XYZLocal(BorneSup,:)-XYZLocal(BorneInf,:);
            DiffStr=['Essai: ',num2str(NumEssai),'    ',num2str(DiffBornes)];
            Res=questdlg(DiffStr,'Memorisation du point?','Yes','No','Yes');
            delete(UD.Bornes.h);
            if strcmp(Res,'Yes')==1 
                deffile=[MatfilePath, PathSep,'default.mes'];
                fid=fopen(deffile, 'a+');
                S=size(DiffBornes);S=S(2);
                fprintf(fid, '%d\t%s\t',NumEssai, 'Pt');
                for i=1:S
                    fprintf(fid, '%4.2f\t',DiffBornes(i) );
                end
                fprintf(fid, '\n');
                fclose(fid);
            else
            end
        else
            delete(UD.Bornes.h);
        end
    end
    %----------------------------------------------------------------------
    %                           INTERPOLATION
    %----------------------------------------------------------------------
    if strcmp(UD.Func,'Interp')==1
        SeuilBadData=0; %str2num(UD.Par1);
        InterpMode=str2num(UD.Par2);        
        UD.Rep='Go';
        OutStruct=CalculBorne(handles, UD);%dialogbox
        
        if strcmp(OutStruct.String,'Go')==1
            UD.Rep='Yes';
            SeuilBadData=str2num(OutStruct.Seuil);UD.Par1=OutStruct.Seuil;
            InterpMode=OutStruct.Method;
            InterpMode=lower(InterpMode);
            switch InterpMode(1)
                case 's'
                    InterpMode='spline';
                    InterpIndex=2;
                case 'l'
                    InterpMode='linear';
                    InterpIndex=1;
                otherwise
                    InterpMode='linear';
                    InterpIndex=1;
            end
            UD.Par2=InterpMode;
            UD.Par3=InterpIndex;
            delete(UD.Bornes.h);
            BorneInf=round(min(UD.Bornes.X));
            BorneSup=round(max(UD.Bornes.X));
            for i=1:NbOfPlot %chq composante
                X=XYZLocal(:,i);
                Lg=size(X);
                t=[1:Lg(1)];
                %seuil peut avoir 2 valeurs possibles: 0 ou >0
                %---- au 9/2014 le seuil est forc� � z�ro ------
                if SeuilBadData~=0 %seuil <> 0
                    p=find (abs(X(BorneInf:BorneSup))>=SeuilBadData)+BorneInf-1;
                else %seuil=0
                    p=[BorneInf:BorneSup];
                end
                %end
                if isempty(p)~=1
                    FirstBad=p(1);
                    LastBad=p(end);
                    if SeuilBadData~=0 %interpolation
                        X(FirstBad:LastBad)=SeuilBadData;
                        p=find (abs(X(BorneInf:BorneSup))>=SeuilBadData)+BorneInf-1;
                        Tx=find (abs(X(BorneInf:BorneSup))<SeuilBadData);
                        Tx=[(1:BorneInf-1)'; Tx+BorneInf-1; (BorneSup+1:Lg(1))'];
                        X(p)=[];
                        Xi=interp1(Tx, X, t,InterpMode);                        
                        XYZInter(:,i) = Xi';
                    else
                        if FirstBad==1 %borne gauche au debut
                            X(FirstBad:LastBad)=X(LastBad+1);
                            XYZInter(:,i)=X;
                        end
                        if LastBad==Lg(1) %borne droite � la fin
                            X(FirstBad:LastBad)=X(FirstBad-1);
                            XYZInter(:,i)=X;
                        end   
                        if FirstBad~=1 & LastBad~=Lg(1)
                            X(FirstBad:LastBad)=SeuilBadData;
                            p=find (abs(X(BorneInf:BorneSup))>=SeuilBadData)+BorneInf-1;
                            Tx=find (abs(X(BorneInf:BorneSup))<SeuilBadData);
                            Tx=[(1:BorneInf-1)'; Tx+BorneInf-1; (BorneSup+1:Lg(1))'];
                            X(p)=[];
                            Xi=interp1(Tx, X, t,InterpMode);                        
                            XYZInter(:,i) = Xi';
                        end
                    end
                else
                    XYZInter=XYZLocal;
                end
            end
            CmdInterp=[CmdSrc0,'=XYZInter;'];
            eval(CmdInterp);
            [Cv, Cr]=AfficheCourbes(handles);
            Res=questdlg('Accept?',['Interpolation  ', InterpMode],'Yes','No','Yes');
            if strcmp(Res,'Yes')==1 
                %on accepte
                a=1;
            else
                CmdInterp=[CmdSrc0,'=XYZLocal;'];
                eval(CmdInterp);
                [Cv, Cr]=AfficheCourbes(handles);
                %on refuse
            end
        else
            delete(UD.Bornes.h);
        end
    end
            if INTERP_OK==1 FuncStr='Interpolation - Selectionner la 1ere borne'; end
            if MOY_OK==1 FuncStr='Moyenne - Selectionner 1ere borne'; end
            if DIFF_OK==1 FuncStr='Difference - Selectionner 1ere borne'; end
            if COUPER_OK==1 FuncStr='Couper - Selectionner 1ere borne'; end
            set(handles.lblFonction,'string',FuncStr);
    UD.Bornes.h=[];
    UD.Bornes.X=[];
end
set(gca, 'UserData',UD);


% --------------------------------------------------------------------
function mnuEdit_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
%----------- interpolation entre les bornes selectionnees avec la souris ----
function mnuInter_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global AlreadyAnalysed


UD=get(gca, 'UserData');
if ~isempty(UD.Func)
    return
end
%------ si le fichier est d�j� trait� ------
if AlreadyAnalysed
        warndlg('Ce fichier est d�j� trait�', 'Interpolation impossible');
        return;
end

%-------- on quitte les modes zoom et pan -----
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
set(handles.chkPan,'Value', 0);
chkPan_Callback(hObject, eventdata, handles);
set(handles.mnuCancelMode,'Visible', 'On');
set(handles.mnuCancelMode,'Label', 'Quit interpolation');
set(handles.mnuCancelMode,'Enable', 'On');

%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
CmdDst0=['trial.',ParentField];
CmdSrc0=['trial.',ParentField, '.', AccessField];
S=size(Rec_selected); S=S(2);
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Un seul essai � la fois', 'Interpolation');
    return;
end
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
set(handles.mnuInter,'Enable', 'Off');
%DisableAll(handles);
set(handles.lblFonction,'String','Interpolation - Selectionner 1ere borne');
UD=get(gca, 'UserData');
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Func='Interp';
UD.Par1='0';
UD.Par2='linear';
UD.Par3=1;
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', {@MouseDown, handles});

% --------------------------------------------------------------------
function mnuCouper_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global AlreadyAnalysed;

%---- si une fonction est activ�e on sort ----
UD=get(gca, 'UserData');
if ~isempty(UD.Func)
    return
end

%------ si le fichier est d�j� trait� ------
if AlreadyAnalysed
        warndlg('Ce fichier est d�j� trait�', 'D�coupage en essais impossible');
        return;
end

%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
CmdDst0=['trial.',ParentField];
CmdSrc0=['trial.',ParentField, '.', AccessField];
S=size(Rec_selected); S=S(2);
FreqRatio=ChannelsProperties.ChannelInfos(Rec_selected(1)).FreqRatio;
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Un seul essai � la fois', 'D�coupage en essais');
    return;
end
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);

%--------- disable list box -------
DisableAll(handles);
set(handles.chkZoom,'Enable','On');

%---- autorise un seul essai s�lectionn� ---------
set(handles.lstFile, 'max', 1);
set(handles.lstFile, 'min', 1);
set(handles.lstFile, 'enable', 'on');
%-------------------------------------------------

% set(handles.lstFile, 'enable', 'off');
set(handles.lstRecType, 'enable', 'off');
set(handles.mnuTraitements,'enable', 'off');

set(handles.txtCurrentScale,'enable', 'off');
% set(handles.txtYnormRange,'enable', 'off');

if ishandle(handles.mnuCancelMode) set(handles.mnuCancelMode,'enable', 'on'); end
if ishandle(handles.chkCursors) set(handles.chkCursors,'enable', 'off'); end
if ishandle(handles.chkPoints) set(handles.chkPoints,'enable', 'off'); end
if ishandle(handles.chkYnorm) set(handles.chkYnorm,'enable', 'off');end
if ishandle(handles.mnuMode) set(handles.mnuMode,'enable', 'off');end
if ishandle(handles.chkXselect) set(handles.chkXselect,'enable','off'); end
if ishandle(handles.chkYselect) set(handles.chkYselect,'enable','off'); end
if ishandle(handles.chkZselect) set(handles.chkZselect,'enable','off'); end
if ishandle(handles.chkTselect) set(handles.chkTselect,'enable','off'); end
if ishandle(handles.mnuFile) set(handles.mnuFile,'enable','off'); end
if ishandle(handles.mnuEdit) set(handles.mnuEdit,'enable','off'); end

%---------- lecture et affichage des marqueurs de coupure des essais ------
TrialDescFlag=isfield(trial, 'TrialCutDesc');
% TrialDescFlag=0;
if TrialDescFlag
    if ~isempty(trial.TrialCutDesc{1,IndListSelect}.bornes)
        handlesDeb=plot(trial.TrialCutDesc{1,IndListSelect}.bornes(:,1),0, 'Marker', '^', 'Color', 'g');
        handlesFin=plot(trial.TrialCutDesc{1,IndListSelect}.bornes(:,2),0, 'Marker', '^', 'Color', 'y');
        trial.TrialCutDesc{1,IndListSelect}.handles(:,1)=handlesDeb;
        trial.TrialCutDesc{1,IndListSelect}.handles(:,2)=handlesFin;
    end
else
    trial.TrialCutDesc=[];
    for i=1:trial.NbEssais
%         trial.TrialCutDesc{1,i}.nom(1
        trial.TrialCutDesc{1,i}.handles=[];
        trial.TrialCutDesc{1,i}.bornes=[];
    end
end
% hCurrentGca=gca;
% FileCutDescHandle=FileCutDesc(handles);
% 
% strTrialCutDesc=num2str(trial.TrialCutDesc{1,IndListSelect}.bornes);
% hList=guihandles(FileCutDescHandle);
% set(hList.lstFileCutDesc,'String',strTrialCutDesc,'Value',1);
% 
% axes(hCurrentGca);


set(handles.lblFonction,'String','Couper - Selectionner 1ere borne');
UD=get(gca, 'UserData');
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Func='Couper';
UD.Par1='0';
UD.Par2='linear';
UD.Par3=1;
% UD.ListHandle=FileCutDescHandle;
set(handles.mnuCouper, 'Enable', 'Off');
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', {@MouseDown, handles});

% --------------------------------------------------------------------
function mnuMesures_Callback(hObject, eventdata, handles)
% hObject    handle to mnuMesures (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuCxt_Callback(hObject, eventdata, handles)
% hObject    handle to mnuCxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=1;


% --------------------------------------------------------------------
function mnuOnePt_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global MatfilePath;
%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
CmdDst0=['trial.',ParentField];
CmdSrc0=['trial.',ParentField, '.', AccessField];
S=size(Rec_selected); S=S(2);
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Un seul essai � la fois', 'Point');
    return;
end
% %est ce une voie optotrak?
% if strfind(ParentField,'opto')==1
%     if strfind(AccessField,'RawData')==1
%     end
% else
%     warndlg('Ce n''est pas du rawdata', 'Moyenne');
%     return;    
% end
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
%DisableAll(handles);
set(handles.lblFonction,'String','MODE POINT');
UD=get(gca, 'UserData');
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Func='Pt';
UD.Par1='';
UD.Par2='';
UD.Par3=1;
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', {@MouseDown, handles});


% --------------------------------------------------------------------
function mnuMoyenne_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global MatfilePath;
%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
CmdDst0=['trial.',ParentField];
CmdSrc0=['trial.',ParentField, '.', AccessField];
S=size(Rec_selected); S=S(2);
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Un seul essai � la fois', 'Moyenne');
    return;
end
% %est ce une voie optotrak?
% if strfind(ParentField,'opto')==1
%     if strfind(AccessField,'RawData')==1
%     end
% else
%     warndlg('Ce n''est pas du rawdata', 'Moyenne');
%     return;    
% end
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
%DisableAll(handles);
set(handles.lblFonction,'String','Moyenne - Selectionner 1ere borne');
UD=get(gca, 'UserData');
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Func='Moy';
UD.Par1='';
UD.Par2='';
UD.Par3=1;
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', {@MouseDown, handles});


% --------------------------------------------------------------------
function mnuMode_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnuMesureSave_Callback(hObject, eventdata, handles)
global MatfilePath;

ExePath=pwd;
cd (MatfilePath);
[filename, pathname] = uiputfile({'*.mes'},'Save as');
if filename~=0
    Cmd=['copy default.mes ', filename ];
    rep=dos(Cmd);
else
    rep=0;
end
if rep~=0
       msgbox('les data ne sont pas enregistrees!','','error')
end
cd (ExePath);
a=1;

% --------------------------------------------------------------------
function mnuMesureReset_Callback(hObject, eventdata, handles)
global MatfilePath;

ExePath=pwd;
cd (MatfilePath);
%----- effecement du mesures.def -----
deffile=[MatfilePath, PathSep, 'default.mes'];
fid=fopen(deffile, 'w');
fclose(fid);
cd (ExePath);



% --------------------------------------------------------------------
function mnuDiff_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global trial;
global MatfilePath;
%***************** infos  sur le channel choisi **************
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
ParentField=ChannelsProperties.ChannelInfos(Rec_selected(1)).ParentField;
AccessField=ChannelsProperties.DataFieldAccessList{Rec_selected(1)}(1,:);
CmdDst0=['trial.',ParentField];
CmdSrc0=['trial.',ParentField, '.', AccessField];
S=size(Rec_selected); S=S(2);
%***************** infos  sur l'essai choisi **************
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
if (list_size(2)>1) | (S>1)
    warndlg('Un seul essai � la fois', 'Difference');
    return;
end
set(handles.chkZoom,'Value', 0);
chkZoom_Callback(hObject, eventdata, handles);
%DisableAll(handles);
set(handles.lblFonction,'String','Difference - Selectionner 1ere borne');
UD=get(gca, 'UserData');
UD.Bornes.h=[];
UD.Bornes.X=[];
UD.Func='Diff';
UD.Par1='';
UD.Par2='';
UD.Par3=1;
set(gca, 'UserData',UD);
set(gca, 'ButtonDownFcn', {@MouseDown, handles});


% --------------------------------------------------------------------
function mnuConvert_Callback(hObject, eventdata, handles)
global trial

CurrentTrial=trial; %on sauve le trial courant
HiViewHedFlag=0;
ZebrisFlag=0;

OutStruct=OptConv2mat(handles); %dialogbox
if strcmp(OutStruct.Reponse,'OK')==1
    if (OutStruct.InterpOK=='I') FreqInter=OutStruct.FreqInter; else FreqInter=[]; end
    
    %------ recherche origine du fichier -----
%     [pathstr, name, ext, versn]=fileparts(OutStruct.filename);
    if verLessThan('matlab', '7.14') %2012a
        [pathstr,name,ext,ver] = fileparts(OutStruct.filename);
    else
        [pathstr,name,ext] = fileparts(OutStruct.filename);
    end
    switch ext
        %----------- Otometrics oeil/tete --------------
        case '.csv'
            Message=OtometricsCsv2Mat(OutStruct.filename, OutStruct.pathname);
            msgbox(Message,'fin de conversion')
%         %---------- EMG Vicon-------
%         case '.csv'
%             Message=Emg2Mat([OutStruct.pathname, name, '.csv'],{},OutStruct.InterpOK);
%             msgbox(Message,'fin de conversion')
        %---------- SMI Oculus oeil-------
        case '.dk2'
            Message=SmiOculusDk2Mat([OutStruct.pathname, name, '.dk2'],{},OutStruct.InterpOK);
            msgbox(Message,'fin de conversion')
        %---------- ISCAN singe oeil-------
        case '.tda'
            Message=iScan2MatConcat([OutStruct.pathname, name, '.tda'],{},OutStruct.InterpOK);
            msgbox(Message,'fin de conversion')
        case '.mep'
            %------Dialog box ----
            ParamsIn=[];
            OutputParams=OptBiopac2Mat(ParamsIn);
            if strcmp(OutputParams.Reponse,'Cancel')==1 %     ChannelList=ChannelsProperties.ChannelList;
                ChannelList=ChannelsProperties.ChannelList;
                return;
            end
            if strcmp(OutputParams.Reponse,'OK')==1
                InStruct{1}=[OutStruct.pathname, name, '.mep'];
                InStruct{2}=OutputParams.DureeAcq; %en ms
    %             Message=Biopac2Mat([OutStruct.pathname, name, '.mep'],{},OutStruct.InterpOK);
                Message=Biopac2Mat(InStruct,{},OutStruct.InterpOK);
                msgbox(Message,'fin de conversion') 
            else
                return;
            end
        case '.txt'
            %---------- SMI Hiview HED ----------------
            %----------------- existence du fichier de data? -----------------
            fid=fopen([OutStruct.pathname, name, '.txt']);
            if fid<0 
                h = msgbox(['Fichier ', [OutStruct.pathname, name, '.txt'], ' introuvable'],'erreur','error');
                return
            end

            %------ new ----
            %---- lecture de la 1ere ligne ----
            CellData=textscan(fid,'%s',5, 'delimiter','\t');
            fclose(fid);           
            Rep=CellData{1,1}(1,:);
            if strcmp(lower(Rep),'## [iview]')==1 % si HiView file
                    HiViewHedFlag=1;
                    ZebrisFlag=0;
            else
                    HiViewHedFlag=0; % sinon Zebris file
                    ZebrisFlag=1;
            end  
%             if strcmp(Rep,'Time')==1 % si HiView file
%                     HiViewHedFlag=1;
%                     ZebrisFlag=0;
%             else
%                     HiViewHedFlag=0; % sinon Zebris file
%                     ZebrisFlag=1;
%             end  
            
             %------- HiView HED --------
            if (HiViewHedFlag==1)
                Message=HiViewHed2Mat([OutStruct.pathname, name, '.txt'],{},OutStruct.InterpOK);
                msgbox(Message,'fin de conversion')
            end
           
            %------- Zebris --------
            if (ZebrisFlag==1)
                Message=Zebris2Mat([OutStruct.pathname, name, '.txt'],{},OutStruct.InterpOK);
                msgbox(Message,'fin de conversion')
            end
            
        case '.mat'
            Champs=load([OutStruct.pathname, name]);
            %---- test si fichier plate forme
            Res=isfield(Champs,'Steps');
            if (Res==1)
                clear Champs;
                Message=Oliv2Mat([OutStruct.pathname, name],{},OutStruct.InterpOK);
            else
                Res=isfield(Champs, name);
                if (Res==1)
                    clear Champs;
                    Message=Italy2Mat([OutStruct.pathname, name],{},OutStruct.InterpOK);
                end              
            end
%             %----- test si fichier bologne -----
%             Res=isfield(Champs, name);
%             if (Res==1)
%                 clear Champs;
%                 Message=Italy2Mat([OutStruct.pathname, name],{},OutStruct.InterpOK);
%             end
            msgbox(Message,'fin de conversion')
        case '.din'
            Message=Dinse2Mat([OutStruct.pathname, name],{},OutStruct.InterpOK);
        case {'.dat', '.c3d', '.mgm'}
            Message=Conv2Mat([OutStruct.pathname,OutStruct.filename],{},OutStruct.InterpOK,handles); %InterpOK
            msgbox(Message,'fin de conversion','modal');
        otherwise
    end  
else
    return;
end
trial=CurrentTrial; %restitution trial original si on est en cours de traitement
% % --------------------------------------------------------------------
% function mnuEyetracker_Callback(hObject, eventdata, handles)
% 
% 
% % --------------------------------------------------------------------
% function mnuEyetrackerVitesse_Callback(hObject, eventdata, handles)








%-----------------------------------------------------------
function txtYnormRange_Callback(hObject, eventdata, handles)
% Rec_list = get(handles.lstRecType,'String');
% Rec_selected=get(handles.lstRecType,'Value');
% Rec_nb = size(Rec_selected);
% Last_Rec=Rec_selected(Rec_nb(2));
YNorm=get(handles.chkYnorm,'Value');
Limstr=(get(handles.txtYnormRange,'string'));
Lim=str2num(Limstr);
S=size(Lim);
if isempty(Lim)==1
end 
if S(2)== 2 
    if YNorm==1
        [Curve, Cursor]=AfficheCourbes(handles);
    else
    end
    return;
end    


% --- Executes during object creation, after setting all properties.
function txtYnormRange_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% % ----------------btnExport---------------------
% function btnExport_Callback(hObject, eventdata, handles)
% h=DrawExport(handles);
% [Cv, Cr]=AfficheCourbes(handles);
% UD.Cv=Cv;
% UD.Cr=Cr;
% set(h,'UserData',UD);
% a=1;


% --- ChkBox affichage des curseurs -------
function chkCursors_Callback(hObject, eventdata, handles)
[Cv, Cr]=AfficheCourbes(handles);


%*********************************************************
%**************** nouvelle fonction affichage ************
%*********************************************************
function [Curve, Cursor]=AfficheCourbes(handles)
global trial;
global ChannelsProperties;
global VisibleCursor;
global MyData
global WorkDir

Curve=[];
Cursor=[];
%------ version matlab ---------
% V=ver('matlab');
% VersionMatlab=V.Version;
% 

Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
YNorm=get(handles.chkYnorm,'Value');
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);


%----- recherche ds ts les essais du nombre max d'echantillons si F=1000Hz--------
MaxSamples=max(trial.stim.NbOfSamples(list_entries));
MaxSamples=MaxSamples*(trial.MainFrequency/trial.stim.Frequency);
NbSamplesMax=MaxSamples; 
hold on;
cla;

%****** etat des check ********
ModifOK=get(handles.radCursModif,'Value');
LectOK=get(handles.radReadMouse,'Value');
AjoutMvtOK=get(handles.radAjoutMvt,'Value');
SuppMvtOK=get(handles.radSuppMvt,'Value');
% SyncEvt=get(handles.mnuSynchroMode,'UserData');

if get(handles.chkPoints, 'value')==1 AffichPoints=1; else AffichPoints=0; end

%**** ajustement echelle temps*******
%----- en mode synchro ---------
% if SyncEvt.Sync==1
%     if isempty(SyncEvt.Params)~=1
%         UD=get(handles.figData,'UserData'); %recup param dlgbox synchro
%         set(gca, 'XLimMode', 'manual');
% %         set(gca, 'XLim', [-str2num(UD.SynchroMode.LimBas) str2num(UD.SynchroMode.Duree)]);
%         set(gca, 'XLim', [0 str2num(UD.SynchroMode.Duree)+str2num(UD.SynchroMode.LimBas)]);
%         
%     end
% end
    
%*************************************
CurInd=0;
set(handles.figData,'Ygrid','on','Ycolor', [0.3 0.3 0.3]);
set(handles.figData,'Xgrid','off');
CourbeInd=0;
Cursor=[];
Curve=[];

%-----recherche du Ylim max pour affichage correct de la taille des curseurs-----
for i=1:Rec_nb(2) %pour chaque voie
     LimArray(i,:)=eval(ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelVlim);
     LimTemp(i)=LimArray(i,2) - LimArray(i,1);
     [C, I]=max(LimTemp);
     YLimMax=LimArray(I,:);
end
if YNorm==1 YLimMax=[-1.5 1.5]; end




%----------------------------- Pour chaque voie---------------------------------
for i=1:Rec_nb(2)
    NbOfPlot=ChannelsProperties.ChannelInfos(Rec_selected(i)).NbOfPlotByCh;
    Comp2Plot=ChannelsProperties.ChannelInfos(Rec_selected(i)).Comp2Plot(1,:);
    ylabel(ChannelsProperties.ChannelInfos(Rec_selected(i)).PlotUnit(1,:));
    Color=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelCol;
    Style=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelStyle;
    ChNb=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelNb;
    
    %********************************************************************
    %NbOfEvents = tableau du nb max d'events pris sur ts les essais 
    %   pour la voie consid�r�e; 1 valeur/composante
    %ex: une voie position Marqueur 3D(opto, vicon,..) -> [4 2 2] 4 evts sur X, 2 sur Y et 2 sur Z
    %ex: une voie vitesse Marqueur 3D(opto, vicon,..) -> [0 0 0 3] 0 evts sur dX, dY et dZ,3 sur Tg
    %********************************************************************
    NbOfEvents=ChannelsProperties.ChannelInfos(Rec_selected(i)).NbOfEvents;
    DataFieldName=[ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField(1,:), '.', ChannelsProperties.DataFieldAccessList{Rec_selected(i)}(1,:), num2str(ChNb)];
    FieldName=['trial.',ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField(1,:)];
    FreqRatio=ChannelsProperties.ChannelInfos(Rec_selected(i)).FreqRatio;
    
    %*********** recup de tous les essais du channel courant ******
    Cmd=['trial.', DataFieldName];
    CurrentChannel=eval(Cmd);
    %---------------------------- Ajustement echelle en amplitude Y-----------------------
    if YNorm==1
        Lim=[-1.5 1.5];
    else
        LimArray(i,:)=eval(ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelVlim);
        LimTemp(i)=LimArray(i,2) - LimArray(i,1);
        [C, I]=max(LimTemp);
        Lim=LimArray(I,:);
        %Lim=eval(ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelVlim);
    end
    set(handles.txtCurrentScale, 'string', [num2str(Lim(1)),'  ', num2str(Lim(2))]);
    set(handles.figData,'Ylim', Lim);
    %----------------------------------------------------------------------
    
    %-------------------- traitement de chaque essai ----------------------
    for j=1:list_size(2) %liste des essais
        %--------- recherche du max ds chq composante --------------
        YAllComp=CurrentChannel{list_entries(j)};
        MaxPosChqComp=max(YAllComp);
        MinPosChqComp=min(YAllComp);MinPosChqComp=abs(MinPosChqComp);
        AllMax=max([MaxPosChqComp;MinPosChqComp]);
        MaxComp=max(AllMax);
        
        for n=1:NbOfPlot %Pour chqe composante
            %********** choix  affichage des composantes *********
            if Comp2Plot(n)==0
                continue;
            end
                         
            %******************** a revoir **************************
            Decalage=0;
            %****** recup du Y(t) de l'essai courant*********
            CourbeInd=CourbeInd+1;
            Yt=CurrentChannel{list_entries(j)}(:,n);
            NbSamples_1000Hz=FreqRatio*size(Yt,1); %Nb echantillons � freq=MainFreq (1000Hz)
            Xt=(1:FreqRatio:NbSamples_1000Hz);
            Xt=Xt-1; % Ds Xt l'indice 1 contient 0, l'indice 2 contient 1, ... 
            %***********************************************            
            %****** on tronque les X et Y data pour la synchro alors Decalage <> 1 *****
            X=Xt;
            Y=Yt;                      
            %------------ Normalisation en Y -------------
            if YNorm==1
                if MaxComp==0  MaxComp=1; end
                Y=(Y./MaxComp);
            end
            %-----------------------------------------------
            
            %*********** traitement de la courbe en cours ************
            Coul=Color(n,:);
            Styl=Style(n,:);
            %------ stockage des infos sur la courbe en cours d'affichage ------
            
            % Curve.NumEssai est le num d'ordre ds la liste des essai
            %et non pas le num d'essai lui meme comme le laisse supposer le nom de variable
            Curve.NumEssai(CourbeInd)=list_entries(j); %Ordre ds la liste des essai et non 
            Curve.Ch(CourbeInd)=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelNb;
            Curve.SelNb(CourbeInd)=Rec_selected(i);
            Curve.ParentField{CourbeInd}=[ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField];
            Curve.Code(CourbeInd)=GetCode(Curve.ParentField{CourbeInd});
            Curve.FieldName{CourbeInd}=[ChannelsProperties.DataFieldAccessList{Rec_selected(i)}(n,:)];
            Curve.PlotName{CourbeInd}=ChannelsProperties.ChannelInfos(Rec_selected(i)).PlotName(n,:);
            Curve.PlotColor{CourbeInd}=(ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelCol(n,:));
            Curve.PlotNb(CourbeInd)=n;
            %------- affichage de la courbe en cours -------
             if AffichPoints==1
             	Curve.hCurve(CourbeInd)=plot(X, Y,'color',Coul,'LineWidth',1, 'LineStyle',Styl, 'Marker','+');
             else
             	Curve.hCurve(CourbeInd)=plot(X, Y,'color',Coul,'LineWidth',1, 'LineStyle',Styl);
             end

            %*************************************************************
            %        traitement et affichage des evenements 
            %*************************************************************
            AffichCursOK=get(handles.chkCursors, 'value');
            if AffichCursOK~=1 NbOfEvents(n)=0; end
            for k=1:NbOfEvents(n) %nombre max d'evt de l'ensemble des essais pour le channel consid�r�
                % pour la voie en cours, Nom du champ ds lequel se trouvel'ensemble des parametres ex:ParamCineMk1
                X0=[ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).ParentField,   num2str(ChNb)];            
                %-----Chemin complet d'acces trial.xxx.Paramxxx ---
                X1=['trial.', X0, '{list_entries(j)}'];  
                %-------Recup nom du curseur ex: TpsFinMvt1----------
                MvtField=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).DataField;
                %--- cas improbable ??---
                %-- le nom du curseur est vide ---
                if isempty(MvtField)
                    continue;
                end
                %----- le curseur existe? ---
                present=isfield(eval(X1), MvtField);
                if (present~=1)
                    continue; %ce curseur n'existe pas sur l'essai en cours
                end
%                 %------ modif otometrics ruben herman DPCt mai 2016%                 %si curseur position ne pas afficher
%                 if strfind(MvtField,'Tps0')
%                     continue;
%                 end
                %------- recup de la valeur Tps du curseur -------
                X=[X0, '{list_entries(j)}.', ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).DataField];
                Cmd=['trial.', X(1,:)];              
                Xk=eval(Cmd);
                Xk=Xk-Decalage;
                IndexXk=round(Xk/FreqRatio)+1; %index doit etre entier 
                %------------------curseur inexistant ou-------------
                %-------------- hors limites ------------------------
                %---------sinon la valeur Y du curseur----------------
%                 if IndexXk>NbSamplesMax | IndexXk<1 | isnan(IndexXk)==1
                if IndexXk>size(Y,1) || IndexXk<1 || isnan(IndexXk)==1
                    %size(Y,1)
                    continue;
                else
                    Yk=Y(IndexXk);
                    CurInd=CurInd+1;
                end
                %-------------- la data curseur est valide -----------
                Echelle=YLimMax;
                EchelleY=(Echelle(1,2)-Echelle(1,1));
                CurSize=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).Size;
                TailleCurSize=size(CurSize);TailleCurSize=TailleCurSize(2);
                CurSize=CurSize(1)*EchelleY;
                CurX=[Xk,Xk];
                if TailleCurSize==1 %le curseur est position� sur la courbe
                    CurY=[Yk+CurSize/2,Yk-CurSize/2];
                end
                if TailleCurSize==2 %le curseur est position� sur la ligne de base
                    CurY=[CurSize/2,-CurSize/2];
                end
                Col=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).color;
                Sty=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).Style;
                %--------- affichage du curseur de l'evenement --------                
                hCurs=plot(CurX,CurY,'Color',Col,'LineWidth',1, 'LineStyle',Sty);
                %------ stockage des infos sur le curseur en cours d'affichage ------
                Cursor.hCursor(CurInd)=hCurs;
                Cursor.ParentField{CurInd}=X0; %Path;
                Cursor.ChannelName{CurInd}=ChannelsProperties.ChannelList{Rec_selected(i)};
                Cursor.ParamFieldName{CurInd}=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).DataField; %nom de l'evenement                
                TempoStr=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).ParentField;
                pos=strfind(TempoStr,'.')+1;
                Cursor.ParentFieldName{CurInd}=TempoStr(pos:end); %nom du champ auquel appartient l'evenement ex:ParamCine, UserParams..               
                Cursor.Label{CurInd}=ChannelsProperties.ChannelInfos(Rec_selected(i)).Event(n,k).Label;
                Cursor.SelNb(CurInd)=Rec_selected(i);
                Cursor.EventNb(CurInd)=k;
                Cursor.NumEssai(CurInd)=list_entries(j);
                Cursor.Ch(CurInd)=ChannelsProperties.ChannelInfos(Rec_selected(i)).ChannelNb;     
                Cursor.Parent{CurInd}=ChannelsProperties.ChannelInfos(Rec_selected(i)).ParentField; 
                Cursor.X(CurInd)=Xk;
                Cursor.Y(CurInd)=Yk;
                Cursor.PlotNb(CurInd)=n;
                
            end %k=1:NbOfEvents
            %********************************************************          
        end %n=1:NbOfPlot ==> chaque composante
    end %j=1:list_size  ==> chaque essai
end %i=1:Rec_nb ==> chaque voie


%------- cas des marqueurs de coupure d'essais --------------
%-------------- traitement d�coupage en essais 7/2012
UD=get(gca, 'UserData');
if isfield(UD,'Func')
    if strcmpi(UD.Func,'couper')  
        TrialDescFlag=isfield(trial, 'TrialCutDesc');
        if TrialDescFlag
            if ~isempty(trial.TrialCutDesc{1,IndListSelect}.bornes)
                handlesDeb=plot(trial.TrialCutDesc{1,IndListSelect}.bornes(:,1),0, 'Marker', '^', 'Color', 'g');
                handlesFin=plot(trial.TrialCutDesc{1,IndListSelect}.bornes(:,2),0, 'Marker', '^', 'Color', 'y');
                trial.TrialCutDesc{1,IndListSelect}.handles(:,1)=handlesDeb;
                trial.TrialCutDesc{1,IndListSelect}.handles(:,2)=handlesFin;
            end
        end
    end
end

%--------------------------------------------------------------

%******* stockage ds userdata des curseurs et des courbes affich�s ******
Graph=get(handles.figData, 'UserData');
Graph.Cursor=Cursor;
Graph.Curve=Curve;
set(handles.figData, 'UserData', Graph);
%************ mise en place des fonctions evenement ButtonDownFcn *******
if isempty(Cursor)~=1
    set(Cursor.hCursor,'ButtonDownFcn',{@EventMouseDown, Cursor, Curve, handles});
    set(handles.txtXdata,'String',['T=', num2str(Cursor.X(CurInd),5), 'ms']);
    set(handles.txtYdata,'String',['Data=', num2str(Cursor.Y(CurInd),5)]);
else
    Cursor=[];
end
if isempty(Curve)~=1
    set(Curve.hCurve,'ButtonDownFcn',{@CurveMouseDown, Cursor, Curve, handles});
else
    Curve=[];
end
% set(handles.figData,'ButtonDownFcn',{@FigureMouseDown, Cursor, Curve, handles});

%***********************************************************************
% Tri=etime(clock,Deb);disp(Tri);
%------------------------- FIN AFFICHAGE--------------------------------



function Code=GetCode(ParentField)
switch ParentField
    case 'stim'
        Code=1;
    case 'eog'
        Code=2;
    case 'coil'
        Code=3;
    case 'gen_analog'
        Code=4;
    case 'spike'
        Code=5;
    case 'bird'
        Code=6;
    case 'opto'
        Code=7;
    case 'eyetracker'
        Code=8;
    case 'eyelink'
        Code=9;
    case 'vicon'
        Code=10;
    case 'mep'
        Code=11;
    case 'emg'
        Code=12;
end


% --- Executes on button press in btnResetAff.
function btnResetAff_Callback(hObject, eventdata, handles)
set(gca, 'XLimMode', 'auto');
% HH=findobj('enable', 'off');
% set(HH,'enable', 'on');



% --- Executes on button press in chkPoints.
function chkPoints_Callback(hObject, eventdata, handles)
[Cv, Cr]=AfficheCourbes(handles);



% --------------------------------------------------------------------
function mnuTronquer_Callback(hObject, eventdata, handles)
%answer = inputdlg('ttttt','Troncature');
Rep=Couper(handles);



%******************************************************
function chkZoom_Callback(hObject, eventdata, handles)
global oldString;

if get(handles.chkZoom, 'value')==1
    DisableAll(handles);
    set(handles.chkZoom, 'enable','On');
%     set(handles.chkPan, 'enable','Off');
    set(handles.chkPan, 'value',0);
    zoom xon;
%     oldString=get(handles.lblFonction,'String');
%     set(handles.lblFonction,'String','ZOOM ON');
else
    EnableAll(handles);
    set(handles.chkPan, 'enable','On');
%     set(handles.lblFonction,'String',oldString);
    zoom off;
end

% --------------------------------------------------------------------



% --- Executes on button press in chkPan.
function chkPan_Callback(hObject, eventdata, handles)
if get(handles.chkPan, 'value')==1
%     set(handles.chkZoom, 'enable','Off');
    set(handles.chkZoom, 'Value',0);
    pan xon;
else
    set(handles.chkZoom, 'enable','On');
    pan off;
end


% --------------------------------------------------------------------
function mnuSelectAscii_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global MatfilePath;
global trial

Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected,2);
IndListSelect = get(handles.lstFile,'Value'); %les num de la liste, pas ceux de l'essai
list_entries =handles.ListeIndMain(IndListSelect);
list_size=size(list_entries);
%if list_size(2)>1 warndlg('Un seul essai � la fois', 'Warning'); return; end; %UN seul autoris�!!!
listeEssais=get(handles.lstFile,'String');
for m=1:list_size(2) %pour chaque essai
    NomEssai=listeEssais(IndListSelect(m),:);
    NomEssai=deblank(NomEssai);
    fname=[MatfilePath, PathSep,NomEssai,'.asc'];
    fid = fopen(fname, 'w');
    k=1;
    for j=1:Rec_nb %liste des voies
    %*********** recup de tous les essais du channel courant ******
        ChNb=ChannelsProperties.ChannelInfos(Rec_selected(j)).ChannelNb;
        NbOfPlot=ChannelsProperties.ChannelInfos(Rec_selected(j)).NbOfPlotByCh;
        DataFieldName=[ChannelsProperties.ChannelInfos(Rec_selected(j)).ParentField(1,:), '.', ChannelsProperties.DataFieldAccessList{Rec_selected(j)}(1,:), num2str(ChNb)];
        Cmd=['trial.', DataFieldName];
        RecName=deblank(ChannelsProperties.ChannelList{Rec_selected(j)});
        CurrentChannel=eval(Cmd);
        for n=1:NbOfPlot
            PlotName=ChannelsProperties.ChannelInfos(Rec_selected(j)).PlotName(n,:);
            fprintf(fid,'%s', RecName);
            fprintf(fid,'%s \t', [' ' PlotName]);
            Yt(:,k)=CurrentChannel{list_entries(1)}(:,n);
            k=k+1;
        end;
    end
    fprintf(fid,'\n');
    
    for p=1:size(Yt,1)
        Cmd='fprintf(fid,''';
        for n=1:size(Yt,2)
            Cmd=[Cmd,'%4.3f'];
            if n~=size(Yt,2)
                Cmd=[Cmd,'\t'];
            else
                Cmd=[Cmd,'\n'', Yt(p,:));'];
            end
        end
        eval(Cmd);
    end
    fclose(fid);
%     save(fname, 'Yt', '-ascii', '-tabs');
end







% --------------------------------------------------------------------
function mnuExportFigure_Callback(hObject, eventdata, handles)
% h=DrawExport(handles);

% h=handles.figData;
h=figure;
linkaxes(handles.figData);
[Cv, Cr]=AfficheCourbes(handles);
% UD.Cv=Cv;
% UD.Cr=Cr;
% set(h,'UserData',UD);






% --------------------------------------------------------------------
function mnuExploration_Callback(hObject, eventdata, handles)
% hObject    handle to mnuExploration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exploration;



% --------------------------------------------------------------------
function mnu3DNormalisation_Callback(hObject, eventdata, handles)
% hObject    handle to mnu3DNormalisation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ChannelsProperties;
global trial;
global MarkerList

IndexTransport=[];
[ListNameToutesLesVoies3D, ListNameVoiesTraitees, IndexVoiesTraitees, ListNameVoiesNonTraitees, IndexVoiesNonTraitees]=RechercheVoiesXYZ('rawdata');

Var.ListNameVoiesTraitees=ListNameVoiesTraitees;
Var.IndexVoiesTraitees=IndexVoiesTraitees;
Var.ListNameVoiesNonTraitees=ListNameVoiesNonTraitees;
Var.IndexVoiesNonTraitees=IndexVoiesNonTraitees;
Var.ListNameToutesLesVoies3D=ListNameToutesLesVoies3D;
Var.AbsFilename=handles.AbsFilename;
Var.PathSep=handles.PathSep;
Var.hand=handles;

% In=find(VoiesValides==1);
if ~isempty(IndexVoiesTraitees)   
    %--------------------------------------------------------------
    %                      TEST VERSION MAIN
    %--------------------------------------------------------------
    switch handles.MainVersion
        case handles.HandiMainVersionID
            %------------ test session -----------------
            Session=handles.Session;
            switch Session
                case 'point'
                    Pince=1;
                case 'preh'
                    [Pince,Mk, FreqRatio,System3D]=Is3DTest(handles); 
                otherwise
                    errordlg('Il ne s''agit pas d''un fichier Handimain, il ne peut �tre trait� qu''avec la version compl�te ', 'Normalisation', 'modal');
                    return
            end
            %test pince
        otherwise
            tf=1;
            Pince=1;
    end
    if ~Pince %Voie  pince absente
            errordlg('La pince n''est pas trait�e', 'Normalisation', 'modal');
    else
        ChannelList=VisuNormalisation(Var);
    end
else
    errordlg('Les voies 3D ne sont pas trait�es', 'Normalisation', 'modal');
end



% -------- Changement de rep�re des donn�es VICON HG -----------
function mnuChgRepere_Callback(hObject, eventdata, handles)
% hObject    handle to mnuChgRepere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ChannelsProperties;
global MatfilePath;
global trial
global Cibles_H_GAB_PR;


Cibles_H_GAB_PR.Excentre(1:3)=0;
Cibles_H_GAB_PR.Centre(1:3)=0;

%---dlgbox chg repere Vicon ---
Titre='Manip PR Vicon Henry Gabrielle';
Comments='POUR LE CHANGEMENT DE PLAN : Il faut imp�rativement que R1, R2 et R3 soient sur les voies  4,5 et 6.';
TextBp='Choisir fichier origine';
OutStruct=OptChgOrigineVicon(Titre, Comments,TextBp);
if strcmp(OutStruct.Reponse,'OK')==1
else
    return;
end

%----- verif de l'existence du DataRef  -----
if isfield(trial.vicon,'DataRef')==0
    trial.vicon.DataRef='V';
end
%--------------------------------------------

%--------------------- moyennage des 3 points du plan entre Tmin et Tmax ------------
%--- Pour chq essai----
FreqRatio=trial.MainFrequency/trial.vicon.FrameFreq;

Tmin=OutStruct.T0; 
Tmax=OutStruct.T1; 
R1=trial.vicon.RawData4;
R2=trial.vicon.RawData5;
R3=trial.vicon.RawData6;

NbMarkers=trial.vicon.NbOfMarkers;
NbEssais=trial.NbEssais;
for i=1:NbEssais
    NbEchant=trial.vicon.NbOfFrames(i);
    EchantDeb=round(Tmin/FreqRatio)+1;
    EchantFin=round(Tmax/FreqRatio)+1;
    %--- Points moyen pour chaque essai ----
    R1_mean(i,:)=mean(R1{i}(EchantDeb:EchantFin, :));
    R2_mean(i,:)=mean(R2{i}(EchantDeb:EchantFin, :));
    R3_mean(i,:)=mean(R3{i}(EchantDeb:EchantFin, :));
    %--- Points moyen de ts les essais ----
end

%------Pour l'ensemble des essais -----
if NbEssais==1
    R1_moyen=R1_mean;
    R2_moyen=R2_mean;
    R3_moyen=R3_mean;
else
    R1_moyen=mean(R1_mean);
    R2_moyen=mean(R2_mean);
    R3_moyen=mean(R3_mean);  
end
%------------------------------------------------------------------------------


%--- calcul de la matrice de chg de repere � partir de R1, R2 et R3 moyens---
[R]=ComputeViconTransformationMatrix(R1_moyen, R2_moyen, R3_moyen);
%-----------------------------------------------------------------------------


%--- Transformation du Mk R1 du plan ds le nouveau repere ---
%----  pour la translation ulterieure.  -----------------
OFS_O=R*[R1_moyen(1); R1_moyen(2); R1_moyen(3)];
%--------------------------------------------------------


%-- Recup ds le fichier l'origine du mvt coord. vicon et transf ds le plan sujet----
if isempty(OutStruct.Filename)~=1
    OffsetTrial=load ([OutStruct.PathName,OutStruct.Filename]);
    NbEchant_geo=OffsetTrial.trial.vicon.NbOfFrames(1);
    EchMin_geo=round(0.2*NbEchant_geo); %20% � partir du debut
    EchMax_geo=round(0.8*NbEchant_geo); %80% � partir du debut
    %------extraction de R1, R2, R3, Depart, centre, left ou right ------
    R1_moy_geo=mean(OffsetTrial.trial.vicon.RawData4{1}(EchMin_geo:EchMax_geo,:));
    R2_moy_geo=mean(OffsetTrial.trial.vicon.RawData5{1}(EchMin_geo:EchMax_geo,:));
    R3_moy_geo=mean(OffsetTrial.trial.vicon.RawData6{1}(EchMin_geo:EchMax_geo,:));
    Depart_moy_geo=mean(OffsetTrial.trial.vicon.RawData1{1}(EchMin_geo:EchMax_geo,:));
    Centre_moy_geo=mean(OffsetTrial.trial.vicon.RawData2{1}(EchMin_geo:EchMax_geo,:));
    Exc_moy_geo=mean(OffsetTrial.trial.vicon.RawData3{1}(EchMin_geo:EchMax_geo,:));
    
    
    %--- referencement des points sur R1 -----
   %---------- Calcul matrice de transformation � partir de R1 R2 et R3 entre Tmin et Tmax ---------
    [R_geo]=ComputeViconTransformationMatrix(R1_moy_geo, R2_moy_geo, R3_moy_geo);
    %-----------------------------------------------------------------------------
    %--- Transformation du Mk R1_moy_geo du plan ds le nouveau repere ---
    %----  pour la translation ulterieure.  -----------------
    OFS_O_geo=R_geo*[R1_moy_geo(1); R1_moy_geo(2); R1_moy_geo(3)];
    %--------------------------------------------------------
    %---rotations centr�es sur O (calage sur un plan // au plan pointage)---
    %---- pour les points depart, centre et exc (cible excentr�e)
    NewDepart_geo=R_geo*[(Depart_moy_geo(:,1))'; (Depart_moy_geo(:,2))';(Depart_moy_geo(:,3))'];
    NewCentre_geo=R_geo*[(Centre_moy_geo(:,1))'; (Centre_moy_geo(:,2))';(Centre_moy_geo(:,3))'];
    NewExc_geo=R_geo*[(Exc_moy_geo(:,1))'; (Exc_moy_geo(:,2))';(Exc_moy_geo(:,3))'];
    %--- translation des 3 points ----
    %--- depart ---
    NewDepart_geo(1)=NewDepart_geo(1)-OFS_O_geo(1);
    NewDepart_geo(2)=NewDepart_geo(2)-OFS_O_geo(2);
    NewDepart_geo(3)=NewDepart_geo(3)-OFS_O_geo(3);
    %--- Centre ---
    NewCentre_geo(1)=NewCentre_geo(1)-OFS_O_geo(1);
    NewCentre_geo(2)=NewCentre_geo(2)-OFS_O_geo(2);
    NewCentre_geo(3)=NewCentre_geo(3)-OFS_O_geo(3);
    %--- Cible excentree ---
    NewExc_geo(1)=NewExc_geo(1)-OFS_O_geo(1);
    NewExc_geo(2)=NewExc_geo(2)-OFS_O_geo(2);
    NewExc_geo(3)=NewExc_geo(3)-OFS_O_geo(3);
    %---- les points sont referenc� sur R1 ---
    
    %----- decalage au depart ----
    Decalage_depart=NewDepart_geo;
else
    Decalage_depart=[];
end
%---------------------------------------------------------


%--- Transformation des data RawData1 ds le nouveau repere ---
%----  rotations + translation R1 devient l'origine du rep�re X,Y,Z-------
for i=1:NbEssais
    for j=1:NbMarkers
        %---- referencement sur R1 ---
        NewRawData=eval(['trial.vicon.RawData', num2str(j)]);
        %---rotations centr�es sur O (calage sur un plan // au plan pointage)---
        NewRawDataTransf=R*[(NewRawData{1,i}(:,1))'; (NewRawData{1,i}(:,2))';(NewRawData{1,i}(:,3))'];
        %---Recalage sur R1 (translations vers plan de pointage)---
        NewRawDataTransf(1,:)=NewRawDataTransf(1,:)- OFS_O(1);
        NewRawDataTransf(2,:)=NewRawDataTransf(2,:)- OFS_O(2);
        NewRawDataTransf(3,:)=NewRawDataTransf(3,:)- OFS_O(3);
        %--- les data sont referencees sur R1 ---
        
        %---Recalage sur DEPART (translation et rotation X et Y)---
        if isempty(Decalage_depart)~=1
            %---- les data ------
            %---translation---
            NewRawDataTransf(1,:)=NewRawDataTransf(1,:)- Decalage_depart(1);
            NewRawDataTransf(2,:)=NewRawDataTransf(2,:)- Decalage_depart(2);   
            NewRawDataTransf(3,:)=NewRawDataTransf(3,:)- Decalage_depart(3);
            %---inversion axes X et Y ---
            NewRawDataTransf(1,:)=-NewRawDataTransf(1,:); %X
            NewRawDataTransf(2,:)=-NewRawDataTransf(2,:); %Y
            
            %--- Les points ---
            trial.vicon.DataRef='U'; %ref sur Depart
            %--- Translation et inversion du centre ---
            Cibles_H_GAB_PR.Centre(1)=NewCentre_geo(1)-Decalage_depart(1);
            Cibles_H_GAB_PR.Centre(2)=NewCentre_geo(2)-Decalage_depart(2);
            Cibles_H_GAB_PR.Centre(3)=NewCentre_geo(3)-Decalage_depart(3);
            Cibles_H_GAB_PR.Centre(1)=-Cibles_H_GAB_PR.Centre(1);
            Cibles_H_GAB_PR.Centre(2)=-Cibles_H_GAB_PR.Centre(2);
            %---  Translation et inversion de la cible excentr�e ---
            Cibles_H_GAB_PR.Excentre(1)=NewExc_geo(1)-Decalage_depart(1);
            Cibles_H_GAB_PR.Excentre(2)=NewExc_geo(2)-Decalage_depart(2);
            Cibles_H_GAB_PR.Excentre(3)=NewExc_geo(3)-Decalage_depart(3);
            Cibles_H_GAB_PR.Excentre(1)=-Cibles_H_GAB_PR.Excentre(1);
            Cibles_H_GAB_PR.Excentre(2)=-Cibles_H_GAB_PR.Excentre(2);
            
            trial.vicon.UserData.Cibles_H_GAB_PR=Cibles_H_GAB_PR;
        else
            trial.vicon.DataRef='P'; %ref sur R1 R2 R3
        end
        eval(['trial.vicon.RawData', num2str(j),'{1,', num2str(i), '}=NewRawDataTransf'';']);
    end
end

[Cv, Cr]=AfficheCourbes(handles);
msgbox('Changement de rep�re effectu�');
% RawData1=R*[ X1(1,:) ;DataY(1,:); DataZ(1,:)]
% DataXYZ=R*[DataX(1,:) ;DataY(1,:); DataZ(1,:)] - OFS_O;
a=1;



% --------------------------------------------------------------------
function mnuManipPRviconHG_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function mnuRecalageDepart_Callback(hObject, eventdata, handles)





% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function mnu_zebris_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_zebris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
% ---- chg de repere zebris -----
function mnuChgRef_Callback(hObject, eventdata, handles)
global ChannelsProperties;
global MatfilePath;
global trial


Titre='ZebrisCMS20S';
% Comments=['POUR LE CHANGEMENT DE PLAN : Le fichier plan doit contenir les 3 mks du plan R1, R2 et R3.', CR, LF];
% Comments=[Comments, 'La translation XYZ est ajout�e dans le rep�re de pointage sujet, apr�s le changement de rep�re Zebris -> plan pointage'];
[Comments, e]=sprintf('\n%s\n%s\n\n%s', 'POUR LE CHANGEMENT VERS LE REPERE SUJET :', 'Le fichier plan doit contenir les 3 mks du plan R1, R2 et R3 respectivement sur mk1 mk2 mk3.', 'La translation XYZ est ajout�e dans le rep�re de pointage sujet, apr�s le changement de rep�re Zebris -> plan pointage');
TextBp='Choisir fichier ''plan''';
OutStruct=OptChgOrigineVicon(Titre, Comments, TextBp);
if strcmp(OutStruct.Reponse,'OK')==1
    if isempty(OutStruct.Filename)==1
        msgbox('Aucun fichier n''a ete selectionne!');
        return
    end
    mTrial=load ([OutStruct.PathName,OutStruct.Filename]);
else
    return;
end

%----- verif de l'existence du DataRef  -----
if isfield(trial.opto,'DataRef')==0
    trial.vicon.DataRef='Z';
else
    if (trial.opto.DataRef=='P')
        msgbox('Changement de rep�re d�ja effectu�','bi caire foul', 'warn');
        return;
    end
end
%--------------------------------------------


%--------------------- moyennage des 3 points du plan entre Tmin et Tmax ------------
    NbEchant=mTrial.trial.opto.NbOfFrames(1);
    EchMin=round(0.2*NbEchant); %20% � partir du debut
    EchMax=round(0.8*NbEchant); %80% � partir du debut
    %------extraction de R1, R2, R3, Depart, centre, left ou right ------
    MeanP1=mean(mTrial.trial.opto.RawData1{1}(EchMin:EchMax,:));
    MeanP2=mean(mTrial.trial.opto.RawData2{1}(EchMin:EchMax,:));
    MeanP3=mean(mTrial.trial.opto.RawData3{1}(EchMin:EchMax,:));
%--- Pour chq essai----

Tmin=OutStruct.T0; 
Tmax=OutStruct.T1; 

%--calcul matrice de rotation R, calcul de l'offset du mk2-----
[R, OFS]=ComputeZebrisTransformationMatrix(MeanP1, MeanP2, MeanP3);

for i=1:trial.NbEssais
    for j=1:trial.opto.NbOfMarkers
        %---- referencement sur R1 ---        
        NewRawData=eval(['trial.opto.RawData', num2str(j)]);
        %---rotations centr�es sur O (calage sur un plan // au plan pointage-)---
        NewRawDataTransf=R*[(NewRawData{1,i}(:,1))'; (NewRawData{1,i}(:,2))';(NewRawData{1,i}(:,3))'];       
        %---Recalage sur R1 (translations vers plan de pointage)---
        NewRawDataTransf(1,:)=NewRawDataTransf(1,:)- OFS(1); %X
        NewRawDataTransf(2,:)=NewRawDataTransf(2,:)- OFS(2); %Y
        NewRawDataTransf(3,:)=NewRawDataTransf(3,:)- OFS(3); %Z
        
        %--- rotation des axes pour manip JL IRMf ---
        NewRawDataTransfRot1=[];
        NewRawDataTransfRot1(1,:)=NewRawDataTransf(2,:);    %Xnew=Yold
        NewRawDataTransfRot1(2,:)=NewRawDataTransf(3,:);    %Ynew=Zold
        NewRawDataTransfRot1(3,:)=NewRawDataTransf(1,:);    %Znew=Xold
        
        %--- rotation des axes pour manip VG  ---
        NewRawDataTransfRot=[];
        NewRawDataTransfRot(1,:)=-NewRawDataTransfRot1(3,:);    %Xnew=-Zold
        NewRawDataTransfRot(2,:)=-NewRawDataTransfRot1(1,:);    %Ynew=-Xold
        NewRawDataTransfRot(3,:)=NewRawDataTransfRot1(2,:);    %Znew=Yold
        
        %---- ajout de l'offset sur XY Z ---
        NewRawDataTransfRot(1,:)=NewRawDataTransfRot(1,:) + OutStruct.Xofs;  
        NewRawDataTransfRot(2,:)=NewRawDataTransfRot(2,:) + OutStruct.Yofs;  
        NewRawDataTransfRot(3,:)=NewRawDataTransfRot(3,:) + OutStruct.Zofs;  
        
        eval(['trial.opto.RawData', num2str(j),'{1,', num2str(i), '}=NewRawDataTransfRot'';']);        
    end
end
trial.opto.DataRef='P';
[Cv, Cr]=AfficheCourbes(handles);

msgbox('Changement de rep�re effectu�');



function NewData=ChangeRep(OldData, R, OFS_O )

NewDataLoc=R*[OldData(:,1)'; OldData(:,2)'; OldData(:,3)'];
NewData(1,:)=NewDataLoc(1,:)- OFS_O(1);
NewData(2,:)=NewDataLoc(2,:)- OFS_O(2);
NewData(3,:)=NewDataLoc(3,:)- OFS_O(3);
NewData=NewData';
return;



% --------------------------------------------------------------------
% function mnuBiopac_Callback(hObject, eventdata, handles)
% global trial;
% global ChannelsProperties;
% Rec_list = get(handles.lstRecType,'String');
% Rec_selected=get(handles.lstRecType,'Value');
% Rec_nb = size(Rec_selected);


% --------------------------------------------------------------------
function mnuMep_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);


% --------------------------------------------------------------------
function MnuMepParams_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;

Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
ChList=MepParams(hObject, handles);
load_Reclistbox(ChList, handles, Rec_selected(1));




% --------------------------------------------------------------------
function mnuOeil_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnu3D_Callback(hObject, eventdata, handles)
global trial;
global ChannelsProperties;
Rec_list = get(handles.lstRecType,'String');
Rec_selected=get(handles.lstRecType,'Value');
Rec_nb = size(Rec_selected);
Nb3dCh=size(Rec_selected,2);
%--------------------------------------------------------------
%                      TEST VERSION MAIN
%--------------------------------------------------------------
switch handles.MainVersion
    case handles.HandiMainVersionID
        %---- test Pointage ou Pr�hension sur le 1er essai ----
        %---- pour autoraisation calcul pince ----
        %---- Ts les essais sont(en principe)de m�me type ----
        if isfield(trial,'vicon')
            Session=lower(trial.stim.SeqType(1,:));
        end
        if isfield(trial,'opto')
            Session=lower(trial.stim.SeqType(1,:));
        end
        Session=strtrim(Session);
        switch Session
            case {'bopointage','pointage', 'Pointing'}
                set(handles.mnu3DModule,'enable', 'off');
                handles.Session='point';
            case {'prehension', 'grasping', 'verresgd'}
                set(handles.mnu3DModule,'enable', 'on');
                handles.Session='preh';
                if Nb3dCh~=2 set(handles.mnu3DModule, 'Enable', 'Off'); end
            otherwise
                set(handles.mnu3DModule,'enable', 'on');
                handles.Session='unknown';
        end
    otherwise
        if Nb3dCh~=2 set(handles.mnu3DModule, 'Enable', 'Off'); else set(handles.mnu3DModule, 'Enable', 'On'); end
end
guidata(hObject, handles);



% --------------------------------------------------------------------
function mnuOeilVitesse_Callback(hObject, eventdata, handles)
    mnuEyelinkVitesse_Callback(hObject, eventdata, handles);


% --------------------------------------------------------------------
function mnuOeilFiltrage_Callback(hObject, eventdata, handles)
    mnuEyelinkFiltrage_Callback(hObject, eventdata, handles);



% --- Executes during object creation, after setting all properties.
function figData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate figData








% --------------------------------------------------------------------
function mnuCinematique_Callback(hObject, eventdata, handles)
% hObject    handle to mnuCinematique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuModule_Callback(hObject, eventdata, handles)
% hObject    handle to mnuModule (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mnu3DModule_Callback(hObject, eventdata, handles);

% --------------------------------------------------------------------
function mnuOptotrakCinematique_Callback(hObject, eventdata, handles)
% hObject    handle to mnuOptotrakCinematique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mnu3DCinematique_Callback(hObject, eventdata, handles);

% --------------------------------------------------------------------
function mnuNormalisation_Callback(hObject, eventdata, handles)
% hObject    handle to mnuNormalisation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mnu3DNormalisation_Callback(hObject, eventdata, handles);


% --------------------------------------------------------------------
function mnuGraphiques_Callback(hObject, eventdata, handles)
% hObject    handle to mnuGraphiques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuVisuDynamique_Callback(hObject, eventdata, handles)
% hObject    handle to mnuVisuDynamique (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Visu2D;


% --------------------------------------------------------------------
function mnuNormalisationTemp_Callback(hObject, eventdata, handles)
    
mnu3DNormalisation_Callback(hObject, eventdata, handles);
% recherche des voies 3D trait�es
%resultat ds VoiesValides
%nom ds NewChannelList
% for i=1:ChannelsProperties.ListeSize
%     ParentField=ChannelsProperties.ChannelInfos(i).ParentField;
%     if strcmp(ParentField,'opto')~=1 & strcmp(ParentField,'vicon')~=1 & strcmp(ParentField,'bird')~=1
%         NewChannelList{1,i}='------';
%     else
%         DataField=ChannelsProperties.DataFieldAccessList{1,i}(1,:);
%         if strcmpi(DataField, 'rawdata')
%             if ChannelsProperties.ChannelInfos(1,i).NbOfEvents(1)>0
%                 NewChannelList{1,i}=ChannelsProperties.ChannelList{1,i};
%                 VoiesValides(i)=1;
%             else
%                 VoiesValides(i)=0;
%                 NewChannelList{1,i}='------';                
%             end
%         else
%             VoiesValides(i)=0;
%             NewChannelList{1,i}='------';
%         end
%     end
% end


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figMain is resized.
function figMain_ResizeFcn(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnuFiltrage_Callback(hObject, eventdata, handles)
% hObject    handle to mnuFiltrage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuHandi2Word_Callback(hObject, eventdata, handles)
global FilenameList;

FilenameList={};
Handimain(handles);
a=1;



% --- Executes during object creation, after setting all properties.
function figMain_CreateFcn(hObject, eventdata, handles)



% --------------------------------------------------------------------
function mnuRepTrav_Callback(hObject, eventdata, handles)
% hObject    handle to mnuRepTrav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global WorkDir
global MatfilePath

WorkDirTmp = uigetdir(WorkDir, ' selectionner le repertoire de travail');
if ~ischar(WorkDirTmp) return; end
WorkDir=WorkDirTmp;
% MatfilePath=WorkDir;
cd (WorkDir);



% --------------------------------------------------------------------
function uiSaveFile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uiSaveFile (see GCBO)
mnuSave_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function uiOpenFile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uiOpenFile (see GCBO)
mnuOpen_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uiWorkDir_ClickedCallback(hObject, eventdata, handles)
mnuRepTrav_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnuMotion_Callback(hObject, eventdata, handles)
% hObject    handle to mnuMotion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuMotionChgRep_Callback(hObject, eventdata, handles)
global trial
    
%--------------------- moyennage des 3 points du plan entre Tmin et Tmax ------------

%----- verif de l'existence du DataRef  -----
if isfield(trial.vicon,'DataRef')==0
    trial.vicon.DataRef='V'; %ref vicon
else
    if strcmpi(trial.vicon.DataRef, 'P')==1 | strcmpi(trial.vicon.DataRef, 'U ')==1 %ref plan
        h=errordlg('Les data sont d�j� r�f�renc�es au plan Ori, Right et Up','modal');
        uiwait(h);
        return
    end
end
Titre='Manip PR Motion M&H';
Comments='POUR LE CHANGEMENT DE PLAN : Il faut que ori, right et up soient sur les voies  4,5 et 6.';
OutStruct=OptChgOrigineMotion('dummy',Titre, Comments);%h=warndlg('Les mk du plan doivent �tre sur les voies 4(ori), 5(Right) et 6(Up)','Changement de rep�re', 'modal');
if strcmp(OutStruct.Reponse,'OK')==1
else
    return;
end
%------ Offset de translation ----
Xofs=OutStruct.Xofs;
Yofs=OutStruct.Yofs;
Zofs=OutStruct.Zofs;

% uiwait(h);
%--- Pour chq essai----
FreqRatio=trial.MainFrequency/trial.vicon.FrameFreq;

% Tmin=OutStruct.T0; 
% Tmax=OutStruct.T1; 

NbMarkersMvt=trial.vicon.NbOfMarkers-3;
NbEssais=trial.NbEssais;
for j=1:NbMarkersMvt
    RawData=eval(['trial.vicon.RawData', num2str(j)]); %ts les essais du mk
    RawDataTransf={};
    for i=1:NbEssais
        NbEchant=trial.vicon.NbOfFrames(i);
        EchantDeb=round(0.1*NbEchant);
        EchantFin=round(0.9*NbEchant);
        % ------les 3 marqueurs du plan------
        R1=trial.vicon.RawData4; % mk Org
        R2=trial.vicon.RawData6; % mk Up
        R3=trial.vicon.RawData5; % mk Right
        %--- mk moyen pour chaque essai ----
        R1_mean(i,:)=mean(R1{i}(EchantDeb:EchantFin, :));
        R2_mean(i,:)=mean(R2{i}(EchantDeb:EchantFin, :));
        R3_mean(i,:)=mean(R3{i}(EchantDeb:EchantFin, :));
        %--- calcul de la matrice de chg de repere � partir de R1, R2 et R3 moyens---
        [R]=ComputeViconTransformationMatrix(R1_mean(i,:), R2_mean(i,:), R3_mean(i,:));    
        %---rotations---
        RawDataTransf{1,i}=(R*[((RawData{1,i}(:,1))'); ((RawData{1,i}(:,2))');((RawData{1,i}(:,3))')])';
    end
    %-----------------------------------------------------------------------------
    eval(['trial.vicon.RawData', num2str(j),'= RawDataTransf;']);
end

if (Xofs==0) & (Yofs==0) & (Zofs==0) %pas de translation
    trial.vicon.DataRef='P'; %ref sur plan Motion  
else %translation
    for j=1:NbMarkersMvt
        RawData=eval(['trial.vicon.RawData', num2str(j)]); %ts les essais du mk
        RawDataOfs={};
        for i=1:NbEssais
            RawDataOfs{1,i}=[((RawData{1,i}(:,1))')-Xofs; ((RawData{1,i}(:,2))')-Yofs;((RawData{1,i}(:,3))'-Zofs)]';
        end
        %-----------------------------------------------------------------------------
        eval(['trial.vicon.RawData', num2str(j),'= RawDataOfs;']);
    end
    trial.vicon.DataRef='U'; %ref sur depart      
end
h=helpdlg('Changement de rep�re effectu�');
uiwait(h);
