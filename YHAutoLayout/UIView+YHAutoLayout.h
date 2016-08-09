//
//  UIView+YHAutoLayout.h
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView* (^YHLayoutSpaceBlock)(UIView *,CGFloat);
typedef UIView* (^YHLayoutEqualBlock)(CGFloat);
typedef UIView* (^YHLayoutEqualViewBlock)(UIView *);
typedef UIView* (^YHLayoutRatioBlock)(UIView *,CGFloat);
typedef UIView* (^YHLayoutFullFillViewBlock)(UIView *);
typedef UIView* (^YHLayoutAdjustBlock)(CGFloat);

@interface UIView (YHAutoLayout)

/************************ Adjust ***************************/
- (YHLayoutAdjustBlock)offest;
//- (YHLayoutAdjustBlock)multy;

/************************ SpaceToView ***************************/
- (YHLayoutSpaceBlock)leftSpaceToView;
- (YHLayoutSpaceBlock)topSpaceToView;
- (YHLayoutSpaceBlock)rightSpaceToView;
- (YHLayoutSpaceBlock)bottomSpaceToView;

/************************ EqualTo ***************************/
- (YHLayoutEqualBlock)widthEqualTo;
- (YHLayoutEqualBlock)heightEqualTo;

/************************ EqualToView ***************************/
- (YHLayoutEqualViewBlock)leftEqualToView;
- (YHLayoutEqualViewBlock)rightEqualToView;
- (YHLayoutEqualViewBlock)topEqualToView;
- (YHLayoutEqualViewBlock)bottomEqualToView;
- (YHLayoutEqualViewBlock)widthEqualToView;
- (YHLayoutEqualViewBlock)heightEqualToView;
- (YHLayoutEqualViewBlock)centerXEqualToView;
- (YHLayoutEqualViewBlock)centerYEqualToView;

/************************ RatioTo ***************************/
- (YHLayoutRatioBlock)widthRatioToView;
- (YHLayoutRatioBlock)heightRatioToView;

/************************ RatioTo ***************************/
- (YHLayoutFullFillViewBlock)fullFillToView;

@end
