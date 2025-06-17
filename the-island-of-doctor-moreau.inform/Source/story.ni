The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 1.
The story description is "The Island of Doctor Moreau".
The story creation year is 2024.

[WORDS -  6586]

Table of Releases
release	notes
"1"	""

Volume - Setup

Book - Extensions

Include Flexible Windows by Jon Ingold. [v15/170131]
Include Simple Graphical Window by Emily Short. [Requires v10/161003 to display images correctly with v15/170131 of Flexible Windows]
Include Basic Screen Effects by Emily Short. [v7/140425. Required to change status bar and display compass rose]
Include Basic Help Menu by Emily Short.
Include Punctuation Removal by Emily Short. [v5. Writing §17.21. Understanding mistakes]

Include Conversation Package by Eric Eve. [Contains Epistemology, Conversation Framework, Conversation Suggestions and Conversation Defaults extensions]
Include List Control by Eric Eve.

Book - User Interface

Part - Windows

Chapter - Setup

Section - Title Window

The title window is a graphics g-window spawned by the main window.
The position of the title window is g-placeabove.
The scale method of the title window is g-fixed-size.
The measurement of the title window is 670.

Section - Sidebar Window

The right-sidebar window is a graphics g-window spawned by the main window.
The position of the right-sidebar window is g-placeright.
The scale method of the right-sidebar window is g-fixed-size.
The measurement of the right-sidebar window is 290.

Section - Location Windows

The title-room window is a text grid g-window spawned by the right-sidebar window.
The position of the title-room window is g-placeabove.
The scale method of the title-room window is g-fixed-size.
The measurement of the title-room window is 2. 

The graphics-room window is a graphics g-window spawned by the right-sidebar window. 
The position of the graphics-room window is g-placeabove.
The scale method of the graphics-room window is g-fixed-size.
The measurement of the graphics-room window is 195.

The description-room window is a text buffer g-window spawned by the right-sidebar window. 
The position of the description-room window is g-placeabove.
The scale method of the description-room window is g-fixed-size.
The measurement of the description-room window is 9.

Section - Inventory Windows

The title-inventory window is a text grid g-window spawned by the right-sidebar window.
The position of the title-inventory window is g-placeabove.
The scale method of the title-inventory window is g-fixed-size.
The measurement of the title-inventory window is 2.

The list-inventory window is a text buffer g-window spawned by the right-sidebar window.
The position of the list-inventory window is g-placeabove.
The scale method of the list-inventory window is g-fixed-size.
The measurement of the list-inventory window is 12.

The graphics-inventory window is a graphics g-window spawned by the right-sidebar window.
The position of the graphics-inventory window is g-placeabove.
The scale method of the graphics-inventory window is g-fixed-size.
The measurement of the graphics-inventory window is 195.

The description-inventory window is a text buffer g-window spawned by the right-sidebar window.
The position of the description-inventory window is g-placeabove.
The scale method of the description-inventory window is g-fixed-size.
The measurement of the description-inventory window is 3.

Section - Help & Debug Windows

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
The measurement of the contents-debug window is 10. [5.]

Section - Map Windows

The map window is a graphics g-window spawned by the main window.
The position of the map window is g-placeabove.
The scale method of the map window is g-fixed-size.
The measurement of the map window is 452.

The entire-map window is a graphics g-window spawned by the main window.
The position of the entire-map window is g-placeabove.
The scale method of the entire-map window is g-fixed-size.
The measurement of the entire-map window is 966.

Section - Character Windows

The character-row window is a graphics g-window spawned by the main window.
The position of the character-row window is g-placeabove.
The scale method of the character-row window is g-fixed-size.
The measurement of the character-row window is 169.

The character-name window is a text grid g-window spawned by the main window.
The position of the character-name window is g-placeabove.
The scale method of the character-name window is g-fixed-size.
The measurement of the character-name window is 1.

The character-topic window is a text grid g-window spawned by the main window.
The position of the character-topic window is g-placeabove.
The scale method of the character-topic window is g-fixed-size.
The measurement of the character-topic window is 4. [5.]


Chapter - Rules

Section - Location Windows

Rule for refreshing the title-room window:
	say "[location]";

Rule for refreshing the graphics-room window:
	draw the illustration of the location in graphics-room window;

Rule for refreshing the description-room window:
	say "[description of location][paragraph break]";	
	before printing the locale description of a room (called the locale):
		focus description-room window;
	after printing the locale description of a room (called the locale):
		focus main window;

Section - Inventory Windows

