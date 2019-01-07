//
//  UIImage+KZ_Load.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "UIImage+KZ_Load.h"
#import <objc/runtime.h>

@implementation UIImage (KZ_Load)

+ (void)load {
    Method m1 = class_getClassMethod(self.class, @selector(imageNamed:));
    Method m2 = class_getClassMethod(self.class, @selector(kz_imageNamed:));
    method_exchangeImplementations(m1, m2);
}

+ (UIImage *)kz_imageNamed:(NSString *)name {
    if (!name.length) {
        return nil;
    }
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        name = [name stringByAppendingString:@"_ios7"];
    }
    return [UIImage kz_imageNamed:name];
}

@end
