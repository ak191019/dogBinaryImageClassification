#Load and save project path based on where this script exists
projectDirectory = strcat(mfilename('fullpath'), '\..')
#Change directory to the project
cd(projectDirectory);

#Find and save the directory path dynamically for the DOG image set
dogDirectory = (strcat(projectDirectory,'\dogSampleSet'));
#Test to make sure the folder loaded properly
if ~isfolder(dogDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', dogDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

dogFile = dir(fullfile(dogDirectory, 'name*.jpg'));
totalDogImages = numel(dogFile);

for n = 1:totalImages
    f = fullfile(ImageFolder, fileName(n).name);
    dogImages = imread(f);
    figure(n);
    imshow(dogImages);
end

#Find and save the directory path dynamically for the BEACH image set
beachDirectory = (strcat(projectDirectory,'\beachSampleSet'));
#Test to make sure the folder loaded properly
if ~isfolder(beachDirectory)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', beachDirectory);
    uiwait(warndlg(errorMessage));
    return;
end

