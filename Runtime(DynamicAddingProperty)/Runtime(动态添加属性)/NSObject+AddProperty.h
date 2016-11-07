//
//  NSObject+AddProperty.h
//  Runtime(动态添加属性)
//
//  Created by Herbert Hu on 16/10/12.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AddProperty)

// OC的分类允许给分类添加属性，但不会自动生成getter、setter方法
@property (strong, nonatomic) NSString *name;

@end
