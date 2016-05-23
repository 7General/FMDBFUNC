//
//  MainViewController.m
//  FMDBDemo
//
//  Created by 王会洲 on 16/5/23.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "FMDB.h"
#import "DBHelper.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FMDB";
    
    UIButton *insterBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect2=CGRectMake(180, 160, 100, 50);
    insterBtn.backgroundColor = [UIColor greenColor];
    insterBtn.frame=rect2;
    [insterBtn addTarget:self action:@selector(insertData) forControlEvents:UIControlEventTouchDown];
    [insterBtn setTitle:@"添加" forState:UIControlStateNormal];
    [self.view addSubview:insterBtn];
    
    
    
    UIButton *updateBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect3=CGRectMake(10, 220, 100, 50);
    updateBtn.backgroundColor = [UIColor greenColor];
    updateBtn.frame=rect3;
    [updateBtn addTarget:self action:@selector(selectData) forControlEvents:UIControlEventTouchDown];
    [updateBtn setTitle:@"查找" forState:UIControlStateNormal];
    [self.view addSubview:updateBtn];
    
    
    UIButton *deleteBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect4=CGRectMake(180, 220, 100, 50);
    deleteBtn.backgroundColor = [UIColor greenColor];
    deleteBtn.frame=rect4;
    [deleteBtn addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchDown];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.view addSubview:deleteBtn];
    
    
    
    UIButton *selectBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect5=CGRectMake(60, 340, 200, 50);
    selectBtn.backgroundColor = [UIColor greenColor];
    selectBtn.frame=rect5;
    [selectBtn addTarget:self action:@selector(updateData) forControlEvents:UIControlEventTouchDown];
    [selectBtn setTitle:@"更新" forState:UIControlStateNormal];
    [self.view addSubview:selectBtn];
    
    
    UIButton *selectSort=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect8=CGRectMake(60, 440, 200, 50);
    selectSort.backgroundColor = [UIColor greenColor];
    selectSort.frame=rect8;
    [selectSort addTarget:self action:@selector(fenyeSelect) forControlEvents:UIControlEventTouchDown];
    [selectSort setTitle:@"分页查询" forState:UIControlStateNormal];
    [self.view addSubview:selectSort];
    
    
    
}

-(void)fenyeSelect {
    //[[DBHelper defaultManager] selectDataFromClassName:@"IColud" sortkeys:@"id" fromIndex:1 rowCount:3];
    
//    [[DBHelper defaultManager] selectCountFromTable];
    [[DBHelper defaultManager] getTableItemCount:@"IColud"];
}

-(void) selectData{
    NSString * selectSql = [NSString stringWithFormat:@"select * from IColud where names = '%@'",@"张"];
    [[DBHelper defaultManager] selectDataFromClassName:selectSql];
}

-(void) deleteData{
    NSString * sqlDel = [NSString stringWithFormat:@"delete  from IColud where id = '%d'",23];
    [[DBHelper defaultManager] deleteDataWithClassName:sqlDel];
}

-(void) updateData{
    NSString * updateSql  = [NSString stringWithFormat:@"update IColud set names = '%@' where id > '%d' ",@"项羽",13];
    [[DBHelper defaultManager] modifyDataWithClassName:updateSql];
}

-(void) insertData{
    NSString * insertSql = [NSString stringWithFormat:@"insert into IColud (names,ages,address)values ('%@','%@','%@')",@"张",@"12",@"中国"];
    [[DBHelper defaultManager] insertDataWithClassName:insertSql];
}

@end
