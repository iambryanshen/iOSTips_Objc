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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)once:(UIButton *)sender {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"永远执行一次，你不可能看到我两次");
    });
    
    
}
- (IBAction)gcdFunc:(UIButton *)sender {
    
    
}

@end
