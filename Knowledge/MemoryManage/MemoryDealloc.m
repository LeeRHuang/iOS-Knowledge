//
//  MemoryDealloc.m
//  Knowledge
//
//  Created by lirihuang on 2021/8/8.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryDealloc.h"

@implementation MemoryDealloc

- (void)dealloc {
    NSLog(@"BaseModel dealloc");
    self.baseName = nil;
}

- (void)setBaseName:(NSString *)baseName {
    _baseName = baseName;
    NSLog(@"BaseModel setBaseName:%@", baseName);
}

@end
