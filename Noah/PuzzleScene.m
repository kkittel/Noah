//
//  PuzzleScene.m
//  Noah
//
//  Created by Karl Kittel on 2/29/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "PuzzleScene.h"
#import "Dragger.h"
#import "AppDelegate.h"

@implementation PuzzleScene

+(id) scene
{
	CCScene* scene = [CCScene node];
	PuzzleScene* layer = [PuzzleScene node];
	[scene addChild:layer];
	return scene;
}

- (SharedDataObject*) theAppDataObject
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	SharedDataObject* theDataObject;
	theDataObject = (SharedDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

- (void) clearArray
{
    // Get our Shared Data Object
    SharedDataObject* theDataObject = [self theAppDataObject];

    // Init array
	for (int i = 0; i < kMaxPuzzleSize; i++)
	{
		theDataObject->pieceInPlace[i] = 0;
	}
    
}

-(void) createPuzzle1
{
    // Create System Preferences Icon
	CCSprite* normal = [CCSprite spriteWithFile:@"system_config_boot_sm.png"];
	CCSprite* selected = [CCSprite spriteWithFile:@"system_config_boot_sm.png"];
	selected.color = ccBLUE;
	CCMenuItemSprite* systemPreferences = [CCMenuItemSprite itemWithNormalSprite:normal selectedSprite:selected target:self selector:@selector(systemPreferencesTouched:)];
    
	// Create the menu using the systemPreferences icon
	CCMenu* menu = [CCMenu menuWithItems:systemPreferences, nil];
    CGSize size = [[CCDirector sharedDirector] winSize];
    float iconWidth = [normal texture].contentSize.width;
    float iconHeight = [normal texture].contentSize.height;
	menu.position = CGPointMake(size.width-(iconWidth / 2)-15, size.height-(iconHeight / 2)-15);
	[self addChild:menu z:3 tag:100];

    [self clearArray];
    
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:1 :CGPointMake(120, 865)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:2 :CGPointMake(290, 895)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:3 :CGPointMake(459, 866)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:4 :CGPointMake(651, 867)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:5 :CGPointMake(120, 608)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:6 :CGPointMake(290, 669)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:7 :CGPointMake(481, 639)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:8 :CGPointMake(675, 610)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:9 :CGPointMake(120, 383)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:10 :CGPointMake(313, 384)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:11 :CGPointMake(482, 386)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:12 :CGPointMake(651, 355)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:13 :CGPointMake(120, 158)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:14 :CGPointMake(291, 127)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:15 :CGPointMake(481, 127)];
    [[Dragger pieceWithParentNode:self] createPuzzlePiece:16 :CGPointMake(675, 129)];
}

-(void) systemPreferencesTouched:(id)sender
{
    CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetSceneMenuScene];
	[[CCDirector sharedDirector] replaceScene:newScene];    
}

-(id) init
{
	if ((self = [super init]))
	{
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);		
    
        [self createPuzzle1];
    }
    
	return self;
}

+(CGPoint) locationFromTouch:(UITouch*)touch
{
	CGPoint touchLocation = [touch locationInView: [touch view]];
	return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

@end
