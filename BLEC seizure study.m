% Calculating PTZ recovery time post seizure
% I want to know, on a 10 minute basis, when do the fish recover to their
% own normalized setpoint?

%geno1= 250422_04 -- day 6 fish
%geno2= 250429_04 -- day 6 fish one mock, one ablated pre-excluded
%geno3= 250423_06 -- day 7 fish  one ablated pre-excluded

for i=1:6
    AblatedNorm1(:,i)=(geno1.tenminute{1}(:,i)-nanmean(geno1.tenminute{1}(:,i)))./nanmean(geno1.tenminute{1}(:,i));
end

for i=1:6
    MockNorm1(:,i)=(geno1.tenminute{2}(:,i)-nanmean(geno1.tenminute{2}(:,i)))./nanmean(geno1.tenminute{2}(:,i));
end

for i=1:8
    AblatedNorm2(:,i)=(geno2.tenminute{1}(:,i)-nanmean(geno2.tenminute{1}(:,i)))./nanmean(geno2.tenminute{1}(:,i));
end

for i=1:8
    MockNorm2(:,i)=(geno2.tenminute{2}(:,i)-nanmean(geno2.tenminute{2}(:,i)))./nanmean(geno2.tenminute{2}(:,i));
end

for i=1:7
    AblatedNorm3(:,i)=(geno3.tenminute{1}(:,i)-nanmean(geno3.tenminute{1}(:,i)))./nanmean(geno3.tenminute{1}(:,i));
end

for i=1:9
    MockNorm3(:,i)=(geno3.tenminute{2}(:,i)-nanmean(geno3.tenminute{2}(:,i)))./nanmean(geno3.tenminute{2}(:,i));
end
% I now want to know when is a fish in the normal range of activity
AblatedFIND1=AblatedNorm1
AblatedFIND1(find(AblatedNorm1<-0.2))=-1;
AblatedFIND1(find(AblatedNorm1>1.5))=-1;

AblatedFIND2=AblatedNorm2
AblatedFIND2(find(AblatedNorm2<-0.2))=-1;
AblatedFIND2(find(AblatedNorm2>1.5))=-1;

AblatedFIND3=AblatedNorm3
AblatedFIND3(find(AblatedNorm3<-0.2))=-1;
AblatedFIND3(find(AblatedNorm3>1.5))=-1;

MockFIND1=MockNorm1
MockFIND1(find(MockNorm1<-0.2))=-1;
MockFIND1(find(MockNorm1>1.5))=-1;

MockFIND2=MockNorm2
MockFIND2(find(MockNorm2<-0.2))=-1;
MockFIND2(find(MockNorm2>1.5))=-1;

MockFIND3=MockNorm3
MockFIND3(find(MockNorm3<-0.2))=-1;
MockFIND3(find(MockNorm3>1.5))=-1;

for i=1:6
A=find(AblatedFIND1(6:end,i)>-1)
AblatedREC1(i)=A(1);
end

for i=1:8
A=find(AblatedFIND2(6:end,i)>-1)
AblatedREC2(i)=A(1);
end

for i=1:7
A=find(AblatedFIND3(6:end,i)>-1)
AblatedREC3(i)=A(1);
end

for i=1:6
A=find(MockFIND1(6:end,i)>-1)
MockREC1(i)=A(1);
end

for i=1:8
A=find(MockFIND2(6:end,i)>-1)
MockREC2(i)=A(1);
end

for i=1:9
A=find(MockFIND3(6:end,i)>-1)
MockREC3(i)=A(1);
end

% So far I am keeping very short bursts of activity when I should really
% ask for the data to be "recovered" only if they sustain for 30 minutes or
% an hour
for i=1:6
Ablated1Smooth30(:,i)= smooth(AblatedNorm1(:,i),3)
Ablated1Smooth60(:,i)= smooth(AblatedNorm1(:,i),6)
end

for i=1:8
Ablated2Smooth30(:,i)= smooth(AblatedNorm2(:,i),3)
Ablated2Smooth60(:,i)= smooth(AblatedNorm2(:,i),6)
end

