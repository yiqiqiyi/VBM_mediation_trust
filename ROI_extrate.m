clc;clear;
%Run mediation without bootstrapping (a quick test)
cd ('D:\documentG\paper_draft\structural of trust in MCI\submit')
names={'Group','TP','GM'};
% extract GMV TOI signal:
AllVolume='4D.nii';
ROIDef={[-17 -24 3 5];[-38 18 2 5]};
OutputName='ROI_GMV'
[ROISignals_med] = y_ExtractROISignal(AllVolume, ROIDef, OutputName,'',0);