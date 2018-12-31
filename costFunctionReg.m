function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));
alpha = .0000001;

    %compute predictions
    prediction = sigmoid(X * theta);
    
    %regularization component
    regOffset = (lambda/(2*m)) * sum(theta(2:end) .^ 2);

    %compute cost and return
    J = (1/m) * sum(-y .* log(prediction) - (1-y) .* log(1 - prediction)) + regOffset;
    
    %compare the predicted value with the empirical value in 
    error = (prediction - y);
    
    %compute gradient
    grad(1) = theta(1) - (alpha/m)*sum(error.*X(:,1)); 
    grad(2:end)= theta(2:end) - ((alpha/m)*(error'*X(:,2:end)))'+(lambda/m)*theta(2:end);
    
    grad = grad(:);

% =============================================================

end
