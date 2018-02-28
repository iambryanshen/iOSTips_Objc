//
//  SFTipsViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFTipsViewController.h"
#import "SFSingletonModeViewController.h"

@interface SFTipsViewController ()

@end

@implementation SFTipsViewController

- (void)viewDidLoad {
    
    self.dataSource = @[@{@"单例模式": [[SFSingletonModeViewController alloc] init],},
                        @{@"单例模式": [[SFSingletonModeViewController alloc] init],},
                        @{@"单例模式": [[SFSingletonModeViewController alloc] init],}];
    
    [super viewDidLoad];
}
@end
