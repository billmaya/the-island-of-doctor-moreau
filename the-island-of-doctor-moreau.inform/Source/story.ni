The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 1.
The story description is "The Island of Doctor Moreau".
The story creation year is 2024.

[WORDS - 3328]

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

Include Conversation Rules by Eric Eve. [Contains Epistemology, Conversation Framework, and List Control]

Book - User Interface

Part - Windows

Chapter - Setup

The title window is a graphics g-window spawned by the main window.
The position of the title window is g-placeabove.
The scale method of the title window is g-fixed-size.
The measurement of the title window is 780.

The map window is a graphics g-window spawned by the main window.
The position of the map window is g-placeabove.
The scale method of the map window is g-fixed-size.
The measurement of the map window is 195. [240.]

The right-sidebar window is a graphics g-window spawned by the main window.
The position of the right-sidebar window is g-placeright.
The scale method of the right-sidebar window is g-fixed-size.
The measurement of the right-sidebar window is 290.

The graphics-object window is a graphics g-window spawned by the right-sidebar window.
The position of the graphics-object window is g-placeabove.
The scale method of the graphics-object window is g-fixed-size.
The measurement of the graphics-object window is 195. [240.]

The title-object window is a text grid g-window spawned by the right-sidebar window.
The position of the title-object window is g-placeabove.
The scale method of the title-object window is g-fixed-size.
The measurement of the title-object window is 2. 

The description-action-object window is a text buffer g-window spawned by the right-sidebar window.
The position of the description-action-object window is g-placeabove.
The scale method of the description-action-object window is g-fixed-size.
The measurement of the description-action-object window is 9.

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

Chapter - Rules

Rule for refreshing the title-object window:
	say "[location]";

Rule for refreshing the description-action-object window:
	say "[description of location]";	

Rule for refreshing the title-help window:
	say "Help (title-help)";
	
Rule for refreshing the contents-help window:
	say "contents-help";
	
Rule for refreshing the title-inventory window:
	say "Inventory". 
	
Rule for refreshing the contents-inventory window:
	try taking inventory.

Rule for refreshing the title-debug window:
	say "DEBUG (title-debug)".
	
Rule for refreshing the contents-debug window:
	say "contents-debug";	

Rule for refreshing the graphics-object window:
	draw the illustration of the location in graphics-object window.

x-calculated-coordinate is a number that varies.
y-calculated-coordinate is a number that varies.
	
