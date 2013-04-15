//
//  HomeBackground.m
//  partystar
//
//  Created by 李 伟 on 4/11/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HomeBackground.h"


@implementation HomeBackground

+(id) scene{
    CCScene* scene = [CCScene node];
    CCLayer* layer = [HomeBackground node];
    [scene addChild:layer];
    return scene;
}

@end
