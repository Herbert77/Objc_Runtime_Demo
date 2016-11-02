//
//  Rabbit.m
//  Runtime(消息机制)
//
//  Created by Herbert Hu on 16/10/11.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "Rabbit.h"

@implementation Rabbit

- (void)jumpTo:(NSString *)place withCarrots:(int)carrots {
    
    NSLog(@"The little rabbit jump to the %@ with %i %@.", place, carrots, (carrots==1)?@"carrot":@"carrots");
}

@end
