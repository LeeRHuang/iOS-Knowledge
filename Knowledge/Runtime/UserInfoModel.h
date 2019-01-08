//
//  UserInfoModel.h
//  Knowledge
//
//  Created by Lee on 2019/1/7.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "TFBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : TFBaseModel

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *gennder;


@end

NS_ASSUME_NONNULL_END
