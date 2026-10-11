%Combining 3 salt stress experiments

%First set 260526_A6 = geno1  AblateSalt N=8 ; MockSalt N=5
%          260610_08 = geno2  AblateSlat N=5 ; MockSalt N=3
%           260617_08 = geno3 AblateSalt N=4 ; MockSalt N=4

% Open and merge around salt washout:
    % Salt wash timing:
            % geno1= 3081:3109
            % geno2= 1430:1438
            % geno3= 1469:1471
            
            
            
   
%  I take the 5 hours SaltON:
    
            SaltONablate1=geno1.avewaking{1}(3081-300:3080,:);
            SaltONablate2=geno2.avewaking{1}(1430-300:1429,:);
            SaltONablate3=geno3.avewaking{1}(1469-300:1468,:);
            SaltONablateALL=[SaltONablate1 SaltONablate2 SaltONablate3];
          
            SaltONmock1=geno1.avewaking{3}(3081-300:3080,:);
            SaltONmock2=geno2.avewaking{3}(1430-300:1429,:);
            SaltONmock3=geno3.avewaking{2}(1469-300:1468,:);
            SaltONmockALL=[SaltONmock1 SaltONmock2 SaltONmock3];
            
% And the 5 hours SaltOFF (two minutes cropped):
            
            SaltOFFablate1=geno1.avewaking{1}(3111:3111+300,:);
            SaltOFFablate2=geno2.avewaking{1}(1440:1440+300,:);
            SaltOFFablate3=geno3.avewaking{1}(1473:1473+300,:);
            SaltOFFablateALL=[SaltOFFablate1 SaltOFFablate2 SaltOFFablate3];
          
            SaltOFFmock1=geno1.avewaking{3}(3111:3111+300,:);
            SaltOFFmock2=geno2.avewaking{3}(1440:1440+300,:);
            SaltOFFmock3=geno3.avewaking{2}(1473:1473+300,:);
            SaltOFFmockALL=[SaltOFFmock1 SaltOFFmock2 SaltOFFmock3];
            
figure;plot(smooth(nanmean([SaltONmockALL; SaltOFFmockALL]'),10))
hold on
plot(smooth(nanmean([SaltONablateALL; SaltOFFablateALL]'),10))

% And a peek at the mocks:

%  I take the 5 hours SaltON:
    
            WaterONablate1=geno1.avewaking{2}(3081-300:3080,:);
            WaterONablate2=geno2.avewaking{2}(1430-300:1429,:);
            WaterONablateALL=[WaterONablate1 WaterONablate2];
          
            WaterONmock1=geno1.avewaking{4}(3081-300:3080,:);
            WaterONmock2=geno2.avewaking{4}(1430-300:1429,:);
            WaterONmockALL=[WaterONmock1 WaterONmock2];
            
% And the 5 hours WaterOFF (two minutes cropped):
            
            WaterOFFablate1=geno1.avewaking{2}(3111:3111+300,:);
            WaterOFFablate2=geno2.avewaking{2}(1440:1440+300,:);
            WaterOFFablateALL=[WaterOFFablate1 WaterOFFablate2 ];
          
            WaterOFFmock1=geno1.avewaking{4}(3111:3111+300,:);
            WaterOFFmock2=geno2.avewaking{4}(1440:1440+300,:);
            WaterOFFmockALL=[WaterOFFmock1 WaterOFFmock2];
            
figure;plot(smooth(nanmean([WaterONmockALL; WaterOFFmockALL]'),10))
hold on
plot(smooth(nanmean([WaterONablateALL; WaterOFFablateALL]'),10))  
  
wTRACESablate=([WaterONablateALL; WaterOFFablateALL]')
wTRACESmock=([WaterONmockALL; WaterOFFmockALL]')

figure;shadedErrorBar(1:601,smooth(nanmean(wTRACESmock),10),smooth(nanstd(wTRACESmock)./sqrt(8),10),'black')
hold on
shadedErrorBar(1:601,smooth(nanmean(wTRACESablate),10),smooth(nanstd(wTRACESablate)./sqrt(9),10),'red')
