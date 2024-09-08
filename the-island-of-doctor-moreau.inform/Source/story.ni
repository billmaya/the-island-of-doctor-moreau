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

The right-sidebar window is a graphics g-window spawned by the main window.
The position of the right-sidebar window is g-placeright.
The scale method of the right-sidebar window is g-fixed-size.
The measurement of the right-sidebar window is 290.

The character-graphics window is a graphics g-window spawned by the right-sidebar window.
The position of the character-graphics window is g-placeabove.
The scale method of the character-graphics window is g-fixed-size.
The measurement of the character-graphics window is 240.

The title-characters window is a text grid g-window spawned by the right-sidebar window.
The position of the title-characters window is g-placeabove.
The scale method of the title-characters window is g-fixed-size.
The measurement of the title-characters window is 2. 

The contents-characters window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-characters window is g-placeabove.
The scale method of the contents-characters window is g-fixed-size.
The measurement of the contents-characters window is 9. [12.] [4.] [8.]

The title-talking-to window is a text grid g-window spawned by the right-sidebar window.
The position of the title-talking-to window is g-placeabove.
The scale method of the title-talking-to window is g-fixed-size.
The measurement of the title-talking-to window is 2. 

The talking-to-character window is a text buffer g-window spawned by the right-sidebar window.
The position of the talking-to-character window is g-placeabove.
The scale method of the talking-to-character window is g-fixed-size.
The measurement of the talking-to-character window is 3.

The title-help window is a text grid g-window spawned by the right-sidebar window.
The position of the title-help window is g-placeabove.
The scale method of the title-help window is g-fixed-size.
The measurement of the title-help window is 2.

The contents-help window is a text buffer g-window spawned by the right-sidebar window.
The position of the contents-help window is g-placeabove.
The scale method of the contents-help window is g-fixed-size.
The measurement of the contents-help window is 9.

The title-inventory window is a text grid g-window spawned by the right-sidebar window.
The position of the title-inventory window is g-placeabove.
The scale method of the title-inventory window is g-fixed-size.
The measurement of the title-inventory window is 2.

The list-inventory window is a text buffer g-window spawned by the right-sidebar window.
The position of the list-inventory window is g-placeabove.
The scale method of the list-inventory window is g-fixed-size.
The measurement of the list-inventory window is [10.] 9. [16.]

The debug-title window is a text grid g-window spawned by the right-sidebar window.
The position of the debug-title window is g-placeabove.
The scale method of the debug-title window is g-fixed-size.
The measurement of the debug-title window is 2.

The debug-info window is a text buffer g-window spawned by the right-sidebar window.
The position of the debug-info window is g-placeabove.
The scale method of the debug-info window is g-fixed-size.
The measurement of the debug-info window is 9.

The map window is a graphics g-window spawned by the main window.
The position of the map window is g-placeabove.
The scale method of the map window is g-fixed-size.
The measurement of the map window is 240.

Section - Rules

Rule for refreshing the title-characters window:
	say "Name (Room, Character,[line break]or Object)";
	[let X be the list of people who are major that are not the player in the location of the player;
	if  X is not empty:
		say "People You Can Talk To By[line break]Saying 'Hello' To Them";
	otherwise:
		say "".]

Rule for refreshing the contents-characters window:
	say "Description or Actions of Name.";
	[let X be the list of people who are major that are not the player in location of player;
	if X is not empty:
		say "[X]";
	otherwise:
		say "".]

Rule for refreshing the title-talking-to window:
	say "[if the current interlocutor is not nothing]You Are Now Talking To[line break]This Person[otherwise][end if]".
	
Rule for refreshing the talking-to-character window:
	if current interlocutor is not nothing:
		say current interlocutor.
	
Rule for refreshing the title-help window:
	say "Help";
	[say "[if the current interlocutor is not nothing]Some Things You Can Talk[line break]About With [current interlocutor][otherwise][end if]".]
	
Rule for refreshing the contents-help window:
	say "Typing > HELP in the main window will display context-sensitive help here.";
	[if current interlocutor is not nothing:
		try listing suggested topics;
	otherwise:
		say "".]
	
Rule for refreshing the title-inventory window:
	say "Inventory". 
	
Rule for refreshing the list-inventory window:
	[let L be the list of things carried by the player;
	Let N be the number of entries in L;
	now the measurement of the list-inventory window is N + 2;]
	try taking inventory.

Rule for refreshing the debug-title window:
	say "DEBUG".
[
Rule for refreshing the character-graphics window:
	if graphics-mode is true:
		let people-in-room be the list of people who are major that are not the player in the location of the player;
		if the number of entries in people-in-room is greater than zero:
			if entry 1 of people-in-room is Weena, draw Figure of Weena in character-graphics window;
			if entry 1 of people-in-room is Humboldt, draw Figure of Humboldt in character-graphics window;
			if entry 1 of people-in-room is Gernsback, draw Figure of Gernsback in character-graphics window;
			if entry 1 of people-in-room is Eloi, draw Figure of Eloi in character-graphics window;
			if entry 1 of people-in-room is Watchett, draw Figure of Watchett in character-graphics window;
		otherwise:
			if the numeric-year is 1895, draw Figure of 1895 in character-graphics window; [TBD Why are these two draw lines necessary]
			if the numeric-year is 802701, draw Figure of 802701 in character-graphics window; [to clear the character-graphics window?]
			clear character-graphics window;
]

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
	[if graphics-mode is true:]
	open character-graphics window;
	open title-characters window;
	open contents-characters window;
	[refresh the character-graphics window;]
	open title-inventory window; 
	open list-inventory window;
	open title-help window;
	open contents-help window;
	if debug-mode is true:
		open debug-title window;
		open debug-info window;
	open map window;
		[follow Update Debug rule;]
	[now the time of day is 10:00 PM;]
	[say "[introduction]";]
	[now suggest-on-greeting is false.]

Volume - Figures

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

