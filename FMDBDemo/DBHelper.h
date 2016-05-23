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
-(void)insertDataWithClassName:(NSString*)insertSql;

/**
 *  删除
 *
 *  @param name 删除SQL
 */
-(void)deleteDataWithClassName:(NSString*)deleSql;


/*！
 *  查询
 *
 *  @param name 查询SQL
 */
-(void)selectDataFromClassName:(NSString*)insertSql;

/*！
 *  更新服务
 *
 *  @param ModifySql 更新SQL
 */
-(void)modifyDataWithClassName:(NSString*)ModifySql;


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
-(void)selectDataFromClassName:(NSString*)name sortkeys:(NSString *)sortkeys fromIndex:(NSInteger)index rowCount:(NSInteger)countData;
-(void)selectCountFromTable;

@end
