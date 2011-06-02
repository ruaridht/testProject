//
//  testAppDelegate.m
//  test
//
//  Created by Ruaridh Thomson on 05/02/2011.
//  Copyright 2011 Life Up North. All rights reserved.
//

#import "testAppDelegate.h"
#import <SDGlobalShortcuts/SDGlobalShortcuts.h>

@implementation testAppDelegate

@synthesize window, easy;
@synthesize _currentPerson = currentPerson;
@synthesize _theControl = theControl;

- (id)init
{
	if (![super init])
		return nil;
	
	
	easy = @"easy";
	newguy = [[Person alloc] initWithName:@"John" old:@"49"];
	otherguy = [[Person alloc] initWithName:@"Al" old:@"50"];
	[people addObject:newguy];
	[people addObject:otherguy];
	currentPerson = newguy;
	/*
	theControl = [[[SRRecorderControl alloc] init] retain];
	KeyCombo combo1 = { (NSShiftKeyMask | NSAlternateKeyMask), (CGKeyCode)21 };
	[theControl setKeyCombo:combo1];
	*/
	
	return self;
}

- (void)awakeFromNib
{	
	SDGlobalShortcutsController *shortcutsController = [SDGlobalShortcutsController sharedShortcutsController];
	
	[shortcutsController addShortcutFromDefaultsKey:@"testhotkeys"
										withControl:theControl
											 target:self
										   selector:@selector(theTest)];
	
	//[self loadPeople];
	/*
	for (Person *p in people) {
		NSLog(@"Adding shortcut for %@", [p name]);
		[shortcutsController addShortcutFromDefaultsKey:[p name]
											withControl:[p srhotkey]
												 target:p
											   selector:@selector(testMe)];
	}
	*/
	/*
	KeyCombo combo1 = { (NSShiftKeyMask | NSAlternateKeyMask), (CGKeyCode)21 };
	[theControl setKeyCombo:combo1];
	*/
	//theControl = [newguy srhotkey];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (void)loadPeople
{
	newguy = [[Person alloc] initWithName:@"John" old:@"49"];
	otherguy = [[Person alloc] initWithName:@"Al" old:@"21"];
	[people addObject:newguy];
	[people addObject:otherguy];
	[self willChangeValueForKey:@"currentPerson"];
	currentPerson = newguy;
	[self didChangeValueForKey:@"currentPerson"];
}

- (IBAction)change:(id)sender
{
	NSLog(@"Button click");
	
	[self willChangeValueForKey:@"currentPerson"];
	if (currentPerson == newguy) {
		currentPerson = otherguy;
	} else if (currentPerson == otherguy) {
		currentPerson = newguy;
	}
	[self didChangeValueForKey:@"currentPerson"];
	
}

- (IBAction)checkChanges:(id)sender
{
	NSLog(@"newguy name: %@ – age: %@ – with keycode: %@", [newguy name], [newguy age], [newguy.srhotkey keyComboString]);
	NSLog(@"otherguy name: %@ – age: %@ – with keycode: %@", [otherguy name], [otherguy age], [otherguy.srhotkey keyComboString]);
	NSLog(@"theControl hotkey: %@", [theControl keyComboString]);
}

- (IBAction)manualTest:(id)sender
{
	//[self theTest];
	
	//NSString *bundleLoc = [[NSBundle mainBundle] bundleURL];
	
	NSString *path = @"/Users/Northern/DockDesktop/Temp Desktop/Me/test/build/Debug/test.app/Contents/Resources/Courses12Data.js";//[NSString stringWithFormat:@"%@%@", bundleLoc,@"Courses12Data.js"];
	
	//NSString *thePath = [NSString stringWithFormat:@"%@%@", bundleLoc,path];
	
	blah = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	c12data = [blah componentsSeparatedByString:@"\n"];
	//NSString *newString = [blah cropFrom:@"Courses" to:@"\n"];
	
	NSLog(@"The Path:");
	//NSLog(@"%@",newString);
	
	//NSLog(@"%@",blah);
	
	NSLog(@"The first x lines:");
	for (int i=0;i<10;i++) {
		NSLog(@"%@", [c12data objectAtIndex:i]);
	}
}

- (void)theTest
{
	NSLog(@"This is the test");
	
	//NSString *combo1 = [theControl keyComboString];
	
	//NSNumber *keyCode = [theControl objectForKey:@"keyCode"];
	//NSNumber *modifierFlags = [theControl objectForKey:@"modifierFlags"];
	//NSLog(@"The combo: %i and %i", [keyCode intValue], [modifierFlags intValue]);
	
	//[self willChangeValueForKey:@"theControl"];
	[theControl setKeyCombo:[currentPerson.srhotkey keyCombo]];
	//[self didChangeValueForKey:@"theControl"];
}

@end
