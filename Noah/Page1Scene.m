//
//  Page1Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page1Scene.h"
#import "LoadingScene.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"

@interface Page1Scene (PrivateMethods)

-(void) systemPreferencesTouched:(id) sender;

@end

@implementation Page1Scene

@synthesize array;

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page1Scene* layer = [Page1Scene node];
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

-(void) readPageOutLoud
{
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        // Load book's text into an array
        array = [PageText new];
        [array loadPageText];
        
        // Speak the page using Text-to-speech
        AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
        AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:[array.pageText objectAtIndex:pageNum-1]];
        [utt setRate:0.15f];
        //utt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        [synthesizer speakUtterance:utt];
        //NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices]);

    }
    else
    {
        NSString *fileName = [NSString stringWithFormat:@"Page%d.mp3", pageNum];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:fileName loop:NO];
    }
}

- (void) displayPage
{
    // Build the filename for the page
    NSString *fileName = [NSString stringWithFormat:@"Noah%d.png", pageNum];
    
    // Create a Sprite to Display the page
    backGround = [CCSprite spriteWithFile:fileName];
    [self addChild: backGround z:0 tag:1];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    backGround.position = CGPointMake(screenSize.width / 2, screenSize.height / 2);
    
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
	[self addChild:menu z:1 tag:100];
    
}

-(void) systemPreferencesTouched:(id)sender
{
    CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetSceneMenuScene];
	[[CCDirector sharedDirector] replaceScene:newScene];

}

-(void) TurnPageForward
{
    CCLOG(@"pageNum: %d", pageNum);
    
    if(pageNum == kLastPage)
        return;
    
	CCScene* newScene = [LoadingScene sceneWithTargetScene:(TargetScenes)pageNum+3];
	[[CCDirector sharedDirector] replaceScene:newScene];
}

-(void) TurnPageBackward
{
    if(pageNum == 1)
        return;
    
	CCScene* newScene = [LoadingScene sceneWithTargetScene:(TargetScenes)pageNum+1];
	[[CCDirector sharedDirector] replaceScene:newScene];
    
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch * touch = [[allTouches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    //Swipe Detection Part 1
    firstTouch = location;
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch * touch = [[allTouches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    //Swipe Detection Part 2
    lastTouch = location;
    
    //Minimum length of the swipe
    float swipeLength = ccpDistance(firstTouch, lastTouch);
    
    //Check if the swipe is a left swipe and long enough
    if (firstTouch.x > lastTouch.x && swipeLength > 60)
    {
        [self TurnPageForward];
    }

    //Check if the swipe is a right swipe and long enough
    if (firstTouch.x < lastTouch.x && swipeLength > 60)
    {
        [self TurnPageBackward];
    }
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 1;    
                        
        self.touchEnabled = YES;
	}
	return self;
}

-(void) dealloc
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


-(void) onEnter
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
	// must call super here:
	[super onEnter];
    
    // Display Page after Delay for Transition
    [self performSelector:@selector(displayPage) withObject:nil afterDelay:0.5];
    
    // Get our Shared Data Object
    SharedDataObject* theDataObject = [self theAppDataObject];

    // Choose delay
    int delay;
    if (pageNum == 1)
        delay = 0;
    else
        delay = 3;
    
    // Read the page out loud if shared flag is set
    if (theDataObject.readPages==1 && (pageNum != 6 && 
                                       pageNum!=11 && pageNum != 19 && pageNum != 22 && pageNum != 28))
        [self performSelector:@selector(readPageOutLoud) withObject:nil afterDelay:delay];    
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
