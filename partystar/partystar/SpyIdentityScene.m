//
//  SpyIdentityScene.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SpyIdentityScene.h"


@implementation SpyIdentityScene


-(void)setPosition{
    
    checkition = ccp(winSize.width*0, -winSize.height*0.25);
    restartPosition = ccp(-winSize.width*0.4, winSize.height*0.45);
    cardDesPosition = ccp(winSize.width*0.5, winSize.height*0.5);
    nextPosition = ccp(winSize.width*0, -winSize.height*0.45);
    cardPosition = ccp(winSize.width*0.5, winSize.height*0.5);
    wordPosition = ccp(winSize.width*0.5, winSize.height*0.5);
}

-(void)addGameMenu{
    
    CCLabelTTF* cardDes = [CCLabelTTF labelWithString:@"1"];
    cardDes.position = cardDesPosition;
    [self addChild:cardDes];
    
    CCLabelTTF* word = [CCLabelTTF labelWithString:@""];
    word.visible = NO;
    word.position = wordPosition;
    word.tag = tag_spy_word;
    [self addChild:word z:2];
    
//    CCSprite* cardSprite = [CCSprite spriteWithFile:@"cardBg.png"];
//    cardSprite.tag = tag_spy_card;
//    cardSprite.position = cardPosition;
//    cardSprite.anchorPoint = cardPosition;
//    [self addChild:cardSprite z:1];
    
    WSMenuWithOneItem* checkMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"点击查看卡牌" position:checkition tag:tag_spy_card_des selector:eventBlock target:self];
    [self addChild:checkMenu z:2];
    
    WSMenuWithOneItem* restartMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"重来" position:restartPosition tag:tag_spy_restart selector:eventBlock target:self];
    [self addChild:restartMenu z:2];
    
    WSMenuWithOneItem* nextMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"传给下一位" position:nextPosition tag:tag_spy_next selector:eventBlock target:self];
    [self addChild:nextMenu z:2];
    
    CCMenuItem* nextItem = (CCMenuItem*)[self getChildByTag:tag_spy_next];
    [nextItem setIsEnabled:NO];
}

-(id)init{
    
    if(self = [super init]){
        self.isTouchEnabled = YES;
        [self getPairOfWords];
    }
    return self;
}

-(void)getPairOfWords{
    populaceWord = @"钱包";
    spyWord = @"口袋";
    totalPlayerNum = [[GameSettings instance] getPlayerNum].intValue;
    spyIndex = arc4random() % totalPlayerNum;
    currentIndex = 0;
}

#pragma mark clickHandler - handle all click event

-(void)clickHandler:(id)sender{
    CCLOG(@"clickHandler");
    CCMenuItem* item = (CCMenuItem*)sender;
    switch (item.tag) {
        case tag_spy_card:{
            CCLOG(@"check");
            //            [[CCDirector sharedDirector] pushScene:[SpyScene node]];
        }break;
        case tag_spy_card_des:{
            CCLOG(@"check des");
            CCLabelTTF* wordLabel = (CCLabelTTF*)[self getChildByTag:tag_spy_word];
            if(wordLabel.visible == NO){
                wordLabel.visible = YES;
                if(currentIndex == spyIndex){
                    [wordLabel setString:spyWord];
                } else {
                    [wordLabel setString:populaceWord];
                }
            }
            
        }break;
        case tag_spy_next:{
            CCLOG(@"next");
            CCLabelTTF* wordLabel = (CCLabelTTF*)[self getChildByTag:tag_spy_word];
            if(wordLabel.visible == YES){
                wordLabel.visible = NO;
                if(currentIndex < totalPlayerNum){
                    currentIndex++;
                } else {
                    [[CCDirector sharedDirector] pushScene:[SpyVoteScene node]];
                }
            }
            //            [[CCDirector sharedDirector] pushScene:[SpyScene node]];
        }break;
        case tag_spy_restart:{
            CCLOG(@"back");
            [[CCDirector sharedDirector] popScene];
        }break;
        default:
            NSAssert(nil, @"%@: unspecified TAGS %i", NSStringFromSelector(_cmd), item.tag);
            break;
    }
}

+(id) scene{
    CCScene* scene = [CCScene node];
    CCLayer* layer = [SpyIdentityScene node];
    [scene addChild:layer];
    return scene;
}

@end
