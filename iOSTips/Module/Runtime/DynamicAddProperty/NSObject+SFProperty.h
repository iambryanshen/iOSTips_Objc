//
//  NSObject+SFProperty.h
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SFProperty)

// 原则上分类中不能添加（OC语法）

// 注意：如果category新增property，category中的property只会生成属性name的set，get方法的声明，并不会生成set，get方法的实现和下划线成员属性（_name）
@property (nonatomic, strong) NSString *name;

@end
