let project = new Project('Collision');

project.addSources('Sources');
project.addSources('../Micro/Sources');

project.windowOptions.width = 512;
project.windowOptions.height = 512;

resolve(project);
