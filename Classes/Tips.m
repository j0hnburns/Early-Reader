//
//  Tips.m
//  Early Reader
//
//  Created by idomechi on 8/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Tips.h"


@implementation Tips

@synthesize type,delegate;

- (id)initWithFrame:(CGRect)frame type:(int) _type  target:(id) del {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		
		NSArray * arr = [NSArray arrayWithObjects:@"Phonics_tips.png",@"SightWords_tips.png",@"SoundingOut_tips.png",@"Sentences_tips.png",nil];
		self.type = _type;
		delegate = del;
		
		UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[arr objectAtIndex:_type]]];
		
		 back = [UIButton buttonWithType:UIButtonTypeCustom];
		back.frame =CGRectMake(0, 0, 52, 53);  
		[back setBackgroundImage:[UIImage imageNamed:@"back_submenu_button.png"] forState:UIControlStateNormal];
		[back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
		back.showsTouchWhenHighlighted = YES;
		back.center = CGPointMake(40,40);
		
		

			
		[self addSubview:img];
		[self addSubview:back];
		[img release];
		
		if(_type==2)
		{
			UIButton * demo = [UIButton buttonWithType:UIButtonTypeCustom];
			demo.frame =CGRectMake(0, 0, 100, 50);  
			[demo setBackgroundImage:[UIImage imageNamed:@"SoundingOut_tips_button.png"] forState:UIControlStateNormal];
			[demo addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchDown];
			demo.showsTouchWhenHighlighted = YES;
			demo.center = CGPointMake(160,344);
			[self addSubview:demo];
			
		}
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}

-(void) back
{
	[delegate performSelector:@selector(flipBack)];
}

- (void) play
{

	NSString * soundFile = [[NSBundle mainBundle] pathForResource:@"audio_demo" ofType:@"caf"];
	NSURL * mouseURL = [[NSURL alloc] initFileURLWithPath:soundFile];
	//[sound stop];
	[sound release];
	sound  = [[AVAudioPlayer alloc] initWithContentsOfURL:mouseURL error:nil];
	sound.delegate = self;
	sound.numberOfLoops = 0;
	[sound play];
}

- (void)dealloc {
	[sound stop];
	[sound release];
    [super dealloc];
}


@end
