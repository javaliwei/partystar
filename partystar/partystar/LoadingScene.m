//
//  LoadingScene.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LoadingScene.h"


@implementation LoadingScene

+(id) sceneWithTargetScene:(TargetScenes)targetScene{
    return [[[self alloc] initWithTargetScene:(TargetScenes)targetScene] autorelease];
}

-(id) initWithTargetScene:(TargetScenes)targetScene{
    if((self = [super init])){
        targetScene_ = targetScene;
        CCLabelTTF* label = [CCLabelTTF labelWithString:@"Loading" fontName:@"Marker Felt" fontSize:64];
        CGSize size = [[CCDirector sharedDirector] winSize];
        label.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:label];
        
        [self scheduleUpdate];
    }
    return self;
}

-(void) update:(ccTime)delta{
    [self unscheduleAllSelectors];
    
    switch (targetScene_) {
        case TargetSceneFirstScene:
            [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
            break;
        case TargetSceneOtherScene:
            [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
            break;
        default:
            NSAssert2(nil, @"%@: unsupported TargetScene %i", NSStringFromSelector(_cmd), targetScene_);
            break;
    }
}

@end
