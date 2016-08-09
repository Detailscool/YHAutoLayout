//
//  UIControl+YHControl.h
//  YHAutoLayout_OC
//
//  Created by HenryLee on 16/7/19.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^YHActionBlock)();
typedef UIControl* (^YHControlBlock)(UIControlEvents,YHActionBlock);

@interface UIControl (YHControl)
@property (nonatomic,strong,readonly)YHControlBlock action;
@end
