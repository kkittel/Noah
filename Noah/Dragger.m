//
//  Dragger.m
//  Noah
//
//  Created by Karl Kittel on 2/29/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Dragger.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"
#import "LoadingScene.h"

@implementation Dragger

+(id) pieceWithParentNode:(CCNode*)parentNode
{
	return [[[self alloc] initWithParentNode:parentNode] autorelease];
}

-(id) initWithParentNode:(CCNode*)parentNode
{
	if ((self = [super init]))
	{
		[parentNode addChild:self];
		        
		// Manually add this class as receiver of targeted touch events.
		[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:-1 swallowsTouches:YES];
        
    }
	
	return self;
}

- (SharedDataObject*) theAppDataObject;
{
	id<AppDelegateProtocol> theDelegate = (id<AppDelegateProtocol>) [UIApplication sharedApplication].delegate;
	SharedDataObject* theDataObject;
	theDataObject = (SharedDataObject*) theDelegate.theAppDataObject;
	return theDataObject;
}

- (void) checkOnPuzzleCompleted: (NSUInteger)puzzleId
{
    // Get our Shared Data Object
    SharedDataObject* theDataObject = [self theAppDataObject];
    
	theDataObject->pieceInPlace[puzzleId-1] = 1;
	int i,n;
	n = 0;
    int size = 16;          // size = How many pieces in the puzzle
    
	for (i=0; i<size; i++)
	{
		if (theDataObject->pieceInPlace[i] == 1) 
			n++;
	}
    
    if (n==size)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:
							  @"The puzzle is complete"
                                                        message:@"Good Job!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
		[alert show];
		
		// Play Wav File
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"crowdapplause1.wav" loop:NO];
        
	}
    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        CCScene* newScene = [LoadingScene sceneWithTargetScene:TargetSceneMenuScene];
        [[CCDirector sharedDirector] replaceScene:newScene];
    }
}
                        
-(void) createPuzzlePiece:(int) pieceNum :(CGPoint)loc
{
    NSString* fileName = [NSString stringWithFormat:@"Piece%d.png", pieceNum];
    puzzlePiece = [CCSprite spriteWithFile:fileName];
    puzzlePiece.position = CGPointMake(randomXPos(), randomYPos());
    [self.parent addChild:puzzlePiece];
    xpos = loc.x;
    ypos = loc.y;
    draggerId = pieceNum;
    CCLOG(@"Piece: %i zOrder %i", pieceNum, puzzlePiece.zOrder);
    CCLOG(@"Parent: %i, zOrder: %i", puzzlePiece.parent.tag, puzzlePiece.parent.zOrder);}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
	CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
	
	// Check if this touch is on the puzzle piece sprite.
	BOOL isTouchHandled = CGRectContainsPoint([puzzlePiece boundingBox], touchLocation);
    
    if (isTouchHandled)
    {
        CCLOG(@"Piece: %i zOrder %i", draggerId, puzzlePiece.zOrder);
        CCLOG(@"Parent: %i, zOrder: %i", puzzlePiece.parent.tag, puzzlePiece.parent.zOrder);
        [self.parent reorderChild:puzzlePiece z:1];
        //CCLOG(@"Piece: %i zOrder %i", draggerId, puzzlePiece.zOrder);
    }
    
    return isTouchHandled;
}

- (void)panForTranslation:(CGPoint)translation 
{    
    CGPoint newPos = ccpAdd(puzzlePiece.position, translation);
    puzzlePiece.position = newPos;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent*)event { 
	// Move relative to the original touch point 
    
    // If within 5 of proper position, snap into place
	if (puzzlePiece.position.x == xpos && puzzlePiece.position.y == ypos);
	else // Snap to position + or - 3 pixels
		if ((puzzlePiece.position.x == xpos+5 ||puzzlePiece.position.x == xpos+4 ||
             puzzlePiece.position.x == xpos+3 || puzzlePiece.position.x == xpos +2 ||
             puzzlePiece.position.x == xpos +1 || puzzlePiece.position.x == xpos-5 ||
             puzzlePiece.position.x == xpos-4 ||puzzlePiece.position.x == xpos-3 ||
             puzzlePiece.position.x == xpos-2 || puzzlePiece.position.x == xpos-1) &&
			(puzzlePiece.position.y == ypos+5 ||puzzlePiece.position.y == ypos+4 ||
             puzzlePiece.position.y == ypos+3 ||puzzlePiece.position.y == ypos+2 ||
             puzzlePiece.position.y == ypos+1 || puzzlePiece.position.y == ypos-5 ||
             puzzlePiece.position.y == ypos-4 ||puzzlePiece.position.y == ypos-3 ||
             puzzlePiece.position.y == ypos-2 || puzzlePiece.position.y == ypos-1))
		{
			puzzlePiece.position = CGPointMake(xpos, ypos);
            [self.parent reorderChild:puzzlePiece z:-1];
		}
        else
        {
            CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
            
            CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
            oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
            oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
            
            CGPoint translation = ccpSub(touchLocation, oldTouchLocation);    
            [self panForTranslation:translation];     
        }
    
	
	// Debug info - use this to find the final position of each puzzle piece
	CCLOG(@"id: %i ", draggerId);
	CCLOG(@"x pos: %f ", puzzlePiece.position.x); 
	CCLOG(@"y pos: %f ", puzzlePiece.position.y);

    
	if (puzzlePiece.position.x == xpos && puzzlePiece.position.y == ypos && played == NO)
	{
		// Play Wav File
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"click.wav" loop:NO];
		played = YES;
		
		// Check for completed puzzle
		[self checkOnPuzzleCompleted:draggerId];
	}
    
} 

-(void) onExit
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
	
    // must call super here:
	[super onExit];
}

@end
