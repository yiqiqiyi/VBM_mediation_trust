clc;clear;
%code for median effect of neural imalge data
for aa=1:1000
andir = ['D:\documentG\paper_draft\structural of trust in MCI\permutation\',num2str(aa)];
mkdir(andir)
%Load image data and behavioral variables
cd('D:\documentG\paper_draft\structural of trust in MCI\submit\')
dinf = dir('4D.n*');
imgs=[dinf.folder,'\',dinf.name];

%$Load and display mask
mask = 'C:\Users\90553\Desktop\GMV_MCI_trust\output.nii';
%display mask
%canlab_results_fmridisplay(mask, 'compact2');

%Run mediation without bootstrapping (a quick test)
datax=xlsread('C:\Users\90553\Desktop\GMV_MCI_trust\vbm_media_moderated.csv');
cc=randperm(199);
x=datax(cc,1);
y=datax(cc,2);
corv=datax(cc,[3 4 5 7])
names={'Group','TP','GM'};
% This is what you would run:
cd(andir)
groupex_idx=1:length(x);

    
imgdata_info=spm_vol(imgs);
imgdata=spm_read_vols(imgdata_info);
cc=imgdata_info(groupex_idx);
imgsdata='D:\documentG\paper_draft\structural of trust in MCI\submit\4D.nii'
% results = mediation_brain(x(groupex_idx),y(groupex_idx),imgs,'covs',[corv,tiv],'names',names,'mask', mask, 'noverbose');
results = mediation_brain(x(groupex_idx),y(groupex_idx),imgsdata,'covs',[corv(groupex_idx,:)],'names',names,'mask', mask, 'noverbose','noboot');
sumresult{aa}=results;
end

%ermutation test
data2=[];
for aa=1:500
andir = ['D:\documentG\paper_draft\structural of trust in MCI\permutation\',num2str(aa)];
cd (andir)
mfilename=spm_vol('X-M-Y_pvals.img');
msakname=spm_read_vols(mfilename);

cc1=find(msakname<=0.005 & msakname>0);
data=zeros(size(msakname));
data(cc1)=1;
if isempty(cc1)
else
S=regionprops(data==1,'Area','PixelIdxList');
cluster_are=[S.Area];
[~,ab]=max(cluster_are);
if isempty(ab)
else
mfilename1=spm_vol('X-M-Y_effect.img');
msakname1=spm_read_vols(mfilename1);

data2=[data2,sum(abs(msakname1(S(ab).PixelIdxList)))];

end

end
end
data3=abs(data2);


%based on effect size
data4=[];

data2=[];
for aa=1:10000
andir = ['D:\documentG\paper_draft\structural of trust in MCI\permutation\',num2str(aa)];
cd (andir)
mfilename1=spm_vol('X-M-Y_effect.img');
msakname1=spm_read_vols(mfilename1);
ccc=find(abs(msakname1)>0.2);
cc1=ccc;
data=zeros(size(msakname1));
data(cc1)=1;
if isempty(cc1)
else
S=regionprops(data==1,'Area','PixelIdxList');
cluster_are=[S.Area];
[~,ab]=max(cluster_are);
if isempty(ab)
else

data2=[data2,sum(abs(msakname1(S(ab).PixelIdxList)))];

end

end
end
data3=abs(data2);


dds=sort(data3,'descend');
cd('D:\documentG\paper_draft\structural of trust in MCI\submit')

xeffect=spm_vol('X-M-Y_pvals.img');
xeffectdata=spm_read_vols(xeffect);
cc1=find(xeffectdata<=0.005 & xeffectdata>0);
data=zeros(size(xeffectdata));
data(cc1)=1;
S=regionprops(data==1,'Area','PixelIdxList');


xvalue=spm_vol('X-M-Y_effect.img');
xvaluedata=spm_read_vols(xvalue);
regionv_ai=sum(abs(xvaluedata(S(7).PixelIdxList)));
regionv_tha=sum(abs(xvaluedata(S(8).PixelIdxList)));

p_AI = length(find(dds>regionv_ai))/10000;
p_tha = length(find(dds>regionv_tha))/10000;
