//
//  MemoryDeallocSubClass.m
//  Knowledge
//
//  Created by lirihuang on 2021/8/8.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryDeallocSubClass.h"

@implementation MemoryDeallocSubClass

- (void)dealloc {
    NSLog(@"SubModel dealloc");
}

- (void)setBaseName:(NSString *)baseName {
    [super setBaseName:baseName];
    NSLog(@"SubModel setBaseName:%@", [NSString stringWithString:baseName]);
}

@end
