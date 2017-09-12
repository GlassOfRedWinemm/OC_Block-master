//
//  main.m
//  OC_Block-master
//
//  Created by iOS-Developer on 2017/9/12.
//  Copyright © 2017年 ShengShiQuanJing. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - Block源码定义

//----------------start-------------------
struct Block_descriptor {
    
    unsigned long int reserved;
    unsigned long int size;
    void (*copy)(void *dst, void *src);
    void (*dispose)(void *);
    
};

struct Block_layout {
    
    void *isa;
    int flags;
    int reserved;
    void (*invoke)(void *,...);
    struct Block_descriptor *descriptor;
    
};
//----------------end----------------------

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        //声明并实现一个简单的Block
        void (^block)() = ^{
            printf("程序员是最可爱的。");
        };
        
        //回调Block
        block();
        
        
        /**
         
         打开终端，到达 main.m 文件的路径下，执行 clang -rewrite-objc main.m 命令。生成 main.cpp 文件。
         
         通过查看 main.cpp 源码文件，可进一步探究 Block传递变量的值的具体实现 ， 如何改变Block传递变量的值 等现象的本质。
         
         Block一共有3种类型的block
         _NSConcreteGlobalBlock 全局静态
         _NSConcreteStackBlock 保存在栈中，出函数作用域就销毁
         _NSConcreteMallocBlock 保存在堆中，retainCount == 0销毁
         
         */
        
    }
    return 0;
}
