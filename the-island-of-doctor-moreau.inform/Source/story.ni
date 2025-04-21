The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 1.
The story description is "The Island of Doctor Moreau".
The story creation year is 2024.

[WORDS - 5347]

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

[Include Conversation Package by Eric Eve.] [Contains Epistemology, Conversation Framework, Conversation Suggestions and Conversation Defaults extensions]
[Include Conversation Rules by Eric Eve.] [Contains Epistemology, Conversation Framework, and List Control]

Book - User Interface

Part - Windows

Chapter - Setup

The title window is a graphics g-window spawned by the main window.
The position of the title window is g-placeabove.
The scale method of the title window is g-fixed-size.
The measurement of the title window is 670.

The map window is a graphics g-window spawned by the main window.
The position of the map window is g-placeabove.
The scale method of the map window is g-fixed-size.
The measurement of the map window is 452.

The entire-map window is a graphics g-window spawned by the main window.
The position of the entire-map window is g-placeabove.
The scale method of the entire-map window is g-fixed-size.
The measurement of the entire-map window is 966.

The right-sidebar window is a graphics g-window spawned by the main window.
The position of the right-sidebar window is g-placeright.
The scale method of the right-sidebar window is g-fixed-size.
The measurement of the right-sidebar window is 290.

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

The character-row window is a graphics g-window spawned by the main window.
The position of the character-row window is g-placeabove.
The scale method of the character-row window is g-fixed-size.
The measurement of the character-row window is 169.

[The left-sidebar window is a text grid g-window spawned by the main window.
The position of the left-sidebar window is g-placeleft.
The scale method of the left-sidebar window is g-fixed-size.
The measurement of the left-sidebar window is 10.]

Chapter - Rules

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
		[otherwise:
			display the illustration of the noun part of the current action in the main window;]

Rule for refreshing the description-inventory window:
	if the current action is examining something (called E):
		if the player has the noun part of the current action:
			say "[description of E][line break]"; 
		else:
			try taking inventory;
	else:
		try taking inventory;
	refresh the title-inventory window;

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
	[showme width of entire-map window;]
	[showme x-calculated-coordinate;]
	[]
	[say "Player location: [location][line break]";
	say "Map window width: [width of map window][line break]";]
	[]
	[repeat through the Table of Debug Variables:
		if there is a display entry:
			if the data entry is:
				-- "location": now obj is location;
				-- "width of map window": now obj is width of map window;
			[]
			say "[label entry]: [obj][line break]";]
	
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
		[focus main window;
		say "[room entry]: [x-calculated-coordinate][line break]";
		focus map window;]
		[now x-calculated-coordinate is (x-coordinate entry / 693) * width of map window;]
		[let x-calculated-coordinate be ( x-coordinate entry * width of map window ) / 693;]
		[let x-calculated-coordinate be ( x-coordinate of the location / 693 ) * width of map window;] [For relative coordinates. Doesn't appear to work/ x-c-c = 0]
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
			[focus main window;
			say "[width of map window]";
			focus map window;]
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
			
Rule for refreshing the character-row window:
	draw the Figure of Sample-Characters in the character-row window;

Chapter - Styles

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
	
Book - Out Of World Actions

Part - Graphics Mode

[graphics-mode is a truth state that varies.
graphics-mode is true.]

Part - Debug Mode

debug-mode is a truth state that varies.
debug-mode is true. [false.]

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
	open entire-map window;
	refresh entire-map window;
	pause the game;
	close entire-map window;
	open map window;
	open character-row window;
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

[Release along with an interpreter.] [and source text.]

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
	[open left-sidebar window;]
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
	open character-row window;
	refresh the map window;
	refresh the graphics-room window;
	refresh the character-row window;
	now the time of day is time of day plus 1 minute;
	[say "[introduction]";]
	[now suggest-on-greeting is false.]

Book - Every Turn

Every turn:
	if display-inventory-illustration is false:
		refresh the list-inventory window;
	otherwise:
		refresh the description-inventory window;
	if debug-mode is true:
		refresh the contents-debug window;
	refresh the map window;
	refresh the character-row window;
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

Figure of Map-Island-1 is the file "mapgen4-195-1.png".
Figure of Map-Island-2 is the file "mapgen4-195-2.png".

Figure of Entire-Island is the file "mapgen4-195.png".

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

Figure of Sample-Characters is the file "character-row-sample-lost.png".

Book - Scenes


Volume - Rooms

Book - Mapping

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
Moreau Compound	Figure of Map-Island-2	375	225	--	true

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
Moreau Compound	375	250	--	true


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

The Moreau Compound is a room. The Moreau Compound is north of the Hidden Valley.

The description of the Moreau Compound is "This is the ruined laboratory compound of Dr. Moreau." The printed name of Moreau Compound is "Moreau's Compound".

The illustration of the Moreau Compound is Figure of Moreau-Compound-0.

Book - Regions


Volume - Characters


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

