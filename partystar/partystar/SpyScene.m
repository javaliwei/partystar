//
//  SpyScene.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SpyScene.h"


@implementation SpyScene

+(id) scene{
    CCScene* scene = [CCScene node];
    CCLayer* layer = [SpyScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init{
    if(self = [super init]){
        self.isTouchEnabled = YES;
        CCLabelTTF* titleLabel = [CCLabelTTF labelWithString:@"谁是卧底设置"];
        titleLabel.position = ccp(padding+titleLabel.width/2, winSize.height-titleLabel.height/2-padding);
        [self addChild:titleLabel];
        
        
    }
    return self;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"touch ended.");
    [[CCDirector sharedDirector] popScene];
}

@end
