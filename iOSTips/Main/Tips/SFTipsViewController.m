//
//  SFTipsViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFTipsViewController.h"
#import "SFSingletonModeViewController.h"
#import "SFRuntimeViewController.h"

@interface SFTipsViewController ()

@end

@implementation SFTipsViewController

- (void)viewDidLoad {
    
    self.header = @[@"", @"Runtime"];
    
    self.dataSource = @[@{@"单例模式": [SFSingletonModeViewController new]},
                        @{@"Runtime": [SFRuntimeViewController new]},];
    
    [super viewDidLoad];
}
@end
