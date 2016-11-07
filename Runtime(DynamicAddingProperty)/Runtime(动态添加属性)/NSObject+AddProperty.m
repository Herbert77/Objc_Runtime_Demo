//
//  NSObject+AddProperty.m
//  Runtime(动态添加属性)
//
//  Created by Herbert Hu on 16/10/12.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/message.h>

@implementation NSObject (AddProperty)

//static NSString *_name;

- (void)setName:(NSString *)name {
    
//    _name = name;
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    
//    return _name;
    return objc_getAssociatedObject(self, "name");
}

@end
