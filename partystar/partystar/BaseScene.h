//
//  BaseScene.h
//  partystar
//
//  Created by 李 伟 on 4/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BaseScene : CCLayer {
    CGSize winSize;
}

@property (nonatomic, readonly) CGSize winSize;

@end


@interface CCSprite(extension)

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

@end

@interface CCLabelTTF(extension)

+(id)labelWithString:(NSString*)label;

@end