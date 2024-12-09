%code for median effect of neural imalge data
andir = 'D:\documentG\paper_draft\structural of trust in MCI\Test_mediation7';
mkdir(andir)
cd(andir)
%Load image data and behavioral variables
cd C:\Users\90553\Desktop\GMV_MCI_trust\
dinf = dir('4D*');
imgs=[dinf.folder,'\',dinf.name];

%$Load and display mask
mask = 'C:\Users\90553\Desktop\GMV_MCI_trust\output.nii';
%display mask
%canlab_results_fmridisplay(mask, 'compact2');

%Run mediation without bootstrapping (a quick test)
cd C:\Users\90553\Desktop\GMV_MCI_trust
x=xlsread('grouplable.xlsx');
y=xlsread('behaviorlable.xlsx');
corv=xlsread('covance.xlsx');
affect=xlsread('affect.xlsx');
tiv=csvread('Tiv.csv');
names={'Group','TP','GM'};
% This is what you would run:
cd(andir)
exclude_idx=[];  %excluded low quality data; 
    groupex_idx=1:length(x);
    groupex_idx([exclude_idx])=[];
    
imgdata_info=spm_vol(imgs);
imgdata=spm_read_vols(imgdata_info);
cc=imgdata_info(groupex_idx);
change4d_job;
datalist=matlabbatch{1,1}.spm.util.cat.vols;
matlabbatch{1,1}.spm.util.cat.vols=datalist(groupex_idx);
inputs = cell(0, 1);
for crun = 1:1
end
spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch, inputs{:});
imgsdata='C:\Users\90553\Desktop\GMV_MCI_trust\vbmdata\4D_excluded.nii'
% results = mediation_brain(x(groupex_idx),y(groupex_idx),imgs,'covs',[corv,tiv],'names',names,'mask', mask, 'noverbose');
results = mediation_brain(x(groupex_idx),y(groupex_idx),imgsdata,'covs',[corv(groupex_idx,:),tiv(groupex_idx)],'names',names,'mask', mask, 'noverbose','boot', 'bootsamples', 1000);

%Generate a results report with figures and tables
publish_mediation_report;

load clusters_with_extracted_data/Statistic_image_and_region_objects.mat
% Orthogonal slices you can surf around:
orthviews(ab_obj)

% A montage
create_figure('montage'); axis off
montage(ab_obj);

% A table with autolabeled regions
table(ab_obj);



cc=find(x==0)
corr(y(cc),gmv_thal(cc))
