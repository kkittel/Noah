//
//  LoadingScene.h
//  Noah
//
//  Created by Karl Kittel on 2/24/12.
//  Copyright 2012 Countryside Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum
{
	TargetSceneINVALID = 0,
    TargetSceneLastScene,
	TargetSceneMenuScene,
	TargetScenePage1Scene,
	TargetScenePage2Scene,
    TargetScenePage3Scene,
	TargetScenePage4Scene,
	TargetScenePage5Scene,
    TargetScenePage6Scene,
	TargetScenePage7Scene,
	TargetScenePage8Scene,
    TargetScenePage9Scene,
	TargetScenePage10Scene,
	TargetScenePage11Scene,
    TargetScenePage12Scene,
	TargetScenePage13Scene,
	TargetScenePage14Scene,
    TargetScenePage15Scene,
	TargetScenePage16Scene,
	TargetScenePage17Scene,
    TargetScenePage18Scene,
	TargetScenePage19Scene,
	TargetScenePage20Scene,
    TargetScenePage21Scene,
	TargetScenePage22Scene,
	TargetScenePage23Scene,
    TargetScenePage24Scene,
	TargetScenePage25Scene,
    TargetScenePage26Scene,
	TargetScenePage27Scene,
	TargetScenePage28Scene,
    TargetScenePuzzleScene,
	TargetSceneMAX,
} TargetScenes;

// LoadingScene is derived directly from Scene. We don't need a CCLayer for this scene.
@interface LoadingScene : CCScene
{
	TargetScenes targetScene_;
}

+(id) sceneWithTargetScene:(TargetScenes)targetScene;
-(id) initWithTargetScene:(TargetScenes)targetScene;

@end
