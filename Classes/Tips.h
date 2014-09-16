//
//  Tips.h
//  Early Reader
//
//  Created by idomechi on 8/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Tips : UIView  <AVAudioPlayerDelegate>{
	UIButton *back;
	id  delegate;
	int type;
	AVAudioPlayer* sound;
}

- (id)initWithFrame:(CGRect)frame type:(int) _type  target:(id) del;

@property (nonatomic,retain) id delegate;
@property (nonatomic) int type;
@end