Rule for refreshing the title-inventory window:
	if the current action is examining something (called E): [if the action name part of the current action is examining action:]
		if the player has the noun part of the current action:
			say "[noun]" in title case; [say "[noun part of the current action]" in title case;]
		else:
			say "You Are Carrying";
	else:
		say "You Are Carrying";

Rule for refreshing the list-inventory window (this is the update-list-inventory rule):
	if the current action is examining something (called E): [if the action name part of the current action is examining action:]
		if the player has the noun part of the current action:
			say "[description of E][line break]"; [say "[description of the noun part of the current action][line break]";]
		else:
			try taking inventory;
	else:
		try taking inventory;
	refresh the title-inventory window;

Rule for refreshing the description-inventory window (this is the update-description-inventory rule):
	if the current action is examining something (called E): 
		if the player has the noun part of the current action:
			say "[description of E][line break]"; 
		else:
			now display-inventory-illustration is false;
			follow the Change Inventory Windows rules;
			try taking inventory;
	else:
		now display-inventory-illustration is false;
		follow the Change Inventory Windows rules;
		try taking inventory;
	refresh the graphics-inventory window;
	refresh the title-inventory window;
	
Rule for refreshing the graphics-inventory window:
	if the current action is examining something (called E): 
		if the player has the noun part of the current action:
			draw the illustration of the noun part of the current action in the graphics-inventory window;

Rule for refreshing the description-inventory window:
	if the current action is examining something (called E):
		if the player has the noun part of the current action:
			say "[description of E][line break]"; 
		else:
			try taking inventory;
	else:
		try taking inventory;
	refresh the title-inventory window;

Section - Help & Debug Windows

Rule for refreshing the title-help window:
	say "Help";
	
Rule for refreshing the contents-help window:
	say "";
		
Rule for refreshing the title-debug window:
	say "DEBUG".

obj is an object variable.

Rule for refreshing the contents-debug window:
	say "";
	showme location;
	showme width of map window;
	[repeat through the Table of Debug Variables:
		if there is a display entry:
			if the data entry is:
				-- "location": now obj is location;
				-- "width of map window": now obj is width of map window;
			[]
			say "[label entry]: [obj][line break]";]

Section - Map Windows
	
x-calculated-coordinate is a number that varies.
current-map is a figure name that varies.

