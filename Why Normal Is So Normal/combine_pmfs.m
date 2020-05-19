function [S,mean,sigma] = combine_pmfs(P,Q)
%P and Q are assumed to be 2D arrays
% first column contains possible values of the RV
% second column contains corresponding probabilities
%S, the convolution of P,Q will also be returned in the same format
% size of S = (size(P,1),size(Q,1)-1, 2 )

S = 10^10*ones(size(P,1)+size(Q,1)-1,2); % intialising S to a high value

count = 1;
for i =1:size(P,1)
    for j= 1:size(Q,1)
        tval = P(i,1)+ Q(j,1);
        tprob =  P(i,2)*Q(j,2);
        
        % if the sum value does not exist then add both tval and tprob
        % to S else only update probability
 
        if size(find(S(:,1)==tval),1)==0
            S(count,1) = tval;
            S(count,2) = tprob;
            count = count+1;
        else
            k = find(S(:,1)==tval);
            S(k,2) =  S(k,2) + tprob;
        end
    end 
end
% Calculating mean of S
mean = S(:,1)'*S(:,2);
% Calculating Standard Deviation of S
S1 = S;
S1(:,1) = (S1(:,1) - mean);
sigma = sqrt((S1(:,1).^2)'*S1(:,2));
end

