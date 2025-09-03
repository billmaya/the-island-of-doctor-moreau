The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 3.
The story description is "The Island of Doctor Moreau".
The story creation year is 2024.

[WORDS -  5478]

Table of Releases
release	notes
"1"	"Onscreen 1/2 map & full-screen map both with icons. Resize map indicator. 
		    Room windows-title, graphics, description. 
		    Inventory windows-title, list, graphic, description.
		    Character windows-row, name, topics (displayed when needed). 
		    >map : Display full-screen map. 
		    >graphics : Turns graphics mode on/off.
		    >help : Displays help window.
		    >debug : Displays debug window"
"2"		"Window display/hide code commented out: title-character, title-room, map. 
            Map width indicator code commented out. 
            Room name moved to status bar.
		  Disabled graphics-mode.
		  Disabled >map|show map|show entire map.
		  Added scroll-mode."
 
Volume - Setup

Book - Extensions

Include Flexible Windows by Jon Ingold. [v15/170131]
Include Simple Graphical Window by Emily Short. [Requires v10/161003 to display images correctly with v15/170131 of Flexible Windows]
Include Basic Screen Effects by Emily Short. [v7/140425. Required to change status bar and display compass rose]
Include Basic Help Menu by Emily Short.
Include Punctuation Removal by Emily Short. [v5. Writing §17.21. Understanding mistakes]

Include Conversation Package by Eric Eve.
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
The measurement of the contents-debug window is 10.

Section - Character Windows

The character-row window is a graphics g-window spawned by the main window.
The position of the character-row window is g-placeabove.
The scale method of the character-row window is g-fixed-size.
The measurement of the character-row window is 169.

The character-name window is a text grid g-window spawned by the main window.
The position of the character-name window is g-placeabove.
The scale method of the character-name window is g-fixed-size.
The measurement of the character-name window is 1.

The character-topic window is a text buffer g-window spawned by the main window.
The position of the character-topic window is g-placeabove.
The scale method of the character-topic window is g-fixed-size.
The measurement of the character-topic window is 3.

Chapter - Rules

Section - Location Windows

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
	[showme width of map window;]
	[repeat through the Table of Debug Variables:
		if there is a display entry:
			if the data entry is:
				-- "location": now obj is location;
				-- "width of map window": now obj is width of map window;
			[]
			say "[label entry]: [obj][line break]";]

Section - Character Windows
	
image-x is a number that varies.
					
Rule for refreshing the character-row window:
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
	[say "[line break]";]
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
" "	" "	"[location]"

Table of Empty Status
left	central	right
" "	"[story description]"	" "
" "	" "	" "
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
		
Part - Banner Text

Chapter - Printing

Rule for printing the banner text:
	if the time of day is not 9:00 AM:
		say "";
	otherwise:
		continue the action;

Chapter - Removing Extra Lines

The initial whitespace rule does nothing.

Part - Rule Modifications

Chapter - Rooms

Section - Room Heading

This is the modified room description heading rule:
	if graphics-mode is false:
		focus main window;
		say "[bold type][location][roman type]";
		continue the action;
		
The modified room description heading rule substitutes for the room description heading rule.

Section - Room Description

This is the modified room description body text rule:
	if graphics-mode is true:
		refresh the description-room window;
	otherwise:
		focus main window;
		say "[description of location][paragraph break]";
		continue the action;

The modified room description body text rule substitutes for the room description body text rule.

Section - Room Graphics

[The display room graphics rule is listed in the every turn rules.] [Made this an explicit call in Beginning The Story | Every Turn section]

This is the display room graphics rule:
	if graphics-mode is true:
		refresh the graphics-room window;

Chapter - Examine

Section - Standard Examine

Before examining something:
	if graphics-mode is true:
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
		[focus main window;]
		continue the action;

Book - Instead Of Rules

Instead of taking inventory:
	if graphics-mode is true:
		if the number of things enclosed by the player is 0:
			say "";
		otherwise:
			list the contents of the player, with newlines;
	otherwise:
		continue the action;


Book - After Rules

After going to a room (this is the check illustration rule):
	if graphics-mode is true:
		if the illustration of location is not Figure of No-Image:
			now display-room-illustration is true;
		otherwise:
			now display-room-illustration is false;
		follow the Change Location Windows rules;
		continue the action;
	otherwise:
		continue the action;

After reading a command:
	[if graphics-mode is true:]
	if scroll-mode is false:
		clear the main window;
		say "[command prompt][bold type][player's command] [roman type][line break]";
	otherwise:
		continue the action;
	
Book - Out Of World Actions

Part - Graphics Mode

graphics-mode is a truth state that varies.
graphics-mode is [false.] true.

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

[This adds a blank row to the status bar when >help is called]
Table of Deep Menu Status (continued)
left	central	right
""	""	""

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
	
Part - Scroll Mode

[If scroll-mode is false, only one command and its results will be displayed in the main window (main window is cleared by After reading a command: code]

scroll-mode is a truth state that varies.
scroll-mode is false. [true.]

Part - Change Current Location Windows

[Had to use "location" instead of "room" in places to get code to compile]

display-room-illustration is a truth state that varies.
display-room-illustration is true.

Chapter - Change Location Windows Rulebook

Change Location Windows is a rulebook.

A change location windows rule (this is the change orientation of location windows rule):
	if graphics-mode is true:
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
	if graphics-mode is true:
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
		[close title-room window;]
		close graphics-room window;
		close description-room window;
		[open title-room window;]
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
	if graphics-mode is true:
		open the right-sidebar window;
		open the graphics-room window;
		open the description-room window;
		open the title-inventory window; 
		open the list-inventory window;
		if help-mode is true:
			open the title-help window;
			open the contents-help window;
		if debug-mode is true:
			open the title-debug window;
			open the contents-debug window;
	now the time of day is time of day plus 1 minute;
	[say "[introduction]";]
	now suggest-on-greeting is false.

Book - Every Turn

Every turn:
	if graphics-mode is true:
		if display-inventory-illustration is false:
			refresh the list-inventory window;
		otherwise:
			refresh the description-inventory window;
		if debug-mode is true:
			refresh the contents-debug window;
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
	otherwise:
		continue the action;


Volume - Figures

Figure of No-Image is the file "NO-IMAGE-0.png".

A room has a figure name called illustration.
The illustration of room is usually Figure of No-Image.

A thing has a figure name called illustration.
The illustration of a thing is usually Figure of No-Image.

Book - Title

Figure of Title is the file "the-dream-0.png".

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

rusty knife is familiar.
piece of red cloth is familiar.

Book - Subjects

Book - Montgomery

Montgomery is a person.
Montgomery is male.

Montgomery is in the Ruins.

Part - Conversation

Chapter - Suggestions

The ask-suggestions are { Dogman, Moreau, self-suggestion }.
The tell-suggestions are { rusty knife, piece of red cloth }.

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
Test me4 with "test me3 / say hello to dogman / examine knife".

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

