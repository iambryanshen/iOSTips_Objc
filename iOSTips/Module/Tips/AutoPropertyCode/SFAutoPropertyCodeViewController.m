//
//  SFAutoPropertyCodeViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFAutoPropertyCodeViewController.h"
// 模型
#import "SFProperty.h"
// 自动生成代码
#import "NSDictionary+Property.h"
// Runtime字典转模型
#import "NSObject+Model.h"

@interface SFAutoPropertyCodeViewController ()

@end

@implementation SFAutoPropertyCodeViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"property" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    // 生成plist文件中对应的属性列表
    [dict propertyCode];
}

@end
