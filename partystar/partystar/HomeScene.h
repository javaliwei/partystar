//
//  HomeScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@interface HomeScene : BaseScene {
    
    //位置信息
    CGPoint gameSpyPosition;
    CGPoint gameGuessPosition;
    CGPoint gameMorePosition;
    CGPoint settingPosition;
    CGPoint storePosition;
    
    CGPoint titlePosition;
    CGPoint titleLabelPosition;
}

+(id)scene;

@end
