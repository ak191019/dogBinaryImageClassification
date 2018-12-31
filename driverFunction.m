dataDog = load('datafile.mat', 'dogTrainingImgSet');
dataNotDog = load('datafile.mat', 'catTrainingImgSet');
X = [dataDog.dogTrainingImgSet;dataNotDog.catTrainingImgSet];
X = [ones(size(X,1),1) X];
y = [ones(100,1);zeros(100,1)];

theta = zeros(size(X,2),1);
lambda = 1;

numIterations = 2000;

costPlot = zeros(numIterations,1);

for i=1:numIterations
    [cost, grad] = costFunctionReg(theta, X, y, lambda);
    theta = grad;
    costPlot(i) = cost;
end

%plot(cost);

%hold on;
%Put labels
%xlabel('Cost')
%ylabel ('Number of Iterations')
%hold off; 

p = predict(theta, X);
