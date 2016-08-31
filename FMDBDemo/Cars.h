//
//  Cars.h
//  FMDBDemo
//
//  Created by 王会洲 on 16/8/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cars : NSObject

@property (nonatomic, copy) NSString * carName;
/**车轮子*/
@property (nonatomic, assign) NSInteger  veelCount;
/**乘客数量*/
@property (nonatomic, assign) double  manngers;

@end
