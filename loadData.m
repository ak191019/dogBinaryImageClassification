%Load and save project path based on where this script exists
projectDirectory = mfilename('fullpath');
projectDirectory = projectDirectory(1:length(mfilename('fullpath'))-8);
%Change directory to the project
cd(projectDirectory);

%Find and save the directory path dynamically for the DOG image set
dogDirectory = (strcat(projectDirectory,'\dogSampleSet'));
%Test to make sure the folder loaded properly
if ~isfolder(dogDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', dogDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

dogFile = dir(fullfile(dogDirectory, '*.jpg'));
totalDogImages = numel(dogFile);
dogImgSet = zeros(100,51529);

for n = 1:totalDogImages
    d = fullfile(dogDirectory, dogFile(n).name);
    dogImages = imread(d); %Reads the folder of dog images
    %[J, rect] = imcrop(dogImages); %Allows the user to crop(square) the images
    resizedImg = imresize(dogImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    dogImgSet(n,:) = (unwrappedImg)';
end

%Find and save the directory path dynamically for the BEACH image set
beachDirectory = (strcat(projectDirectory,'\beachSampleSet'));
%Test to make sure the folder loaded properly
if ~isfolder(beachDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', beachDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

beachFile = dir(fullfile(beachDirectory, '*.jpg'));
totalBeachImages = numel(beachFile);
beachImgSet = zeros(100,51529);

for n = 1:totalBeachImages
    b = fullfile(beachDirectory, beachFile(n).name);
    beachImages = imread(b); %Reads the folder of beach images
    %[J, rect] = imcrop(beachImages); %Allows the user to crop(square) the images
    resizedImg = imresize(beachImages, [227 227]); %Change the image dimensions
    greyScaleImg = rgb2gray(resizedImg);
    unwrappedImg = greyScaleImg(:);
    beachImgSet(n,:) = (unwrappedImg)';
end

save('datafile','dogImgSet','beachImgSet');
