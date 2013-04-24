//
//  GameSetting.m
//  partystar
//
//  Created by 李 伟 on 4/23/13.
//
//

#import "GameSettings.h"

@implementation GameSettings

@synthesize playerNum, nextIndexToCheck, playerMaps;

static GameSettings * instance = nil;

+(GameSettings *) instance {
	if(instance == nil) {
		instance = [[GameSettings alloc] init];
        
//        NSMutableDictionary* settings = [Settings settingsPlistDict];
//        NSNumber* soundState = [settings objectForKey:@"SoundStateKey"];
//        NSNumber* followState = [settings objectForKey:@"FollowStateKey"];
//        
//        [instance setHasSound:!!soundState.intValue];
//        instance.followShot = !!followState.intValue;
        [instance recoverFromRetainFile];
	}
    return instance;
}

-(void)recoverFromRetainFile{
    NSMutableDictionary* setting = [SettingLoader settingsPlistDict];
    playerNum = [setting objectForKey:@"playerNum"];
    nextIndexToCheck = [setting objectForKey:@"nextIndexToCheck"];
    playerMaps = [setting objectForKey:@"playerMaps"];
}

//如果在查看身份或者在投票，则表示上一局未结束(数据不一致除外)
-(BOOL)isRunning{
    return (isChecking || isVoting) && playerMaps != nil && [playerMaps count] == playerNum.intValue;
}
//如何下一个待查看的序号不等于总人数，则身份没有查看结束
-(BOOL)isChecking{
    return nextIndexToCheck != playerNum;
}
//如何有卧底没有被票出，则投票未结束
-(BOOL)isVoting{
    if(playerMaps == nil){
        return NO;
    }
    for (NSMutableDictionary* playerIdentity in playerMaps) {
//        int iden = [playerIdentity objectForKey:@"identity"];
        BOOL isVoted = (int)[playerIdentity objectForKey:@"isVoted"] == 1;
        SpyRoles role = [playerIdentity objectForKey:@"role"];
        if(role == spy && isVoted == NO){
            return YES;
        }
    }
    return NO;
}

-(void)setPlayerNum:(NSString*)playerNums{
    [self saveSettingWithKeyValue:@"playerNum" value:playerNums];
}

-(NSString*)getPlayerNum{
    NSMutableDictionary* setting = [SettingLoader settingsPlistDict];
    if(setting == nil || [setting objectForKey:@"playerNum"] == nil){
        CCLOG(@"无玩家数设置，取默认人数：%@",DEF_PLAYER_NUM);
        return DEF_PLAYER_NUM;
    }
    NSString* lastPlayerNum = (NSString*)[setting objectForKey:@"playerNum"];
    CCLOG(@"读取玩家数设置：%@",lastPlayerNum);
    return lastPlayerNum;
}

-(void)setNextIndexToCheck:(NSString*)index{
    [self saveSettingWithKeyValue:@"nextIndexToCheck" value:index];
}

-(void)saveSettingWithKeyValue:(NSString*)key value:(id)value{
    NSMutableDictionary* setting = [SettingLoader settingsPlistDict];
    [setting setObject:value forKey:key];
    [SettingLoader saveSettings:setting];
}

@end