for i=1:7
Mock3Smooth30(:,i)= smooth(MockNorm3(:,i),3)
Mock3Smooth60(:,i)= smooth(MockNorm3(:,i),6)
end

for i=1:6
Mock1Smooth30(:,i)= smooth(MockNorm1(:,i),3)
Mock1Smooth60(:,i)= smooth(MockNorm1(:,i),6)
end

for i=1:8
Mock2Smooth30(:,i)= smooth(MockNorm2(:,i),3)
Mock2Smooth60(:,i)= smooth(MockNorm2(:,i),6)
end

for i=1:9
Mock3Smooth30(:,i)= smooth(MockNorm3(:,i),3)
Mock3Smooth60(:,i)= smooth(MockNorm3(:,i),6)
end

% Smoothing distorts the timings of when they are reaching recovery. A
% finesse-- should use only post 820 minutes as the recovery average (next
% days/nights-- or better, when recovering relative to the 7-11 window the
% next day?

for i=1:6
    AblatedNorm1b(:,i)=(geno1.tenminute{1}(:,i)-nanmean(geno1.tenminute{1}(83:end,i)))./nanmean(geno1.tenminute{1}(83:end,i));
end

for i=1:6
    MockNorm1b(:,i)=(geno1.tenminute{2}(:,i)-nanmean(geno1.tenminute{2}(83:end,i)))./nanmean(geno1.tenminute{2}(83:end,i));
end

for i=1:8
    AblatedNorm2b(:,i)=(geno2.tenminute{1}(:,i)-nanmean(geno2.tenminute{1}(83:end,i)))./nanmean(geno2.tenminute{1}(83:end,i));
end

for i=1:8
    MockNorm2b(:,i)=(geno2.tenminute{2}(:,i)-nanmean(geno2.tenminute{2}(83:end,i)))./nanmean(geno2.tenminute{2}(83:end,i));
end

for i=1:7
    AblatedNorm3b(:,i)=(geno3.tenminute{1}(:,i)-nanmean(geno3.tenminute{1}(83:end,i)))./nanmean(geno3.tenminute{1}(83:end,i));
end

for i=1:9
    MockNorm3b(:,i)=(geno3.tenminute{2}(:,i)-nanmean(geno3.tenminute{2}(83:end,i)))./nanmean(geno3.tenminute{2}(83:end,i));
end

for k=1:6
j=0;    
for i=1:3:300;
j=j+1;
Ablate30ave1(j,k)=nanmean(AblatedNorm1b(i:i+2,k));
Mock30ave1(j,k)=nanmean(MockNorm1b(i:i+2,k));
end
end

for k=1:6
j=0;    
for i=1:6:300;
j=j+1;
Ablate60ave1(j,k)=nanmean(AblatedNorm1b(i:i+5,k));
Mock60ave1(j,k)=nanmean(MockNorm1b(i:i+5,k));
end
end

for k=1:8
j=0;    
for i=1:3:300;
j=j+1;
Ablate30ave2(j,k)=nanmean(AblatedNorm2b(i:i+2,k));
Mock30ave2(j,k)=nanmean(MockNorm2b(i:i+2,k));
end
end

%Survival Curves for how long they go before a 30 min epoch of normal
%behavior (0)
%blateSURVIVE1=[];
%for k=1:6
%    j=0
%for i=1:300
    
%    if Ablate30ave1(i,k)<-0.00001 
%        AblateSURVIVE1(i,k)=0;
%        next i
%    if Ablate30ave1(i,k)>-0.00001
    
Ablated30FIND1=Ablate30ave1
Ablated30FIND1(find(Ablate30ave1<-0.2))=-1;
Ablated30FIND1(find(Ablate30ave1>1.2))=-1;

Ablated30FIND2=Ablate30ave2
Ablated30FIND2(find(Ablate30ave2<-0.2))=-1;
Ablated30FIND2(find(Ablate30ave2>1.2))=-1;

Mock30FIND1=Mock30ave1
Mock30FIND1(find(Mock30ave1<-0.2))=-1;
Mock30FIND1(find(Mock30ave1>1.2))=-1;

Mock30FIND2=Mock30ave2
Mock30FIND2(find(Mock30ave2<-0.2))=-1;
Mock30FIND2(find(Mock30ave2>1.2))=-1;

for i=1:6
A=find(Ablated30FIND1(4:end,i)>-1)
Ablated30REC1(i)=A(1);
end

for i=1:8
A=find(Ablated30FIND2(4:end,i)>-1)
Ablated30REC2(i)=A(1);
end

for i=1:6
A=find(Mock30FIND1(4:end,i)>-1)
Mock30REC1(i)=A(1);
end

for i=1:8
A=find(Mock30FIND2(4:end,i)>-1)
Mock30REC2(i)=A(1);
end


Ablated30SURVIVE=[Ablated30REC1 Ablated30REC2]
Mock30SURVIVE=[Mock30REC1 Mock30REC2]
Experiment=[0 0 0 0 0 0 1 1 1 1 1 1 1 1]
AblateMock=[Ablated30SURVIVE Mock30SURVIVE];
ExperimentString=[Experiment Experiment];
Samplestring=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1]

