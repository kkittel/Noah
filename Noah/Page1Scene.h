//
//  Page1Scene.h
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PageText.h"

#define kLastPage    28
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface Page1Scene : CCLayer {
    CCSprite* backGround;
    int pageNum;
    PageText *array;
    CGPoint firstTouch;
    CGPoint lastTouch;
}

@property (nonatomic, retain) PageText *array;

+(id) scene;
-(void) displayPage;
-(void) TurnPageForward;
-(void) TurnPageBackward;

@end
