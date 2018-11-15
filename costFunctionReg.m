function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

    %compute predictions
    prediction = sigmoid(X * theta);
    
    %regularization component
    regOffset = (lambda/(2*m)) * sum(theta(2:size(theta)) .^ 2);

    %compute cost and return
    J = (1/m) * sum(-y .* log(prediction) - (1-y) .* log(1 - prediction)) + regOffset;
    
    %compare the predicted value with the empirical value in 
    error = (prediction - y);
    
    %compute gradient
    grad = (1/m) * sum((X' * error),2) + (lambda/m).*theta;
    %adjust theta zero
    grad(1) = grad(1) - (lambda/m)*theta(1);

% =============================================================

end