Rule for refreshing the map window:
	[Draw the map section for the current location]
	repeat through the Table of Room Map Locations:
		if the room entry is the location:
			now current-map is the map-section entry; ["let current-map be the map-section entry" doesn't work.]
			draw the map-section entry in the map window;
	[Draw icons for other visible locations in same map section that are not player's current location - unvisited, visited, visited w/ room-specific icon]
	repeat through the Table of Room Map Locations:
		now x-calculated-coordinate is ( x-coordinate entry * width of map window ) / [907;] 693; [changed from let/be in line below]
		if the room entry is not the location:
			if there is a display entry:
				if the map-section entry is the current-map: [map-section of the location:]
					if the room entry is visited:
						if there is an icon entry:
							draw the icon entry in the map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
						otherwise:
							draw the Figure of Icon-Visited-Location in the map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
					otherwise:
						draw the Figure of Icon-Unknown-Location in the map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
		otherwise:
			draw the Figure of Icon-Player-Location in the map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
	[Draw the map width indicator icon]
	if the width of map window <= 910:
		if the width of map window >= 890:
			draw the Figure of Map-Width-Good in the map window at x 2 and y 430 scaled to width 20 and height 20;
		otherwise:
			draw the Figure of Map-Width-Bad in the map window at x 2 and y 430 scaled to width 20 and height 20;
	otherwise:
		draw the Figure of Map-Width-Bad in the map window at x 2 and y 430 scaled to width 20 and height 20;

Rule for refreshing the entire-map window:
	draw the Figure of Entire-Island in the entire-map window;
	repeat through the Table of Room Main Map Locations:
		now x-calculated-coordinate is (x-coordinate entry * width of entire-map window ) / 693;
		if the room entry is the location:
			draw the Figure of Icon-Player-Location in the entire-map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
		otherwise:
			if there is a display entry:
				if the room entry is visited:
					if there is an icon entry:
						draw the icon entry in the entire-map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
					otherwise:
						draw the Figure of Icon-Visited-Location in the entire-map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;
				otherwise:
					draw the Figure of Icon-Unknown-Location in the entire-map window at x x-calculated-coordinate and y y-coordinate entry scaled to width 20 and height 20;

Section - Character Windows
	
flag-switch is a number that varies.
flag-switch is [0.] 1.	
	
image-x is a number that varies.
					
Rule for refreshing the character-row window:
	if flag-switch is:
		-- 0: [Sample images]
			draw the Figure of Moreau in the character-row window at x 0 and y 0 scaled to width 127 and height 169;
			draw the Figure of Beast-People in the character-row window at x 128 and y 0 scaled to width 224 and height 169;
			draw the Figure of Dogman in the character-row window at x 353 and y 0 scaled to width 127 and height 169;
			draw the Figure of Montgomery in the character-row window at x 481 and y 0 scaled to width 127 and height 169;
			draw the Figure of Moreau-Assistant in the character-row window at x 609 and y 0 scaled to width 127 and height 169;
		-- 1:
			[clear the character-row window;] [This doesn't clear the window of previous images. Why?]
			draw Figure of Blank-Character-Row in the character-row window at x 0 and y 0;
			now image-x is 0;
			repeat through the Table of Character Display Information:
				if the location of the people entry is the location of the player:
					if there is an image entry:
						if the type entry is "Portrait":
							draw the image entry in the character-row window at x image-x and y 0 scaled to width 127 and height 169;
							now image-x is image-x + 127;
						otherwise:
							draw the image entry in the character-row window at x image-x and y 0 scaled to width 224 and height 169;
							now image-x is image-x + 224;

portrait-name-length is a number that varies.
portrait-name-length is 11.
			
landscape-name-length is a number that varies.
landscape-name-length is 19.
	
padding-needed is a number that varies.
				
Rule for refreshing the character-name window:
	if flag-switch is:
		-- 0: [Sample text]
			[say "011111111111022222222222222222220333333333330444444444440555555555550";]
			say "   Moreau       Beast People       Dogman    MONTGOMERY   Assistant  ";
		-- 1:
			clear the character-name window;
			say " ";
			repeat through the Table of Character Display Information:
				if the location of the people entry is the location of the player:
					let name-length be number of characters in display-name entry;
					if the type entry is "Portrait":
						now padding-needed is portrait-name-length - name-length;
					otherwise:
						now padding-needed is landscape-name-length - name-length;
					let prefix-padding be padding-needed / 2;
					repeat with counter running from 1 to prefix-padding:
						say " ";
					if the current interlocutor is the people entry:
						say "[display-name entry]" in upper case;
					otherwise:
						say "[display-name entry]";
					let suffix-padding be padding-needed - prefix-padding;
					repeat with counter running from 1 to suffix-padding:
						say " ";
					say " ";

To say demo-person: say "Montgomery";

Rule for refreshing the character-topic window:
	if flag-switch is:
		-- 0: [Sample text]
			say "[line break][roman type] ASK [demo-person] about: [italic type]The Beast People | Dogman | Moreau [line break][roman type] TELL [demo-person] about: [italic type]Dogman | Moreau[line break][roman type] ASK [demo-person] for: [italic type]";
			[say "[italic type]                         SOME SUGGESTED CONVERSATION TOPICS[line break][line break][roman type] ASK about: [italic type]The Beast People | Dogman | Moreau [line break][roman type] TELL about: [italic type] Dogman | Moreau";]
		-- 1:
			[say " ";]
			try listing suggested topics;



Chapter - Styles

Table of User Styles (continued)
window	reversed 	style name	color	italic	relative size
character-name	true 	--	--	--	--
character-topic	false	--	--	--	--


[all-styles	"#FF0000"	true	--
header-style	"#0000FF"	false	1
special-style-1	"#00FF00"]

[ from Flexible Window.i7x
Table of User Styles
window (a g-window)	
style name (a glulx text style)	
background color (a text)	
color (a text)	
first line indentation (a number)	
fixed width (a truth state)	
font weight (a font weight)	
indentation (a number)	
italic (a truth state)	
justification (a text justification)	
relative size (a number)	
reversed (a truth state)
]

Part - Status Line

[The original code was taken from the Improved Status Line section of "Bronze" by Emily Short and modified slightly. 
 See https://i7-examples.github.io/Bronze/source_43.html for the original code.]

Table of User Styles (continued)
window	style name	background color
all-grid-windows	special-style-1	"#FFFFFF" ["#FF0000" - Red]

Table of Fancy Status
left	central	right
" "	"[story description]"	" "
" "	" "	"                [top rose]"
" "	" "	"       [middle rose]"
" "	" "	"       [bottom rose]"

Table of Empty Status
left	central	right
" "	"[story description]"	" "
" "	" "	" "
" "	" "	" "
" "	" "	" "

When play begins: 
	now right alignment depth is 25;
	fill status bar with Table of Empty Status;

To say red reverse:
	say special-style-1;

To say default letters:
	say roman type;

Definition: a room is discernible:
	[if it is the River Bank and the Balcony is unvisited and the River Bank is unvisited, no;
	if it is the River Bank and the Balcony is unvisited and the River Bank is visited, yes;
	if it is the River Bank and the Balcony is visited and the River Bank is unvisited, yes;
	if it is the River Bank and the Balcony is visited and the River Bank is visited, yes;
	if it is the Top Well and the metal cover is on the circular well, no;
	if it is the Domed Building and the player is in the time machine, no;]
	yes.

To say top rose:
	let place be the room up from the location;
	if the place is a discernible room, say "[if the place is unvisited][red reverse][end if]U [default letters]"; otherwise say "  "; [Added one additional space to otherwise say]
	let place be the room northwest from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]NW [default letters]"; otherwise say "   "; [Added two additional spaces to otherwise say]
	let place be the room north from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]N [default letters]"; otherwise say "  "; [Added one additional space to otherwise say]
	let place be the room northeast from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]NE[default letters]"; otherwise say " ".

To say middle rose:
	say "           "; [Added one additional space to say; added nine additional spaces]
	let place be the room west from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]W [default letters]"; otherwise say "  ";
	say " . ";
	let place be the room east from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if] E[default letters]"; otherwise say "  ".

