//
//  Player.m
//  Early Reader
//
//  Created by idomechi on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

static 	AVAudioPlayer * player= nil;
static BOOL soundState =YES;
static NSArray * names = nil;
@implementation Player

+(void)play:(int) index
{
	if(!names)
	{
		names = [[NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",
										@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",
										@"u",@"v",@"w",@"x",@"y",@"z",@"ar",@"ai",@"ee",@"er",
										@"ie",@"oa",@"oi",@"oo",@"or",@"ou",@"ue",@"ch",@"sh",@"th",
				 
				 @"me",@"i_",@"you",@"are",@"the",@"and",@"out",@"like",@"now",@"yes",
				 @"my",@"here",@"ask",@"make",@"saw",@"look",@"play",@"said",@"come",@"little",
				 @"what",@"our",@"have",@"when",@"all",@"blue",@"help",@"they",@"went",@"read",
				 @"please",@"well",@"down",@"why",@"ate",@"where",@"ride",@"away",@"there",@"because",
				 
				 
				 @"it",@"at",@"sit",@"cat",@"hen",@"fun",@"bat",@"dad",@"pet",@"dog",
				 @"hat",@"leg",@"man",@"nod",@"lip",@"hot",@"map",@"pan",@"mad",@"quit",
				 @"van",@"jug",@"fox",@"car",@"farm",@"wait",@"seed",@"rain",@"park",@"queen",
				 @"zoo",@"chin",@"fish",@"goat",@"tie",@"soil",@"food",@"ship",@"that",@"fork",
				 
				 @"icanhop",@"iamsad",@"iliketoplay",@"iamlittle",@"hereismypen",@"thebagisred",@"icanseeacat",@"ihaveadog",@"lookatmycar",@"thejugishot",
				 @"ilikemyhat",@"isawaboat",@"thatpanishot",@"iliketoeat",@"lookatthatbus",@"whereistthepark",@"thereismybag",@"iliketherain",@"icansitdown",@"iwentottheshop",
				 @"ourvanisblue",@"whatisthat",@"theyliketoread",@"whereareyou",@"comeheresaiddad",@"whencaniplay",@"itisfunatthepark",@"icanhopandjump",@"pleasehelpme",@"whydoyoufeelmad",
				 @"hereisabook",@"lookatmoon",@"iliketoplayatthepark",@"iateahotpie",@"ihadarideinthebus",@"ifelldownthehill",@"doyoulikemyhat",@"icanship",@"yesihaveabook",@"icannowread",nil
				  ] retain];
	}
	
	[Player playName:[names objectAtIndex:index]];
}

+(void)playName:(NSString*) name
{
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
	if(player)
	{
		[player stop];
		[player release];
		player = nil;
	}
	player=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
	
	if(soundState)
		[player play];

}

+(void)stop
{
	if(player)
		[player stop];
}

+(BOOL) isPlaying
{
	return [player isPlaying];
}
+(void) setState:(BOOL) state
{
	soundState = state;
}

+(BOOL) getState
{
	return soundState;
}
@end
