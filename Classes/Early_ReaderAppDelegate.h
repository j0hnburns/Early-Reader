//
//  Early_ReaderAppDelegate.h
//  Early Reader
//
//  Created by idomechi on 8/8/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Early_ReaderViewController;

@interface Early_ReaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Early_ReaderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Early_ReaderViewController *viewController;

@end

