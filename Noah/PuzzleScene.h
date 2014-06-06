//
//  PuzzleScene.h
//  Noah
//
//  Created by Karl Kittel on 2/29/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define kMaxPuzzleSize      16

@interface PuzzleScene : CCLayer {
    
}

+(id) scene;
+(CGPoint) locationFromTouch:(UITouch*)touch;

@end
