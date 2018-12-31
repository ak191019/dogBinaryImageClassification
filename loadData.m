%Load and save project path based on where this script exists
projectDirectory = mfilename('fullpath');
projectDirectory = projectDirectory(1:length(mfilename('fullpath'))-8);
%Change directory to the project
cd(projectDirectory);

%Find and save the directory path dynamically for the DOG image set
dogDirectory = (strcat(projectDirectory,'\dogTrainingSet'));
%Test to make sure the folder loaded properly
if ~isfolder(dogDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', dogDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

dogFile = dir(fullfile(dogDirectory, '*.jpg'));
totalDogImages = numel(dogFile);
dogTrainingImgSet = zeros(100,51529);

for n = 1:totalDogImages
    d = fullfile(dogDirectory, dogFile(n).name);
    dogImages = imread(d); %Reads the folder of dog images
    resizedImg = imresize(dogImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    dogTrainingImgSet(n,:) = (unwrappedImg)';
end

%Find and save the directory path dynamically for the CAT image set
catDirectory = (strcat(projectDirectory,'\catTrainingSet'));
%Test to make sure the folder loaded properly
if ~isfolder(catDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', catDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

catFile = dir(fullfile(catDirectory, '*.jpg'));
totalCatImages = numel(catFile);
catTrainingImgSet = zeros(100,51529);

for n = 1:totalCatImages
    b = fullfile(catDirectory, catFile(n).name);
    catImages = imread(b); %Reads the folder of cat images
    resizedImg = imresize(catImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    catTrainingImgSet(n,:) = (unwrappedImg)';
end

save('datafile','dogTrainingImgSet','catTrainingImgSet');
