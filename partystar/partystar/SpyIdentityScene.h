//
//  SpyIdentityScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
#import "BaseScene.h"
#import "SpyVoteScene.h"


@interface SpyIdentityScene : BaseScene {
    
    CGPoint cardDesPosition;
    CGPoint cardPosition;
    CGPoint checkition;
    CGPoint restartPosition;
    CGPoint nextPosition;
    CGPoint wordPosition;
    NSArray* spyWords;
    
    NSString* populaceWord;
    NSString* spyWord;
    
    int totalPlayerNum;
    int spyIndex;
    int currentIndex;
}

+(id)scene;

@end