To say bottom rose:
	say "         "; [Added nine additional spaces]
	let place be the room down from the location;
	if the place is a discernible room, say "[if the place is unvisited][red reverse][end if]D [default letters]"; otherwise say "  "; [Added one additional space to otherwise say]
	let place be the room southwest from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]SW [default letters]"; otherwise say "   "; [Added two additional spaces to otherwise say]
	let place be the room south from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]S [default letters]"; otherwise say "  "; [Added one additional space to otherwise say]
	let place be the room southeast from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]SE[default letters]"; otherwise say " ".

Rule for constructing the status line:
	if time of day is 9:00 AM:
		fill status bar with Table of Empty Status;
		rule succeeds;
	otherwise:
		fill status bar with Table of Fancy Status;
		say default letters;
		rule succeeds;
		
Chapter - Banner Text

Section - Printing

Rule for printing the banner text:
	if the time of day is not 9:00 AM:
		say "";
	otherwise:
		continue the action;

Section - Removing Extra Lines

The initial whitespace rule does nothing.

Part - Rule Modifications

Chapter - Rooms

Section - Room Heading

This is the modified room description heading rule:
	refresh the title-room window;

The modified room description heading rule substitutes for the room description heading rule.

Section - Room Description

This is the modified room description body text rule:
	refresh the description-room window;

The modified room description body text rule substitutes for the room description body text rule.

Section - Room Graphics

[The display room graphics rule is listed in the every turn rules.] [Made this an explicit call in Beginning The Story | Every Turn section]

This is the display room graphics rule:
	refresh the graphics-room window;

Chapter - Examine

Section - Standard Examine

Before examining something:
	if the player has the noun part of the current action:
		if the illustration of the noun part of the current action is not Figure of No-Image:
			now display-inventory-illustration is true;
		otherwise:
			now display-inventory-illustration is false;
		follow the Change Inventory Windows rules;
		if display-inventory-illustration is false:
			refresh the list-inventory window;
		otherwise:
			refresh the description-inventory window;
		stop the action;
	otherwise:
		continue the action;

Book - Instead Of Rules

Instead of taking inventory:
	if the number of things enclosed by the player is 0:
		say "";
	otherwise:
		list the contents of the player, with newlines;

Book - After Rules

After going to a room (this is the check illustration rule):
	if the illustration of location is not Figure of No-Image:
		now display-room-illustration is true;
	otherwise:
		now display-room-illustration is false;
	follow the Change Location Windows rules;
	continue the action;

After reading a command:
	clear the main window;
	say "[command prompt][bold type][player's command] [roman type][line break]";
	
Book - Out Of World Actions

Part - Graphics Mode

[graphics-mode is a truth state that varies.
graphics-mode is true.]

Part - Debug Mode

debug-mode is a truth state that varies.
debug-mode is [true.] false.

Switch debug mode is an action out of world.

Report switch debug mode:
	if debug-mode is true:
		now debug-mode is false;
		close contents-debug window;
		close title-debug window;
	otherwise:
		now debug-mode is true;
		open title-debug window;
		open contents-debug window;

