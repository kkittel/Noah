//
//  PageText.h
//  Noah
//
//  Created by Karl Kittel on 11/10/13.
//  Copyright (c) 2013 Countryside Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PageText : NSObject {
	NSMutableArray	*pageText;
}

@property (nonatomic, retain) NSMutableArray *pageText;

- (void)loadPageText;

@end
