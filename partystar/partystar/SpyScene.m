//
//  SpyScene.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SpyScene.h"

@implementation SpyScene

-(void)setPosition{
    
    settingPosition = ccp(winSize.width*0.35, -winSize.height*0.40);
    backPosition = ccp(-winSize.width*0.4, winSize.height*0.45);
    
    playerNumPosition = ccp(winSize.width*0.55, winSize.height*0.7);
    playerNumLabelPosition = ccp(winSize.width*0.2, winSize.height*0.7);
    addPosition = ccp(winSize.width*0.2, winSize.height*0.2);
    minusPosition = ccp(-winSize.width*0.1, winSize.height*0.2);
    
    startPosition = ccp(winSize.width*0, -winSize.height*0.2);

}

-(void)addGameMenu{
    
    CCLabelTTF* playerNumLabel = [CCLabelTTF labelWithString:@"人数"];
    playerNumLabel.position = playerNumLabelPosition;
    [self addChild:playerNumLabel];
    
    CCLabelTTF* playerNum = [CCLabelTTF labelWithString:[[GameSettings instance] getPlayerNum]];
    playerNum.position = playerNumPosition;
    [self addChild:playerNum z:2 tag:tag_spy_player_num];
    
    WSMenuWithOneItem* minusMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"-" position:minusPosition tag:tag_spy_minus selector:eventBlock target:self];
    [self addChild:minusMenu z:2];
    
    WSMenuWithOneItem* addMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"+" position:addPosition tag:tag_spy_add selector:eventBlock target:self];
    [self addChild:addMenu z:2];
    
    WSMenuWithOneItem* backMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"返回" position:backPosition tag:tag_back selector:eventBlock target:self];
    [self addChild:backMenu z:2];
    
    WSMenuWithOneItem* startMenu = [WSMenuWithOneItem menuWithLabelPosiTag:@"开始游戏" position:startPosition tag:tag_spy_start selector:eventBlock target:self];
    [self addChild:startMenu z:2];
}

-(id)init{
    if(self = [super init]){
        self.isTouchEnabled = YES;
        
        
    }
    return self;
}

#pragma mark clickHandler - handle all click event

-(void)clickHandler:(id)sender{
    CCLOG(@"clickHandler");
    CCMenuItem* item = (CCMenuItem*)sender;
    switch (item.tag) {
        case tag_spy_minus:{
            CCLOG(@"minus");
            CCLabelTTF* playerNum = (CCLabelTTF*)[self getChildByTag:tag_spy_player_num];
            NSString* playerNumString = [playerNum string];
            if(playerNumString.intValue - 1 >= 3){
                [playerNum setString:[NSString stringWithFormat:@"%d", playerNumString.intValue-1]];
            }
        }break;
        case tag_spy_add:{
            CCLOG(@"add");
            CCLabelTTF* playerNum = (CCLabelTTF*)[self getChildByTag:tag_spy_player_num];
            NSString* playerNumString = [playerNum string];
            if(playerNumString.intValue + 1 <= 15){
                [playerNum setString:[NSString stringWithFormat:@"%d", playerNumString.intValue+1]];
            }
        }break;
        case tag_spy_start:{
            CCLOG(@"spy_start");
            CCLabelTTF* playerNum = (CCLabelTTF*)[self getChildByTag:tag_spy_player_num];
            [[GameSettings instance] setPlayerNum:[playerNum string]];
            [[CCDirector sharedDirector] pushScene:[SpyIdentityScene scene]];
        }break;
        case tag_back:{
            CCLOG(@"back");
            [[CCDirector sharedDirector] popScene];
        }break;
        default:
            NSAssert(nil, @"%@: unspecified TAGS %i", NSStringFromSelector(_cmd), item.tag);
            break;
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"touch ended.");
}

+(id) scene{
    CCScene* scene = [CCScene node];
    CCLayer* layer = [SpyScene node];
    [scene addChild:layer];
    return scene;
}

@end
