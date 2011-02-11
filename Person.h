//
//  Person.h
//  test
//
//  Created by Ruaridh Thomson on 05/02/2011.
//  Copyright 2011 Life Up North. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ShortcutRecorder/ShortcutRecorder.h>
#import <SDGlobalShortcuts/SDGlobalShortcuts.h>

@interface Person : NSObject {
	NSString *name;
	NSString *age;
	
	SRRecorderControl *srhotkey;
	KeyCombo theCombo;
}

@property (readwrite, retain) NSString *name;
@property (readwrite, retain) NSString *age;
@property (readwrite, retain) SRRecorderControl *srhotkey;
@property (readwrite) KeyCombo theCombo;

- (id)initWithName:(NSString *)aName old:(NSString *)anAge;

- (void)testMe;

@end
