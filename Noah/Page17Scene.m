//
//  Page17Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/25/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page17Scene.h"


@implementation Page17Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page17Scene* layer = [Page17Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 17;
	}
	return self;
}


@end
