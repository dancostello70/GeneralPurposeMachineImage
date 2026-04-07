:: XSPLK2
SET TargetDir=C:\DC\Clients\ONLC\Projects\GeneralPurposeMachineImage\ImageComponents\XSPLK2\ArchiveSource\c_XSPLK2ClassFiles_BIG
c:
cd \XSPLK2ClassFiles
xcopy /e Installers %TargetDir%\Installers\
xcopy /e Apps\*.tgz %TargetDir%\Apps\