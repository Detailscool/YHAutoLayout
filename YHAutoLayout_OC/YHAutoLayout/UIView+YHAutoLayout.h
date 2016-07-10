//
//  UIView+YHAutoLayout.h
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView * (^YHLayoutSpaceBlock)(UIView *,CGFloat);
typedef UIView * (^YHLayoutEqualBlock)(CGFloat);
typedef UIView * (^YHLayoutEqualViewBlock)(UIView *);
typedef UIView * (^YHLayoutRatioBlock)(UIView *,CGFloat);

@interface UIView (YHAutoLayout)

/************************ SpaceToView ***************************/
@property (nonatomic,strong,readonly)YHLayoutSpaceBlock leftSpaceToView;
@property (nonatomic,strong,readonly)YHLayoutSpaceBlock topSpaceToView;
@property (nonatomic,strong,readonly)YHLayoutSpaceBlock rightSpaceToView;
@property (nonatomic,strong,readonly)YHLayoutSpaceBlock bottomSpaceToView;

/************************ EqualTo ***************************/
@property (nonatomic,strong,readonly)YHLayoutEqualBlock widthEqualTo;
@property (nonatomic,strong,readonly)YHLayoutEqualBlock heightEqualTo;

/************************ EqualToView ***************************/
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock leftEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock rightEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock topEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock bottomEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock widthEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock heightEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock centerXEqualToView;
@property (nonatomic,strong,readonly)YHLayoutEqualViewBlock centerYEqualToView;

/************************ RatioTo ***************************/
@property (nonatomic,strong,readonly)YHLayoutRatioBlock widthRatioToView;
@property (nonatomic,strong,readonly)YHLayoutRatioBlock heightRatioToView;

@end