[f,x]=ecdf(Ablated30SURVIVE)
figure;ecdf(Ablated30SURVIVE)
hold on
ecdf(Mock30SURVIVE)

% This does show a shift, but it is not large. 
% What if I go 50 above and 50 below? I might be making a mistake because
% of the day-night rhythm




% What if I include the 3rd day of data? 

for k=1:7
j=0;    
for i=1:3:261;
j=j+1;
Ablate30ave3(j,k)=nanmean(AblatedNorm3b(i:i+2,k));
%Mock30ave3(j,k)=nanmean(MockNorm3b(i:i+2,k));
end
end

Ablated30FIND3=Ablate30ave3
Ablated30FIND3(find(Ablate30ave3<-0.2))=-1;
Ablated30FIND3(find(Ablate30ave3>1.2))=-1;

Mock30FIND3=Mock30ave3
Mock30FIND3(find(Mock30ave3<-0.2))=-1;
Mock30FIND3(find(Mock30ave3>1.2))=-1;

for i=1:7
A=find(Ablated30FIND3(2:end,i)>-1)
Ablated30REC3(i)=A(1);
end

for i=1:9
A=find(Mock30FIND3(2:end,i)>-1)
Mock30REC3(i)=A(1);
end

%Now combined them ALL for survival curves:

Ablated30SURVIVEall=[Ablated30REC1 Ablated30REC2 Ablated30REC3]
Mock30SURVIVEall=[Mock30REC1 Mock30REC2 Mock30REC3]

[f,x]=ecdf(Ablated30SURVIVEall)
figure;ecdf(Ablated30SURVIVEall)
hold on
ecdf(Mock30SURVIVEall)

% Hmm, there is one Mock fish that is not recovering based on this metric
% until more than 24 hours. They are the only one, does this mean my metric
% for recovery isn't quite right?
%-- No, this fish IS slow to recover compared to the rest. It has some
%spikey activity that is supra-baseline, which are the exact types I want
%to exclude here.

% OK, I am really happy with this survival curve based on 30 minute bins
% normalized to when they reach a window of activity from [-0.2 to 1.2] of
% the data normalized after the start of the 2nd subjective day-- 830 minutes into the expt.

% But I want to double check this by calculating it slightly different--

% First convert the data to 30 minutes:
for k=1:6
j=0;    
for i=1:30:4050;
j=j+1;
geno1.Ablate30(j,k)=nanmean(geno1.data{1}(i:i+29,k));
geno1.Mock30(j,k)=nanmean(geno1.data{2}(i:i+29,k));
end
end

for k=1:8
j=0;    
for i=1:30:3900;
j=j+1;
geno2.Ablate30(j,k)=nanmean(geno2.data{1}(i:i+29,k));
geno2.Mock30(j,k)=nanmean(geno2.data{2}(i:i+29,k));
end
end

