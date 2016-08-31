//
//  FMDBExtension.m
//  RuntimeData
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "FMDBExtension.h"



@implementation FMDBExtension

+(instancetype)FMDBExtension {
    return [[self alloc] init];
}

+(NSString *) CreateSqlcommandOfClass:(Class )className {
    ///存储所有的属性名称
    NSString *sqlCommand = [[NSString alloc] init];
    ///存储属性的个数
    unsigned int propertyCount = 0;
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList(className, &propertyCount);
    /**凭接Sql语句*/
    sqlCommand = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT",NSStringFromClass(className)];
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        Property *codeName = [Property PropertyCache:property];
        sqlCommand = [sqlCommand stringByAppendingString:[NSString stringWithFormat:@",%@ %@",codeName.CodeName,codeName.codeType.CodeType]];
    }
   sqlCommand = [sqlCommand stringByAppendingString:@")"];
    NSLog(@"-----%@",sqlCommand);
    /**
     *   注意，这里properties是一个数组指针，是C的语法，
     *   我们需要使用free函数来释放内存，否则会造成内存泄露
     */
    free(propertys);
    return sqlCommand;
}


@end
