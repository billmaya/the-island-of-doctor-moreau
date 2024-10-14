The story title is "The Island of Doctor Moreau".
The story author is "Bill Maya".
The story genre is "Science Fiction".
The release number is 1.
The story description is "The Island of Doctor Moreau".
The story creation year is 2024.

[WORDS - 2204]

Table of Releases
release	notes
"1"	""

Volume - Setup

Book - Missing Item Description Check



Book - Extensions

Include Flexible Windows by Jon Ingold.
Include Simple Graphical Window by Emily Short. [Requires v10/161003 to display images correctly; v15/170131 of Flexible Windows]
Include Basic Screen Effects by Emily Short. [Required to change status bar and display compass rose]
Include Basic Help Menu by Emily Short.
Include Punctuation Removal by Emily Short. [Writing §17.21. Understanding mistakes]

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
	say "Help[line break]title-help";
	
Rule for refreshing the contents-help window:
	say "contents-help[line break]Typing > HELP in the main window will display context-sensitive help here.";
	
Rule for refreshing the title-inventory window:
	say "Inventory". 
	
Rule for refreshing the contents-inventory window:
	try taking inventory.

Rule for refreshing the title-debug window:
	say "DEBUG[line break]title-debug".
	
Rule for refreshing the contents-debug window:
	say "contents-debug[line break]Debugging info goes here.";	

Rule for refreshing the graphics-object window:
	draw Figure of Beach-0 in graphics-object window;
	
Rule for refreshing the map window:
	draw Figure of Map-Island-1 in map window;

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

Book - Rule Modifications

The room description heading rule does nothing.
The room description body text rule does nothing.

This is the modified room description heading rule:
	refresh the title-object window;

[The window room heading rule substitues for the room description heading rule.] [This doesn't appear to work. Why?]

The modified room description heading rule is listed in the every turn rules.

This is the modified room description body text rule:
	refresh the description-action-object window;

The modified room description body text rule is listed in the every turn rules.
	
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

Volume - Figures

Book - Testing

Figure of Title is the file "the-dream-0.png".
[Figure of Title is the file "the-dream-0.jpg".]
[Figure of Island is the file "island-0.png".]

Figure of Beach-0 is the file "beach-0.png".
Figure of Jungle-0 is the file "jungle-0.png".
Figure of Deep-Jungle-0 is the file "deep-jungle-0.png".
Figure of Ruins-0 is the file "ruins-0.png".

Figure of Map-Island-1 is the file "island-1.png".
Figure of Map-Island-2 is the file "island-2.png".
Figure of Map-Island-3 is the file "island-3.png".
Figure of Map-Island-4 is the file "island-4.png".

Book - Rooms



Book - Characters



Book - Things



Book - Scenes



Volume - Rooms

The player is in the Beach.

Book - Island

Part - Beach

The Beach is a room. The description of the Beach is "This is the beach."

Part - Jungle

The Jungle is a room. The Jungle is north of the Beach.
The description of the Jungle is "This is the jungle."

Part - Ruins

The Ruins are a room. The Ruins are west of the Jungle.
The description of the Ruins are "These are the ruins."

Part - Deep Jungle

The Deep Jungle is a room. The Deep Jungle is north of the Jungle.
The description of the Deep Jungle is "This is the Deep Jungle."

Book - Regions



Book - Mapping

Table of Map Locations
room	map	map-x	map-y	image
"Beach"	"Map-Island-1"	0	0	"Beach-0"
"Jungle"	"Map-Island-1"	0	0	
"Ruins"	"Map-Island-1"	0	0	
"Deep Jungle"	"Map-Island-2"	0	0	

Volume - Characters



Volume - Things


Volume - Scenes



Volume - Help

