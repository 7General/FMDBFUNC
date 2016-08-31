//
//  Property.m
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "Property.h"
#import "ExtensionConst.h"
#import <objc/message.h>

@implementation Property

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**向外抛出方法*/
+(instancetype)PropertyCache:(objc_property_t)property; {
    Property *propertOBJ = [[Property alloc] init];
    propertOBJ.property = property;
    return propertOBJ;
}

#pragma mark - set and get
-(void)setProperty:(objc_property_t)property {
    _property = property;
    
    /**记录成员属性名称*/
    _CodeName = @(property_getName(property));
    
    /**获取字段属性*/
    NSString *attrs = @(property_getAttributes(property));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 1;
    if (dotLoc == NSNotFound) {
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
    }
    _codeType = [PropertyType PropertyTypeCache:code];
}






@end
