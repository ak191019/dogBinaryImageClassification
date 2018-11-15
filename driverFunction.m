dataDog = load('datafile.mat', 'dogImgSet');
dataNotDog = load('datafile.mat', 'beachImgSet');
X = [dataDog.dogImgSet;dataNotDog.beachImgSet];
y = [ones(100,1);zeros(100,1)];

initial_theta = zeros(size(X,2),1);
lambda = 1;

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, J, exit_flag] = ...
fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

p = predict(theta, X);
