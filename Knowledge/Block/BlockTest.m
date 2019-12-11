//
//  BlockTest.m
//  Knowledge
//
//  Created by 李日煌 on 2019/3/2.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "BlockTest.h"

@interface BlockTest ()
// 定义一个block
@property (nonatomic,strong)void(^myBlock)(void);

@end

int age1 = 11;
static int height1 = 22;
@implementation BlockTest

- (void)testBlock {
//    void(^blockA)(void) = ^{
//        NSLog(@"just a block");
//    };
//    NSLog(@"%@", blockA);
//
//    NSInteger value = 10;
//
//    void(^blockB)(void) = ^{
//        NSLog(@"just a block === %ld", value);
//    };
//    NSLog(@"%@", blockB);
//
//    void(^ __weak blockC)(void) = ^{
//        NSLog(@"just a block === %ld", value);
//    };
//
//    NSLog(@"%@", blockC);
//
//    self.callBack(@"aaa");
    
//    void (^block)(void) =  ^{
//          NSLog(@"123");
//    };
//
//    NSLog(@"block.class = %@",[block class]);
//    NSLog(@"block.class.superclass = %@",[[block class] superclass]);
//    NSLog(@"block.class.superclass.superclass = %@",[[[block class] superclass] superclass]);
//    NSLog(@"block.class.superclass.superclass.superclass = %@",[[[[block class] superclass] superclass] superclass]);
//    [self testAuto];
//    [self testStatic];
//    [self testGlobal];
    [self testType];
}

- (void)testAuto {
    int age = 20;
    void (^block)(void) =  ^{
            NSLog(@"age is %d",age);
    };
    age = 25;
    block();
}

- (void)testStatic {
    static int height  = 30;
    int age = 20;
    void (^block)(void) =  ^{
         NSLog(@"age is %d height = %d",age,height);
    };
    age = 25;
    height = 35;
    block();
}

- (void)testGlobal {
    void (^block)(void) =  ^{
                NSLog(@"age1 is %d height1 = %d",age1,height1);
    };
    age1 = 25;
    height1 = 35;
    block();
}

- (void)testType {
    // 定义Block
    // -fno-objc-arc
    //1  全局块 存储在代码区 NSConcreteGlobalBlock
        // 不访问外部的变量就是全局块
        void (^myBlock1)(void) = ^() {
            NSLog(@"全局块");
        };
        myBlock1();
        NSLog(@"%@",myBlock1);

        
        
        //2  存储在栈区域 访问外部变量, 但是没有进行copy,函数作用域结束
        // NSConcreteStackBlock
        int q = 15;
        void(^myBlock2)(void) = ^(){
            NSLog(@"栈块 --%d",q);
        };
        
        myBlock2();
        NSLog(@"%@",myBlock2);
        //3 堆块
        // NSConcreteMallocBlock
        int p = 25;
        void(^myBlock3)(void) = ^(){
            NSLog(@"堆块--%d",p);
        };
    
    // 进行一次copy 操作
        [myBlock3 copy];
        
        myBlock3();
        NSLog(@"%@",[myBlock3 copy]);
        
        [self test];
        // 到这一行 test 函数中所有存储在栈区的变量都会进行销毁，如果myBlock 使用
        // assign 进行修饰的话,没有把block copy到堆内存中的话，在下面的代码再进行访问的话，就会造成问野指针访问. EXC_BAD_ACCESS 错误
        
        // 所以要使 copy 属性进行修饰
        self.myBlock();
}

- (void)test
{
    int a = 10;
    [self setMyBlock:^{
    
        NSLog(@"myblock--%d",a);
    }];
    
    NSLog(@"test--%@",self.myBlock);

}

@end
