//
//  Page3Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/25/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page3Scene.h"


@implementation Page3Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page3Scene* layer = [Page3Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 3;		
	}
	return self;
}

@end
