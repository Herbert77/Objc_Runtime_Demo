//
//  UIImage+Swizzling.m
//  Runtime(交换方法)
//
//  Created by Herbert Hu on 16/10/11.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "UIImage+Swizzling.h"
#import <objc/message.h>

@implementation UIImage (Swizzling)

// 该方法在类被加载到内存时, 执行一次
+ (void)load {
    
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));

    Method swizzling_imageNamedMethod = class_getClassMethod(self, @selector(swizzling_imageNamed:));
    
    method_exchangeImplementations(imageNamedMethod, swizzling_imageNamedMethod);
}

//+ (void)initialize {
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//}

+ (UIImage *)swizzling_imageNamed:(NSString *)name {
    
    UIImage *image = [UIImage swizzling_imageNamed:name];
    
    if (image == nil) {
        
        NSLog(@"Failed to load.");
    }
    else {
        
        NSLog(@"Success to load.");
    }
    
    return image;
}

@end
