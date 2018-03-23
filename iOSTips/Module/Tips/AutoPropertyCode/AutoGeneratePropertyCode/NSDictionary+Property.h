//
//  NSDictionary+Property.h
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Property)

/*
 自动生成返回的数据中和字典中key值一一对应的属性列表
 */
- (void)propertyCode;

@end
