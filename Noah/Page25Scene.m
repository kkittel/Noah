//
//  Page25Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/25/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page25Scene.h"


@implementation Page25Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page25Scene* layer = [Page25Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 25;
	}
	return self;
}

@end
