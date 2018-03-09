//
//  SFSingletonModeViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFSingletonModeViewController.h"
#import "SingletonModeTool.h"

@interface SFSingletonModeViewController ()

@end

@implementation SFSingletonModeViewController

- (IBAction)singletonMode1:(UIButton *)sender {
    
    SingletonModeTool *tool1 = [[SingletonModeTool alloc] init];
    SingletonModeTool *tool2 = [[SingletonModeTool alloc] init];
    SingletonModeTool *tool3 = [[SingletonModeTool alloc] init];
    
    NSLog(@"%@", tool1);
    NSLog(@"%@", tool2);
    NSLog(@"%@", tool3);
    
    NSLog(@"%@", [SingletonModeTool share]);
    
    NSLog(@"%@", tool1.copy);
    NSLog(@"%@", tool2.mutableCopy);
}

- (IBAction)singletonMode2:(id)sender {
    
    NSLog(@"%@", [SingletonModeTool shareInstance]);
    NSLog(@"%@", [SingletonModeTool shareInstance]);
    NSLog(@"%@", [SingletonModeTool shareInstance]);
}


/**
 常用写法
 */
- (IBAction)singletonMode3:(UIButton *)sender {
    
    NSLog(@"%@", [SingletonModeTool shareTool]);
    NSLog(@"%@", [SingletonModeTool shareTool]);
    NSLog(@"%@", [SingletonModeTool shareTool]);
}
@end
