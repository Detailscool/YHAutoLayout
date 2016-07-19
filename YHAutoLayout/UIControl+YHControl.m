//
//  UIControl+YHControl.m
//  YHAutoLayout_OC
//
//  Created by HenryLee on 16/7/19.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIControl+YHControl.h"
#import <objc/runtime.h>
@interface UIControl ()
@property (nonatomic,strong)YHActionBlock actionBlock;
@end

@implementation UIControl (YHControl)

- (void)setActionBlock:(YHActionBlock)actionBlock {
    objc_setAssociatedObject(self, @selector(setActionBlock:), actionBlock, OBJC_ASSOCIATION_RETAIN);
}

- (YHActionBlock)actionBlock {
    return objc_getAssociatedObject(self, @selector(setActionBlock:));
}

- (YHControlBlock)action {
    if (self.hidden == YES || self.alpha < 0.01 || self.userInteractionEnabled == NO) {
        return nil;
    }
    
    YHControlBlock yhControl = ^(UIControlEvents events, YHActionBlock actionBlock){
        self.actionBlock = actionBlock;
        [self addTarget:self action:@selector(abc) forControlEvents:events];
        return self;
    };
    return yhControl;
}

- (void)abc {
    !self.actionBlock?:self.actionBlock();
}

@end