for k=1:9
j=0;    
for i=1:30:2610;
j=j+1;
%geno3.Ablate30(j,k)=nanmean(geno3.data{1}(i:i+29,k));
geno3.Mock30(j,k)=nanmean(geno3.data{2}(i:i+29,k));
end
end

% And then normalize this after 830 minutes= start with value 28 

for i=1:6
    geno1.AblatedNorm(:,i)=(geno1.Ablate30(:,i)-nanmean(geno1.Ablate30(28:end,i)))./nanmean(geno1.Ablate30(28:end,i));
end

for i=1:6
    geno1.MockNorm(:,i)=(geno1.Mock30(:,i)-nanmean(geno1.Mock30(28:end,i)))./nanmean(geno1.Mock30(28:end,i));
end

for i=1:8
    geno2.AblatedNorm(:,i)=(geno2.Ablate30(:,i)-nanmean(geno2.Ablate30(28:end,i)))./nanmean(geno2.Ablate30(28:end,i));
end

for i=1:8
    geno2.MockNorm(:,i)=(geno2.Mock30(:,i)-nanmean(geno2.Mock30(28:end,i)))./nanmean(geno2.Mock30(28:end,i));
end

for i=1:7
    geno3.AblatedNorm(:,i)=(geno3.Ablate30(:,i)-nanmean(geno3.Ablate30(28:end,i)))./nanmean(geno3.Ablate30(28:end,i));
end

for i=1:9
    geno3.MockNorm(:,i)=(geno3.Mock30(:,i)-nanmean(geno3.Mock30(28:end,i)))./nanmean(geno3.Mock30(28:end,i));
end

geno1.Ablated30FIND=geno1.AblatedNorm
geno1.Ablated30FIND(find(geno1.AblatedNorm<-0.2))=-1;
geno1.Ablated30FIND(find(geno1.AblatedNorm>1.2))=-1;

geno2.Ablated30FIND=geno2.AblatedNorm
geno2.Ablated30FIND(find(geno2.AblatedNorm<-0.2))=-1;
geno2.Ablated30FIND(find(geno2.AblatedNorm>1.2))=-1;

geno3.Ablated30FIND=geno3.AblatedNorm
geno3.Ablated30FIND(find(geno3.AblatedNorm<-0.2))=-1;
geno3.Ablated30FIND(find(geno3.AblatedNorm>1.2))=-1;

geno1.Mock30FIND=geno1.MockNorm
geno1.Mock30FIND(find(geno1.MockNorm<-0.2))=-1;
geno1.Mock30FIND(find(geno1.MockNorm>1.2))=-1;

geno2.Mock30FIND=geno2.MockNorm
geno2.Mock30FIND(find(geno2.MockNorm<-0.2))=-1;
geno2.Mock30FIND(find(geno2.MockNorm>1.2))=-1;

geno3.Mock30FIND=geno3.MockNorm
geno3.Mock30FIND(find(geno3.MockNorm<-0.2))=-1;
geno3.Mock30FIND(find(geno3.MockNorm>1.2))=-1;

for i=1:6
A=find(geno1.Ablated30FIND(4:end,i)>-1)
geno1.Ablated30REC(i)=A(1);
end

for i=1:8
A=find(geno2.Ablated30FIND(4:end,i)>-1)
geno2.Ablated30REC(i)=A(1);
end

for i=1:7
    A=find(geno3.Ablated30FIND(4:end,i)>-1)
geno3.Ablated30REC(i)=A(1);
end

for i=1:6
A=find(geno1.Mock30FIND(4:end,i)>-1)
geno1.Mock30REC(i)=A(1);
end

for i=1:8
A=find(geno2.Mock30FIND(4:end,i)>-1)
geno2.Mock30REC(i)=A(1);
end

for i=1:9
    A=find(geno3.Mock30FIND(4:end,i)>-1)
geno3.Mock30REC(i)=A(1);
end

Ablated30SURVIVEall2=[geno1.Ablated30REC geno2.Ablated30REC geno3.Ablated30REC]
Mock30SURVIVEall2=[geno1.Mock30REC geno2.Mock30REC geno3.Mock30REC]


