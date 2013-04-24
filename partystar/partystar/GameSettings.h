//
//  GameSetting.h
//  partystar
//
//  Created by 李 伟 on 4/23/13.
//
//

#import "SettingLoader.h"

@interface GameSettings : NSObject {
    //if game is unfinished
	BOOL isRunning;
    //if players are checking identities
    BOOL isChecking;
    //if players are voting
    BOOL isVoting;
    //players number
    NSString* playerNum;
    //the next index player to check identities
    NSString* nextIndexToCheck;
    //all the user identities
    NSMutableArray* playerMaps;
}

@property(nonatomic, assign) NSString* playerNum;
@property(nonatomic, assign) NSString* nextIndexToCheck;
@property(nonatomic, assign) NSMutableArray* playerMaps;

+(GameSettings *) instance;
-(BOOL)isRunning;
-(BOOL)isChecking;
-(BOOL)isVoting;
-(void)recoverFromRetainFile;
-(void)setPlayerNum:(NSString*)playerNum;
-(NSString*)getPlayerNum;
-(void)setNextIndexToCheck:(NSString*)nextIndexToCheck;
-(NSString*)getNextIndexToCheck;
-(void)setPopuWord:(NSString*)popuWord;
-(NSString*)getPopuWord;
-(void)setSpyWord:(NSString*)spyWord;
-(NSString*)getSpyWord;

@end