//
//  Dragger.h
//  Noah
//
//  Created by Karl Kittel on 2/29/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PuzzleScene.h"

#define XRAND_MAX			515
#define randomXPos() ((arc4random() % ((unsigned)XRAND_MAX))+125)
#define YRAND_MAX			675
#define randomYPos() ((arc4random() % ((unsigned)YRAND_MAX))+175)

@interface Dragger : CCNode <CCTouchOneByOneDelegate>
{
@ private
    CCSprite* puzzlePiece;
@ public
	NSUInteger draggerId;
	NSUInteger xpos;
	NSUInteger ypos;
	BOOL played;
}

+(id) pieceWithParentNode:(CCNode*)parentNode;
-(id) initWithParentNode:(CCNode*)parentNode;
-(void) createPuzzlePiece:(int) pieceNum :(CGPoint)loc;

@end
