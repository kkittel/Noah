//
//  MenuScene.m
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "MenuScene.h"
#import "Page1Scene.h"
#import "LoadingScene.h"
#import "AppDelegate.h"

@interface MenuScene (PrivateMethods)
-(void) menuItem1Touched:(id)sender;
-(void) menuItem2Touched:(id)sender;
-(void) menuItem3Touched:(id)sender;
@end

@implementation MenuScene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	CCScene* scene = [CCScene node];
	MenuScene* layer = [MenuScene node];
	[scene addChild:layer];
	return scene;
}

- (SharedDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	SharedDataObject* theDataObject;
	theDataObject = (SharedDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // set CCMenuItemFont default properties
        [CCMenuItemFont setFontName:@"STHeitiJ-Light"];
        [CCMenuItemFont setFontSize:40];
        
        // Create a Label item
        CCMenuItemFont* item1 = [CCMenuItemFont itemWithString:@"Go To Beginning" target:self selector:@selector(menuItem1Touched:)];

        // Create a toggle item using two other menu items (toggle works with images, too)
        CCMenuItemFont* toggleOn = [CCMenuItemFont itemWithString:@"Read Pages to Me OFF"];
        CCMenuItemFont* toggleOff = [CCMenuItemFont itemWithString:@"Read Pages to Me ON"];
        CCMenuItemToggle* item2 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuItem2Touched:) items:toggleOn, toggleOff, nil];
        
        // Get our Shared Data Object
        SharedDataObject* theDataObject = [self theAppDataObject];
        [item2 setSelectedIndex: theDataObject.readPages];
        
        // Create Puzzle item
        CCMenuItemFont* item3 = [CCMenuItemFont itemWithString:@"Play with Puzzle" target:self selector:@selector(menuItem3Touched:)];
        
        // Create Done label item
        CCMenuItemFont* item4 = [CCMenuItemFont itemWithString:@"Done" target:self selector:@selector(menuItem4Touched:)];

        // create the menu using the items
        CCMenu* menu = [CCMenu menuWithItems:item1, item2, item3, item4, nil];
        menu.position = CGPointMake((size.width / 2), (size.height / 3)*2);
        menu.tag = 100;
        [self addChild:menu];
        
        // calling one of the align methods is important, otherwise all labels will occupy the same location
        [menu alignItemsVerticallyWithPadding:40];
				
		self.touchEnabled = YES;
	}
	return self;
}
-(void) menuItem1Touched:(id)sender
{
	CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetScenePage1Scene];
	[[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) menuItem2Touched:(id)sender
{
   	// sender is a CCMenuItemToggle in this case
	CCMenuItemToggle* toggleItem = (CCMenuItemToggle*)sender;
	int index = [toggleItem selectedIndex];
	
	CCLOG(@"item 1 touched: %@ - selected index: %i", sender, index);
    
    // Get our Shared Data Object and set index of toggle
    SharedDataObject* theDataObject = [self theAppDataObject];
    theDataObject.readPages = index;
 
}

-(void) menuItem3Touched:(id)sender
{
	CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetScenePuzzleScene];
	[[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) menuItem4Touched:(id)sender
{
	CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetSceneLastScene];
	[[CCDirector sharedDirector] replaceScene:newScene];

}

-(void) dealloc
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetSceneLastScene];
	[[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) onEnter
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
	// must call super here:
	[super onEnter];
}

-(void) onEnterTransitionDidFinish
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
	// must call super here:
	[super onEnterTransitionDidFinish];
}

-(void) onExit
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	// must call super here:
	[super onExit];
}

@end
