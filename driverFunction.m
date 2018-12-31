dataDogTraining = load('datafile.mat', 'dogTrainingImgSet');
dataNotDogTraining = load('datafile.mat', 'catTrainingImgSet');
dataDogTest = load('datafile.mat', 'dogTestImgSet');
dataNotDogTest = load('datafile.mat', 'catTestImgSet');
X = [dataDogTraining.dogTrainingImgSet;dataNotDogTraining.catTrainingImgSet];
X = [ones(size(X,1),1) X];
y = [ones(100,1);zeros(100,1)];

XTest = [dataDogTest.dogTestImgSet;dataNotDogTest.catTestImgSet];
XTest = [ones(size(XTest,1),1) XTest];

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

p = predict(theta, XTest);

count = 0;
for i=1:100
    if p(i) == 1
        count=count+1;
    end
end
for i=101:200
    if p(i) == 0
        count=count+1;
    end
end

percentCorrect = (count / 200) * 100;
fprintf("Percent Correct: %f", percentCorrect);
