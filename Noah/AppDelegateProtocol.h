//
//  AppDelegateProtocol.h
//  Noah
//
//  Created by Karl Kittel on 2/26/12.
//  Copyright (c) 2012 Countryside Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDataObject;

@protocol AppDelegateProtocol

- (AppDataObject*) theAppDataObject;

@end