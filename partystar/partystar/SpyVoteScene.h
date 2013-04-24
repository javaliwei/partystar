//
//  SpyVoteScene.h
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@interface SpyVoteScene : BaseScene {
    CGPoint restartPosition;
    CGPoint voteResultPosition;
    CGPoint cardsPosition;
    
    NSString* populaceWord;
    NSString* spyWord;
    
    int totalPlayerNum;
    int spyIndex;
}

@end
