//
//  TouchableScrollView.m
//  Early Reader
//
//  Created by idomechi on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchableScrollView.h"
#import "Player.h"

@implementation TouchableScrollView

@synthesize inner_index;



- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	if (!self.dragging) {
		[self.nextResponder touchesEnded: touches withEvent:event]; 
		
		if([Player isPlaying])
			[Player stop];
		else {
			[Player play:inner_index];
		}

	}		
	[super touchesEnded: touches withEvent: event];
}


- (void)dealloc {
    [super dealloc];
}


@end
