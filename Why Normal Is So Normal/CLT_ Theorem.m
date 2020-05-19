
close all
clear all
%% Defining Two Discrete Uniforms X1 and X2
x1 = 0:1; % domain of X1
x2 = 0:1; % domain of X2

pX1 =1/2*ones(1,2); % pmf of X1
pX2 = 1/2*ones(1,2); %pmf of X2
% Vectorize the domain and corresponding probabilities into a 2D array

X1 = [x1;pX1]';  
X2 = [x2;pX2]';



%% Plotting the PMF of Sum of  X1 and X2 n number of times 
% Adding Random variable implies convolving their PMFs 
P=X1;
Q=X2;

h = figure()
set(gcf,'color','w');
for i=1:49
    
    [S,mean,sigma] = combine_pmfs(Q,P);   
    % At each iteration i, a normal having mean and sigma as that of the sum of i random variable is plot 
    % Hence mean of Normal = mean of S and sigma of the normal = sigma of S
    pd = makedist('Normal','mu',mean,'sigma',sigma);
    x = min(S(:,1)):0.1:max(S(:,1));
    y = pdf(pd,x);
    plot(x,y,'r--')
    hold on
    
    plot(S(:,1),S(:,2),'b-o','MarkerFaceColor',[0,0.5,1])
    legend('Normal','p_{S_{n}}(s)')
    xlabel('s')
    title(['S_{n} = X_{1}+X_{2}+X_{3}+X_{4}.......+X_{n}, n = ',num2str(i+1)])
    make_animation( h,i,'CLT_convergence.gif')
    pause(0.5)
    Q = S;
    hold off
    
end


%% Plotting uniform distribution
figure(2)
set(gcf,'color','w');
stem(X1(:,1),X2(:,2),'b','o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[0,0,1])
xlabel('x')
ylabel('p_{X}(x)')
xlim([-.5,1.5])
ylim([0,1])
title('PMF of a Uniform RV')
saveas(gcf,'Uniform_distribution.png')

%% Plotting Normal distribution for mean = 0 different sigmas
figure(3)
set(gcf,'color','w');
sig = [1,sqrt(2),2,sqrt(8)]; % value of sigma
for i = 1:size(sig,2)
     pd = makedist('Normal','mu',0,'sigma',sig(i));
     x = -10:0.1:10;
     y = pdf(pd,x);
     plot(x,y)
     legend('\sigma^2 = 1','\sigma^2 = 2', '\sigma^2= 4','\sigma^2= 8' )
     xlabel('x')
     ylabel('f_{X}(x)')
     title('Normal Distributions with \mu = 0')
     hold on
     saveas(gcf,'NormalPlot.png')
end











