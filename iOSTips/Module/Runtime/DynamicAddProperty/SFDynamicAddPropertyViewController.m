//
//  SFDynamicAddPropertyViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//


/*
 属性的本质：就是让某个指针（类的属性）和某个对象（属性值，比如：[NSString stringWithFormat:@"hello world"]）发生关联
 
 需求：给NSObject新增一个属性：name。把创建的对象name = @"hello world"，保存到NSObject新增的属性name中
 保存到NSObject中的属性的标准是，NSObject创建的对象objc在，属性name在，对象objc销毁，属性name销毁
 
 如果通过在分类中新增属性，且自己实现属性的set、get方法，我们需要间接定义一个全局变量才能实现，全局变量不会在objc对象销毁的时候，一起销毁。
 */


#import "SFDynamicAddPropertyViewController.h"
#import "NSObject+SFProperty.h"

@interface SFDynamicAddPropertyViewController ()

@end

@implementation SFDynamicAddPropertyViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *name = [NSString stringWithFormat:@"hello world"];
    NSObject *objc = [[NSObject alloc] init];
    objc.name = name;
    NSLog(@"objc.name = %@", objc.name);
}

@end
