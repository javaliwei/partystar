//
//  HomeScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@interface HomeScene : BaseScene {
    //背景
    CCSprite *bg;

    //游戏标题
    CCSprite *gameTitle;
    
    //按钮
    CCMenuItem *gameSpyItem;
    CCMenuItem *gameGuessItem;
    CCMenuItem *gameMoreItem;
    
    CCMenuItem *settingItem;
    CCMenuItem *moreItem;
    CCMenuItem *storeItem;
    
    //音效设置
//    CCMenu* soundMenu;
    //位置信息
//    CGPoint soundMenuLocation;
    
    
    
    //位置信息
    CGPoint gameSpyLocation;
    CGPoint gameGuessLocation;
    CGPoint gameMoreLocation;
    CGPoint settingLocation;
    CGPoint storeLocation;
    
    CGPoint titleLocation;
    CGPoint titleLabelLocation;
    CGPoint bgLocation;
}

@end
