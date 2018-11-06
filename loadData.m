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

for n = 1:totalDogImages
    d = fullfile(dogDirectory, dogFile(n).name);
    dogImages = imread(d); %Reads the folder of dog images
    [J, rect] = imcrop(dogImages); %Allows the user to crop(square) the images
    resizedImg = imresize(J, [227 227]); %Change the image dimensions
    
    figure (n);
    newDogFolder = fullfile(dogDirectory, sprintf('Dog #%d.png', n)); %Save the edited images
    imwrite(resizedImg, newDogFolder);
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

for n = 1:totalBeachImages
    b = fullfile(beachDirectory, beachFile(n).name);
    beachImages = imread(b); %Reads the folder of beach images
    [J, rect] = imcrop(beachImages); %Allows the user to crop(square) the images
    resizedImg = imresize(J, [227 227]); %Change the image dimensions
    
    figure (n);
    newBeachFolder = fullfile(beachDirectory, sprintf('Beach #%d.png', n)); %Save the edited images
    imwrite(resizedImg, newBeachFolder);
end


