//
//  SpyScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"
#import "SpyIdentityScene.h"
#import "SceneManager.h"

@interface SpyScene : BaseScene {
    
    //位置信息
    CGPoint playerNumLabelPosition;
    CGPoint playerNumPosition;
    
    CGPoint backPosition;
    CGPoint startPosition;
    CGPoint minusPosition;
    CGPoint addPosition;
    CGPoint helpPosition;
    CGPoint settingPosition;
}

@end
