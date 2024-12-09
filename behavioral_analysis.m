clc;clear
%load test
[trust_tet]=xlsread('vbm_media_moderated.csv');
mci_allgrp1=find(trust_tet(:,1)==0);
hc_allgrp1=find(trust_tet(:,1)==1);
%normality
%TP
idx_t=2
[H1, pValue1, KSstatistic1, criticalValue1]=kstest(trust_tet(mci_allgrp1,idx_t));
[H2, pValue2, KSstatistic2, criticalValue2]=kstest(trust_tet(hc_allgrp1,idx_t));
%Levene test
[p,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]');
%Affect
idx_t=[6 ];
[H1, pValue1, KSstatistic1, criticalValue1]=kstest(trust_tet(mci_allgrp1,idx_t));
[H2, pValue2, KSstatistic2, criticalValue2]=kstest(trust_tet(hc_allgrp1,idx_t));
%Levene test
[p,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]');
%social
idx_t=[8 ];
[H1, pValue1, KSstatistic1, criticalValue1]=kstest(trust_tet(mci_allgrp1,idx_t));
[H2, pValue2, KSstatistic2, criticalValue2]=kstest(trust_tet(hc_allgrp1,idx_t));
%Levene test
[p,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]');
%motivation
idx_t=[9 ];
[H1, pValue1, KSstatistic1, criticalValue1]=kstest(trust_tet(mci_allgrp1,idx_t));
[H2, pValue2, KSstatistic2, criticalValue2]=kstest(trust_tet(hc_allgrp1,idx_t));
%Levene test
[p,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]');
%execuctive
idx_t=[10 ];
[H1, pValue1, KSstatistic1, criticalValue1]=kstest(trust_tet(mci_allgrp1,idx_t));
[H2, pValue2, KSstatistic2, criticalValue2]=kstest(trust_tet(hc_allgrp1,idx_t));
%Levene test
[p,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]');


%ranksum test
%TP
idx_t=2
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[p, h, stats]=ranksum(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
[a,b]=partialcorr(trust_tet([mci_allgrp1;hc_allgrp1],idx_t),...
    [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]',...
    trust_tet([mci_allgrp1;hc_allgrp1],[3 4 5]),'Type','Spearman','Tail','right')
%affect
idx_t=6
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[p, h, stats]=ranksum(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
%social
idx_t=8
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[p, h, stats]=ranksum(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
%motivation
idx_t=9
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[p, h, stats]=ranksum(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
%exe
idx_t=10
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[p, h, stats]=ranksum(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))

%age
idx_t=3
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[h,p,ci,stats] =ttest2(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
%sex
idx_t=4
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[h,p,ci,stats] =ttest2(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))
%education
idx_t=5
[mean(trust_tet(mci_allgrp1,idx_t)),std(trust_tet(mci_allgrp1,idx_t))...
    mean(trust_tet(hc_allgrp1,idx_t)),std(trust_tet(hc_allgrp1,idx_t))]
[h,p,ci,stats] =ttest2(trust_tet(mci_allgrp1,idx_t),trust_tet(hc_allgrp1,idx_t))

%other tests
clc,clear,
[trust_tet,~,trust_raw]=xlsread('neuropsychologicaltests.xlsx');

name_t={'mmse','rey-recall','avlt','dst','tmtb','stroop','tmt-a','smdt','cvft','bnt','rey-copy','cdt','gds'}'
name_idx=[43 14 28 41 30 19 29 33 38 32 13 31 42];
mci_allgrp1=find(trust_tet(:,10)==0);
hc_allgrp1=find(trust_tet(:,10)==1);
for ii=1:length(name_idx)
    %test normality
    h1=kstest(trust_tet(mci_allgrp1,name_idx(ii)));
    h2=kstest(trust_tet(hc_allgrp1,name_idx(ii)));
    [pv,stats] =vartestn(trust_tet([mci_allgrp1;hc_allgrp1],name_idx(ii)),...
        [ones(1,length(mci_allgrp1)),ones(1,length(hc_allgrp1))*2]','Display','off')
    if h1==1|h2==1|pv<0.05
        MCImean(ii)=mean(trust_tet(mci_allgrp1,name_idx(ii)));
        MCIstd(ii)=std(trust_tet(mci_allgrp1,name_idx(ii)));
        HCmean(ii)=mean(trust_tet(hc_allgrp1,name_idx(ii)))
        HCstd(ii)=std(trust_tet(hc_allgrp1,name_idx(ii)));
        [p, h, stats]=ranksum(trust_tet(mci_allgrp1,name_idx(ii)),trust_tet(hc_allgrp1,name_idx(ii)))
        idx_tt(ii)=stats.zval;
        idx_p(ii)=p;
    else
        MCImean(ii)=mean(trust_tet(mci_allgrp1,name_idx(ii)));
        MCIstd(ii)=std(trust_tet(mci_allgrp1,name_idx(ii)));
        HCmean(ii)=mean(trust_tet(hc_allgrp1,name_idx(ii)))
        HCstd(ii)=std(trust_tet(hc_allgrp1,name_idx(ii)));
        [h,p,ci,stats]=ttest2(trust_tet(mci_allgrp1,name_idx(ii)),trust_tet(hc_allgrp1,name_idx(ii)))
        idx_tt(ii)=stats.tstat;
        idx_p(ii)=p;
    end
end
table(name_t,MCImean',MCIstd',HCmean',HCstd',idx_tt',idx_p')
