//
//  BaseScene.h
//  partystar
//
//  Created by 李 伟 on 4/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameSettings.h"

@interface BaseScene : CCLayer {
    CGSize winSize;
    CCSprite* bg;
    
    CGPoint bgPosition;
    
    SEL eventBlock;
}

-(void)setPosition;
-(void)addBackground;
-(void)addGameMenu;

@end


@interface CCSprite(extension)

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

@end

@interface CCLabelTTF(extension)

+(id)labelWithString:(NSString*)label;

@end

@interface WSMenuWithOneItem : CCMenu

+(id)menuWithLabelPosiTag:(NSString*)label position:(CGPoint)position tag:(int)tag selector:(SEL)selector target:(id)target;

@end