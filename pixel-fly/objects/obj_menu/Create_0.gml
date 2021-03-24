#macro QUIT_OPTION true
#macro browser:QUIT_OPTION false

selected = 0;

options[0] = "Play";
options[1] = "Guide";
options[2] = "Flydex";
if (QUIT_OPTION) {
	options[3] = "Quit";
}