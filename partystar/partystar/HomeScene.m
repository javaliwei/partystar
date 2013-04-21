//
//  HomeScene.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HomeScene.h"
#import "SpyScene.h"
#import "SettingScene.h"

@implementation HomeScene


-(void)setLocation{
    
    titleLocation = ccp(winSize.width*0.5,winSize.height*0.8);
    
    gameSpyLocation = ccp(winSize.width*0.5,winSize.height*0.7);
    
    gameGuessLocation =ccp(winSize.width*0.5,winSize.height*0.6);
    
    gameMoreLocation = ccp(winSize.width*0.5,winSize.height*0.5);
    
    settingLocation = ccp(winSize.width*0.35, -winSize.height*0.40);
    
    
    
    bgLocation = ccp(winSize.width*0.5, winSize.height*0.5);
}

-(void)addGameTitle{
    gameTitle = [CCSprite spriteWithFile:@"logo_home.png"];
    gameTitle.position = titleLocation;
    [self addChild:gameTitle z:0];
    
    
//    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Challenge" fontName:@"ChalkboardSE-Bold" fontSize:90];
//    label.position = titleLabelLocation;
//    label.color = ccc3(16,174,231);
//    
//    [self addChild:label z:0];
}

-(void)addBackground{
    
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
       && winSize.height == IPHONE5_HEIGHT){
        bg = [CCSprite spriteWithFile:@"bg-iphone5.png"];
    } else {
        bg = [CCSprite spriteWithFile:@"bg.png"];
    }
    bg.position = bgLocation;
    
    [self addChild:bg z:-1];
    
}

#pragma mark -- Add all menu item

-(void)addGameMenu{
    
    [self addGameMenuItem];
    [self addSettingItem];
}

-(void)addGameMenuItem{
    SEL eventBlock = @selector(homeClick:);
    
    CCLabelTTF* spyLabel = [CCLabelTTF labelWithString:@"谁是卧底"];
    gameSpyItem = [CCMenuItemFont itemWithLabel:spyLabel target:self selector:eventBlock];
    
    gameSpyItem.position = gameSpyLocation;
    gameSpyItem.tag = tag_home_spy;
    
    CCLabelTTF* guessLabel = [CCLabelTTF labelWithString:@"心有灵犀"];
    gameGuessItem = [CCMenuItemFont itemWithLabel:guessLabel target:self selector:eventBlock];
    gameGuessItem.position = gameGuessLocation;
    gameGuessItem.tag = tag_home_guess;
    
    
    
    CCMenu *menu =[CCMenu menuWithItems:gameSpyItem, gameGuessItem, nil];
//    menu.position = CGPointZero;
    [menu alignItemsVerticallyWithPadding:40];
    [self addChild:menu z:2];
    
}

-(void)addSettingItem{
    SEL eventBlock = @selector(homeClick:);
    //创建菜单项
    
//    settingItem = [CCMenuItemImage itemWithNormalImage:@"button_setting-ipad.png" selectedImage:nil target:self selector:@selector(enterGameSetting)];
    
    
    CCLabelTTF* settingLabel = [CCLabelTTF labelWithString:@"设置"];
    settingItem = [CCMenuItemFont itemWithLabel:settingLabel target:self selector:eventBlock];
    settingItem.position = settingLocation;
    settingItem.tag = tag_setting;
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:settingItem, nil];
    [self addChild:menu z:2];
    
}

//-(void)playBackgroundMusic{
//    
//    
//    GameData *data = [GameData sharedData];
//    if ( data.backgroundMusicMuted == NO ) {
//        
//        
//        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"start.mp3" loop:YES];
//        
//        
//    }
//    
//    
//}

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

-(id)init{
    if((self  =[super init])){
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        [self addGameTitle];
    }
    return self;
}

+(id)scene{
    
    CCScene *scene =[CCScene node];
    HomeScene *layer = [HomeScene node];
    [scene addChild:layer];
    return scene;
    
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

@end
