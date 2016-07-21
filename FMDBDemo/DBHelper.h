//
//  DBHelper.h
//  FMDBDemo
//
//  Created by 王会洲 on 16/5/23.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject

+(instancetype)defaultManager;

/**
 *  创建表格
 *
 *  @param CreateTableSql 创建表SQL
 */
-(void)CreateDataBaseName:(NSString*)CreateTableSql;

/**
 *  添加
 *
 *  @param name 添加SQL
 */
-(BOOL)insertDataWithClassName:(NSString*)insertSql;

/**
 *  删除
 *
 *  @param name 删除SQL
 */
-(BOOL)deleteDataWithClassName:(NSString*)deleSql;


/*！
 *  查询
 *
 *  @param name 查询SQL
 */
-(NSMutableArray *)selectDataFromClassName:(NSString*)insertSql;

/*！
 *  更新服务
 *
 *  @param ModifySql 更新SQL
 */
-(BOOL)modifyDataWithClassName:(NSString*)ModifySql;


/**
 *  根据谓词查询分页数据
 *
 *  @param name      表名
 *  @param predicate 谓词
 *  @param sortkeys  排序字段
 *  @param index     页码
 *  @param countData 每页数量
 *
 *  @return <#return value description#>
 */
-(NSMutableArray *)selectDataFromClassName:(NSString*)name sortkeys:(NSString *)sortkeys fromIndex:(NSInteger)index rowCount:(NSInteger)countData;

/**
 *  查询表里的数据项总计数
 *
 *  @param tableName 表名
 *
 *  @return 数据项总计数
 */
- (NSInteger) getTableItemCount:(NSString *)tableName;

/**
 *  表里是否有数据
 *
 *  @param tableName 表名
 *
 *  @return 是否有数据
 */
-(BOOL)isHaveDataFromTableItem:(NSString *)tableName;

@end