figure;ecdf(Ablated30SURVIVEall2)
hold on
ecdf(Mock30SURVIVEall2)

% This yields an essentially identical curve, so I feel the calculations
% are correct.

% June 2025 update
% I wish to work out the exact correct window for what is called "recovery"
% Originally, I picked -0.2 to 1.2 of the same fish's day 2 mean value as a
% good metric for recovery, but is that the best? 

% The correct range might be something like the X percentile, for each fish
% this will be different based on the range of behaviour in the recovery
% period (28:end in the 30 minute bin data)

% I get the percentiles: 

for i = 1:6
    geno1.PercentileMock(i,1:2)=prctile(geno1.MockNorm(28:end,i),[50 100]);
end

for i = 1:8
    geno2.PercentileMock(i,1:2)=prctile(geno2.MockNorm(28:end,i),[50 100]);
end

for i = 1:9
    geno3.PercentileMock(i,1:2)=prctile(geno3.MockNorm(28:end,i),[50 100]);
end

for i = 1:6
    geno1.PercentileAblated(i,1:2)=prctile(geno1.AblatedNorm(28:end,i),[50 100]);
end

for i = 1:8
    geno2.PercentileAblated(i,1:2)=prctile(geno2.AblatedNorm(28:end,i),[50 100]);
end

for i = 1:7
    geno3.PercentileAblated(i,1:2)=prctile(geno3.AblatedNorm(28:end,i),[50 100]);
end

%OK now I need to peg each to their own 50 percentile:

geno1.Ablated30PFIND=geno1.AblatedNorm
for i=1:length(geno1.AblatedNorm(:,1))
    for j=1:6
    if geno1.AblatedNorm(i,j)<geno1.PercentileAblated(j,1)
        geno1.Ablated30PFIND(i,j)=-1;
    end
    if geno1.AblatedNorm(i,j)>geno1.PercentileAblated(j,2)
        geno1.Ablated30PFIND(i,j)=-1;
    end
    end
end

geno2.Ablated30PFIND=geno2.AblatedNorm
for i=1:length(geno2.AblatedNorm(:,1))
    for j=1:8
    if geno2.AblatedNorm(i,j)<geno2.PercentileAblated(j,1)
        geno2.Ablated30PFIND(i,j)=-1;
    end
    if geno2.AblatedNorm(i,j)>geno2.PercentileAblated(j,2)
        geno2.Ablated30PFIND(i,j)=-1;
    end
    end
end

geno3.Ablated30PFIND=geno3.AblatedNorm
for i=1:length(geno3.AblatedNorm(:,1))
    for j=1:7
    if geno3.AblatedNorm(i,j)<geno3.PercentileAblated(j,1)
        geno3.Ablated30PFIND(i,j)=-1;
    end
    if geno3.AblatedNorm(i,j)>geno3.PercentileAblated(j,2)
        geno3.Ablated30PFIND(i,j)=-1;
    end
    end
end

geno1.Mock30PFIND=geno1.MockNorm
for i=1:length(geno1.MockNorm(:,1))
    for j=1:6
    if geno1.MockNorm(i,j)<geno1.PercentileMock(j,1)
        geno1.Mock30PFIND(i,j)=-1;
    end
    if geno1.MockNorm(i,j)>geno1.PercentileMock(j,2)
        geno1.Mock30PFIND(i,j)=-1;
    end
    end
end

geno2.Mock30PFIND=geno2.MockNorm
for i=1:length(geno2.MockNorm(:,1))
    for j=1:8
    if geno2.MockNorm(i,j)<geno2.PercentileMock(j,1)
        geno2.Mock30PFIND(i,j)=-1;
    end
    if geno2.MockNorm(i,j)>geno2.PercentileMock(j,2)
        geno2.Mock30PFIND(i,j)=-1;
    end
    end
end

