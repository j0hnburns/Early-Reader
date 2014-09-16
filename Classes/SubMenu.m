//
//  SubMenu.m
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SubMenu.h"
#import "MainMenu.h"


#define DURATION 0.5

@implementation SubMenu

@synthesize parent,	itemNum;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self loadRes];
    }
    return self;
}


- (void)loadRes
{
	mainview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	[self setBackgroundColor:[UIColor whiteColor]];
	//UIImageView * imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_menu_background.png"]];
	
	phonicCard = [[PhonicsCards alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
	phonicCard.parent = self;
	
	words = [[Words alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
	words.parent = self;
	
	
	back = [UIButton buttonWithType:UIButtonTypeCustom];
	back.frame =CGRectMake(0, 0, 52, 53);  
	[back setBackgroundImage:[UIImage imageNamed:@"back_submenu_button.png"] forState:UIControlStateNormal];
	[back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
	back.showsTouchWhenHighlighted = YES;
	back.center = CGPointMake(40,40);
	
	
	set1 = [UIButton buttonWithType:UIButtonTypeCustom];
	set1.frame =CGRectMake(0, 0, 191, 77); 
	[set1 setBackgroundImage:[UIImage imageNamed:@"set1_button.png"] forState:UIControlStateNormal];
	[set1 addTarget:self action:@selector(set1) forControlEvents:UIControlEventTouchDown];
	set1.showsTouchWhenHighlighted = YES;
	set1.center = CGPointMake(160,84);
	
	set2 = [UIButton buttonWithType:UIButtonTypeCustom];
	set2.frame =CGRectMake(0, 0, 191, 77); 
	[set2 setBackgroundImage:[UIImage imageNamed:@"set2_button.png"] forState:UIControlStateNormal];
	[set2 addTarget:self action:@selector(set2) forControlEvents:UIControlEventTouchDown];
	set2.showsTouchWhenHighlighted = YES;
	set2.center = CGPointMake(160,162);
	
	set3 = [UIButton buttonWithType:UIButtonTypeCustom];
	set3.frame =CGRectMake(0, 0, 191, 77); 
	[set3 setBackgroundImage:[UIImage imageNamed:@"set3_button.png"] forState:UIControlStateNormal];
	[set3 addTarget:self action:@selector(set3) forControlEvents:UIControlEventTouchDown];
	set3.showsTouchWhenHighlighted = YES;
	set3.center = CGPointMake(160,240);
	
	set4 = [UIButton buttonWithType:UIButtonTypeCustom];
	set4.frame =CGRectMake(0, 0, 191, 77); 
	[set4 setBackgroundImage:[UIImage imageNamed:@"set4_button.png"] forState:UIControlStateNormal];
	[set4 addTarget:self action:@selector(set4) forControlEvents:UIControlEventTouchDown];
	set4.showsTouchWhenHighlighted = YES;
	set4.center = CGPointMake(160,318);
	
	
	
	
	//[mainview addSubview:imgView];
	[mainview addSubview:set1];
	[mainview addSubview:set2];
	[mainview addSubview:set3];
	[mainview addSubview:set4];
	[mainview addSubview:back];
	
	[self addSubview:mainview];
	
	//[imgView release];
}

- (void) setBackground
{
	NSArray * arr = [NSArray arrayWithObjects:@"phonics_footer.png",@"sightwords_footer.png",@"soundingout_footer.png",@"sentences_footer.png",nil];
	UIImageView * imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[arr objectAtIndex:itemNum]]];
	imgView.frame=CGRectMake(0, 480-imgView.frame.size.height, 320, imgView.frame.size.height);
	[mainview addSubview:imgView];
	[imgView release];
}

-(void)set1
{
	[self setStartedPage:0];
	[(PhonicsCards*)currentView setupWords:itemNum withPage:0];
}

-(void)set2
{
	[self setStartedPage:1];
	[(PhonicsCards*)currentView setupWords:itemNum withPage:1];
}

-(void)set3
{
	[self setStartedPage:2];
	[(PhonicsCards*)currentView setupWords:itemNum withPage:2];
}

-(void)set4
{
	[self setStartedPage:3];
	[(PhonicsCards*)currentView setupWords:itemNum withPage:3];
}


-(void)setStartedPage:(int) page
{


	@synchronized(parent)
	{
		
	MainMenu * mm = (MainMenu*)parent;
	if(mm.animation) return;
	
	mm.animation =YES;
	

	switch (itemNum) {
		case 0:
			phonicCard.alpha = 0;
			[UIView beginAnimations:nil context:self];
			[UIView setAnimationDuration:DURATION];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDidStopSelector:@selector(didFinish)];
			phonicCard.alpha = 1;

			[self addSubview:phonicCard];
			[UIView commitAnimations];
			currentView = phonicCard;
			break;

		case 1:
		case 2:
		case 3:
			words.alpha = 0;
			[UIView beginAnimations:nil context:self];
			[UIView setAnimationDuration:DURATION];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDidStopSelector:@selector(didFinish)];
			words.alpha = 1;
			[self addSubview:words];
			[UIView commitAnimations];
			currentView = words;
			break;
			
		default:
			break;
	}
		
	}
	//NSLog(@"start sub page");
	
}

-(void) didFinish
{

	MainMenu * mm = (MainMenu*)parent;
	mm.animation =NO;
	
	[mainview removeFromSuperview];


}

-(void)back
{

	MainMenu * mm = (MainMenu*)parent;
	if(mm.animation) return;
		

	[mm comesBack];
	


}

- (void) comesBack
{

		
	MainMenu * mm = (MainMenu*)parent;
	if(mm.animation) return;

	mm.animation =YES;
	currentView.alpha = 1;
	[UIView beginAnimations:nil context:self];
	[UIView setAnimationDuration:DURATION];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(stopAnimation)];
	currentView.alpha = 0;
	[currentView removeFromSuperview];
	[self addSubview:mainview];
	[UIView commitAnimations];
	
	NSLog(@"appearing JJJJ");
	
	
}

-(void) stopAnimation
{

		MainMenu * mm = (MainMenu*)parent;
		mm.animation =NO;
		[currentView removeFromSuperview];
		NSLog(@"animation no");

}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[mainview removeFromSuperview];
	[mainview release];
	
    [super dealloc];
}


@end
