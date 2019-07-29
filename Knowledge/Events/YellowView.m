//
//  YellowView.m
//  Event
//
//  Created by 李日煌 on 2018/10/31.
//  Copyright © 2018年 TF. All rights reserved.
//

#import "YellowView.h"

@implementation YellowView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"YellowView-touch");
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return YES;
//}

@end
