dataDog = load('datafile.mat', 'dogImgSet');
dataNotDog = load('datafile.mat', 'beachImgSet');
X = [dataDog.dogImgSet;dataNotDog.beachImgSet];
X = [ones(size(X,1),1) X];
y = [ones(100,1);zeros(100,1)];

theta = zeros(size(X,2),1);
lambda = 1;

costPlot = zeros(500,1);

for i=1:500
    [cost, grad] = costFunctionReg(theta, X, y, lambda);
    theta = grad;
    costPlot(i) = cost;
end

%plot(cost);

%hold on;
%Put labels
%xlabel('Dog')
%ylabel ('NotDog')

%legend('y = 1', 'y = 0')
%hold off; 

p = predict(theta, X);
