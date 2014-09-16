//
//  MainMenu.h
//  Early Reader
//
//  Created by idomechi on 7/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubMenu.h"

@interface MainMenu : UIView {
	
	UIView * layoutView;
	UIButton * phonics;
	UIButton * sight_words;
	UIButton * sounding_out;
	UIButton * sentences;
	SubMenu * submenu;
	BOOL animation;
}

- (void) loadRes;
- (void) comesBack;
- (void) nextScreenTranslation:(int) button_num;

@property (nonatomic) BOOL animation;
@end
