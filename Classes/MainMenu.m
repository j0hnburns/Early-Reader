//
//  MainMenu.m
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainMenu.h"

#define DURATION 0.2

@implementation MainMenu

@synthesize animation;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self loadRes];
    }
    return self;
}

- (void)loadRes
{
	
	submenu =[[SubMenu alloc] initWithFrame:CGRectMake(320, 0, 320, 480)];
	submenu.parent = self;
	
	layoutView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	
	UIImageView * imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_menu_background.png"]];
		
	phonics = [UIButton buttonWithType:UIButtonTypeCustom];
	phonics.frame =CGRectMake(0, 0, 191, 77); 
	[phonics setBackgroundImage:[UIImage imageNamed:@"phonics_button.png"] forState:UIControlStateNormal];
	[phonics addTarget:self action:@selector(phonic) forControlEvents:UIControlEventTouchDown];//UIControlEventTouchUpInside];
	phonics.showsTouchWhenHighlighted = YES;
	
	phonics.center = CGPointMake(160,84);
	
	sight_words = [UIButton buttonWithType:UIButtonTypeCustom];
	sight_words.frame =CGRectMake(0, 0, 191, 77); 
	[sight_words setBackgroundImage:[UIImage imageNamed:@"sightwords_button.png"] forState:UIControlStateNormal];
	[sight_words addTarget:self action:@selector(sight) forControlEvents:UIControlEventTouchDown];
	sight_words.showsTouchWhenHighlighted = YES;
	sight_words.center = CGPointMake(160,162);
	
	sounding_out = [UIButton buttonWithType:UIButtonTypeCustom];
	sounding_out.frame =CGRectMake(0, 0, 191, 77); 
	[sounding_out setBackgroundImage:[UIImage imageNamed:@"soundingout_button.png"] forState:UIControlStateNormal];
	[sounding_out addTarget:self action:@selector(sounding) forControlEvents:UIControlEventTouchDown];
	sounding_out.showsTouchWhenHighlighted = YES;
	sounding_out.center = CGPointMake(160,240);
	
	sentences = [UIButton buttonWithType:UIButtonTypeCustom];
	sentences.frame =CGRectMake(0, 0, 191, 77); 
	[sentences setBackgroundImage:[UIImage imageNamed:@"sentences_button.png"] forState:UIControlStateNormal];
	[sentences addTarget:self action:@selector(sentences) forControlEvents:UIControlEventTouchDown];
	sentences.showsTouchWhenHighlighted = YES;
	sentences.center = CGPointMake(160,318);
	
	[layoutView addSubview:imgView];
	[layoutView addSubview:phonics];
	[layoutView addSubview:sight_words];
	[layoutView addSubview:sounding_out];
	[layoutView addSubview:sentences];
	[imgView release];
	
	[self addSubview:layoutView];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void) phonic
{
	[self nextScreenTranslation:0];
}

-(void) sight
{
	[self nextScreenTranslation:1];
}

-(void) sounding
{
	[self nextScreenTranslation:2];
}

-(void) sentences
{
	[self nextScreenTranslation:3];
}




- (void) nextScreenTranslation:(int) button_num
{

		
	if(animation) return;
	
	NSLog(@"start trans");
	animation = YES;
	submenu.alpha = 0;
	submenu.itemNum = button_num;
	[submenu setBackground];
	[UIView beginAnimations:nil context:self];
	[UIView setAnimationDuration:DURATION];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(nexScreenAppear)];
	
	
	
	[self addSubview:submenu];
	//[layoutView removeFromSuperview];
	submenu.frame=CGRectMake(0, 0, 320, 480);
	submenu.alpha = 1;
	
	[UIView commitAnimations];

	
}

-(void)nexScreenAppear
{
	animation = NO;
	//[layoutView removeFromSuperview];
}

- (void) comesBack
{
	@synchronized(self)
	{
		if(animation) return;
		
		animation = YES;
		submenu.alpha = 1;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:DURATION];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(backAppear)];
		

		submenu.frame=CGRectMake(320, 0, 320, 480);
		submenu.alpha = 0;
		//[self addSubview:layoutView];
	
		[UIView commitAnimations];
	}

}

-(void)backAppear
{
	animation = NO;
	[submenu removeFromSuperview];
}

- (void)dealloc {
	[submenu release];
    [super dealloc];
}


@end
