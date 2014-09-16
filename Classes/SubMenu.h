//
//  SubMenu.h
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhonicsCards.h"
#import "Words.h"

@interface SubMenu : UIView {

	UIView * parent;
	UIButton * back;
	UIButton * set1;
	UIButton * set2;
	UIButton * set3;
	UIButton * set4;
	int itemNum;
	PhonicsCards * phonicCard;
	Words * words;
	UIView * currentView;
	UIView * mainview;
}

- (void) loadRes;
- (void) comesBack;
- (void) setStartedPage:(int) page;
- (void) setBackground;

@property (nonatomic) int itemNum;
@property (nonatomic,retain) UIView * parent;
@end
