function SauvegardeDataPourOffice( handles, VarIn)
global trial;
global Labels;
global CategoriesPre;
global CategoriesPoint;
global GV;
global PV;
global PV_GV;
global GD;
global PML;
global GD_PML;


%---------------- recup des initiales du sujet ----------------
if ~isempty(GV)
    SubjectName=VarIn.DataPrehension{1,1}.AllDataNorm.Subject;
else
    if ~isempty(GD)
        SubjectName=VarIn.DataPointage{1,1}.AllDataNorm.Subject;
    else
        if ~isempty(PML)
            SubjectName=VarIn.DataPointage{1,1}.AllDataNorm.Subject;
        else
            SubjectName='XX';
        end
    end
end

% AbsfilenameEllipse=[VarIn.AbsRapportPath, VarIn.RapportName, '.elp'];
% Data=VarIn;
% save(AbsfilenameEllipse,'Data');
Absfilename=[VarIn.AbsRapportPath, VarIn.RapportName, '.json'];
fid=fopen(Absfilename, 'w');

to_write_temp = struct('SUJET', SubjectName);
to_write_temp = mergestruct(to_write_temp, struct('FICHIER', [VarIn.RapportName, '.txt']));
to_write_temp = mergestruct(to_write_temp, struct('DATE',datestr(clock)));
to_write_temp = mergestruct(to_write_temp, struct('LOGICIEL','Conv2Handimain'));
to_write_temp = mergestruct(to_write_temp, struct('VERSION','V1.00'));
to_write_temp = mergestruct(to_write_temp, struct('LOCKED_CHAR','x'));
to_write_temp = mergestruct(to_write_temp, struct('BLANK_CHAR','blk'));


%**************************************************************************
%**************************************************************************
%                               PREHENSION
%**************************************************************************
%**************************************************************************
if ~isempty(GV)
    %**************************************************************************
    %                       VITESSE DES REPONSES
    %**************************************************************************

    VitesseRep = struct('NbEssais', num2str_array(GV.NbEssais),...
                          'LatenceMvtMean_GV', num2str_array(GV.LatenceMvtMean_GV),...
                          'LatenceMvtMeanStd_GV', num2str_array(GV.LatenceMvtMeanStd_GV),...
                          'DureeMvtMean_GV', num2str_array(GV.DureeMvtMean_GV),...
                          'DureeMvtStd_GV', num2str_array(GV.DureeMvtStd_GV));
                      

    
    %**************************************************************************
    %                       TRANSPORT ET FLUIDITE
    %**************************************************************************
    

    TransportEtFluidite = struct('PicVitTgMean_GV', num2str_array(GV.PicVitTgMean_GV),...
                                'PicVitTgMeanStd_GV', num2str_array(GV.PicVitTgMeanStd_GV),...
                                'LatencePicVitTgMean_GV', num2str_array(GV.LatencePicVitTgMean_GV),...
                                'LatencePicVitTgMeanStd_GV', num2str_array(GV.LatencePicVitTgMeanStd_GV));

    
    %**************************************************************************
    %                          FORMATION DE LA PINCE
    %**************************************************************************
    
    if ~isfield(GV,'OuvPinceMaxMean_PV_GV')
        GV.OuvPinceMaxMean_PV_GV = [ ' ', ' ', ' ', ' '];
    end
    if ~isfield(GV, 'OuvPinceMaxMeanStd_PV_GV')
        GV.OuvPinceMaxMeanStd_PV_GV = [ ' ', ' ', ' ', ' '];
    end
    FormationPince = struct('LatencePinceMean_GV', num2str_array(GV.LatencePinceMean_GV),...
                            'LatencePinceMeanStd_GV', num2str_array(GV.LatencePinceMeanStd_GV),...
                            'OuvPinceMaxMean_PV_GV', num2str_array(GV.OuvPinceMaxMean_PV_GV),...
                            'OuvPinceMaxMeanStd_PV_GV', num2str_array(GV.OuvPinceMaxMeanStd_PV_GV),...
                            'OuvPinceMaxMean_PV', num2str_array(PV.OuvPinceMaxMean_PV),...
                            'OuvPinceMaxMeanStd_PV', num2str_array(PV.OuvPinceMaxMeanStd_PV),...
                            'OuvPinceMaxMean_GV', num2str_array(GV.OuvPinceMaxMean_GV),...
                            'OuvPinceMaxMeanStd_GV', num2str_array(GV.OuvPinceMaxMeanStd_GV),...
                            'TpsOuvPinceMaxMean_GV', num2str_array(GV.TpsOuvPinceMaxMean_GV),...
                            'TpsOuvPinceMaxMeanStd_GV', num2str_array(GV.TpsOuvPinceMaxMeanStd_GV));  
  
    
    %**************************************************************************
    %                  COORDINATION TRANSPORT/PREHENSION
    %**************************************************************************
    
    CoordTransportPrehension = struct('TpsDebPinceTransportMean_GV', num2str_array(GV.TpsDebPinceTransportMean_GV),...
                                      'TpsDebPinceTransportMeanStd_GV', num2str_array(GV.TpsDebPinceTransportMeanStd_GV),...
                                      'TpsPicVitPinceTransportMean_GV', num2str_array(GV.TpsPicVitPinceTransportMean_GV),...
                                      'TpsPicVitPinceTransportMeanStd_GV', num2str_array(GV.TpsPicVitPinceTransportMeanStd_GV));


    %**************************************************************************
    %                   COORDINATION INTER SEGMENTAIRE
    %**************************************************************************

    CoordInterSegment = struct('ZmaxPoignetMean_GV', num2str_array(GV.ZmaxPoignetMean_GV),...
                               'ZmaxPoignetMeanStd_GV', num2str_array(GV.ZmaxPoignetMeanStd_GV),...
                               'ZmaxCoudeMean_GV', num2str_array(GV.ZmaxCoudeMean_GV),...
                               'ZmaxCoudeMeanStd_GV', num2str_array(GV.ZmaxCoudeMeanStd_GV),...
                               'TpsPicVitPoignetCoudeMean_GV', num2str_array(GV.TpsPicVitPoignetCoudeMean_GV),...
                               'TpsPicVitPoignetCoudeMeanStd_GV', num2str_array(GV.TpsPicVitPoignetCoudeMeanStd_GV));
    
    prehension = struct('VitesseRep_preh', VitesseRep,...
                        'TransportEtFluidite_preh', TransportEtFluidite,...
                        'FormationPince_preh', FormationPince,...
                        'CoordTransportPrehension_preh', CoordTransportPrehension,...
                        'CoordInterSegment_preh', CoordInterSegment);
                        
    to_write_temp = mergestruct(to_write_temp, prehension);

    
    
