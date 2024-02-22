MIT License by Eric Conrad begins here.

[
Copyright 2024 by Eric Conrad.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]

Section 1 - Setup rules

Copyright holder is a text that varies.  Copyright year is a text that varies.

MIT-warnings is a number that varies.  MIT-warnings is usually 0.

When play begins while copyright holder exactly matches the text "":
	increase MIT-warnings by 1;
	say "[bold type]WARNING[roman type]: The copyright holder string needs to be set.".

When play begins while copyright year exactly matches the text "":
	increase MIT-warnings by 1;
	say "[bold type]WARNING[roman type]: The copyright year string needs to be set.".

Section 2 - Copyright notice

After printing the banner text:
	say "[line break]";
	if MIT-warnings is 0:
		say "Copyright [copyright year] by [copyright holder].";
		say "[line break]";
		say "Use the command LICENSE to display license terms.";
	otherwise:
		say "[bold type]*** WARNING ***[roman type]The MIT License extension reports [MIT-warnings] warnings.  Please correct these before publishing your code.".
		
Section 3 - commands

Requesting the copyright is an action out of world.  Understand "copyright" as requesting the copyright.

Requesting the license is an action out of world.  Understand "license" as requesting the license.

Section 4 - COPYRIGHT command

Report requesting the copyright (this is the request the copyright rule):
	if MIT-warnings is 0:
		say "Copyright [copyright year] by [copyright holder].";
	otherwise:
		say "[bold type]The copyright notice is missing some information[roman type].".

Section 5 - LICENSE command

Report requesting the license (this is the request the license rule):
	try requesting the copyright;
	say "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:";
	say "[line break]";
	say "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.";
	say "[line break]";
	say "THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.".

MIT License ends here.

---- Documentation ----

The MIT License extension provides a (hopefully or at least relatively) painless way of incorporating an MIT open source license in an Inform 7 project.  In addition to using the extension, include a copy of the copyright notice and the license text as a comment in the beginning of the program.

The extension defines two text constants ("copyright holder" and "copyright year") and two out of world actions ("requesting the license" and "requesting the copyright").  The commands "LICENSE" and "COPYRIGHT" may be used to access the actions.  In addition, the constant "MIT-warnings" is used to detect problems.

To use the extension, iinclude it (of course!), and set the text constants "copyright holder" and "copyright year" to appropriate values.  If the constants are not set, warnings are displayed after the banner text.  In addition to printing the banner text, if both values are set, then the copyright notice is displayed.

Example:  * The Right Way - using the extension.

	*: "The right way to use the extension"

	Include MIT License by Eric Conrad.

	Copyright holder is "Eric Conrad".  Copyright year is "2024".

	The old fishing hole is a room.  The description is "It dried up many years ago.".

	test me with "copyright / license".

Example: * The Wrong Way - forgetting to set the copyright holder and year.

	*: "The wrong way to use the extension"

	Include MIT License by Eric Conrad.

		[ Copyright holder is "Eric Conrad".  Copyright year is "2024". ]

	The old fishing hole is a room.  The description is "It dried up many years ago.".

	test me with "copyright / license".

Example:  * Using a different license - example with BSD-1-clause license.

	*: "Using a different license"

	Include MIT License by Eric Conrad.

		[ We add a text named "provider organization". ]

	Copyright holder is "Eric Conrad".  Copyright year is "2024".   Provider organization is always "Foobar Associates".

		[ Here we replace the MIT license with a 1-clause BSD license.  We can either unlist the report rule and replace it with a new rule, or we can use a check rule to short-circuit the rulebook.  ]

	Check requesting the license (this is the new request the license rule):
		try requesting the copyright;
		say "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:";
		say "[line break]";
		say "Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.";
		say "[line break]";
		say "THIS SOFTWARE IS PROVIDED BY [Provider organization] 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL [Provider organization] BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE." instead.

	The old fishing hole is a room.  The description is "It dried up many years ago.".

	test me with "copyright / license".

