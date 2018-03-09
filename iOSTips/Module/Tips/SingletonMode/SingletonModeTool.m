//
//  SingletonModeTool.m
//  iOSTips
//
//  Created by brian on 2018/3/1.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SingletonModeTool.h"

/*
 * static 修饰的静态变量，程序启动后就存在，直到程序退出销毁
 */
static SingletonModeTool *_instance;
@implementation SingletonModeTool

#pragma mar - 简洁单例模式
+ (instancetype)shareTool {
    static SingletonModeTool *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}

#pragma mark - 单例方法
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

// 用来记录当前类是否已经创建过对象（已分配过内存）（已执行过allocWithZone方法）
// 全局的静态变量：对外界隐藏且不能修改值
+ (instancetype)share {
    return [[self alloc] init];
}

#pragma mark - alloc

+ (instancetype)alloc {
//    NSLog(@"%@", [SingletonModeTool shareInstance]);
    return [super alloc];
}

/*
 * 在通过alloc方法分配内存空间时，alloc会调用allocWithZone方法，分配内存实际上是在allocWithZone中实现的
 * 通过在重写的allocWithZone方法中控制allocWithZone实际只调用一次，来保存对象只创建一次，内存只分配一次，从而实现单例模式
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    NSLog(@"%s", __func__);
    // 同步锁，防止多线程的情况下，多个线程同时执行以下代码，导致对象多次创建
    // 被同步锁包裹的代码，一条线程未执行结束，其他线程排队等待
    /*
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
        return _instance;
    }
     */
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

#pragma mark - Copy mutableCopy

/*
 * copy同样也会调用copyWithZone分配内存
 */
- (id)copy {
//    NSLog(@"%s", __func__);
    return [super copy];
}

/*
 * _instance保存的当前类的创建的唯一对象
 */
- (id)copyWithZone:(NSZone *)zone {
//    NSLog(@"%s", __func__);
    return _instance;
}

- (id)mutableCopy {
//    NSLog(@"%s", __func__);
    return [super mutableCopy];
}

/*
 _instance保存的当前类的创建的唯一对象
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
//    NSLog(@"%s", __func__);
    return _instance;
}

@end
