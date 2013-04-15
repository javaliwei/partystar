//
//  GameScene.m
//  partystar
//
//  Created by 李 伟 on 4/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Config.h"
#import "UMFeedback.h"
#import "UMSocialSnsService.h"

#import "GameScene.h"
#import "LoadingScene.h"
#import "SpyScene.h"
#import "SettingScene.h"




@implementation GameScene

+(id) scene{
    CCScene* scene = [CCScene node];
    CCLayer* layer = [GameScene node];
    [scene addChild:layer];
    return scene;
}

#pragma mark Init - init page layout

-(id) init{
    if ((self = [super init])) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        self.isAccelerometerEnabled = YES;
        
        glClearColor(1, 1, 1, 1);
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        
        
        SEL eventBlock = @selector(homeClick:);
        
        [CCMenuItemFont  setFontName:@"Helvatica_BoldOblique"];
        [CCMenuItemFont setFontSize:30];
        
        CCLabelTTF* spyLabel = [CCLabelTTF labelWithString:@"谁是卧底" fontName:@"Arial" fontSize:30];
        
        CCMenuItemFont* item1 = [CCMenuItemFont itemWithLabel:spyLabel target:self selector:eventBlock];
        item1.color = ccBLACK;
        item1.rotation = 10;
        item1.tag = tag_home_spy;
        
        CCLabelTTF* guessLabel = [CCLabelTTF labelWithString:@"心有灵犀" fontName:@"Arial" fontSize:30];
        CCMenuItemFont* item2 = [CCMenuItemFont itemWithLabel:guessLabel target:self selector:eventBlock];
        item2.color = ccBLACK;
        item2.rotation = -10;
        item2.tag = tag_home_guess;
        
        CCMenu* menu = [CCMenu menuWithItems:item1, item2, nil];
        menu.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:menu];
        
        CCSprite* normal = [CCSprite spriteWithFile:@"Icon.png"];
        normal.color = ccORANGE;
        CCSprite* selected = [CCSprite spriteWithFile:@"Icon.png"];
        selected.color = ccRED;
        
        CCMenuItemSprite* settingSprite = [CCMenuItemSprite itemWithNormalSprite:normal selectedSprite:selected target:self selector:eventBlock];
        settingSprite.tag = tag_setting;
        CCMenu* settingMenu = [CCMenu menuWithItems:settingSprite, nil];
        float settingSize = [normal texture].contentSize.width;
        settingMenu.position = CGPointMake(size.width - settingSize - padding, settingSize + padding);
        [self addChild:settingMenu];
        
        [menu alignItemsVerticallyWithPadding:40];
        
    }
    return self;
}

#pragma mark homeClick - handle all click event

-(void)homeClick:(id)sender{
    CCLOG(@"homeClicked");
    CCMenuItem* item = (CCMenuItem*)sender;
    switch (item.tag) {
        case tag_home_spy:{
            CCLOG(@"谁是卧底");
            [[CCDirector sharedDirector] pushScene:[SpyScene node]];
        }break;
        case tag_home_guess:{
            CCLOG(@"心有灵犀");
            [[CCDirector sharedDirector] pushScene:[SpyScene node]];
        }break;
        case tag_setting:{
            CCLOG(@"设置");
            [[CCDirector sharedDirector] pushScene:[SettingScene node]];
        }break;
        default:
            NSAssert(nil, @"%@: unspecified TAGS %i", NSStringFromSelector(_cmd), item.tag);
            break;
    }
}

#pragma mark Update - update ui, such as animations

-(void) update: (ccTime)delta{
    
    
}

-(void) onEnter{
    [super onEnter];
}

-(void) onEnterTransitionDidFinish{
    [super onEnterTransitionDidFinish];
}

-(void) onExit{
    [super onExit];
}

-(void) dealloc{
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    [super dealloc];
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
}


@end
