//
//  SFRuntimeViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/15.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFRuntimeViewController.h"
#import "SFSendMsgViewController.h"
#import "SFExchangeMethodViewController.h"
#import "SFDynamicAddMethodViewController.h"
#import "SFDynamicAddPropertyViewController.h"
#import "SFDictToModelViewController.h"

#import "SFAutoPropertyCodeViewController.h"

@interface SFRuntimeViewController ()

@end

@implementation SFRuntimeViewController

- (void)viewDidLoad {
    
    self.header = @[@"", @"开发小技巧"];
    self.dataSource = @[@{@"1.Runtime发送消息": [SFSendMsgViewController new],
                          @"2.Runtime交换方法": [SFExchangeMethodViewController new],
                          @"3.Runtime动态添加方法": [SFDynamicAddMethodViewController new],
                          @"4.Runtime动态添加属性": [SFDynamicAddPropertyViewController new],
                          @"5.Runtime实现字典转模型": [SFDictToModelViewController new],},
                        
                        @{@"自动生成属性代码": [SFAutoPropertyCodeViewController new],},];
    
    [super viewDidLoad];
}

@end
