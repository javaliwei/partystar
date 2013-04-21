//
//  SpyScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@interface SpyScene : BaseScene {
    
    CCSprite *bg;
    
    CCMenuItem *homeItem;
    CCMenuItem *startItem;
    CCMenuItem *minusItem;
    CCMenuItem *addItem;
    CCMenuItem *helpItem;
    CCMenuItem *settingItem;
    
    
    //位置信息
    CGPoint homeLocation;
    CGPoint startLocation;
    CGPoint minusLocation;
    CGPoint addLocation;
    CGPoint helpLocation;
    CGPoint settingLocation;

    CGPoint bgLocation;
}

@end
