//
//  GameScene.h
//  partystar
//
//  Created by 李 伟 on 4/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

@interface GameScene : CCLayer {
    CCSprite *spyColumn;
    CCSprite *guessColumn;
    CCSprite *setting;
    CCLayerColor* colorLayer;
}

+(id) scene;

@end
