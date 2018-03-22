//
//  Person.m
//  iOSTips
//
//  Created by brian on 2018/3/21.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

- (void)eat {
    NSLog(@"eat");
}

- (void)run:(int)name dis:(int)metre {
    NSLog(@"%d跑了%d", name, metre);
}

/*******************************动态加载方法*******************************/
/*
 * 处理未实现的类方法
 * 调用了一个未实现的类方法时就会执行resolveClassMethod
 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    NSLog(@"方法：%@", NSStringFromSelector(sel));
    
    return [super resolveClassMethod:sel];
}

/*
 * 处理未实现的对象方法
 * 调用了一个未实现的对象方法时就会执行resolveInstanceMethod
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    /*
     * 动态添加play方法
     */
    if (sel == NSSelectorFromString(@"aaaa")) {
        /*
         * 参数一：给哪个类添加方法
         * 参数二：添加的方法
         * 参数三：添加方法的实现(函数的入口：函数名)
         * 参数四：
            > "v": 返回值（void）
            > "@": 第一个参数类型（An object (whether statically typed or typed id)）
            > ":": 第二个参数类型（A method selector (SEL)）
         */
        class_addMethod(self, sel, aaaa, "v@:");
    } else if (sel == NSSelectorFromString(@"bbbb:")) {
        /*
         "v@:@"
            > v: 方法的返回值为void
            > @: 第一个参数的类型为一个对象self
            > :: 第二个参数的类型为一个方法选择器
            > @: 第三个参数的类型为一个对象NSNumber *metre
         */
        class_addMethod(self, @selector(bbbb:), bbbb, "v@:@");
    }
    
    return [super resolveInstanceMethod:sel];
}

/*
 * self:方法调用者
 * _cmd:当前方法编号
 * 任何一个方法都能调用self,_cmd，任何一个方法也都有这两个参数，隐士参数
 */
void aaaa(id self, SEL _cmd) {
    NSLog(@"打篮球！！！");
}

void bbbb(id self, SEL _cmd, NSNumber *metre) {
    NSLog(@"打篮球，进了%@球", metre);
}

@end
