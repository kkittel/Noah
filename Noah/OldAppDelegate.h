//
//  AppDelegate.h
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright Countryside Software 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedDataObject.h"
#import "AppDelegateProtocol.h"

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    SharedDataObject *theAppDataObject;

}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SharedDataObject *theAppDataObject;

@end
