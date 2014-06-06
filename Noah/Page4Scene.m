//
//  Page4Scene.m
//  Noah
//
//  Created by Karl Kittel on 2/25/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import "Page4Scene.h"


@implementation Page4Scene

+(id) scene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    CCScene* scene = [CCScene node];
	Page4Scene* layer = [Page4Scene node];
	[scene addChild:layer];
	return scene;
    
}

-(id) init
{
	if ((self = [super init]))
	{
		CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
		
        pageNum = 4;
	}
	return self;
}

@end
