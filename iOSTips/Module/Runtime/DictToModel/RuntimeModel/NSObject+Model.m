//
//  NSObject+Model.m
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/runtime.h>

/*
 MJExtension的实现思路:
    > KVC实现字典转模型的思路是根据字典中的key到model中找对应的属性，并把key值对应的value赋值给对应的属性，如果找不到就调用setValue: forUndefinedKey:报错。
    > 在实际开发中，我们一般只需要用到字典中的一部分属性
    > 所以我们可以逆向思路，根据模型中的属性去字典中找对应的key值保存的value给属性赋值
 
 获取类中的所有方法：通过这种方式找到一个类中（一般是系统类）的私有方法，研究系统底层
    class_copyMethodList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
 
 获取一个类中的所有属性：
    class_copyPropertyList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
 
 获取类中的所有成员变量
    class_copyIvarList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
 
 为什么获取模型中所有key时使用class_copyIvarList，而不使用class_copyPropertyList？
    class_copyPropertyList：获取属性
    class_copyIvarList：获取成员变量
    > 用@property修饰的属性都会生成下划线开头的成员变量
    > 但是定义了成员变量，不一定定义了属性
    > 所有获取模型中所有key时，获取成员变量可以保证不漏掉任何一个key
 
 通过Runtime实现字典转模型的步骤
 1. 获取模型中所有的成员变量
 2. 根据模型中成员变量的key，去字典中找对应key保存的value
 3. 根据key和value给模型对象设置值
 */

@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    
    id objc = [[self alloc] init];
    
    /*
     第一个参数：获取那个类的成员变量
     第二个参数：记录成员变量个数的变量（count）
     返回值：保存全部成员变量的数组
     */
    unsigned int count;  // 定义一个count，传入count的地址&count，count会在方法执行后记录通过Runtime获取到的成员变量的数量
    Ivar *ivarList = class_copyIvarList(self, &count);

    // 遍历全部成员变量
    for (int i = 0; i < count; i++) {
        // 获取数组中的成员变量
        Ivar ivar = ivarList[i];
        // 获取成员变量的名字，并转成OC对象
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 获取模型的类名
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        // 由于获取到的成员变量前有一个下划线，去掉“_”
        NSString *key = [ivarName substringFromIndex:1];
        // 获取字典中key对应的value
        id value = dict[key];
        
        // 如果value是字典，需要进行二级转换
        // 如果模型中的key为NSDictionary，理解成不需要转换（如果是模型类才转换），做进一步判断
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            
            // 根据类名字典串转成类对象
            Class modelClass = NSClassFromString(ivarType);
        
            // 字典转模型: 把二级字典转换为二级模型
            value = [modelClass modelWithDict:value];
        }
        
        // 通过获取到的key和value给模型设置值
        [objc setValue:value forKey:key];
    }
    
    return objc;
}

@end
