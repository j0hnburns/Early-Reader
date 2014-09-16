//
//  TouchableScrollView.h
//  Early Reader
//
//  Created by idomechi on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TouchableScrollView : UIScrollView {

	int inner_index;
}

@property (nonatomic) int inner_index;
@end
