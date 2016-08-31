//
//  Property.h
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

/**获取数据内容*/
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "PropertyType.h"

@interface Property : NSObject

/**名称*/
@property (nonatomic, assign) objc_property_t  property;
/**属性名称*/
@property (nonatomic, strong,readonly) NSString * CodeName;

/**成员属性类型*/
@property (nonatomic, strong,readonly) PropertyType * codeType;

+(instancetype)PropertyCache:(objc_property_t)property;


@end

