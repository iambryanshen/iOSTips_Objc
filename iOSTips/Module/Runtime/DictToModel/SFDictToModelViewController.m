//
//  SFDictToModelViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFDictToModelViewController.h"
// 自动生成代码
#import "NSDictionary+Property.h"
// Runtime字典转模型
#import "NSObject+Model.h"

// 导入模型
#import "SFPerson.h"

@interface SFDictToModelViewController ()

@end

@implementation SFDictToModelViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"person" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
//    [dict[@"body"] propertyCode];
    SFPerson *person = [SFPerson modelWithDict:dict];
    NSLog(@"%@ ------ %@ ------ %@ ------ %@", person.body, person.section_count, person.tag_name, person.color);
}

@end
