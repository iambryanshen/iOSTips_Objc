//
//  SFRuntimeViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/15.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFRuntimeViewController.h"
#import "SFSendMsgViewController.h"

@interface SFRuntimeViewController ()

@end

@implementation SFRuntimeViewController

- (void)viewDidLoad {
    
    self.header = @[@""];
    self.dataSource = @[@{@"Runtime发送消息": [SFSendMsgViewController new]},];
    
    [super viewDidLoad];
}

@end
