//
//  SFGCDViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFGCDViewController.h"

@interface SFGCDViewController ()

@end

@implementation SFGCDViewController

- (IBAction)once:(UIButton *)sender {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"永远执行一次，你不可能看到我两次");
    });
}

- (IBAction)gcdFunc:(UIButton *)sender {
    
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.brian.www", DISPATCH_QUEUE_CONCURRENT);
    
    /*
     * 以函数的形式封装任务，功能上等同于下面以block的形式封装任务
     * dispatch_async(queue, ^{
     *    任务
     * })
     */
    dispatch_async_f(queue, NULL, task);
}

void task(void *_Nullable str) {
    NSLog(@"%@", [NSThread currentThread]);
}

@end