geno3.Mock30PFIND=geno3.MockNorm
for i=1:length(geno3.MockNorm(:,1))
    for j=1:9
    if geno3.MockNorm(i,j)<geno3.PercentileMock(j,1)
        geno3.Mock30PFIND(i,j)=-1;
    end
    if geno3.MockNorm(i,j)>geno3.PercentileMock(j,2)
        geno3.Mock30PFIND(i,j)=-1;
    end
    end
end

for i=1:6
A=find(geno1.Ablated30PFIND(4:end,i)>-1)
geno1.Ablated30PREC(i)=A(1);
end

for i=1:8
A=find(geno2.Ablated30PFIND(4:end,i)>-1)
geno2.Ablated30PREC(i)=A(1);
end

for i=1:7
    A=find(geno3.Ablated30PFIND(4:end,i)>-1)
geno3.Ablated30PREC(i)=A(1);
end

for i=1:6
A=find(geno1.Mock30PFIND(4:end,i)>-1)
geno1.Mock30PREC(i)=A(1);
end

for i=1:8
A=find(geno2.Mock30PFIND(4:end,i)>-1)
geno2.Mock30PREC(i)=A(1);
end

for i=1:9
    A=find(geno3.Mock30PFIND(4:end,i)>-1)
geno3.Mock30PREC(i)=A(1);
end

Ablated30SURVIVEall3=[geno1.Ablated30PREC geno2.Ablated30PREC geno3.Ablated30PREC]
Mock30SURVIVEall3=[geno1.Mock30PREC geno2.Mock30PREC geno3.Mock30PREC]


figure;ecdf(Ablated30SURVIVEall3)
hold on
ecdf(Mock30SURVIVEall3)

% July 2025-- One last check-- maybe unfair to use daytime normalizing when
% the night data is most of the start of the plots... What if I make the
% cutoff be the nighttime threshold?




%OK now I want to show how the curves shift regardless of the benchmark
%that is chosen:

for q=1:100
for i = 1:6
    geno1.PercentileMockq(i,1:2,q)=prctile(geno1.MockNorm(28:end,i),[q 100]);
end

for i = 1:8
    geno2.PercentileMockq(i,1:2,q)=prctile(geno2.MockNorm(28:end,i),[q 100]);
end

for i = 1:9
    geno3.PercentileMockq(i,1:2,q)=prctile(geno3.MockNorm(28:end,i),[q 100]);
end

for i = 1:6
    geno1.PercentileAblatedq(i,1:2,q)=prctile(geno1.AblatedNorm(28:end,i),[q 100]);
end

for i = 1:8
    geno2.PercentileAblatedq(i,1:2,q)=prctile(geno2.AblatedNorm(28:end,i),[q 100]);
end

for i = 1:7
    geno3.PercentileAblatedq(i,1:2,q)=prctile(geno3.AblatedNorm(28:end,i),[q 100]);
end

end


%OK now I need to peg each to the full range:

[numRows, numCols] = size(geno1.AblatedNorm);
geno1.Ablated30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno1.Ablated30PFINDq(:,:,q) = geno1.AblatedNorm;  % Initialize the 3D matrix

    for i = 1:size(geno1.AblatedNorm, 1)
        for j = 1:6
            if geno1.AblatedNorm(i,j) < geno1.PercentileAblatedq(j,1,q)
                geno1.Ablated30PFINDq(i,j,q) = -1;
            end
            if geno1.AblatedNorm(i,j) > geno1.PercentileAblatedq(j,2,q)
                geno1.Ablated30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

%figure; hold on
%for q=1:100
%    plot(geno1.Ablated30PFINDq(:,2,q))
%end

[numRows, numCols] = size(geno2.AblatedNorm);
geno2.Ablated30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno2.Ablated30PFINDq(:,:,q) = geno2.AblatedNorm;  % Initialize the 3D matrix

    for i = 1:size(geno2.AblatedNorm, 1)
        for j = 1:8
            if geno2.AblatedNorm(i,j) < geno2.PercentileAblatedq(j,1,q)
                geno2.Ablated30PFINDq(i,j,q) = -1;
            end
            if geno2.AblatedNorm(i,j) > geno2.PercentileAblatedq(j,2,q)
                geno2.Ablated30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