Understand "debug" as switch debug mode.

Chapter - Debug Display Table

[data can't be value that varies according to compiler]

Table 3 - Debug Variables
display	label	data
true	"Player Location"	"location"
--	"Map Window Width"	"width of map window"
--	"Debug Mode"	"debug-mode"
-- 	"Help Mode"	"help-mode"
--	"Display Room Illustration"	"display-room-illustration"
--	"Display Inventory Illustration"	"display-inventory-illustration"
--	"Entire Map Window Width"	"width of entire-map-window"
--	"x-calculated-coordinate"	"x-calculated-coordinate"
--	"Action"	"action name part of current action"
--	"Noun"	"noun part of the current action"
	


Part - Help Mode

[help-mode exists in other parts of the code so it has not been commented out but it has been set to false.]
[Currently, we'll be using Emily Short's Basic Help Menu extension to display instructions and help in the main window.]

help-mode is a truth state that varies.
help-mode is false. [true.]

[The code that shows and hides the Help window has been commented out.]

[Switch help mode is an action out of world.

Report switch help mode:
	if help-mode is true:
		now help-mode is false;
		if debug-mode is true:
			close contents-debug window;
			close title-debug window;
		close contents-help window;
		close title-help window;
		if debug-mode is true:
			open title-debug window;
			open contents-debug window;
	otherwise:
		now help-mode is true;
		if debug-mode is true:
			close contents-debug window;
			close title-debug window;
		open title-help window;
		open contents-help window;
		if debug-mode is true:
			open title-debug window;
			open contents-debug window;

Understand "help" as switch help mode.]

Part - Map Mode

Request map mode is an action out of world.
Report request map mode:
	follow the Show Map rules;

Understand "map" as request map mode.
Understand "show map" as request map mode.
Understand "show entire map" as request map mode.

Chapter - Show Map Rulebook

Show Map is a rulebook.
A show map rule:
	close map window;
	close character-row window;
	close character-name window;
	open entire-map window;
	refresh entire-map window;
	pause the game;
	close entire-map window;
	open map window;
	open character-row window;
	open character-name window;
	refresh map window;

Part - Change Current Location Windows

[Had to use "location" instead of "room" in places to get code to compile]

display-room-illustration is a truth state that varies.
display-room-illustration is true.

Chapter - Change Location Windows Rulebook

Change Location Windows is a rulebook.

A change location windows rule (this is the change orientation of location windows rule):
	if debug-mode is true: [close debug windows]
		close contents-debug window; 
		close title-debug window;
	if help-mode is true: [close help windows]
		close contents-help window;
		close title-help window;
	[Close Inventory windows]
	close list-inventory;
	close title-inventory;
	[Modify Room windows]
	close description-room window;
	if display-room-illustration is false:
		close graphics-room window;
		now the measurement of the description-room window is 18;
		open description-room window;
		refresh description-room window;
	otherwise:
		open graphics-room window;
		refresh graphics-room window;
		now the measurement of the description-room window is 9;
		open description-room window;
		refresh description-room window;
	[Open Inventory windows]
	open title-inventory window;
	if display-inventory-illustration is false:
		open list-inventory window;
	otherwise:
		open graphics-inventory window;
		open description-inventory window;
	if help-mode is true: [open help windows]
		open title-help window;
		open contents-help window;
	if debug-mode is true: [open debug windows]
		open title-debug window;
		open contents-debug window;

 Part - Change Inventory Windows

display-inventory-illustration is a truth state that varies.
display-inventory-illustration is false.

Chapter - Change Inventory Windows Rulebook

Change Inventory Windows is a rulebook.

Change Inventory Windows is a rulebook.
A change inventory windows rule:
	if debug-mode is true: [close debug windows]
		close contents-debug window;
		close title-debug window;
	if help-mode is true: [close help windows]
		close contents-help window;
		close title-help window;
	[Close Inventory contents window]
	close title-inventory window;
	close list-inventory window;
	close graphics-inventory window;
	close description-inventory window;
	[Close Room windows]
	close title-room window;
	close graphics-room window;
	close description-room window;
	open title-room window;
	if display-room-illustration is true:
		open graphics-room window;
		now the measurement of the description-room window is 9;
		open description-room window;
	otherwise:
		now the measurement of the description-room window is 18;
		open description-room window;
	[Modify Inventory contents windows]
	open title-inventory window;
	if display-inventory-illustration is true: 
		open graphics-inventory window;
		open description-inventory window;
	otherwise:
		open list-inventory window;
	if help-mode is true: [open help windows]
		open title-help window;
		open contents-help window;
	if debug-mode is true: [open debug windows]
		open title-debug window;
		open contents-debug window;

Book - Release

Release along with an interpreter. [and source text.]

Volume - Beginning The Story

Before starting the virtual machine:
	now the current graphics drawing rule is the standard placement [centered scaled drawing] [fully scaled drawing] [tiled drawing] rule; 

Book - Player Location

The player is in the Beach. [Compass Location.]

Book - When Play Begins

When play begins:
	close the graphics window;
	open the title window;
	draw Figure of Title in title window;
	say "[banner text]";
	pause the game;
	close the title window;
	open right-sidebar window;
	open title-room window;
	open graphics-room window;
	open description-room window;
	open title-inventory window; 
	open list-inventory window;
	if help-mode is true:
		open title-help window;
		open contents-help window;
	if debug-mode is true:
		open title-debug window;
		open contents-debug window;
	open map window;
	now the time of day is time of day plus 1 minute;
	[say "[introduction]";]
	now suggest-on-greeting is false.

Book - Every Turn

Every turn:
	if display-inventory-illustration is false:
		refresh the list-inventory window;
	otherwise:
		refresh the description-inventory window;
	if debug-mode is true:
		refresh the contents-debug window;
	refresh the map window;
	let people-in-the-room be the list of people who are not the player in the location of the player;
	if the number of entries in people-in-the-room is greater than zero:
		open the character-row window;
		open the character-name window;
		refresh the character-row window;
		refresh the character-name window;
	otherwise:
		close the character-name window;
		close the character-row window;
	if the current interlocutor is not nothing:
		if the character-topic window is g-unpresent:
			open the character-topic window;
		refresh the character-topic window;
	otherwise:
		close the character-topic window;
	silently try looking;


Volume - Figures

Figure of No-Image is the file "NO-IMAGE-0.png".

A room has a figure name called illustration.
The illustration of room is usually Figure of No-Image.

A thing has a figure name called illustration.
The illustration of a thing is usually Figure of No-Image.

Book - Title

Figure of Title is the file "the-dream-0.png".

Book - Mapping

Figure of Map-Island-1 is the file "mapgen4-195-1-gray.png".
Figure of Map-Island-2 is the file "mapgen4-195-2-gray.png".

Figure of Entire-Island is the file "mapgen4-195-gray.png".

Book - Icons

Figure of Icon-Player-Location is the file "icon-player-location-0.png".

Figure of Icon-Unknown-Location is the file "icon-unknown-location-0.png".
Figure of Icon-Visited-Location is the file "icon-visited-location-0.png".

Figure of Icon-Ruins is the file "icon-ruins-0.png".
Figure of Icon-Volcanic-Caldera is the file "icon-volcanic-caldera-0.png".

Figure of Map-Width-Good is the file "map-width-good.png".
Figure of Map-Width-Bad is the file "map-width-bad.png".

Book - Rooms

Figure of Beach-0 is the file "beach-0.png".
Figure of Jungle-0 is the file "jungle-0.png".
Figure of Ruins-0 is the file "ruins-0.png".
Figure of Muddy-Path-0 is the file "muddy-path-0.png".
Figure of Volcanic-Caldera-0 is the file "volcanic-caldera-0.png".

Figure of Deep-Jungle-0 is the file "deep-jungle-0.png".

Figure of Hidden-Valley-0 is the file "hidden-valley-0.png".

Figure of Moreau-Compound-0 is the file "moreau-compound-0.png".

Book - Things

Figure of Knife-0 is the file "knife-0.png".

Book - Characters

Figure of Blank-Character-Row is the file "character-row-blank-0.png".

Figure of Montgomery is the file "character-montgomery-0.png".
Figure of Dogman is the file "character-dogman-0.png".
Figure of Beast-People is the file "character-beast-people-0.png".

Figure of Moreau is the file "character-moreau-0.png".
Figure of Moreau-Assistant is the file "character-moreau-assistant-0.png".
Figure of Hybrid-Creature is the file "character-hybrid-creature-0.png".

Book - Scenes


Volume - Rooms

Book - Map Display Information

[
Ever room in the game should have a table entry. 
The following columns are required - map-section, x-coordinate; y-coordinate.
The following columns are optional - icon; display.
To use a custom visited icon for a room, set icon to a Figure of XYZ.
To display a room icon on the map, set display to true.
]

[When map window height is 452 with 2-segment map]
Table 1 - Room Map Locations
room	map-section	x-coordinate	y-coordinate	icon	display
Beach	Figure of Map-Island-1	195	235	--	true
Jungle	Figure of Map-Island-1	195	205	--	true
Ruins	Figure of Map-Island-1	150	205	Figure of Icon-Ruins	true
Muddy Path	Figure of Map-Island-1	225	205	--	--
Volcanic Caldera	Figure of Map-Island-1	285	275	Figure of Icon-Volcanic-Caldera	true
Deep Jungle	Figure of Map-Island-1	300	115	--	true
Hidden Valley	Figure of Map-Island-2	375	345	--	true
Moreau-Compound	Figure of Map-Island-2	375	225	--	true

[For main map]
Table 2 - Room Main Map Locations
room	x-coordinate	y-coordinate	icon	display
Beach	190	724	--	true
Jungle	190	694	--	true
Ruins	145	694	Figure of Icon-Ruins	true
Muddy Path	220	694	--	--
Volcanic Caldera	285	766	Figure of Icon-Volcanic-Caldera	true
Deep Jungle	300	604	--	true
Hidden Valley	375	373	--	true
Moreau-Compound	375	250	--	true


Book - Beach

The Beach is a room. 

The description of the Beach is "This is the beach."

The illustration of the Beach is Figure of Beach-0.

Book - Jungle

The Jungle is a room. The Jungle is north of the Beach.

The description of the Jungle is "This is the jungle."

The illustration of the Jungle is Figure of Jungle-0.

Book - Ruins

The Ruins are a room. The Ruins are west of the Jungle.

The description of the Ruins are "These are the ruins."

The illustration of the Ruins are Figure of Ruins-0.

Book - Muddy Path

The Muddy Path is a room. The Muddy Path is east of the Jungle and northwest of the Volcanic Caldera.

The description of the Muddy Path is "This is a narrow, muddy path."

[The illustration of the Muddy Path is Figure of Muddy-Path-0.]

Book - Volcanic Caldera

The Volcanic Caldera is a room. The Volcanic Caldera is southeast of the Muddy Path.

The description of the Volcanic Caldera is "This is the volcanic caldera."

The illustration of the Volcanic Caldera is Figure of Volcanic-Caldera-0.

Book - Deep Jungle

The Deep Jungle is a room. The Deep Jungle is northeast of the Jungle.

The description of the Deep Jungle is "This is the Deep Jungle."

The illustration of the Deep Jungle is Figure of Deep-Jungle-0.

Book - Hidden Valley

The Hidden Valley is a room. The Hidden Valley is north of the Deep Jungle.

The description of the Hidden Valley is "This is the Hidden Valley."

The illustration of the Hidden Valley is Figure of Hidden-Valley-0.

Book - Moreau Compound

The Moreau-Compound is a room. The Moreau-Compound is north of the Hidden Valley.

The description of the Moreau-Compound is "This is the ruined laboratory compound of Dr. Moreau." The printed name of Moreau-Compound is "Moreau's Compound".

The illustration of the Moreau-Compound is Figure of Moreau-Compound-0.

Book - Regions


Volume - Characters

Book - Character Display Information

[
Order of characters in table determines how they appear in the character-row window, left to right, if they are in same room.

But I might want to use the position column to handle this explicitly.

For example, if Montgomery's position was 2, Moreau's position was 1, and Dogman's position was 3, if Moreau and Montgomery appeared in the same room Moreau would be displayed first, then Montgomery. If all three characters were in the same room, the display order would be Moreau, Montgomery, and Dogman.
]

Table 3 - Character Display Information
people	image	display-name	type	displayed	position
Montgomery	Figure of Montgomery	"Montgomery"	"Portrait"	false	0
Beast People	Figure of Beast-People	"Beast People"	"Landscape"	false	0
Dogman	Figure of Dogman	"Dogman"	"Portrait"	false	0
Moreau	Figure of Moreau	"Moreau"	"Portrait" 	false	0
Hybrid Creature	Figure of Hybrid-Creature	"Hybrid Creature"	"Landscape"	false	0
Assistant	Figure of Moreau-Assistant	"Assistant"	"Portrait"	false	0
Ghost	--	"Ghost"	"Portrait"	false	0

Book - Familiarity

Moreau is familiar.
Dogman is familiar.

Book - Subjects

Book - Montgomery

Montgomery is a person.
Montgomery is male.

Montgomery is in the Ruins.

Part - Conversation

Chapter - Suggestions

The ask-suggestions are { Dogman, Moreau, self-suggestion }.

Chapter - Hello

Chapter - Goodbye

Chapter - Ask/Tell/Show/Give Responses

Section - Requests - "Ask [someone] for [thing]"

Section - Quizzing - "Ask [someone] about [thing]"

Section - Informing - "Tell [someone] about [thing]"

Section - Imploring - "Ask [someone] for ['text']"

Section - Showing

Section - Giving

Chapter - Default Responses

Chapter - Testing


Book - Dogman

The Dogman is a person.
The Dogman is male.
The indefinite article of the Dogman is "the".

The Dogman is in the Ruins [Muddy Path] [Deep Jungle].

Part - Conversation

Chapter - Suggestions

The ask-suggestions are { Montgomery, Moreau, self-suggestion }.

Chapter - Hello

Chapter - Goodbye

Chapter - Ask/Tell/Show/Give Responses

Section - Requests - "Ask [someone] for [thing]"

Section - Quizzing - "Ask [someone] about [thing]"

Section - Informing - "Tell [someone] about [thing]"

Section - Imploring - "Ask [someone] for ['text']"

Section - Showing

Section - Giving

Chapter - Default Responses

Chapter - Testing

Book - Beast People

The Beast People are people.
The Beast People are neuter.
The Beast People are plural-named.

The Beast People are in the Deep Jungle.

Book - Moreau

Moreau is a person.
Moreau is male.

Moreau is in Moreau-Compound.

Book - Assistant

Assistant is a person.
Assistant is neuter.
The printed name of Assistant is "Moreau's Assistant". 

Assistant is in Moreau-Compound.

Book - Hybrid Creature

Hybrid Creature is a person.
Hybrid Creature is neuter.

Hybrid Creature is in Moreau-Compound.

Book - Ghost

Ghost is a person.
Ghost is neuter.

[Ghost is in the Ruins] [Muddy Path].

Book - CONVERSATION TEMPLATE

Part - Conversation

Chapter - Suggestions

Chapter - Hello

Chapter - Goodbye

Chapter - Ask/Tell/Show/Give Responses

Section - Requests - "Ask [someone] for [thing]"

Section - Quizzing - "Ask [someone] about [thing]"

Section - Informing - "Tell [someone] about [thing]"

Section - Imploring - "Ask [someone] for ['text']"

Section - Showing

Section - Giving

Chapter - Default Responses

Chapter - Testing


Volume - Things

Book - Rusty Knife

The rusty knife is a thing.

The description of the knife is "An old, worn out sheath knife that probably won't keep an edge."

The illustration of the rusty knife is Figure of Knife-0.

The rusty knife is in the Jungle.

Book - Piece of Red Cloth

The piece of red cloth is a thing.

The description of the piece of red cloth is "A tattered piece of red cloth."

The piece of red cloth is in the Muddy Path.

Volume - Scenes



Volume - Tests

Book - General

Test me with "north / take knife / west / east / east / take cloth / southeast / northwest / west / south / examine knife".
Test me2 with "test me / north / northeast / north".
Test me3 with "test me / north / west / examine knife".

Test bug with "north / take knife / east/ take cloth".

Book - Compass Test Room

[This code is used just to test the positioning and appearance of the compass rose in the status bar.]

Compass Location is a room. 

To The North is a room. To The North is north of the Compass Location.
To The South is a room. To The South is south of the Compass Location.
To The West is a room. To The West is west of the Compass Location.
To The East is a room. To The East is east of the Compass Location.

To The Northeast is a room. To The Northeast is northeast of the Compass Location.
To The Northwest is a room. To The Northwest is northwest of the Compass Location.
To The Southeast is a room. To The Southeast is southeast of the Compass Location.
To The Southwest is a room. To The Southwest is southwest of the Compass Location.

Up Above is a room. Up Above is up from the Compass Location.
Down Below is a room. Down Below is down from the Compass Location. 


Volume - Utilities

Book - Missing Item Description Check

[Checks for missing item descriptions]
[
When play begins (this is the run property checks at the start of play rule): 
	repeat with item running through things: 
		if description of the item is "":
			say "[item] has no description."

[Writing §20.5. Matching and exact matching]	
[Writing §20.6. Regular expresssion matching]		
			
When play begins (this is the run TBD checks at the start of play rule):
	repeat with item running through things:
		if description of item matches the text "TBD":
			say "[item] description TBD."
]


Volume - Help

