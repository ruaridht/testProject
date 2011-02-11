//
//  Person.m
//  test
//
//  Created by Ruaridh Thomson on 05/02/2011.
//  Copyright 2011 Life Up North. All rights reserved.
//

#import "Person.h"


@implementation Person

- (id)initWithName:(NSString *)aName old:(NSString *)anAge
{
	if (![super init])
		return nil;
	
	
	name = aName;
	age = anAge;
	
	/*
	KeyCombo combo1 = { (NSShiftKeyMask | NSAlternateKeyMask), (CGKeyCode)49 };
	theCombo = combo1;
	*/
	srhotkey = [[[SRRecorderControl alloc] init] retain];
	
	KeyCombo combo1 = { (NSShiftKeyMask | NSAlternateKeyMask), (CGKeyCode)[anAge intValue] };
	[srhotkey setKeyCombo:combo1];
	/*
	SDGlobalShortcutsController *shortcutsController = [SDGlobalShortcutsController sharedShortcutsController];
	[shortcutsController addShortcutFromDefaultsKey:@"testhotkeys"
										withControl:srhotkey
											 target:self
										   selector:@selector(testMe)];
	*/
	[self testMe];
	return self;
}

@synthesize name, age, srhotkey, theCombo;

- (void)testMe
{
	NSLog(@"My name is %@", name);
}

@end
