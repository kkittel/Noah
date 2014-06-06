//
//  SharedDataObject.h
//  Noah
//
//  Created by Karl Kittel on 2/26/12.
//  Copyright (c) 2012 Countryside Software. All rights reserved.
//

#import "AppDataObject.h"
#import "LoadingScene.h"

@interface SharedDataObject : AppDataObject
{
@public
    TargetScenes lastScene;
    NSUInteger readPages;
    int pieceInPlace[16];
}

@property (nonatomic) TargetScenes lastScene;
@property (nonatomic) NSUInteger readPages;

@end
