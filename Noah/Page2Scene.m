//
//  Page2Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page2Scene.h"


@implementation Page2Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page2Scene* layer = [Page2Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 2;		
	}
	return self;
}

@end
