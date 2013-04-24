//
//  SettingLoader.h
//  partystar
//
//  Created by 李 伟 on 4/23/13.
//
//

@interface SettingLoader : NSObject


+(id) settingsFile;
+(BOOL) settingsFileExists;
+(NSMutableDictionary*) settingsPlistDict;
+(void) saveSettings:(NSDictionary*)settings;

@end
