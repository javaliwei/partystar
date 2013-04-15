//
//  LoadingScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"

typedef enum {
    TargetSceneINVALID = 0,
    TargetSceneFirstScene,
    TargetSceneOtherScene,
    TargetSceneMAX,
} TargetScenes;

@interface LoadingScene : CCScene {
    TargetScenes targetScene_;
}

+(id) sceneWithTargetScene:(TargetScenes)targetScene;
-(id) initWithTargetScene:(TargetScenes)targetScene;

@end
