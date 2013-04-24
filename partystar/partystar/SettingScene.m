//
//  SettingScene.m
//  partystar
//
//  Created by 李 伟 on 4/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SettingScene.h"
#import "Config.h"
#import "UMFeedback.h"
#import "UMSocialSnsService.h"

@implementation SettingScene

-(id) init{
    if ((self = [super init])) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        self.isAccelerometerEnabled = YES;
        self.isTouchEnabled = YES;
        
//        glClearColor(1, 1, 1, 1);
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        
        
        SEL eventBlock = @selector(settingClick:);
        
        [CCMenuItemFont  setFontName:@"Helvatica_BoldOblique"];
        [CCMenuItemFont setFontSize:30];
        
        CCLabelTTF* spyLabel = [CCLabelTTF labelWithString:@"反馈" fontName:@"Arial" fontSize:30];
        
        CCMenuItemFont* item1 = [CCMenuItemFont itemWithLabel:spyLabel target:self selector:eventBlock];
        item1.color = ccBLACK;
        item1.tag = tag_setting_feedback;
        
        CCLabelTTF* guessLabel = [CCLabelTTF labelWithString:@"分享" fontName:@"Arial" fontSize:30];
        CCMenuItemFont* item2 = [CCMenuItemFont itemWithLabel:guessLabel target:self selector:eventBlock];
        item2.color = ccBLACK;
        item2.tag = tag_setting_share;
        
        CCMenu* menu = [CCMenu menuWithItems:item1, item2, nil];
        menu.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:menu];
        
        [menu alignItemsVerticallyWithPadding:40];
        
    }
    return self;
}

-(void)settingClick:(id)sender{
    CCLOG(@"homeClicked");
    CCMenuItem* item = (CCMenuItem*)sender;
    switch (item.tag) {
        case tag_setting_feedback:{
            CCLOG(@"反馈");
            [UMFeedback showFeedback:[UIApplication sharedApplication].keyWindow.rootViewController withAppkey:UMENG_APP_KEY];
        }break;
        case tag_setting_share:{
            CCLOG(@"分享");
            [UMSocialSnsService presentSnsController:[UIApplication sharedApplication].keyWindow.rootViewController appKey:UMENG_APP_KEY shareText:@"这个游戏太好玩了！你也来试试看吧？" shareImage:[UIImage imageNamed:@"fps_images"] shareToSnsNames:@[@[UMShareToSina,UMShareToTencent],@[UMShareToWechat, UMShareToSms]] delegate:nil];
        }break;
        default:
            NSAssert(nil, @"%@: unspecified TAGS %i", NSStringFromSelector(_cmd), item.tag);
            break;
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"touch ended.");
    [[CCDirector sharedDirector] popScene];
}

@end
