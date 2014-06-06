//
//  Page12Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/25/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page12Scene.h"


@implementation Page12Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page12Scene* layer = [Page12Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 12;
	}
	return self;
}

@end
