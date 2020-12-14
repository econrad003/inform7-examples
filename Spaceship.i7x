Version 1 of Spaceship by Eric Conrad begins here.

"The Spaceship extension provides a collection of tools for building spaceships."

	[
		Implementation history for version 1:
			(1) 7 Dec 2020 - Spaceship and airlock with first three examples (using a refrigerator box) to show working of a spaceship, an airlock, and a security mechanish (key and push-pull lock control).
			(2) 9 Dec 2020 - Listing destination coordinates.
			(3) 9 Dec 2020 - Setting destination coordinates.
	]

Chapter 1 - a basic spaceship

Section 1a - spaceships and airlocks

A spaceship is a kind of enterable container.  A spaceship is usually closed and openable.  A spaceship is rarely locked.  The specification of a spaceship is " A kind of enterable container.  A spaceship may be associated with an airlock (a kind of room) using the verb to enter at.  (For example: The rocket enters at the entry portal.)  Spaceships may be open or closed or locked and are usually openable, closed and unlocked.".

	[ Ships are traditionally feminine in gender.  We'll permit that but not require it.  Inform 7 sets feminine gender from the female property which generally does not apply to inanimate objects. ]

A spaceship can be female.  A spaceship is usually not female.

An airlock is a kind of room.  The specification of an airlock is "A kind of room which serves as a point of entry and exit to a spaceship (a kind of enterable container).  The verb to enter at associates a spaceship with an airlock.  (For example: The rocket enters at the entry portal.)  To enter the airlock, an actor enters the spaceship.  To exit the airlock, an actor goes outside to the location of the spaceship.  (The actor may also exit.  If the spaceship is locked, an actor cannot exit via the airlock.)".

Airlock-ownership relates one airlock to one spaceship.  The verb to enter at implies the airlock-ownership relation.  The verb to enter by implies the reversed airlock-ownership relation.

Section 1b - actions related to boarding a spaceship

Before an actor entering a closed spaceship (this is the before entering a closed spaceship rule):
	if the actor is in the location, say "(first opening [the noun])";
	try the actor opening the noun.

After entering a spaceship (this is the after entering a spaceship rule):
	if the noun enters by an airlock (called the site):
		move the actor to the site.

Section 1c - actions related to deboarding a spaceship

Instead of an actor going outside when the location is an airlock (this is the instead of leaving an airlock rule):
	if the location enters at a spaceship (called the owner):
		if the owner is locked:
			if the actor is in the location, say "The exit seems to be locked." (A) instead;
		if the owner is closed:
			if the owner is openable:
				if the actor is in the location, say "(first opening the hatch)" (B);
				now the owner is open;
			otherwise:
				say "The exit must first be opened." (C);
		move the player to the location of the owner;
	otherwise:
		if the actor is in the location, say "There doesn't seem to be a way out." (D) instead.

Instead of an actor exiting when the location is an airlock (this is the instead of exiting an airlock rule):
	try the actor going outside.

Chapter 2 - travel through space and/or time

	[
		A table with four columns holds destination information for all spaceships in a story.  The four columns are:
				place#name - text - a topic name for a destination
				vehicle#num - integer - a spacecraft identifier or vehicle number
					negative vehicle numbers - ignored
					0 - applies to all spaceships
					positive vehicle numbers - apply only to spaceships with the indicated vehicle number
				dest#key - text - a topic name for destination coordinates
				dest#room - room or container - a place where a spaceship can be moved into

		To define this table, we need to define a row which contains text in the place#name and dest#key columns, a number in the vehicle#num column, and a room or container in the dest#room column.  For our purposes, this last item will be a special container named Absolutely#Nowhere.  This row is not intended for actual use, so the vehicle#num entry is set to -1.
	]
		
Absolutely#Nowhere is a container.   It is closed and not openable.  The description is "One really should not be here.".  The printed name is "place where one should not be".

Table of Spacecraft Destinations
Place#name	Vehicle#num	Dest#key	Dest#room
"Erewhon"	-1	"XYZZY"	Absolutely#Nowhere

A spaceship has a number called the vehicle number.  The vehicle number of a spaceship is usually 1.

Section 2a - listing destinations

A travelogue is a kind of thing.  A travelogue is usually fixed in place.  The specification of a travelogue is "A kind of thing which provides course coordinates for programming a spaceship.  The listing action is used to provide the required list of course coordinates.  Since a travelogue is envisioned as an instrument, it is, by default, fixed in place, but a travelogue can be defined as portable.".

Destination-listing relates one travelogue to one spaceship.  The verb to list destinations of implies the destination-listing relation.

Carry out examining a travelogue (this is the examining travelogues rule):
	if the noun lists destinations of a spaceship (called the owner):
		say "Destinations of [the owner][line break]";
		repeat through the Table of Spacecraft Destinations:
			let the item be the vehicle#num entry;
			if the item is 0, say "[dest#key entry] - [place#name entry][line break]";
			if the item is the vehicle number of the owner, say "[dest#key entry] - [place#name entry][line break]";
		say "-- end travelogue -- .";
		now examine text printed is true.

The examining travelogues rule is listed after the standard examining rule in the carry out examining rulebook.

Section 2b - setting coordinates

A gosetter is a kind of thing.  A gosetter is usually fixed in place.  The specification of a gosetter is "A kind of thing which uses course coordinates to navigate a spaceship.  The setting it to action is used to program the course coordinates.  Since a gosetter is envisioned as an instrument, it is, by default, fixed in place, but a gosetter can be defined as portable.".

Coordinate-setting relates one gosetter to one spaceship.  The verb to navigate coordinatewise implies the coordinate-setting relation.

A spaceship has some text called the coordinates.  The coordinates of a spaceship are usually "".

Carry out examining a gosetter (this is the examine gosetters rule):
	if the noun navigates coordinatewise a spaceship (called the owner):
		let x be the coordinates of the owner;
		if x is "":
			say "According to [the noun], [the owner] [are] [if story tense is present tense]currently [end if]not set for a destination." (A);
		otherwise:
			say "According to [the noun], [the owner] [are] [if story tense is present tense]currently [end if]set with destination coordinates [x]." (B);
	otherwise:
		say "[The noun] [are] [if story tense is present tense]currently [end if] disconnected." (C);
	now examine text printed is true.

The examine gosetters rule is listed after the standard examining rule in the carry out examining rulebook.

To fiddle is a verb.

Check an actor setting a gosetter to (this is the set gosetters to rule):
	let x be the topic understood;
	if the noun navigates coordinatewise a spaceship (called the owner):
		now the coordinates of the owner are the topic understood;
		if the actor is the player, say "[We] [set] the coordinates to [the topic understood]." (A) instead;
		if the actor is in the location, say "[The actor] [fiddle] with [the noun]." (B) instead;
		stop the action.

Section 2c - the launching activity

Launching something is an activity.  The launching activity has some text called the launch-status.  Successful-launch is a truth state that varies.  Successful-launch is false.

	[
		The launching activity prepares a spaceship for launch.  If the launch is successful, the rule or launching sets successful-launch to true.
	]

Before launching:
		[ Default: what is to be launched is unlaunchable. ]
	now the launch-status is "cannot be launched";
	now successful-launch is false.

Rule for launching a spaceship (called the item):
	let x be the coordinates of the item in lower case;
	let y be the location of the item;
	let n be 0;
	repeat through the Table of Spacecraft Destinations:
		let z be the vehicle#num entry;
		if z is 0, now z is the vehicle number of the item;
		if z is the vehicle number of the item:
				[ vehicle found! ]
			let w be the dest#key entry in lower case;
			if x exactly matches the text w:
				now y is the dest#room entry;
				now n is 1;
	if n is:
		-- 0:
			now the launch-status is "unknown destination";
		-- 1:
			if y is the location of the item:
				now the launch-status is "already in location";
			otherwise:
				now the launch-status is "successful launch";
				now successful-launch is true.

After launching something (called the item):
	say "--- Launching [item]: [launch-status] ---".

Section 2d - the landing activity

Landing something is an activity.  The landing activity has some text called the landing-status.  Successful-landing is a truth state that varies.  Successful-landing is false.

Before landing:
		[ Default: what is to be launched is unlaunchable. ]
	now the landing-status is "unsuccessful";
	now successful-landing is false.

Rule for landing a spaceship (called the item):
	let x be the coordinates of the item in lower case;
	let y be the location of the item;
	let n be 0;
	repeat through the Table of Spacecraft Destinations:
		let z be the vehicle#num entry;
		if z is 0, now z is the vehicle number of the item;
		if z is the vehicle number of the item:
				[ vehicle found! ]
			let w be the dest#key entry in lower case;
			if x exactly matches the text w:
				now the item is in the dest#room entry;
				now the landing-status is "successful";
				now successful-landing is true;
				now n is 1.

After landing something (called the item):
	say "--- Landing [item]: [landing-status] ---".

Section 2e - launchers

A launcher is a kind of device.  A launcher is usually fixed in place.  The specification of a launcher is "A kind of device which uses course coordinates to move a spaceship.  The switching on action is used to activate a launcher.  Since a launcher is envisioned as an instrument, it is, by default, fixed in place, but a launcher can be defined as portable.".

Launch-activating relates one launcher to one spaceship.  The verb to activate launch for implies the launch-activating relation.

After an actor switching on a launcher which activates launch for a spaceship (called the owner) (this is the activating launchers rule):
	now the noun is switched off;
	say "Lights flicker as power is drawn to prepare for launch.";
	carry out the launching activity with the owner;
	if successful-launch is false:
		say "[paragraph break]Lighting settles as normal power levels return.  Sensors indicate no change in location.";
	otherwise:
		say "[paragraph break]Increased G-forces indicate a successful launch.[no line break]";
		carry out the landing activity with the owner;
		if successful-landing is false:
			say "[paragraph break]Sensors indicate a problem with landing.";
		otherwise:
			say "[paragraph break]Sensors indicate no problems in landing.";
			now successful-landing is false;
		now successful-launch is false.

After an actor switching on a launcher (this is the block activating launchers rule):
	now the noun is switched off;
	if the actor is in the location, say "There is no response from [the noun].".

Spaceship ends here.

---- DOCUMENTATION ---- 

The spaceship extension defines several kinds: a spaceship (a kind of enterable container), an airlock (a kind of room).  A one-to-one relation (called airlock-ownership) relates an airlock to a spaceship. 

Part 1 - entry and exit

The spaceship itself is simply a container which an actor can enter.  Without any setup, it is simply like a large box, as in the example 'A Very Simple Spaceship', where a refrigerator box is implemented as a spaceship.  By default, spaceships are enterable, closed, openable, and unlocked.

In practice, entry and exit of real spaceships usually involves interaction with an airlock.  To set up a working airlock, (1) we must have a spaceship, (2) an airlock, and (3) an airlock-ownership relation between them.  If the actor using the airlock is the player, then the spaceship must be in a working location such as a room or inside a container.  The verb to enter at implies the airlock-ownership relation.  (The converse of the verb to enter at is the verb to enter by.)  For example:

	The garden is a room.
	The rocket is a spaceship.  It is in the garden.
	The silvery airlock is an airlock.  It enters at the rocket.

If the player is in the garden, then the command 'enter rocket' will place the player in the silvery airlock.  If the player is in the silvery airlock, the commands 'out', 'outside', 'go out', or simply 'exit' will move the player to the location of the spaceship, in this case the garden.  (Warning: If the spaceship is nowhere or offstage, exiting the airlock will cause a run-time error.) 

The example 'A Simple Airlock' adds a working airlock to the refrigerator box of 'A Very Simple Spaceship'.  Continuing in this vein, the example 'A Lockable Airlock' adds a simple locking mechanism to the refrigerator box.  From the outside, we unlock the box using the key.  From the airlock, the box is unlocked using a push-pull control.

Part 2 - simple travel

In addition to boarding and exiting a spaceship, it is desirable to have the spaceship travel from place to place.  There are several aspects of travel here.  One is a matter of determining all available destinations.  Another is a matter of setting a destination for the spaceship.  Others are matters of actual launching and landing.

2.1 Listing destinations.

To supply a list of destinations, the extension defines a kind (travelogue).  A table (the Table of Spacecraft Destinations) supplies the data that is needed.  If there is more than one spaceship and their destinations differ, then spaceships can be assigned distinct vehicle numbers.  (The vehicle number of a spaceship is usually 1.)

To supply one or more destinations for a spaceship, continue the Table of Spacecraft Destinations.

	Table of Spacecraft Destinations (continued)
	Place#name	Vehicle#num	Dest#key	Dest#room
	"home"	0	"A"	the material world
	"the better place"	1	"B"	paradise
	"the worse place"	1	"C"	the other place
	"Pluto"	2	"D"	Pluto
	"Utopia"	-1	"E"	Neverneverland

The first column (Place#name) is some text that identifies the destination to the player.  The second column (Vehicle#num) identifies which spaceships can reach this destination.  The third column (Dest#key) is some text which represents the coordinate setting which is used to arrive at the indicated destination.  The fourth and last column (Dest#room) identifies the actual destination (a room or a container).

If a travelogue is in scope (in other words, visible), the player can query the travelogue using the examining action.  When declaring a travelogue, we should also assign it to a spaceship.

	The hot tub is a spaceship.
	The guidebook is a travelogue.  It lists destinations of the hot tub.

Since no vehicle number was assigned, the vehicle number of the hot tub is 1.  In the story, the player can query the guidebook using the examining action.

	> x guidebook
	home - A
	the better place - B
	the worse place - C

The output is the first and third entries of each row in the Table of Spacecraft Destinations for which the third entry is either 0 or the vehicle number of the assigned spacecraft (namely 1).  Our hot tub is not programmed to go to either Pluto or Neverneverland.

2.2 Setting destinations.

To set a destination, the extension defines a kind called, for lack of a better name, a gosetter.  A gosetter sets the desrination coordinates for the spaceship, if any, to which it is assigned.  Coordinates are not validated at this point.  Examining a gosetter reveals the coordinates of its spaceship's current destination.

 To define a working gosetter, the programmer must both declare it and assign it to a spaceship.

	The hot tub is a spaceship.
	The spatial limiter is a gosetter.  The spatial limiter navigates coordinatewise the hot tub.

The verb "to navigate coordinatewise" is implies the coordinate-setting relation (which assigns a gosetter to a spaceship).

During play, if the spatial limiter is in scope, destination coordinates can be set and the current destination coordinates can verified.

	> x limiter
	According to the spatial limiter, the hot tub is currently not set for a destination.
	> set limiter to XYZZY
	You set the coordinates to XYZZY.
	> x limiter
	According to the spatial limiter, the hot tub is currently set with destination coordinates XYZZY.

2.3 Going somewhere.

To actually make a spaceship go somewhere, the Spaceship extension defines a kind of device called a launcher and two activities (launching and landing) which are triggered by switching on the launcher.

To define a launcher, the programmer must both declare it and assign it to a spaceship.  Since a launcher does not set coordinates, a separate gosetter is required.

	The hot tub is a spaceship.
	The spatial limiter is a gosetter.  The spatial limiter navigates coordinatewise the hot tub.
	The red button is a launcher.  It activates launch for the hot tub.

During play, the player uses the gosetter to set coordinates to the desired destination and the launcher to go there.  The default behavior is to arrive immediately when the launcher is switched on.

	> set limiter to C
	You set the coordinates to C.
	> switch on red
	Lights flicker as power is drawn to prepare for launch.
	--- Launching refrigerator box: successful launch ---

	Increased G-forces indicate a successful launch.
	--- Landing refrigerator box: successful ---

	Sensors indicate no problems in landing.

The example "A moving spaceship" illustrates very basic usage of gosetter and launcher objects.

The implementer may wish to incorporate a delay between launch and landing.  This can be accomplished using a recurring scene.  This sort of story scenario is illustrated in the the example "A trip to the moon".

Example: * A Very Simple Spaceship - A minimalist spaceship.

	*: "A very simple spaceship"

	Include Spaceship by Eric Conrad.

		[ The launchpad is simply the start room in this example and several that follow. ]

	The launchpad is a room.

		[ To set up a spaceship, we need to declare it and place it somewhere. ]

	The refrigerator box is a spaceship.  It is in the launchpad.

	Test me with "enter box / look".

Example: * A Simple Airlock - A spaceship with an airlock.

	*: "A simple airlock"

	Include Spaceship by Eric Conrad.

	The launchpad is a room.

	The refrigerator box is a spaceship.  It is in the launchpad.

		[ To make a working airlock (a kind of room), we must declare it and associate it with a spaceship: ]

	The control room is an airlock.  It enters at the refrigerator box.

	Test me with "enter box / exit".

Example: * A Lockable Airlock - A spaceship with an airlock which locks and unlocks.

	*: "A lockable airlock"

	Include Spaceship by Eric Conrad.

	The launchpad is a room.

	The refrigerator box is a spaceship.  It is in the launchpad.  It is locked.

		[ The simplest mechanism for locking and unlocking a spaceship is a key. ]

	The magic key is in the launchpad.  The magic key unlocks the refrigerator box.

	The control room is an airlock.  It enters at the refrigerator box.

		[ In order to secure the spaceship, we have to add a control.  Here we implement a mechanical push-pull control. ]

	The red lever is in the control room.

		[ The way our lever works is push to unlock and pull to lock.  The control is implemented using two instead rules.  Note that locking or unlocking the refrigerator box with the magic key automatically sets the position of the red lever.  ]

	Instead of an actor pushing the red lever:
		if the refrigerator box is unlocked:
			if the actor is the player, say "The red lever won't budge.";
		otherwise:
			if the actor is in the location, say "[We] [push] the red lever.";
			now the refrigerator box is unlocked.

	Instead of an actor pulling the red lever:
		if the refrigerator box is locked:
			if the actor is the player, say "The red lever won't budge.";
		otherwise:
			if the actor is in the location, say "[We] [pull] the red lever.";
			now the refrigerator box is locked.

	Test me with "enter box / unlock box with key / enter box / exit / enter box / push lever / pull lever / pull lever / exit / push lever / exit".

Example: * A Moving Spaceship - A spaceship that travels.

	*: "A moving spaceship"

	Include Spaceship by Eric Conrad.

	The launchpad is a room.

	The refrigerator box is a spaceship.  It is in the launchpad.

	The hitchhikers' guide is a travelogue.  It is in the launchpad.  It lists destinations of the refrigerator box.

	The navswitch is a gosetter.  It navigates coordinatewise the refrigerator box.  It is in the refrigerator box.

	The spatial limiter is a launcher.  It activates launch for the refrigerator box.  It is in the refrigerator box. 

	Starbase 5 is a room.

	Table of Spacecraft Destinations (continued)
	Place#name	Vehicle#num	Dest#key	Dest#room
	"home"	1	"SB0"	launchpad
	"Starbase 5"	1	"SB5"	Starbase 5

	Test me with "x guide / take guide / enter box / look / x navswitch / take navswitch / set navswitch to SB0 / x navswitch / x spatial limiter / switch on spatial limiter / look / set navswitch to FUBAR / switch on spatial limiter / look / set navswitch to SB5 / switch on spatial limiter / look".

Example: ** A Trip to the Moon - A more realistic spaceship.

	*: "A trip to the moon"

	Include Spaceship by Eric Conrad.

	Cape Canaveral is a rooms.  The description is "A spaceport for a minor planet (known as Earth) which is host to a parasitic humanoid species.".

	Mare Imbrium is a room.  The description is "A desolate region on Earth's only moon.".

	The Nosferatu is a spaceship.  It is in Cape Canaveral.  It is female.  The description is "An impressive craft, currently owned by a smuggler and confidence artist named Sabalom Glitz, who won the ship in a game of Canasta.".  The indefinite article is "the".

		[ Sabalom Glitz is a minor character from Dr Who - a friendly adversary of both the sixth and seventh Doctors.  He's here for a little ambience -- the Nosferatu is his spaceship.  My guess is that Glitz would refer to his ship as 'she'.  I don't think he actually won her in a Canasta game, but it's certainly his style. ]

	Sabalom Glitz is a man.  He is in the control room.  The description is "A confidence artist, smuggler, and card cheat, but, at heart, a really nice guy.".

		[ Now we describe the Nosferatu, starting with an airlock. ]

	The entry portal is an airlock.  It enters at the Nosferatu.  The description is "This is the airlock for the Nosferatu.  The control room is north from here.  Storage (for smuggled goods) is to the south."

	The control room is a room.  The description is "This is the control room of the Nosferatu.".  It is north of the entry portal.

	The control panel is a supporter.  It is in the control room.  It is fixed in place.

	On the control panel is a travelogue called the hitchhiker's guide.   The hitchhiker's guide lists destinations of the Nosferatu. The description of the hitchhiker's guide is "A guide to the universe.  On the cover, it has the reassuring image of a red button (labelled PANIC in big block capital letters).".

	Table of Spacecraft Destinations (continued)
	Place#name	Vehicle#num	Dest#key	Dest#room
	"Earth"	1	"Sol-3"	Cape Canaveral
	"Moon"	1	"Sol-3a"	Mare Imbrium

	On the control panel is a gosetter called the spatial limiter.  The spatial limiter navigates coordinatewise the Nosferatu.

	The reassuring red button is part of the spatial limiter.  The description is "It is labelled with the reassuring words 'PANIC', in big block capital letters.".  Understand "panic" as the reassuring red button.

	The space column is a thing.  It is on the control panel.  It is fixed in place.  The description is "It goes up and down when the spacecraft is in flight.  It is currently down, indicating that the spacecraft is docked.".

		[ launch and landing ]

	In-flight is a truth state that varies.  In-flight is false.

	Flight-time-remaining is a number that varies.

	Space travel is a recurring scene.  Space travel begins when in-flight is true.  Space travel ends when in-flight is false.

	When space travel begins:
		now the Nosferatu is closed;
		now the Nosferatu is locked;
		say "[line break]The Nosferatu's exits are secured for takeoff.'";
		now flight-time-remaining is 3;
		carry out the launching activity with the Nosferatu;
		if successful-launch is true:
			now the description of the space column is "The space column is going up and down with lights flashing indicating that the Nosferatu is currently in flight.";
			say " -- 'Welcome to the Nosferatu.  Passengers please keep your seat belts fastened while the ship is in flight.'";
		otherwise:
			now in-flight is false;
			say " -- 'The ship's computer has detected a programming error.  Please reprogram and try again.'".

	Every turn during space travel:
		if flight-time-remaining is 0:
			now in-flight is false;
			say " -- 'Ship's crew please stand by for landing.  Passengers please keep your seat belts fastened.'";
			carry out the landing activity with the Nosferatu;
			if successful-landing is true:
				now the description of the space column is "The space column is in the down position with lights off indicating that the Nosferatu is safely docked.";
				now the Nosferatu is unlocked;
				say "[line break] -- 'Please exit the craft in an orderly manner.'";
			otherwise:
				now the description of the space column is "The space column is in the up position with lights on indicating that the Nosferatu is wandering aimlessly in outer space.";
				say "[line break] -- 'The ship's computer has detected a problem with landing.'";
		otherwise:
			if the location is the control room, say "The time column is going up and down with lights flashing.";
			decrease flight-time-remaining by 1.

	When space travel ends:
		now successful-launch is false;
		now successful-landing is false.

	The troublesome blue button is on the control panel.  It is fixed in place.  The description is "It says 'LIFTOFF' in bold capital letters.  Below the button, there are instructions that say 'Warning: for use by authorized personnel only.".

	Understand "liftoff" as the troublesome blue button.

	Instead of pushing the troublesome blue button:
		if in-flight is true:
			say "It seems to be stuck.";
		otherwise:
			now in-flight is true;
			say "You press [the noun].".

		[ ambience ]

	The storage room is a room.  The description is "This is the storage room of the Nosferatu.".  It is south of the entry portal.

	Smuggled goods are a thing.  They are plural-named.  They are in the storage room.

		[ And here is the default test... ]

	Test me with "enter Nosferatu / n / x guide / push panic / set spatial to Sol-3a / x column / push liftoff / z / x column / z / x column / s / out".