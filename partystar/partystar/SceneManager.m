//
//  SceneManager.m
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

//
//  SceneManager.m
//

#import "SceneManager.h"


@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;

@end

@implementation SceneManager

/*  ___Template___________________________________
 
 Step 3 - Add implementation to call scene
 ______________________________________________
 
 
 +(void) goSceneName {
 [SceneManager go:[SceneName node]];
 }
 
 */

#pragma mark 切换场景

+(void) goSpyHome {
    [SceneManager go:[SpyScene node]];
}

+(void) go: (CCLayer *) layer {
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    
    
    if ([director runningScene]) {
        
        [director replaceScene:newScene];
        
        
    }
    else {
        [director runWithScene:newScene];
    }
}


#pragma mark 类方法

+(CCScene *) wrap: (CCLayer *) layer {
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}

@end
