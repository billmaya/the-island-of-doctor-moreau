The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 1.
The story description is "".
The story creation year is 2024.

[WORDS - 1372]

Table of Releases
release	notes
"1"	""

Volume - Setup

Part - Missing Item Description Check



Part - Extensions

Include Flexible Windows by Jon Ingold.
Include Simple Graphical Window by Emily Short. [Requires v10/161003 to display images correctly; v15/170131 of Flexible Windows]
Include Basic Screen Effects by Emily Short. [Required to change status bar and display compass rose]
Include Basic Help Menu by Emily Short.
Include Punctuation Removal by Emily Short. [Writing §17.21. Understanding mistakes]

[Include Conversation Package by Eric Eve.] [Contains Epistemology, Conversation Framework, Conversation Suggestions and Conversation Defaults extensions]

Include Conversation Rules by Eric Eve. [Contains Epistemology, Conversation Framework, and List Control]

Part - User Interface

Chapter - Windows

Section - Setup

The map window is a graphics g-window spawned by the main window.
The position of the map window is g-placeabove.
The scale method of the map window is g-fixed-size.
The measurement of the map window is 240.

The right-sidebar window is a graphics g-window spawned by the main window.
The position of the right-sidebar window is g-placeright.
The scale method of the right-sidebar window is g-fixed-size.
The measurement of the right-sidebar window is 290.

The graphics-object window is a graphics g-window spawned by the right-sidebar window.
The position of the graphics-object window is g-placeabove.
The scale method of the graphics-object window is g-fixed-size.
The measurement of the graphics-object window is 240.

The title-object window is a text grid g-window spawned by the right-sidebar window.
The position of the title-object window is g-placeabove.
The scale method of the title-object window is g-fixed-size.
The measurement of the title-object window is 2. 

The contents-object window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-object window is g-placeabove.
The scale method of the contents-object window is g-fixed-size.
The measurement of the contents-object window is 9.

The title-inventory window is a text grid g-window spawned by the right-sidebar window.
The position of the title-inventory window is g-placeabove.
The scale method of the title-inventory window is g-fixed-size.
The measurement of the title-inventory window is 2.

The contents-inventory window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-inventory window is g-placeabove.
The scale method of the contents-inventory window is g-fixed-size.
The measurement of the contents-inventory window is [10.] 9. [16.]

The title-help window is a text grid g-window spawned by the right-sidebar window.
The position of the title-help window is g-placeabove.
The scale method of the title-help window is g-fixed-size.
The measurement of the title-help window is 2.

The contents-help window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-help window is g-placeabove.
The scale method of the contents-help window is g-fixed-size.
The measurement of the contents-help window is 9.

The title-debug window is a text grid g-window spawned by the right-sidebar window.
The position of the title-debug window is g-placeabove.
The scale method of the title-debug window is g-fixed-size.
The measurement of the title-debug window is 2.

The contents-debug window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-debug window is g-placeabove.
The scale method of the contents-debug window is g-fixed-size.
The measurement of the contents-debug window is 9.

Section - Rules

Rule for refreshing the title-object window:
	say "title-object[line break](Room, Character, Object)";

Rule for refreshing the contents-object window:
	say "contents-object[line break]title-object Description or Action.";
	
Rule for refreshing the title-help window:
	say "title-help[line break]Help";
	
Rule for refreshing the contents-help window:
	say "contents-help[line break]Typing > HELP in the main window will display context-sensitive help here.";
	
Rule for refreshing the title-inventory window:
	say "title-inventory[line break]Inventory". 
	
Rule for refreshing the contents-inventory window:
	[try taking inventory.]
	say "list-inventory";

Rule for refreshing the title-debug window:
	say "title-debug[line break]DEBUG".
	
Rule for refreshing the contents-debug window:
	say "contents-debug[line break]Debugging info goes here.";	

Rule for refreshing the graphics-object window:
	draw Figure of Beach-0 in graphics-object window;
	
Rule for refreshing the map window:
	draw Figure of Map-Island-1 in map window;

Section - Styles

Chapter - Status Line

Section  - Compass Test Room

Part - Out Of World Actions

Chapter - Graphics Mode

graphics-mode is a truth state that varies.
graphics-mode is true.

Chapter - Debug Mode

Volume - Beginning The Story

debug-mode is a truth state that varies.
debug-mode is [false.] true.

When play begins:
	close the graphics window;
	open right-sidebar window;
	open graphics-object window;
	open title-object window;
	open contents-object window;
	open title-inventory window; 
	open contents-inventory window;
	open title-help window;
	open contents-help window;
	open map window;
	if debug-mode is true:
		open title-debug window;
		open contents-debug window;
	refresh the map window;
	refresh the graphics-object window;
	[now the time of day is 10:00 PM;]
	[say "[introduction]";]
	[now suggest-on-greeting is false.]

Volume - Figures

Book - Testing

Figure of Beach-0 is the file "beach-0.png".
Figure of Map-Island-1 is the file "island-1.png".
Figure of Map-Island-2 is the file "island-2.png".
Figure of Map-Island-3 is the file "island-3.png".
Figure of Map-Island-4 is the file "island-4.png".
Figure of Map-Island-5 is the file "island-5.png".
Figure of Map-Island-6 is the file "island-6.png".
Figure of Map-Island-7 is the file "island-7.png".
Figure of Map-Island-8 is the file "island-8.png".

Book - Settings



Book - Characters



Book - Things



Book - Scenes



Volume - Settings

Example Location is a room. 

Book - Regions



Volume - Characters



Volume - Things


Volume - Scenes



Volume - Help

