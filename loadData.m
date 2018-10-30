#Load and save project path based on where this script exists
projectDirectory = strcat(mfilename('fullpath'), '\..')
#Load the provided file path
cd(projectDirectory);
#Change the directory dynamically as to load the DOG image set
cd(strcat(projectDirectory,'\dogSampleSet'));

#Change the directory dynamically as to load the BEACH image set
cd(strcat(projectDirectory,'\beachSampleSet'));

