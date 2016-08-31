//
//  PropertyType.h
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

/**获取数据类型*/
#import <Foundation/Foundation.h>
#import "ExtensionConst.h"

@interface PropertyType : NSObject

/** 是否为基本数字类型：int、float等 */
@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;
/** 是否为BOOL类型 */
@property (nonatomic, readonly, getter=isBoolType) BOOL boolType;
//@property (nonatomic, readonly) Class typeClass;

/**各项数据类型*/
@property (nonatomic, copy,readonly) NSString * CodeType;

/**向外抛出方法*/
+(instancetype)PropertyTypeCache:(NSString *)properName;

@end
