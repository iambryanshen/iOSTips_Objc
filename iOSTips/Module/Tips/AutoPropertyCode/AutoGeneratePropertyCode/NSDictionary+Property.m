//
//  NSDictionary+Property.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "NSDictionary+Property.h"

@implementation NSDictionary (Property)

/*
 自动生成返回的数据中和字典中key值一一对应的属性列表
 */
- (void)propertyCode {

    NSMutableString *codes = [NSMutableString string];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;", key];
            [codes appendFormat:@"\n%@\n", code];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            NSString *code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;", key];
            [codes appendFormat:@"\n%@\n", code];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            NSString *code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;", key];
            [codes appendFormat:@"\n%@\n", code];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            NSString *code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSNumber *%@;", key];
            [codes appendFormat:@"\n%@\n", code];
        }
    }];
    
    NSLog(@"%@",codes);
}

@end
