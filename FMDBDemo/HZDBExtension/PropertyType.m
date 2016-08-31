//
//  PropertyType.m
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "PropertyType.h"

@implementation PropertyType

+(instancetype)PropertyTypeCache:(NSString *)code {
    PropertyType * property = [[self alloc] init];
    property.CodeType = code;
    return property;
}
-(void)setCodeType:(NSString *)CodeType {
    _CodeType = CodeType;
    
    if (CodeType == nil) return;
    
    if (CodeType.length > 3 && [CodeType hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        NSString * _code = [CodeType substringWithRange:NSMakeRange(2, CodeType.length - 3)];
      if([_code isEqualToString:PropertyTypeString]) {
           _CodeType = SqlliteTEXT;
      }
    }

    // 是否为数字类型
    NSString *lowerCode = CodeType.lowercaseString;
    NSArray *numberTypes = @[PropertyTypeInt, PropertyTypeShort, PropertyTypeFloat, PropertyTypeDouble, PropertyTypeLong, PropertyTypeLongLong, PropertyTypeChar, PropertyTypeBOOL1, PropertyTypeBOOL2];
    if ([numberTypes containsObject:lowerCode]) {
        /**合并为sqllite的INTEGER*/
        /*_numberType = YES;
        if ([lowerCode isEqualToString:PropertyTypeBOOL1]
            || [lowerCode isEqualToString:PropertyTypeBOOL2]) {
            _boolType = YES;
        }*/
        
        /**同意归属为INT类型*/
        _CodeType = SqlliteINTEGER;
    }
}


@end
