//
//  NSObject+SFProperty.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "NSObject+SFProperty.h"

#import <objc/message.h>

@implementation NSObject (SFProperty)

- (void)setName:(NSString *)name {
    /*
     第一个参数：需要添加属性的对象
     第二个参数：添加的属性
     第三个参数：添加的属性保存的值
     第四个参数：保存属性的策略（weak、strong、retain、assign...）
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    /*
     第一个参数：取出属性的对象
     第二个参数：需要取出的属性的名称
     */
    return objc_getAssociatedObject(self, @"name");
}

@end
