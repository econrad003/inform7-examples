Version 1 of Prefabricated Furniture by Eric Conrad begins here.

"Creates some prefabricated furniture with drawers.  It is intended to demonstrate how to define mass-produced assemblies with parts that can be accessed.  Because of some peculiarities in Inform 7 semantics, this is easy to do, but not straightforward.  The following kinds are defined in this extension: drawer (a kind of container), six kinds of drawers (namely: top drawer, middle drawer, bottom drawer, left drawer, center drawer, right drawer), desk#kind (a kind of supporter which incorporates a drawer), and filing#cabinet (a kind of supporter which incorporates top, middle, and bottom drawers).  The oddities of the semantics are illustrated in the examples.

This extension is incompatible with Drawers by Emily Short."

Chapter 1 - Drawers

	[ We define seven kinds of drawers for use in furniture. The first kind of drawer is a basic drawer for something with just one drawer. ]

A drawer is a kind of container.  A drawer is usually closed and openable.  A drawer is rarely locked.  The specification of a drawer is "A container which is usually closed, openable, and unlocked.  It is normally part of some piece of furniture.".

	[ For an object with two or three vertically placed drawers, we have top, middle, and bottom drawers. ]
	
A top drawer is a kind of drawer.  A middle drawer is a kind of drawer.  A bottom drawer is a kind of drawer.

	[ For an object with two or three horizontally placed drawers, we have left, center, and right drawers. ]

A right drawer is a kind of drawer.  A center drawer is a kind of drawer.  A left drawer is a kind of drawer.

Chapter 2 - Furniture

Section 2a - Desks

	[ A basic desk is a supporter that incorporates a drawer. The reason for the unusual naming has to do with oddities of Inform 7 semantics and is explained in the examples.  The intention here is that all supporters of type desk#kind should be given a name. ]

A desk#kind is a kind of supporter.  A desk#kind is usually fixed in place.  The specification of a desk#kind is "A kind of supporter which represents a simple desk with a single drawer.".

A drawer is part of every desk#kind.

Section 2b - Filing Cabinets

	[ The reason for the odd name has to do with peculiarities in Inform 7 semantics.  See the examples for more information. ]

A filing#cabinet is a kind of supporter.  A filing#cabinet is usually fixed in place.  The specification of a filing#cabinet is "A kind of supporter which represents a typical filing cabinet with top, middle and bottom drawers.".

A top drawer is part of every filing#cabinet.

A middle drawer is part of every filing#cabinet.

A bottom drawer is part of every filing#cabinet.

Chapter 3 - Rooms

Section 3a - Offices

	[ Here we define a kind of room with some prefab furniture. ]

An office is a kind of room.

Every office contains a desk#kind (called desk).

Every office contains a filing#cabinet (called filing cabinet)

Prefabricated Furniture ends here.

---- DOCUMENTATION ----

Example: * A Configuration Problem - The reason for the strange names in the extension.

	*: "A configuration problem"

	Include Prefabricated Furniture by Eric Conrad.
	
	An evildesk is a kind of supporter.  An evildesk is usually fixed in place. 

	A drawer is part of every evildesk.

	A badly configured office is a kind of office.
	
	Every badly configured office contains an evildesk.

	The Bad Place is a badly configured office.

	The clue is a thing.  The description is "The treasure is in evildesk's drawer.".

	The treasure is a thing.

	When play begins:
		let x be a random evildesk in the Bad Place;
		now the clue is on x; 
		let the site be a random drawer which is part of x;
		now the treasure is in the site;
		say "Find the treasure!".

	Test me with "x clue / x drawer / open evildesk's drawer".

Example: * But This Works - More on the reason for the strange names in the extension.

	*: "But this works!"

	Include Prefabricated Furniture by Eric Conrad.
	
	The Good Place is an office.

	The clue is a thing.  The description is "There are treasures in every drawer.".

	Bulky things are a kind of thing.  The indefinite article of bulky things is usually "some".

	The gold, the frankincense, the myrrh are bulky things.
	
	Some rubies are things. They are plural-named.

	When play begins:
		let x be a random desk#kind in the Good Place;
		now the clue is on x; 
		let the site be a random drawer which is part of x;
		now rubies are in the site;
		let x be a random filing#cabinet in the Good Place;
		let the site be a random top drawer which is part of x;
		now gold is in the site;
		let the site be a random middle drawer which is part of x;
		now frankincense is in the site;
		let the site be a random bottom drawer which is part of x;
		now myrrh is in the site;
		say "Find the treasure!".

	Test me with "x clue / x drawer / open top drawer / open middle drawer / open bottom drawer / open desk's drawer".

	
	

	
