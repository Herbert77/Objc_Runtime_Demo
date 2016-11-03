//
//  UIImage+Swizzling.h
//  Runtime(交换方法)
//
//  Created by Herbert Hu on 16/10/11.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Swizzling)

// 调和方法

// 需求:
// 希望在调用 imageNamed: 类方法时,
// 明确地知道图片的加载是否成功.

// 思路:
// 通过 UIImage 的分类来扩展 UIImage 类的能力,
// 使用 swizzling_imageNamed: 和 imageNamed: 方法进行调和.
// 让 imageNamed: 方法在 UIImage 类对象的方法列表中所表明的函数地址, 指向 swizzling_imageNamed: 方法在代码区的函数实现.
// 让 swizzling_imageNamed: 方法在 UIImage 类对象方法列表中所表明的函数地址, 指向 imageNamed: 方法在代码区的函数实现.

+ (UIImage *)swizzling_imageNamed:(NSString *)name;

@end
