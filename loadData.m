%Load and save project path based on where this script exists
projectDirectory = mfilename('fullpath');
projectDirectory = projectDirectory(1:length(mfilename('fullpath'))-8);
%Change directory to the project
cd(projectDirectory);

%Find and save the directory path dynamically for the DOG image set
dogTrainingDirectory = (strcat(projectDirectory,'\dogTrainingSet'));
%Test to make sure the folder loaded properly
if ~isfolder(dogTrainingDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', dogTrainingDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

dogTrainingFile = dir(fullfile(dogTrainingDirectory, '*.jpg'));
totalDogTrainingImages = numel(dogTrainingFile);
dogTrainingImgSet = zeros(100,51529);

for n = 1:totalDogTrainingImages
    d = fullfile(dogTrainingDirectory, dogTrainingFile(n).name);
    dogTrainingImages = imread(d); %Reads the folder of dog images
    resizedImg = imresize(dogTrainingImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    dogTrainingImgSet(n,:) = (unwrappedImg)';
end

%Find and save the directory path dynamically for the CAT image set
catTrainingDirectory = (strcat(projectDirectory,'\catTrainingSet'));
%Test to make sure the folder loaded properly
if ~isfolder(catTrainingDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', catTrainingDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

catTrainingFile = dir(fullfile(catTrainingDirectory, '*.jpg'));
totalCatTrainingImages = numel(catTrainingFile);
catTrainingImgSet = zeros(100,51529);

for n = 1:totalCatTrainingImages
    b = fullfile(catTrainingDirectory, catTrainingFile(n).name);
    catTrainingImages = imread(b); %Reads the folder of cat images
    resizedImg = imresize(catTrainingImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    catTrainingImgSet(n,:) = (unwrappedImg)';
end

%Find and save the directory path dynamically for the DOG image set
dogTestDirectory = (strcat(projectDirectory,'\dogTestSet'));
%Test to make sure the folder loaded properly
if ~isfolder(dogTestDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', dogTestDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

dogTestFile = dir(fullfile(dogTestDirectory, '*.jpg'));
totalDogTestImages = numel(dogTestFile);
dogTestImgSet = zeros(100,51529);

for n = 1:totalDogTestImages
    d = fullfile(dogTestDirectory, dogTestFile(n).name);
    dogTestImages = imread(d); %Reads the folder of dog images
    resizedImg = imresize(dogTestImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    dogTestImgSet(n,:) = (unwrappedImg)';
end

%Find and save the directory path dynamically for the CAT image set
catTestDirectory = (strcat(projectDirectory,'\catTestSet'));
%Test to make sure the folder loaded properly
if ~isfolder(catTestDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', catTestDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

catTestFile = dir(fullfile(catTestDirectory, '*.jpg'));
totalCatTestImages = numel(catTestFile);
catTestImgSet = zeros(100,51529);

for n = 1:totalCatTestImages
    b = fullfile(catTestDirectory, catTestFile(n).name);
    catTestImages = imread(b); %Reads the folder of cat images
    resizedImg = imresize(catTestImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    catTestImgSet(n,:) = (unwrappedImg)';
end

save('datafile','dogTrainingImgSet','catTrainingImgSet','dogTestImgSet','catTestImgSet');
