//
//  SettingLoader.m
//  partystar
//
//  Created by 李 伟 on 4/23/13.
//
//

#import "SettingLoader.h"

@implementation SettingLoader

+(NSMutableDictionary*) settingsPlistDict {
    
	if([SettingLoader settingsFileExists]) {
		return [[[NSMutableDictionary alloc] initWithContentsOfFile:[SettingLoader settingsFile]] autorelease];
	} else {
		NSMutableDictionary* settingsPlistDict = [[[NSMutableDictionary alloc] init] autorelease];
		[settingsPlistDict setObject:[NSNumber numberWithInt:0] forKey:@"hasMultiplayer"];
		return settingsPlistDict;
	}
}

+(void) saveSettings:(NSDictionary*)settings {
	[settings writeToFile:[SettingLoader settingsFile] atomically:NO];
}

+(id) settingsFile {
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:SETTING_FILE];
}

+(BOOL) settingsFileExists {
	return [[NSFileManager defaultManager] fileExistsAtPath:[self settingsFile] isDirectory:nil];
}

@end