end

%**************************************************************************
%**************************************************************************
%                               POINTAGE_GD
%**************************************************************************
%**************************************************************************
if ~isempty(GD)
    
    %**************************************************************************
    %                       VITESSE DES REPONSES
    %**************************************************************************

    VitesseRep = struct('NbEssais', num2str_array(GD.NbEssais),...
                        'LatenceMvtMean', num2str_array(GD.LatenceMvtMean),...
                        'LatenceMvtMeanStd', num2str_array(GD.LatenceMvtMeanStd),...
                        'DureeMvtMean', num2str_array(GD.DureeMvtMean),...
                        'DureeMvtMeanStd', num2str_array(GD.DureeMvtMeanStd));

                    
    
    %**************************************************************************
    %                       TRANSPORT ET FLUIDITE
    %**************************************************************************

    TransportEtFluidite = struct('PicVitTgMean', num2str_array(GD.PicVitTgMean),...
                                 'PicVitTgMeanStd', num2str_array(GD.PicVitTgMeanStd),...
                                 'LatencePicVitTgMean', num2str_array(GD.LatencePicVitTgMean),...
                                 'LatencePicVitTgMeanStd', num2str_array(GD.LatencePicVitTgMeanStd));

    
    %**************************************************************************
    %                   COORDINATION INTER SEGMENTAIRE
    %**************************************************************************
    
        
    CoordInterSegment = struct('ZmaxPoignetMean', num2str_array(GD.ZmaxPoignetMean),...
                               'ZmaxPoignetMeanStd', num2str_array(GD.ZmaxPoignetMeanStd),...
                               'ZmaxCoudeMean', num2str_array(GD.ZmaxCoudeMean),...
                               'ZmaxCoudeMeanStd', num2str_array(GD.ZmaxCoudeMeanStd),...
                               'TpsPicVitPoignetCoudeMean', num2str_array(GD.TpsPicVitPoignetCoudeMean),...
                               'TpsPicVitPoignetCoudeMeanStd', num2str_array(GD.TpsPicVitPoignetCoudeMeanStd));
 

                           
    %**************************************************************************
    %                       PRECISION FINALE
    %**************************************************************************
    
    NbConditions = size(GD.PrecisionFinale.Surface,2);
    PrecisionFinale = struct('PrecisionFinale_ErreurLaterale', num2str_array(GD.PrecisionFinale.ErreurLaterale),...
                              'PrecisionFinale_ErreurProfondeur', num2str_array(GD.PrecisionFinale.ErreurProfondeur),...
                              'PrecisionFinale_ErreurDistance', num2str_array(GD.PrecisionFinale.ErreurDistance),...
                              'PrecisionFinale_Surface', num2str_array(GD.PrecisionFinale.Surface),...
                              'PrecisionFinale_Surface_erreur', num2str_array(zeros(1, NbConditions)));
 
    pointage_GD = struct('VitesseRep_PGD', VitesseRep,...
                        'TransportEtFluidite_PGD', TransportEtFluidite,...
                        'CoordInterSegment_PGD', CoordInterSegment,...
                        'PrecisionFinale_PGD', PrecisionFinale);
                        
    to_write_temp = mergestruct(to_write_temp, pointage_GD);

