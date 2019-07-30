//
//  ViewController.m
//  Knowledge
//
//  Created by Lee on 2018/11/26.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "ViewController.h"
#import "BlockTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BlockTest *block = [[BlockTest alloc] init];
//    [block testBlock];
//    
//    NSMutableString *originalString = @"hello world!";
//    NSString *newString = [self stringByReverse:originalString];
//    NSLog(@"OC reverse result is %@ \n", newString);
//    block.callBack = ^NSString *(NSString *name) {
//        
//    };
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)stringByReverse:(NSMutableString *)str{
    
      NSMutableString *string = [NSMutableString stringWithCapacity:str.length];
      for (NSInteger i = str.length-1; i>=0; i--) {
      NSLog(@"%@",[str substringWithRange:NSMakeRange(i, 1)]);
      [string appendString:[str substringWithRange:NSMakeRange(i, 1)]];
    }
    
     return string;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
