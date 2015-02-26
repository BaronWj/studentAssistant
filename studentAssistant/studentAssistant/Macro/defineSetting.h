
//
//  defineSetting.h
//  SchoolGateway
//
//  Created by 迈艾普 on 14-11-20.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#ifndef SchoolGateway_defineSetting_h
#define SchoolGateway_defineSetting_h
    #define ScreenHeight [UIScreen mainScreen].bounds.size.height
    #define ScreenWidth [UIScreen mainScreen].bounds.size.width



#import "UITableViewCell+tableViewCell.h"
#import "UIKit+AFNetworking.h"
#import "NSString+URLEncoding.h"
#import "UIImageView+UIImageCategory.h"

//#endif
// Get RGBA Color
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// Get RGB Color
#define RGB(r,g,b)          RGBA(r,g,b,1.0f)
// RGB（hexadecimal->decimal）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define iPhoneDelegate    ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/**
 * userAndPassWord
 */
#define USERANDPWED  @"USERANDPWD"
#define FIRSTLODINSTATE @"FIRSTLODINSTATE"
#define USERID @"USERID"
//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);

/**
 *  Device
 */
#define isRetina ([[UIScreen mainScreen] scale]==2)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define isRetinaOld ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536, 2048), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIOS4 ([[[UIDevice currentDevice] systemVersion] intValue]==4)

#define isIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]==5)

#define isIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]==6)

#define isAfterIOS4 ([[[UIDevice currentDevice] systemVersion] intValue] >= 4)

#define isAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue] >= 5)

#define isAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue] >= 6)

#define IsAfterIOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0)? (YES):(NO))

#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))


#define iOSCurrentVersion ([[UIDevice currentDevice] systemVersion])



// openURL
#define canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])

#define openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

// telphone

#define canTel   ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])

#define tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])

#define telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

//应用尺寸(不包括状态栏,通话时状态栏高度不是20，所以需要知道具体尺寸)

#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)

#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)

#define kContent_Frame    (CGRectMake(0, 0 ,kContent_Width,kContent_Height))

#define kContent_CenterX  kContent_Width/2

#define kContent_CenterY  kContent_Height/2


//设备屏幕尺寸

#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)

#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)

#define kScreen_Frame    (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))

#define kScreen_CenterX  kScreen_Width/2

#define kScreen_CenterY  kScreen_Height/2


//判断空字符串

#define ISNULLSTR(str) (str == nil || (NSObject *)str == [NSNull null] || str.length == 0 || [str isKindOfClass:[NSNull class]])
#define ISNULLARRAY(arr) (arr == nil || (NSObject *)arr == [NSNull null] || arr.count == 0)
#define ISNULL(obj) (obj == nil || (NSObject *)obj == [NSNull null])
#define iPhoneDelegate    ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//输出frame(frame是结构体，没法%@)

#define LOGRECT(f) NSLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)

#define LOGBOOL(b)  NSLog(@"%@",b?@"YES":@"NO");

//弹出信息

#define ALERT(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show]

//背景颜色
#define backGround UIColorFromRGB(0xFFFFFF)
#define nav_backGround UIColorFromRGB(0x84b73e)
#define labelTextColor UIColorFromRGB(0x5b5b5b)
//课表
#define kWidth 60
#define kHeight 40

// defineLog pattern
#ifdef DEBUG
#define MyLog(...) NSLog(__VA_ARGS__)
#else
#define MyLog(...)
#endif

#endif
