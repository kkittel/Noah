//
//  LoadingScene.m
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "LoadingScene.h"
#import "MenuScene.h"
#import "Page1Scene.h"
#import "Page2Scene.h"
#import "Page3Scene.h"
#import "Page4Scene.h"
#import "Page5Scene.h"
#import "Page6Scene.h"
#import "Page7Scene.h"
#import "Page8Scene.h"
#import "Page9Scene.h"
#import "Page10Scene.h"
#import "Page11Scene.h"
#import "Page12Scene.h"
#import "Page13Scene.h"
#import "Page14Scene.h"
#import "Page15Scene.h"
#import "Page16Scene.h"
#import "Page17Scene.h"
#import "Page18Scene.h"
#import "Page19Scene.h"
#import "Page20Scene.h"
#import "Page21Scene.h"
#import "Page22Scene.h"
#import "Page23Scene.h"
#import "Page24Scene.h"
#import "Page25Scene.h"
#import "Page26Scene.h"
#import "Page27Scene.h"
#import "Page28Scene.h"
#import "PuzzleScene.h"
#import "SharedDataObject.h"
#import "AppDelegate.h"

@interface LoadingScene (PrivateMethods)
-(void) update:(ccTime)delta;
@end

@implementation LoadingScene

+(id) sceneWithTargetScene:(TargetScenes)targetScene;
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
	// This creates an autorelease object of self (the current class: LoadingScene)
	return [[[self alloc] initWithTargetScene:targetScene] autorelease];
	
}

- (SharedDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	SharedDataObject* theDataObject;
	theDataObject = (SharedDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

-(id) initWithTargetScene:(TargetScenes)targetScene
{
	if ((self = [super init]))
	{
		targetScene_ = targetScene;
        		
		// Must wait one frame before loading the target scene!
		// Two reasons: first, it would crash if not. Second, the Loading label wouldn't be displayed.
		[self scheduleUpdate];
	}
	
	return self;
}

-(void) update:(ccTime)delta
{
	// It's not strictly necessary, as we're changing the scene anyway. But just to be safe.
	[self unscheduleAllSelectors];
	
	// Decide which scene to load based on the TargetScenes enum.
	// You could also use TargetScene to load the same with using a variety of transitions.
    CCTransitionFade* transition;
	        
    // Get our Shared Data Object
    SharedDataObject* theDataObject = [self theAppDataObject];
    
    if (targetScene_ == TargetSceneLastScene)
        targetScene_ = theDataObject.lastScene;
    
    switch (targetScene_)
	{
		case TargetSceneMenuScene:
            transition = [CCTransitionSlideInB transitionWithDuration:2 scene:[MenuScene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
			break;
		case TargetScenePage1Scene:
            [[CCDirector sharedDirector] replaceScene:[Page1Scene scene]];
			break;
		case TargetScenePage2Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page2Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage3Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page3Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage4Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page4Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage5Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page5Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage6Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page6Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage7Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page7Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage8Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page8Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage9Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page9Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage10Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page10Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage11Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page11Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage12Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page12Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage13Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page13Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage14Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page14Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage15Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page15Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage16Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page16Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage17Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page17Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage18Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page18Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage19Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page19Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage20Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page20Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage21Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page21Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage22Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page22Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage23Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page23Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage24Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page24Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage25Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page25Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage26Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page26Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage27Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page27Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePage28Scene:
			transition = [CCTransitionPageTurn transitionWithDuration:2 scene:[Page28Scene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            break;			
		case TargetScenePuzzleScene:
            [[CCDirector sharedDirector] replaceScene:[PuzzleScene scene]];
            break;			
		case TargetSceneMAX:
            transition = [CCTransitionSlideInB transitionWithDuration:2 scene:[MenuScene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
			break;
		default:
			// Always warn if an unspecified enum value was used. It's a reminder for yourself to update the switch
			// whenever you add more enum values.
			NSAssert2(nil, @"%@: unsupported TargetScene %i", NSStringFromSelector(_cmd), targetScene_);
            transition = [CCTransitionSlideInB transitionWithDuration:3 scene:[MenuScene scene]];			
            [[CCDirector sharedDirector] replaceScene:transition];            
            break;
	}
    
    if (targetScene_ != TargetSceneMenuScene)
        theDataObject.lastScene = targetScene_;
	
}

-(void) dealloc
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
