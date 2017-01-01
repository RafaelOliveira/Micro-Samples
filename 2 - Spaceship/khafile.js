let project = new Project('Spaceship');

project.addAssets('Assets');
project.addSources('Sources');
project.addSources('../Micro/Sources');

project.windowOptions.width = 512;
project.windowOptions.height = 512;

resolve(project);
