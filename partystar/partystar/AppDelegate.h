//
//  AppDelegate.h
//  partystar
//
//  Created by 李 伟 on 4/9/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//
#import "WXApi.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate, WXApiDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
