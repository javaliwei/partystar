//
//  BaseScene.m
//  partystar
//
//  Created by 李 伟 on 4/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@implementation BaseScene

@synthesize winSize;

-(id)init{
    if(self = [super init]){
        winSize = [[CCDirector sharedDirector] winSize];
        
    }
    return self;
}

@end


@implementation CCSprite(extension)

- (CGFloat)width
{
	CGFloat width = self.texture.contentSize.width;
    
	return width;
}

- (CGFloat)height
{
	CGFloat height = self.texture.contentSize.height;
    
	return height;
}

@end

@implementation CCLabelTTF(extension)

+(id)labelWithString:(NSString*)label{
    CCLabelTTF* ccLabel = [self labelWithString:label fontName:DEF_FONT_NAME fontSize:DEF_FONT_SIZE];
    ccLabel.color = ccBLACK;
    return ccLabel;
}

@end