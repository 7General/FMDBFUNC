# FMDBFUNC
FMDB封装------快速使用

### 创建数据表
```objc
//创建表sql语句（这里只需要传入 [selfclass class]）即可创建表
  NSString * sql =  [FMDBExtension CreateSqlcommandOfClass:[News class]];
  [[DBHelper defaultManager] CreateDataBaseName:sql];
```

### 查询
```objc
NSString * selectSql = [NSString stringWithFormat:@"select * from IColud where names = '%@'",@"张"];
[[DBHelper defaultManager] selectDataFromClassName:selectSql];
```

### 删除
```objc
NSString * sqlDel = [NSString stringWithFormat:@"delete  from IColud where id > '%d'",10];
[[DBHelper defaultManager] deleteDataWithClassName:sqlDel];
```

### 更新
```objc
NSString * updateSql  = [NSString stringWithFormat:@"update IColud set names = '%@' where id > '%d' ",@"项羽",13];
[[DBHelper defaultManager] modifyDataWithClassName:updateSql];
```

### 添加
```objc
NSString * insertSql = [NSString stringWithFormat:@"insert into IColud (names,ages,address)values ('%@','%@','%@')",@"张",@"12",@"中国"];
[[DBHelper defaultManager] insertDataWithClassName:insertSql];
```
### 分页查询
```objc
[[DBHelper defaultManager] selectDataFromClassName:@"IColud" sortkeys:@"id" fromIndex:1 rowCount:3];
```
### 查询表中是否有数据
```objc
[[DBHelper defaultManager] isHaveDataFromTableItem:@"IColud"];
```


关注洲洲哥的公众号，提高装逼技能就靠他了

![这里写图片描述](http://img.blog.csdn.net/20160426092941254)