Rule for refreshing the map window:
	[Draw the map section for the current location]
	draw the map-section of the location in the map window;
	[Draw the icon for the player's current location]
	let x-calculated-coordinate be ( x-coordinate of the location * width of map window ) / 693;
	[let x-calculated-coordinate be ( x-coordinate of the location / 693 ) * width of map window;] [Doesn't appear to work, x-c-c = 0]
	draw the Figure of Icon-Player-Location in the map window at x x-calculated-coordinate and y y-coordinate of the location scaled to width 20 and height 20;
	[Draw the unknown or visited location icons for other locations in the same map section that are not the player's current location]
	repeat through the Table of Room Map Locations:
		if the room entry is not the location and the map-section entry is the map-section of the location:
			if the room entry is visited:
				[if there is an icon corresponding to the room of location in the Table of Room Map Locations:
					draw the icon entry in the map window at x x-coordinate entry and y y-coordinate entry scaled to width 20 and height 20;
				otherwise:]
				draw the Figure of Icon-Visited-Location in the map window at x x-coordinate entry and y y-coordinate entry scaled to width 20 and height 20;
			otherwise:
				draw the Figure of Icon-Unknown-Location in the map window at x x-coordinate entry and y y-coordinate entry scaled to width 20 and height 20;


	


Chapter - Styles

Part - Status Line

[The original code was taken from the Improved Status Line section of "Bronze" by Emily Short and modified slightly. 
 See https://i7-examples.github.io/Bronze/source_43.html for the original code.]

Table of User Styles (continued)
window	style name	background color
all-grid-windows	special-style-1	"#FFFFFF" ["#FF0000" - Red]

Table of Fancy Status
left	central	right
" "	" "	"                [top rose]"
" "	" "	"       [middle rose]"
" "	" "	"       [bottom rose]"

Table of Empty Status
left	central	right
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
	

Chapter - Compass Test Room

[This code is used just to test the positioning and appearance of the compass rose.]

Example Location is a room. 

To The North is a room. To The North is north of the Example Location.
To The South is a room. To The South is south of the Example Location.
To The West is a room. To The West is west of the Example Location.
To The East is a room. To The East is east of the Example Location.

To The Northeast is a room. To The Northeast is northeast of the Example Location.
To The Northwest is a room. To The Northwest is northwest of the Example Location.
To The Southeast is a room. To The Southeast is southeast of the Example Location.
To The Southwest is a room. To The Southwest is southwest of the Example Location.

Up Above is a room. Up Above is up from the Example Location.
Down Below is a room. Down Below is down from the Example Location. 
		
Chapter - Banner Text

Section - Printing

Rule for printing the banner text:
	if the time of day is not 9:00 AM:
		say "";
	otherwise:
		continue the action;

Section - Removing Extra Lines

The initial whitespace rule does nothing.
	
Book - Out Of World Actions

Part - Graphics Mode

[graphics-mode is a truth state that varies.
graphics-mode is true.]

Part - Debug Mode

debug-mode is a truth state that varies.
debug-mode is [false.] true.

Part - Map Mode



Book - Release

Release along with an interpreter and source text.

Volume - Beginning The Story

Before starting the virtual machine:
	now the current graphics drawing rule is the standard placement [centered scaled drawing] [fully scaled drawing] [tiled drawing] rule; 

When play begins:
	close the graphics window;
	open the title window;
	draw Figure of Title in title window;
	say "[banner text]";
	pause the game;
	close the title window;
	open right-sidebar window;
	open graphics-object window;
	open title-object window;
	open description-action-object window;
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
	now the time of day is time of day plus 1 minute;
	[say "[introduction]";]
	[now suggest-on-greeting is false.]

Book - Every Turn

Every turn:
	follow the display object graphics rule;
	refresh the contents-inventory window;
	refresh the map window;
	if debug-mode is true: 
		focus contents-debug window;
		clear contents-debug window; [Uncomment]
		[Begin debug statements]
		say "Map window width: [width of map window][line break]";
		say "Map window height: [height of map window][line break]";
		[End debug statements]
		focus main window;


Volume - Figures

A room has a figure name called illustration.

A thing has a figure name called illustration.

[Before examining the noun: 
	if the noun is not a person:
		if graphics-mode is true:
			display the illustration of the noun.]

Book - Testing

Figure of Title is the file "the-dream-0.png".
[Figure of Title is the file "the-dream-0.jpg".]
[Figure of Island is the file "island-0.png".]

Part - Rooms

Figure of Map-Island-1 is the file "island-1.png".
Figure of Beach-0 is the file "beach-0.png".
Figure of Jungle-0 is the file "jungle-0.png".
Figure of Ruins-0 is the file "ruins-0.png".
Figure of Volcanic-Caldera-0 is the file "volcanic-caldera-0.png".

Figure of Map-Island-2 is the file "island-2.png".
Figure of Deep-Jungle-0 is the file "deep-jungle-0.png".

Figure of Map-Island-3 is the file "island-3.png".
Figure of Hidden-Valley-0 is the file "hidden-valley-0.png".

Figure of Map-Island-4 is the file "island-4.png".
Figure of Moreau-Compound-0 is the file "moreau-compound-0.png".

Part - Objects

Figure of Knife-0 is the file "knife-0.png".

Part - Icons

Figure of Icon-Player-Location is the file "icon-player-location-0.png".

Figure of Icon-Unknown-Location is the file "icon-unknown-location-0.png".
Figure of Icon-Visited-Location is the file "icon-visited-location-0.png".

Figure of Icon-Ruins is the file "icon-ruins-0.png".
Figure of Icon-Volcanic-Caldera is the file "icon-volcanic-caldera-0.png".

Book - Rooms



Book - Characters



Book - Things



Book - Scenes



Volume - Rooms

The player is in the Beach.

Book - Rule Modifications

Part - Heading 

This is the modified room description heading rule:
	refresh the title-object window;

The modified room description heading rule substitutes for the room description heading rule.

Part - Description

This is the modified room description body text rule:
	refresh the description-action-object window;

The modified room description body text rule substitutes for the room description body text rule.

Part - Graphics

[The display object graphics rule is listed in the every turn rules.] [Made this an explicit call in Beginning The Story | Every Turn section]

This is the display object graphics rule:
	refresh the graphics-object window;

Part - You Also See

[This is the modified you-can-also-see rule:
	refresh the description-action-object window;

The modified you-can-also-see rule substitutes for the you-can-also-see rule.]

Book - Mapping

A room has a figure name called map-section.
A room has a number called an x-coordinate.
A room has a number called a y-coordinate.

Table 1 - Room Map Locations
room	map-section	x-coordinate	y-coordinate	icon
Beach	Figure of Map-Island-1	425	100	--
Jungle	Figure of Map-Island-1	425	50	--
Ruins	Figure of Map-Island-1	345	50	Figure of Icon-Ruins
Volcanic Caldera	Figure of Map-Island-1	525	130	Figure of Icon-Volcanic-Caldera
Deep Jungle	Figure of Map-Island-2	425	100	--
Hidden Valley	Figure of Map-Island-3	425	125	--
Moreau Compound	Figure of Map-Island-4	300	100	--



Book - Island

Part - Beach

The Beach is a room. 

The description of the Beach is "This is the beach."
The illustration of the Beach is Figure of Beach-0.

The map-section of the Beach is Figure of Map-Island-1.
The x-coordinate of the Beach is 425.
The y-coordinate of the Beach is 100.

Part - Jungle

The Jungle is a room. The Jungle is north of the Beach.

The description of the Jungle is "This is the jungle."
The illustration of the Jungle is Figure of Jungle-0.

The map-section of the Jungle is Figure of Map-Island-1.
The x-coordinate of the Jungle is 425.
The y-coordinate of the Jungle is 50.

Part - Ruins

The Ruins are a room. The Ruins are west of the Jungle.

The description of the Ruins are "These are the ruins."
The illustration of the Ruins are Figure of Ruins-0.

The map-section of the Ruins is Figure of Map-Island-1.
The x-coordinate of the Ruins is 345.
The y-coordinate of the Ruins is 50.

Part - Volcanic Caldera

The Volcanic Caldera is a room. The Volcanic Caldera is southeast of the Jungle.

The description of the Volcanic Caldera is "This is the volcanic caldera."
The illustration of the Volcanic Caldera is Figure of Volcanic-Caldera-0.

The map-section of the Volcanic Caldera is Figure of Map-Island-1.
The x-coordinate of the Volcanic Caldera is 525.
The y-coordinate of the Volcanic Caldera is 130.

Part - Deep Jungle

The Deep Jungle is a room. The Deep Jungle is north of the Jungle.

The description of the Deep Jungle is "This is the Deep Jungle."
The illustration of the Deep Jungle is Figure of Deep-Jungle-0.

The map-section of the Deep Jungle is Figure of Map-Island-2.
The x-coordinate of the Deep Jungle is 425.
The y-coordinate of the Deep Jungle is 100.

Part - Hidden Valley

The Hidden Valley is a room. The Hidden Valley is north of the Deep Jungle.

The description of the Hidden Valley is "This is the Hidden Valley."
The illustration of the Hidden Valley is Figure of Hidden-Valley-0.

The map-section of the Hidden Valley is Figure of Map-Island-3.
The x-coordinate of the Hidden Valley is 425.
The y-coordinate of the Hidden Valley is 125.

Part - Moreau Compound

The Moreau Compound is a room. The Moreau Compound is northwest of the Hidden Valley.

The description of the Moreau Compound is "This is the ruined laboratory compound of Dr. Moreau." The printed name of Moreau Compound is "Moreau's Compound".
The illustration of the Moreau Compound is Figure of Moreau-Compound-0.

The map-section of the Moreau Compound is Figure of Map-Island-4.
The x-coordinate of the Moreau Compound is 300.
The y-coordinate of the Moreau Compound is 100.

Book - Regions





Volume - Characters



Volume - Things


Book - Island

Part - Rusty Knife

The rusty knife is a thing.
The description of the knife is "An old, worn out sheath knife that probably won't keep an edge."
The illustration of the rusty knife is Figure of Knife-0.

The rusty knife is in the Jungle.

Volume - Scenes



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

