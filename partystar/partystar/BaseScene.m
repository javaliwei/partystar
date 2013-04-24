//
//  BaseScene.m
//  partystar
//
//  Created by 李 伟 on 4/15/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseScene.h"

@implementation BaseScene

-(id)init{
    if(self = [super init]){
        winSize = [[CCDirector sharedDirector] winSize];
        eventBlock = @selector(clickHandler:);
        [self setPosition];
        [self addBackground];
        [self addGameMenu];
    }
    return self;
}

-(void)setPosition{
    bgPosition = ccp(winSize.width*0.5, winSize.height*0.5);
}

-(void)addBackground{
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
       && winSize.height == IPHONE5_HEIGHT){
        bg = [CCSprite spriteWithFile:@"bg-iphone5.png"];
    } else {
        bg = [CCSprite spriteWithFile:@"bg.png"];
    }
    bg.anchorPoint = bgPosition;
    
    [self addChild:bg z:-1];
}

-(void)addGameMenu{
    
}

@end


@implementation CCSprite(extension)

- (CGFloat)width
{
	CGFloat width = self.texture.contentSize.width;
    
	return width;
}

- (CGFloat)height
{
	CGFloat height = self.texture.contentSize.height;
    
	return height;
}

@end

@implementation CCLabelTTF(extension)

+(id)labelWithString:(NSString*)label{
    CCLabelTTF* ccLabel = [self labelWithString:label fontName:DEF_FONT_NAME fontSize:DEF_FONT_SIZE];
    ccLabel.color = ccBLACK;
    return ccLabel;
}

@end

@implementation WSMenuWithOneItem

+(id)menuWithLabelPosiTag:(NSString *)label position:(CGPoint)position tag:(int)tag selector:(SEL)selector target:(id)target{
    CCLabelTTF* mLabel = [CCLabelTTF labelWithString:label];
    CCMenuItem* menuItem = [CCMenuItemFont itemWithLabel:mLabel target:target selector:selector];
    menuItem.position = position;
    menuItem.tag = tag;
    
    CCMenu *menu =[CCMenu menuWithItems:menuItem, nil];
    return menu;
}

@end





