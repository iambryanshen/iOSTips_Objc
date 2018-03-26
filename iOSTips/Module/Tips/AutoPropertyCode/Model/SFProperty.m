//
//  SFProperty.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFProperty.h"

@implementation SFProperty

+ (SFProperty *)propertyWithDict:(NSDictionary *)dict {
    
    SFProperty *property = [[SFProperty alloc] init];
    
    // 该行的具体实现如下
    //[property setValuesForKeysWithDictionary:dict];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        /*
         KVC本质
         会去找和key相同名称的setKey方法，如果有，直接调用setKey方法赋值，如果没有
         会去找和key相同名称的带有下划线的成员变量，如果有，直接给_key赋值，如果没有
         会去找和key相同名称的属性，如果有，直接给属性赋值，如果没有
         会调用：setValue: forUndefinedKey:，然后报错
         
         Tips：如果在模型中只定义需要的key值，同时又不希望报错。可以通过重写setValue:forUndefinedKey:方法，然后保证setValue:forUndefinedKey:方法什么也不做就好了。
         */
        [property setValue:obj forKey:key];
    }];
    
    return property;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    /*
     什么也不做，保证模型中即使没有定义数据中的全部key值，也不会报错
     */
}

@end
