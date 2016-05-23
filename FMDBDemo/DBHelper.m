//
//  DBHelper.m
//  FMDBDemo
//
//  Created by 王会洲 on 16/5/23.
//  Copyright © 2016年 王会洲. All rights reserved.
//

// coredata 的数据库名称
#define COREDATANAME @"IColud"
// 创建DB的名称
#define DBNAME @"IColud.sqlite"


#import "DBHelper.h"
#import "FMDB.h"

@interface DBHelper()
// 文件路径
@property (nonatomic, strong) NSString * DBStringPath;

@property (nonatomic, strong) FMDatabase * DB;
@end

@implementation DBHelper
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documents = [paths objectAtIndex:0];
        self.DBStringPath = [documents stringByAppendingPathComponent:DBNAME];
        NSLog(@"-----path:%@",self.DBStringPath);
        self.DB = [FMDatabase databaseWithPath:self.DBStringPath];
    }
    return self;
}

+ (instancetype)defaultManager {
    static DBHelper * s_defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_defaultManager = [[DBHelper alloc] init];
    });
    return s_defaultManager;
}

// 创建表
-(void)CreateDataBaseName:(NSString*)CreateTableSql  {
    //sql 语句
    if ([self.DB open]) {
        
        //        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS IColud (ID INTEGER PRIMARY KEY AUTOINCREMENT, names TEXT, ages INTEGER, address TEXT)"];
        NSString * sqlCreateTable = CreateTableSql;
        NSLog(@"--------------------------------------");
        BOOL res = [self.DB executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"creating DBTable--------->ERROR");
        } else {
            NSLog(@"creating DBTable success");
        }
        [self.DB close];
    }
}

/**
 *  添加
 *
 *  @param name <#name description#>
 */
-(void)insertDataWithClassName:(NSString*)insertSql  {
    if ([self.DB open]) {
        NSString * insertSql1 = insertSql;
        BOOL res = [self.DB executeUpdate:insertSql1];
        if (!res) {
            NSLog(@"insert table-----ERROR");
        } else {
            NSLog(@"insert table success");
        }
        [self.DB close];
        
    }
    
}



/**
 *  删除
 *
 *  @param name 凭借sql语句
 */
-(void)deleteDataWithClassName:(NSString*)deleSql {
    if ([self.DB open]) {
        NSString * deleteSql = deleSql;
        BOOL res = [self.DB executeUpdate:deleteSql];
        if (!res) {
            NSLog(@"delete table-----ERROR");
        } else {
            NSLog(@"delete table-----success");
        }
        [self.DB close];
    }
}


/*！
 *  查询
 *
 *  @param name 拼接sql查询语句
 */
-(void)selectDataFromClassName:(NSString*)selectSql {
    if ([self.DB open]) {
        NSString * sql = selectSql;
        FMResultSet * rs = [self.DB executeQuery:sql];
        while ([rs next]) {
            int Id = [rs intForColumn:@"ID"];
            NSString * name = [rs stringForColumn:@"names"];
            NSString * age = [rs stringForColumn:@"ages"];
            NSString * address = [rs stringForColumn:@"address"];
            NSLog(@"id = %d, name = %@, age = %@  address = %@", Id, name, age, address);
        }
        [self.DB close];
    }
}


/*！
 *  更新服务
 *
 *  @param ModifySql update的sql语句
 */
-(void)modifyDataWithClassName:(NSString*)ModifySql {
    if ([self.DB open]) {
        NSString * updateSql = ModifySql;
        BOOL res = [self.DB executeUpdate:updateSql];
        if (!res) {
            NSLog(@"update table-----ERROR");
        } else {
            NSLog(@"update table sucess");
        }
        [self.DB close];
        
    }
}







-(void)selectDataFromClassName:(NSString*)name sortkeys:(NSString *)sortkey fromIndex:(NSInteger)index rowCount:(NSInteger)countData {
    
    NSString *sql=[NSString stringWithFormat:@"SELECT  * FROM %@ WHERE %@>=%zi AND %@<=%zi ORDER BY %@ DESC",name,sortkey,(index - 1) * countData+1,sortkey,index * countData,sortkey];
    if ([self.DB open]) {
        FMResultSet *rs=[self.DB executeQuery:sql];
        
        while ([rs next]){
            int Id = [rs intForColumn:@"ID"];
            NSString * name = [rs stringForColumn:@"names"];
            NSString * age = [rs stringForColumn:@"ages"];
            NSString * address = [rs stringForColumn:@"address"];
            NSLog(@"id = %d, name = %@, age = %@  address = %@", Id, name, age, address);
            
        }
    }
}

-(void)selectCountFromTable {
    if ([self.DB open]) {
        NSString * updateSql = [NSString stringWithFormat:@"select count(*) as 'Count' from IColud"];
        FMResultSet * res = [self.DB executeQuery:updateSql];
    
        if ([res next]) {
            int totalCount = [res intForColumnIndex:0];
             NSLog(@"---%d",totalCount);
        }
//        while ([res next]) {
//            int count = [res intForColumn:@"Count"];
//            NSLog(@"---%d",count);
//        }
        [self.DB close];
    }
}





@end