end

%**************************************************************************
%**************************************************************************
%                               POINTAGE_PML
%**************************************************************************
%**************************************************************************
if ~isempty(PML)

    %**************************************************************************
    %                       VITESSE DES REPONSES
    %**************************************************************************
    VitesseRep = struct('NbEssais', num2str_array(PML.NbEssais),...
                        'LatenceMvtMean', num2str_array(PML.LatenceMvtMean),...
                        'LatenceMvtMeanStd', num2str_array(PML.LatenceMvtMeanStd),...
                        'DureeMvtMean', num2str_array(PML.DureeMvtMean),...
                        'DureeMvtMeanStd', num2str_array(PML.DureeMvtMeanStd));


    %**************************************************************************
    %                       TRANSPORT ET FLUIDITE
    %**************************************************************************
    TransportEtFluidite = struct('NbEssais', num2str_array(PML.NbEssais),...
                                 'LatenceMvtMean', num2str_array(PML.LatenceMvtMean),...
                                 'LatenceMvtMeanStd', num2str_array(PML.LatenceMvtMeanStd),...
                                 'DureeMvtMean', num2str_array(PML.DureeMvtMean),...
                                 'DureeMvtMeanStd', num2str_array(PML.DureeMvtMeanStd));
    

    %**************************************************************************
    %                   COORDINATION INTER SEGMENTAIRE
    %**************************************************************************
    CoordInterSegment = struct('ZmaxPoignetMean', num2str_array(PML.ZmaxPoignetMean),...
                               'ZmaxPoignetMeanStd', num2str_array(PML.ZmaxPoignetMeanStd),...
                               'ZmaxCoudeMean', num2str_array(PML.ZmaxCoudeMean),...
                               'ZmaxCoudeMeanStd', num2str_array(PML.ZmaxCoudeMeanStd),...
                               'TpsPicVitPoignetCoudeMean', num2str_array(PML.TpsPicVitPoignetCoudeMean),...
                               'TpsPicVitPoignetCoudeMeanStd', num2str_array(PML.TpsPicVitPoignetCoudeMeanStd));

                           
    %**************************************************************************
    %                       PRECISION FINALE
    %**************************************************************************
    PrecisionFinale = struct('PrecisionFinale_ErreurLaterale', num2str_array(PML.PrecisionFinale.ErreurLaterale),...
                             'PrecisionFinale_ErreurProfondeur', num2str_array(PML.PrecisionFinale.ErreurProfondeur),...
                             'PrecisionFinale_ErreurDistance', num2str_array(PML.PrecisionFinale.ErreurDistance),...
                             'PrecisionFinale_Surface', num2str_array(PML.PrecisionFinale.Surface),...
                             'PrecisionFinale_Surface_erreur', num2str_array(zeros(1, NbConditions)));

    pointage_PML = struct('VitesseRep_PML', VitesseRep,...
                        'TransportEtFluidite_PML', TransportEtFluidite,...
                        'CoordInterSegment_PML', CoordInterSegment,...
                        'PrecisionFinale_PML', PrecisionFinale);
                        
    to_write_temp = mergestruct(to_write_temp, pointage_PML);
                         
end

to_write = jsonencode(to_write_temp);fprintf(fid,'%s\n', to_write);   

fclose(fid);
