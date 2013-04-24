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


-(void)setPosition{
    
    titlePosition = ccp(winSize.width*0.5,winSize.height*0.8);
    
    gameSpyPosition = ccp(winSize.width*0.5,winSize.height*0.7);
    
    gameGuessPosition =ccp(winSize.width*0.5,winSize.height*0.6);
    
    gameMorePosition = ccp(winSize.width*0.5,winSize.height*0.5);
    
    settingPosition = ccp(winSize.width*0.35, -winSize.height*0.40);
    
}

-(void)addGameTitle{
    CCSprite* gameTitle = [CCSprite spriteWithFile:@"logo_home.png"];
    gameTitle.position = titlePosition;
    [self addChild:gameTitle z:0];
    
    
//    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Challenge" fontName:@"ChalkboardSE-Bold" fontSize:90];
//    label.position = titleLabelPosition;
//    label.color = ccc3(16,174,231);
//    
//    [self addChild:label z:0];
}

#pragma mark -- Add all menu item

-(void)addGameMenu{
    
    CCLabelTTF* spyLabel = [CCLabelTTF labelWithString:@"谁是卧底"];
    CCMenuItem* gameSpyItem = [CCMenuItemFont itemWithLabel:spyLabel target:self selector:eventBlock];
    
    gameSpyItem.position = gameSpyPosition;
    gameSpyItem.tag = tag_home_spy;
    
    CCLabelTTF* guessLabel = [CCLabelTTF labelWithString:@"心有灵犀"];
    CCMenuItem* gameGuessItem = [CCMenuItemFont itemWithLabel:guessLabel target:self selector:eventBlock];
    gameGuessItem.position = gameGuessPosition;
    gameGuessItem.tag = tag_home_guess;
    
    CCMenu *menu =[CCMenu menuWithItems:gameSpyItem, gameGuessItem, nil];
    [menu alignItemsVerticallyWithPadding:40];
    [self addChild:menu z:2];
    
    WSMenuWithOneItem* settingMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"设置" position:settingPosition tag:tag_setting selector:eventBlock target:self];
    [self addChild:settingMenu z:2];
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

#pragma mark clickHandler - handle all click event

-(void)clickHandler:(id)sender{
    CCLOG(@"clickHandler");
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
