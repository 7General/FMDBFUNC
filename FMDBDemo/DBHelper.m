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
-(BOOL)insertDataWithClassName:(NSString*)insertSql  {
    BOOL res = NO;
    if ([self.DB open]) {
        NSString * insertSql1 = insertSql;
        res = [self.DB executeUpdate:insertSql1];
        if (res) {
            NSLog(@"insert table success");
        } else {
            NSLog(@"insert table-----ERROR");
        }
        [self.DB close];
    }
    return res;
}



/**
 *  删除
 *
 *  @param name 凭借sql语句
 */
-(BOOL)deleteDataWithClassName:(NSString*)deleSql {
    BOOL res = NO;
    if ([self.DB open]) {
        NSString * deleteSql = deleSql;
        res = [self.DB executeUpdate:deleteSql];
        if (res) {
            NSLog(@"delete table-----success");
        } else {
            NSLog(@"delete table-----ERROR");
        }
        [self.DB close];
    }
    return res;
}


/*！
 *  查询
 *
 *  @param name 拼接sql查询语句
 */
-(NSMutableArray *)selectDataFromClassName:(NSString*)selectSql {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([self.DB open]) {
        NSString * sql = selectSql;
        FMResultSet * rs = [self.DB executeQuery:sql];
        while ([rs next]) {
            //int Id = [rs intForColumn:@"ID"];
            //NSString * name = [rs stringForColumn:@"names"];
            //NSString * age = [rs stringForColumn:@"ages"];
            //NSString * address = [rs stringForColumn:@"address"];
            //NSLog(@"id = %d, name = %@, age = %@  address = %@", Id, name, age, address);
            [arr addObject:[rs resultDictionary]];
            
            NSLog(@"arr:%@", arr);
        }
        [self.DB close];
    }
    return arr;
}


/*！
 *  更新服务
 *
 *  @param ModifySql update的sql语句
 */
-(BOOL)modifyDataWithClassName:(NSString*)ModifySql {
    BOOL res = NO;
    if ([self.DB open]) {
        NSString * updateSql = ModifySql;
        res = [self.DB executeUpdate:updateSql];
        if (res) {
            NSLog(@"update table sucess");
        } else {
            NSLog(@"update table-----ERROR");
        }
        [self.DB close];
    }
    return res;
}







-(NSMutableArray *)selectDataFromClassName:(NSString*)name sortkeys:(NSString *)sortkey fromIndex:(NSInteger)index rowCount:(NSInteger)countData {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSString *sql=[NSString stringWithFormat:@"SELECT  * FROM %@ WHERE %@>=%zi AND %@<=%zi ORDER BY %@ DESC",name,sortkey,(index - 1) * countData+1,sortkey,index * countData,sortkey];
    if ([self.DB open]) {
        FMResultSet * result =[self.DB executeQuery:sql];
        while ([result next]){
//            int Id = [rs intForColumn:@"ID"];
//            NSString * name = [rs stringForColumn:@"names"];
//            NSString * age = [rs stringForColumn:@"ages"];
//            NSString * address = [rs stringForColumn:@"address"];
//            NSLog(@"id = %d, name = %@, age = %@  address = %@", Id, name, age, address);
            //NSString *querySql = @"select * from stuInfo";
            
            //NSMutableArray *arr = [[NSMutableArray alloc] init];
            
            //FMResultSet *result = [_database executeQuery:querySql];
            
            //while ([result next]) {
                //用数组arr保存一条记录转成的字典
            [arr addObject:[result resultDictionary]];
            //}
            
            NSLog(@"arr:%@", arr);
            
            
        }
        [self.DB close];
    }
    return arr;
}



// 获得表的数据条数
- (NSInteger) getTableItemCount:(NSString *)tableName {
    NSInteger resInt = 0;
    NSString *sqlstr = [NSString stringWithFormat:@"SELECT count(*) as 'count' FROM %@", tableName];
    if ([self.DB open]) {
        FMResultSet *res = [self.DB executeQuery:sqlstr];
        if ([res next]) {
            resInt = [res intForColumn:@"count"];
            NSLog(@"TableItemCount %ld", resInt);
        }
        [self.DB close];
    }
    return resInt;
}

-(BOOL)isHaveDataFromTableItem:(NSString *)tableName {
    NSInteger resCount = [self getTableItemCount:tableName];
    return  resCount > 0 ? YES:NO;
}

@end
