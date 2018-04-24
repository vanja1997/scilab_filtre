supported_formats = ["*.jp*g","JPG/JPEG format";"*.png","PNG format"];
demo = scf();
demo.figure_position = [100 100];
demo.figure_name = gettext("Projet de Filtre");
demo.axes_size = [750 550];


//MENU
delmenu(demo.figure_id,gettext("&File"));
delmenu(demo.figure_id,gettext("&Tools"));
delmenu(demo.figure_id,gettext("&Edit"));
delmenu(demo.figure_id,gettext("&?"));
delmenu(demo.figure_id,gettext("off"));

h1= uimenu("parent",demo,"label",gettext("Load Picture"),"callback","Load_Pic(supported_formats)");
h2= uimenu("parent",demo, "label",gettext("About"),"callback","Projet_About();");


//FUNCTIONS

//FUNCTION ABOUT
function Projet_About()
    msg = msprintf(gettext("Ce projet a été fait par Florian Bouissonnié et Vanja Plavsic pour le projet de L3"));
     messagebox(msg , gettext("About"),"info", "modal");
endfunction

//FUCTIONS LOAD PICTURE
function [base_image,S] = Load_Pic(supported_formats,handle)
	base_image = imread(uigetfile(supported_formats,"$HOME","Load picture"));
	S = base_image;
	imshow(S);
    handle.S = S;
    handle = resume(handle);
endfunction

//FUNCTION APPLY PICTURE
function [N] = Apply_Filter(filterlist,handle)
    if filterlist.Value ==2 then
		N = gaussianBlur(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle); 
		end
    if filterlist.Value ==3 then
		N = gradientsobel(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle); 
		end
    if filterlist.Value ==4 then
		N = gradientprewitt(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle); 
		end
    if filterlist.Value ==5 then
		N = gradientcanny(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle); 
		end
	if filterlist.Value ==6 then
		N = rvb2nb(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle); 
		end
    if filterlist.Value ==7 then
		N = demon(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==8 then
		N = zoom(handle.S,2);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==9 then
		N = flipImageVertic(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==10 then
		N = flipImageHoriz(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==11 then
		N = flipImageBoth(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==12 then
		N = negatif(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==13 then
		N = red(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==14 then
		N = green(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
    if filterlist.Value ==15 then
		N = blue(handle.S);
		imshow(N);
        handle.N = N;
        handle =resume(handle);
		end
endfunction

//FUNCTION REFRESH PICTURE
function [refreshed_image] = Refresh_Pic(handle)
     refreshed_image = handle.S;
     imshow(refreshed_image); 
endfunction

//FUNCTION SAVE PICTURE
function [] = Save_Pic(supported_formats,handle)
	imwrite(handle.N, uiputfile(supported_formats,"$HOME","Save picture"));
endfunction




//TITLE

Title = uicontrol(demo, "style", "text", ...
    "string", "PICTURE FILTERING", ...
    "fontsize", 14, ...
    "fontweight", "bold", ...
    "fontangle", "italic", ...
    "position", [300 275 150 30], ...
    "HorizontalAlignment", "center", ...
    "ForegroundColor", [1 0.0 0]);	
    
Category1 = uicontrol(demo, "style", "text", ...
    "string", "Filters", ...
    "fontsize", 14, ...
    "fontweight", "bold", ...
    "fontangle", "italic", ...
    "position", [70 400 200 30], ...
    "HorizontalAlignment", "center", ...
    "ForegroundColor", [1 0.0 0]);
    


    



//BUTTONS

//APPLY BUTTON
apply_button = uicontrol(demo, "style" , "pushbutton");
apply_button.String = "Apply";
apply_button.Position = [500 425 200 60];
apply_button.BackgroundColor=[0.9 0.9 0.9];
apply_button.Callback = "[current_s_image] = Apply_Filter(filterlist,handle)";
apply_button.ForegroundColor=[1 0 0];
apply_button.fontsize=14;

//REFRESH BUTTOM
refresh_button = uicontrol(demo, "style" , "pushbutton");
refresh_button.String = "Refresh";
refresh_button.Position = [500 325 200 60];
refresh_button.Callback = "[current_ns_image] = Refresh_Pic(handle);";
refresh_button.BackgroundColor=[0.9 0.9 0.9];
refresh_button.ForegroundColor=[1 0 0];
refresh_button.fontsize=14;

//SAVE BUTTON
save_button = uicontrol(demo, "style" , "pushbutton");
save_button.String = "Save";
save_button.Position = [500 175 200 60];
save_button.Callback = "Save_Pic(supported_formats,handle)";
save_button.BackgroundColor=[0.9 0.9 0.9];
save_button.ForegroundColor=[1 0 0];
save_button.fontsize=14;

//QUIT BUTTON
quit_button = uicontrol(demo, "style" , "pushbutton");
quit_button.String = "Quit";
quit_button.Position = [500 75 200 60];//1 = x , 2 = y 
quit_button.Callback = "delete(demo)";//3= largeur du boutton ,4=longueur du button 
quit_button.BackgroundColor=[0.9 0.9 0.9];
quit_button.ForegroundColor=[1 0 0];
quit_button.fontsize=14;

//FILTER LIST
filterlist=uicontrol(demo,"style","listbox");
filterlist.Position = [70 190 200 180];
filterlist.String = ["Choose","Gaussien","Sobel","Prewitt","Canny","Noir et blanc","Demon","Zoom","Flipvertical","Fliphorizontal" ,"Fliptotal","Negative","Red","Green","Blue"];
filterlist.Value = 1;
filterlist.BackgroundColor=[1 1 1];
filterlist.fontsize=14;







