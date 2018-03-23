//
//  SFExchangeMethodViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFExchangeMethodViewController.h"

@interface SFExchangeMethodViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SFExchangeMethodViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
     如果希望交换方法起作用的话，比如希望让系统方法：[UIImage imagedName: @"imagename"]，使用自己的实现，需要在类UIImage加载进内存前起作用。所以需要在load方法里交换方法，因为load方法在类被加载进内存前调用
     */
    
    self.imageView.image = [UIImage imageNamed:@"卡哇伊"];
}

@end
