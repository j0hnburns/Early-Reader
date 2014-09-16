//
//  PhonicsCards.h
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tips.h"
#import "TouchableScrollView.h"

@interface PhonicsCards : UIView <UIScrollViewDelegate>{

	UIButton * back;
	UIButton * tip;
	UIButton * sound;
	UIView * parent;
	TouchableScrollView * scroll;
	NSMutableArray * pictures[4];
	int count_card;
	int current_page;
	int lastPlayed;
	Tips * tips;
}

-(void) loadRes;
-(void) initDatabase;
-(void) back;
-(void)setupWords:(int)types withPage:(int) page;

@property (nonatomic,retain) UIView * parent; 
@end
