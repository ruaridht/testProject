//
//  testAppDelegate.h
//  test
//
//  Created by Ruaridh Thomson on 05/02/2011.
//  Copyright 2011 Life Up North. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"
#import <ShortcutRecorder/ShortcutRecorder.h>

@interface testAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSString *easy;
	
	Person *currentPerson;
	Person *newguy;
	Person *otherguy;
	
	NSMutableArray *people;
	
	IBOutlet SRRecorderControl *theControl;
}

@property (assign) IBOutlet NSWindow *window;
@property (readwrite, retain) NSString *easy;
@property (readwrite, retain) SRRecorderControl *_theControl;
@property (readwrite, assign) Person *_currentPerson;

- (IBAction)change:(id)sender;
- (IBAction)checkChanges:(id)sender;
- (IBAction)manualTest:(id)sender;

- (void)theTest;
- (void)loadPeople;

@end
