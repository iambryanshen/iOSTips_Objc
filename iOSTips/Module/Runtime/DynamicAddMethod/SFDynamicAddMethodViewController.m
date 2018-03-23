
//
//  SFDynamicAddMethodViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFDynamicAddMethodViewController.h"
#import "Person.h"

@interface SFDynamicAddMethodViewController ()

@end

@implementation SFDynamicAddMethodViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    Person *p = [Person new];
    
    //[p performSelector:@selector(aaaa)];
    [p performSelector:@selector(bbbb:) withObject:@10];
}


@end
