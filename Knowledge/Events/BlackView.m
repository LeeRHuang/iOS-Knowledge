//
//  BlackView.m
//  Event
//
//  Created by 李日煌 on 2018/10/31.
//  Copyright © 2018年 TF. All rights reserved.
//

#import "BlackView.h"

@implementation BlackView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"BlackView-touch");
    [super touchesBegan:touches withEvent:event];
}

@end
