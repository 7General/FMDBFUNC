//
//  FMDBExtension.h
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "PropertyType.h"
#import "Property.h"

@interface FMDBExtension : NSObject


+(NSString *) CreateSqlcommandOfClass:(Class )className;

@end
