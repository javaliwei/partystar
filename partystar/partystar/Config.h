//
//  Config.h
//  partystar
//
//  Created by 李 伟 on 4/9/13.
//
//

#ifndef partystar_Config_h
#define partystar_Config_h



#endif

#define SETTING_FILE @"settingsFile"
#define DEF_FONT_NAME @"Arial"
#define UMENG_APP_KEY @"50c72ed55270153a8b000013"
#define WEIXIN_APP_ID @"wx958e9703d9ba5ae9"
#define DEF_PLAYER_NUM @"6"

#define DEF_FONT_SIZE 26
#define IPHONE5_HEIGHT 568

typedef enum SpyRoles {
	populace,
	spy,
	blank,
    
} SpyRoles;

enum TAGS {
    tag_home_spy = 1000,
    tag_home_guess,
    tag_setting,
    tag_setting_feedback,
    tag_setting_share,
    tag_back,
    
    tag_spy_player_num,
    tag_spy_minus,
    tag_spy_add,
    tag_spy_start,
    tag_spy_card,
    tag_spy_card_des,
    tag_spy_restart,
    tag_spy_next,
    tag_spy_word,
    
    
    
};

enum CONSTS {
    padding = 10,
    marginTop = 5,
    
};
