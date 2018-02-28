//
//  SFNetworkViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFNetworkViewController.h"
#import "SFGCDViewController.h"

@interface SFNetworkViewController ()

@end

@implementation SFNetworkViewController

- (void)viewDidLoad {
    
    self.dataSource = @[@{@"GCD": [[SFGCDViewController alloc] init]}];
    
    [super viewDidLoad];
}

@end