[numRows, numCols] = size(geno3.AblatedNorm);
geno3.Ablated30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno3.Ablated30PFINDq(:,:,q) = geno3.AblatedNorm;  % Initialize the 3D matrix

    for i = 1:size(geno3.AblatedNorm, 1)
        for j = 1:7
            if geno3.AblatedNorm(i,j) < geno3.PercentileAblatedq(j,1,q)
                geno3.Ablated30PFINDq(i,j,q) = -1;
            end
            if geno3.AblatedNorm(i,j) > geno3.PercentileAblatedq(j,2,q)
                geno3.Ablated30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

[numRows, numCols] = size(geno1.MockNorm);
geno1.Mock30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno1.Mock30PFINDq(:,:,q) = geno1.MockNorm;  % Initialize the 3D matrix

    for i = 1:size(geno1.MockNorm, 1)
        for j = 1:6
            if geno1.MockNorm(i,j) < geno1.PercentileMockq(j,1,q)
                geno1.Mock30PFINDq(i,j,q) = -1;
            end
            if geno1.MockNorm(i,j) > geno1.PercentileMockq(j,2,q)
                geno1.Mock30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

%figure; hold on
%for q=1:100
%    plot(geno1.Mock30PFINDq(:,2,q))
%end

[numRows, numCols] = size(geno2.MockNorm);
geno2.Mock30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno2.Mock30PFINDq(:,:,q) = geno2.MockNorm;  % Initialize the 3D matrix

    for i = 1:size(geno2.MockNorm, 1)
        for j = 1:8
            if geno2.MockNorm(i,j) < geno2.PercentileMockq(j,1,q)
                geno2.Mock30PFINDq(i,j,q) = -1;
            end
            if geno2.MockNorm(i,j) > geno2.PercentileMockq(j,2,q)
                geno2.Mock30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

[numRows, numCols] = size(geno3.MockNorm);
geno3.Mock30PFINDq = zeros(numRows, numCols, 100);
for q = 1:100
    geno3.Mock30PFINDq(:,:,q) = geno3.MockNorm;  % Initialize the 3D matrix

    for i = 1:size(geno3.MockNorm, 1)
        for j = 1:9
            if geno3.MockNorm(i,j) < geno3.PercentileMockq(j,1,q)
                geno3.Mock30PFINDq(i,j,q) = -1;
            end
            if geno3.MockNorm(i,j) > geno3.PercentileMockq(j,2,q)
                geno3.Mock30PFINDq(i,j,q) = -1;  % FIX: use the same variable name
            end
        end
    end
end

% Now I find the survival value for each fish, under each condition:
for q=1:100

for i=1:6
A=find(geno1.Ablated30PFINDq(4:end,i,q)>-1)
geno1.Ablated30PRECq(i,q)=A(1);
end

for i=1:8
A=find(geno2.Ablated30PFINDq(4:end,i,q)>-1)
geno2.Ablated30PRECq(i,q)=A(1);
end

for i=1:7
    A=find(geno3.Ablated30PFINDq(4:end,i,q)>-1)
geno3.Ablated30PRECq(i,q)=A(1);
end

for i=1:6
A=find(geno1.Mock30PFINDq(4:end,i,q)>-1)
geno1.Mock30PRECq(i,q)=A(1);
end

for i=1:8
A=find(geno2.Mock30PFINDq(4:end,i,q)>-1)
geno2.Mock30PRECq(i,q)=A(1);
end

for i=1:9
    A=find(geno3.Mock30PFINDq(4:end,i,q)>-1)
geno3.Mock30PRECq(i,q)=A(1);
end


end

