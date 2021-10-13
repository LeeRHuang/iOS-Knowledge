//
//  ViewController.m
//  Knowledge
//
//  Created by Lee on 2018/11/26.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "ViewController.h"
#import "BlockTest.h"
#import <objc/runtime.h>
#import "MemoryAutoReleasePool.h"

@interface ViewController ()
typedef void (^CustomBlock)(NSString *name);

@end

@implementation ViewController

- (void)testIMP {
    [self addMethodByIMP];
    NSArray *paramArray = @[@"112",@[@2,@13],@12];
    [self performSelector:@selector(textFunctionWithParam:param2:param3:) withObject:paramArray];
}

- (id)performSelector:(SEL)selector withObject:(NSArray *)objects {
  // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        
        //可以抛出异常也可以不操作。
    }
    
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}


//要调用的方法
-(void)textFunctionWithParam:(NSString *)param1 param2:(NSArray *)param2 param3:(NSInteger)param3 {
    NSLog(@"param1:%@, param2:%@, param3:%ld",param1, param2, param3);
}

- (void)addMethodByIMP {
    CustomBlock block = ^(NSString *name){
        NSLog(@"执行block");
    };
    IMP impBlock = imp_implementationWithBlock(block);
    Method m = class_getInstanceMethod(self.class, @selector(testIMP));
    method_setImplementation(m, impBlock);
    const char * types = method_getTypeEncoding(m); //因为方法类型相同（都是无参数无返回值类型，所以方法类型相同，如果知道的话，可以直接制定type为v16@0:8）
    sel_registerName("newSel");             //注册newSel
    BOOL isAdded = class_addMethod([self class], @selector(newSel), impBlock, types);
    if (isAdded == YES) {
        NSLog(@"添加成功");
        [self performSelector:@selector(newSel)];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    __autoreleasing MemoryAutoReleasePool *pool = [[MemoryAutoReleasePool alloc] init];
    NSLog(@"%s", __func__);
//    [self testIMP];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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
