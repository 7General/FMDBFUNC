//
//  ExtensionConst.h
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ExtensionConst : NSObject


/**常量标示*/
UIKIT_EXTERN NSString *const PropertyTypeInt;
UIKIT_EXTERN NSString *const PropertyTypeShort;
UIKIT_EXTERN NSString *const PropertyTypeFloat;
UIKIT_EXTERN NSString *const PropertyTypeDouble;
UIKIT_EXTERN NSString *const PropertyTypeLong;
UIKIT_EXTERN NSString *const PropertyTypeLongLong;
UIKIT_EXTERN NSString *const PropertyTypeChar;
UIKIT_EXTERN NSString *const PropertyTypeBOOL1;
UIKIT_EXTERN NSString *const PropertyTypeBOOL2;
UIKIT_EXTERN NSString *const PropertyTypeString;



/**SQLITE数据库标示*/
UIKIT_EXTERN NSString *const SqlliteINTEGER; // INT
UIKIT_EXTERN NSString *const SqlliteTEXT;        // string


@end
