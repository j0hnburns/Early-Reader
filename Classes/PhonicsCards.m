//
//  PhonicsCards.m
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PhonicsCards.h"
#import "SubMenu.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "Player.h"


@implementation PhonicsCards

@synthesize parent;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self loadRes];
    }
    return self;
}

-(void) loadRes
{

	[self initDatabase];
	[self setBackgroundColor:[UIColor whiteColor]];
	
	back = [UIButton buttonWithType:UIButtonTypeCustom];
	back.frame =CGRectMake(0, 0, 52, 53);  
	[back setBackgroundImage:[UIImage imageNamed:@"back_submenu_button.png"] forState:UIControlStateNormal];
	[back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
	back.showsTouchWhenHighlighted = YES;
	back.center = CGPointMake(40,40);
	
	tip = [UIButton buttonWithType:UIButtonTypeCustom];
	tip.frame =CGRectMake(0, 0, 47, 49);  
	[tip setBackgroundImage:[UIImage imageNamed:@"tips_flashcards_button.png"] forState:UIControlStateNormal];
	[tip addTarget:self action:@selector(tip) forControlEvents:UIControlEventTouchDown];
	tip.showsTouchWhenHighlighted = YES;
	tip.center = CGPointMake(40,440);
	

	sound = [UIButton buttonWithType:UIButtonTypeCustom];
	sound.frame =CGRectMake(0, 0, 47, 49);  
	if([Player getState])
		[sound setBackgroundImage:[UIImage imageNamed:@"Sound_on_button.png"] forState:UIControlStateNormal];
	else
		[sound setBackgroundImage:[UIImage imageNamed:@"Sound_off_button.png"] forState:UIControlStateNormal];
	
	[sound addTarget:self action:@selector(soundAction) forControlEvents:UIControlEventTouchDown];
	sound.showsTouchWhenHighlighted = YES;
	sound.center = CGPointMake(280,440);
	
	scroll = [[TouchableScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	scroll.pagingEnabled =YES;
	scroll.showsHorizontalScrollIndicator =NO;
	scroll.showsVerticalScrollIndicator =NO;
	scroll.delegate =self;
	
	[self addSubview:scroll];
	[self addSubview:back];
	[self addSubview:tip];
	[self addSubview:sound];
	//[scroll release];
	[tip retain];
	[back retain];
	[sound retain];
}

-(void) soundAction
{
	[Player setState:![Player getState]];
	if([Player getState])
		[sound setBackgroundImage:[UIImage imageNamed:@"Sound_on_button.png"] forState:UIControlStateNormal];
	else
		[sound setBackgroundImage:[UIImage imageNamed:@"Sound_off_button.png"] forState:UIControlStateNormal];
	[Player stop];
}

-(void) tip
{

	tips = [[Tips alloc] initWithFrame:CGRectMake(0, 0, 320, 480) type:0  target:self];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
	[UIView setAnimationDuration:0.5];
	[scroll removeFromSuperview];
	[back removeFromSuperview];
	[tip removeFromSuperview];
	[sound removeFromSuperview];
	
	[self addSubview:tips];
	[UIView commitAnimations];
	[tips release];
	[Player stop];
}


-(void) flipBack
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
	[UIView setAnimationDuration:0.5];
	[tips removeFromSuperview];
	
	[self addSubview:scroll];
	[self addSubview:back];
	[self addSubview:tip];
	[self addSubview:sound];

	[UIView commitAnimations];
	
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	//int page = scrollView.contentOffset.x;
	//if(page < -120 || page> 320*(count_card-1)+120 )
	//	[self back];
	//NSLog(@"%d",page);
}

-(void)setupWords:(int)types withPage:(int) page 
{
	
	NSArray * subviews = [scroll subviews];
	for(UIView * view in subviews)
	{
		[view removeFromSuperview];
	}
	
	for(int i=0;i<[pictures[page] count];i++)
	{
		UIImageView * view= [[UIImageView alloc] initWithImage:[UIImage imageNamed:[ NSString stringWithFormat:@"%@.png",[pictures[page]objectAtIndex:i] ]]];
		//UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
//		lable.text = [NSString stringWithFormat:@"%d",i];
//		lable.backgroundColor =[UIColor clearColor];
//		lable.font = [UIFont boldSystemFontOfSize:24];
//		[view addSubview:lable];
//		[lable release];
		
		view.frame=CGRectMake(i*320, 0, 320, 480);
		[scroll addSubview:view];
		[view release];
	}
	
	[scroll setContentSize:CGSizeMake([pictures[page] count]*320,480)];
	scroll.contentOffset = CGPointMake(0,0);
	count_card =[pictures[page] count];
	current_page = page;
	[Player play:current_page*10];
	[scroll setInner_index:current_page*10];
	lastPlayed = 0;
}

-(void) initDatabase
{
	for(int i=0;i<4;i++)
		pictures[i] = [[NSMutableArray alloc] init];

	
	FMDatabase* db = [FMDatabase databaseWithPath:[[NSBundle mainBundle] pathForResource:@"early_reader" ofType:@"db"]];
    [db open];
	
	
	FMResultSet *rs = [db executeQuery:@"select id,page,name from Words where type = '0' "];
	
    while ([rs next]) {
		
		int type = [rs intForColumn:@"type"];
		int page = [rs intForColumn:@"page"];
		NSString* name = [rs stringForColumn:@"name"];
		switch (type) {
			case 0:
				[pictures[page] addObject:name];
				break;
			default:
				break;
		}
    }
	
	[rs close];
	[db close];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
		int page = scrollView.contentOffset.x/320;
	NSLog(@"did end scroll %d",page);
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
	NSLog(@"did end scroll to top");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//	NSLog(@"did end scroll to top 2 2 2");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	[Player stop];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	int page = scrollView.contentOffset.x/320;
	if(lastPlayed != page)
			[Player play:page+current_page*10];
	lastPlayed = page;
	[scroll setInner_index:page+current_page*10];
}


-(void) back
{
	SubMenu * menu = (SubMenu*)parent;
	[menu comesBack];
	[Player stop];
}


- (void)dealloc {
	[scroll release];
	[tip release];
	[back release];
	[sound release];
	
	[scroll removeFromSuperview];
	[back removeFromSuperview];
	[tip removeFromSuperview];
	[sound removeFromSuperview];
	
	for(int i=0;i<4;i++)
	{
		[pictures[i] removeAllObjects];
		[pictures[i] release];
	}
    [super dealloc];
}


@end