% for q=1:100
% Ablated30SURVIVEall3{q}=[geno1.Ablated30PRECq(:,q)' geno2.Ablated30PRECq(:,q)' geno3.Ablated30PRECq(:,q)']
% Mock30SURVIVEall3{q}=[geno1.Mock30PRECq(:,q)' geno2.Mock30PRECq(:,q)' geno3.Mock30PRECq(:,q)']
% end
% 
% Ablated30SURVIVEall3 = cell(1, 100);  % Preallocate as 1x100 cell array
% Mock30SURVIVEall3 = cell(1, 100);     % Same here
% 
% for q = 1:100
%     Ablated30SURVIVEall3{q} = [geno1.Ablated30PRECq(:,q)' ...
%                                geno2.Ablated30PRECq(:,q)' ...
%                                geno3.Ablated30PRECq(:,q)'];
%                            
%     Mock30SURVIVEall3{q} = [geno1.Mock30PRECq(:,q)' ...
%                             geno2.Mock30PRECq(:,q)' ...
%                             geno3.Mock30PRECq(:,q)'];
% end
% 
% 
% AblatedCurve = cell(1, 100);
% MockCurve = cell(1, 100);
% 
% for q = 1:100
%     [fAblated, ~] = ecdf(Ablated30SURVIVEall3{q});
%     [fMock, ~] = ecdf(Mock30SURVIVEall3{q});
% 
%     AblatedCurve{q} = fAblated;
%     MockCurve{q} = fMock;
% end
% 
% EC50 = 0.5;  % or whatever your target threshold is
% EC50_crossings = zeros(1,100);  % To store the x-values
% 
% for q = 1:100
%     f = AblatedF{q};
%     x = AblatedX{q};
% 
%     % Only interpolate if EC50 is within the CDF range
%     if EC50 >= min(f) && EC50 <= max(f)
%         EC50_crossings(q) = interp1(f, x, EC50, 'linear');
%     else
%         EC50_crossings(q) = NaN;  % Out of range
%     end
% end

AblatedCurveF = cell(1, 100);  % f (CDF values)
AblatedCurveX = cell(1, 100);  % x (data values)

MockCurveF = cell(1, 100);
MockCurveX = cell(1, 100);

for q = 1:100
    [fAblated, xAblated] = ecdf(Ablated30SURVIVEall3{q});
    [fMock, xMock] = ecdf(Mock30SURVIVEall3{q});

    AblatedCurveF{q} = fAblated;
    AblatedCurveX{q} = xAblated;

    MockCurveF{q} = fMock;
    MockCurveX{q} = xMock;
end

EC50 = 0.5;
Ablated_EC50_X = NaN(1, 100);  % Preallocate
Mock_EC50_X = NaN(1, 100);

for q = 1:100
    fA = AblatedCurveF{q};
    xA = AblatedCurveX{q};
    
    fM = MockCurveF{q};
    xM = MockCurveX{q};

    % Only interpolate if EC50 is within f's range
    if EC50 >= min(fA) && EC50 <= max(fA)
        Ablated_EC50_X(q) = interp1(fA, xA, EC50, 'linear');
    end

    if EC50 >= min(fM) && EC50 <= max(fM)
        Mock_EC50_X(q) = interp1(fM, xM, EC50, 'linear');
    end
end

% Want to grab and plot the average activity of the seizure fish after
% recovery to show there is no effect. 

DayAverageAblation= [nanmean(geno1.summarytable.averageActivity.day{1}(2:3,:)) nanmean(geno2.summarytable.averageActivity.day{1}(2:3,:)) nanmean(geno3.summarytable.averageActivity.day{1}(2:3,:))]
DayAverageMock= [nanmean(geno1.summarytable.averageActivity.day{2}(2:3,:)) nanmean(geno2.summarytable.averageActivity.day{2}(2:3,:)) nanmean(geno3.summarytable.averageActivity.day{2}(2:3,:))]

NightAverageAblation= [nanmean(geno1.summarytable.averageActivity.night{1}(2:3,:)) nanmean(geno2.summarytable.averageActivity.night{1}(2:3,:)) (geno3.summarytable.averageActivity.night{1}(2,:))]
NightAverageMock= [nanmean(geno1.summarytable.averageActivity.night{2}(2:3,:)) nanmean(geno2.summarytable.averageActivity.night{2}(2:3,:)) (geno3.summarytable.averageActivity.night{2}(2,:))]


