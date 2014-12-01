//
//  HRCommon.h
//  Hunter
//
//  Created by Comocomo on 11/30/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#ifndef Hunter_HRCommon_h
#define Hunter_HRCommon_h


#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define ORANGE_COLOR RGB(244, 112, 56)
#define GREEN_COLOR RGB(109, 148, 64)
#define BLUE_COLOR RGB(49, 129, 198)
#define DARK_BLUISH_GREY RGB(55, 75, 88)
#define LIGHT_BLUISH_GREY RGB(117, 140, 154)
#define LIGHT_BLUE RGB(49, 129, 198)
#define FACEBOOK_BLUE_COLOR RGB(45, 71,  131)
#define GREY_COLOR RGB(135, 135, 135)


#define HELVETICA_CONDENSEDBOLD(fontSize) [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:fontSize]
#define HELVETICA_BOLD(fontSize) [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]
#define HELVETICA_MEDIUM(fontSize) [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize]
#define HELVETICA_LIGHT(fontSize) [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize]
#define NOTEWORTHY_LIGHT(fontSize) [UIFont fontWithName:@"Noteworthy-Light" size:fontSize]

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height



#endif
