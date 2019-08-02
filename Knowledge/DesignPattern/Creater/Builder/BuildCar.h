//
//  BuildCar.h
//  Knowledge
//
//  Created by 李日煌 on 2019/8/1.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BuildCarDelegate
@optional

- (void)buildBaoMa;
- (void)buildBenz;

@end

@interface BuildCar : NSObject<BuildCarDelegate>

@end
