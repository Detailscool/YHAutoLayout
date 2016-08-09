//
//  UIView+YHAutoLayout.m
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIView+YHAutoLayout.h"
#import <objc/runtime.h>

typedef NS_OPTIONS(NSUInteger, YHAutoLayoutState) {
    YHAutoLayoutStateLeft,
    YHAutoLayoutStateRight,
    YHAutoLayoutStateTop,
    YHAutoLayoutStateBottom,
    YHAutoLayoutStateHeight,
    YHAutoLayoutStateWidth,
    YHAutoLayoutStateCenterX,
    YHAutoLayoutStateCenterY,
    YHAutoLayoutStateFullFill
};

@interface UIView ()
@property (nonatomic,assign)YHAutoLayoutState autoLayoutState;
@property (nonatomic,weak)NSLayoutConstraint * currentConstraint;
@end

@implementation UIView (YHAutoLayout)

- (void)setAutoLayoutState:(YHAutoLayoutState)autoLayoutState {
    objc_setAssociatedObject(self, @selector(setAutoLayoutState:), @(autoLayoutState), OBJC_ASSOCIATION_ASSIGN);
}

- (YHAutoLayoutState)autoLayoutState {
    return [objc_getAssociatedObject(self, @selector(setAutoLayoutState:)) integerValue];
}

- (void)setCurrentConstraint:(NSLayoutConstraint *)currentConstraint {
    objc_setAssociatedObject(self, @selector(setCurrentConstraint:), currentConstraint, OBJC_ASSOCIATION_ASSIGN);
}

- (NSLayoutConstraint *)currentConstraint {
    return objc_getAssociatedObject(self, @selector(setCurrentConstraint:));
}

#pragma mark - SpaceToView
- (YHLayoutSpaceBlock)leftSpaceToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateLeft;
    YHLayoutSpaceBlock yhSpace = ^UIView *(UIView * view ,CGFloat space) {
        if ([view.subviews containsObject:self]) {
            [self yhInnerConstraint:NSLayoutAttributeLeading toView:view space:space];
        }else {
            [self yhConstraint:NSLayoutAttributeLeading equalToView:view withConstraint:NSLayoutAttributeTrailing space:space];
        }
        return self;
    };
    return yhSpace;
}

- (YHLayoutSpaceBlock)topSpaceToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateTop;
    YHLayoutSpaceBlock yhSpace = ^UIView *(UIView * view ,CGFloat space) {
        if ([view.subviews containsObject:self]) {
            [self yhInnerConstraint:NSLayoutAttributeTop toView:view space:space];
        }else {
            [self yhConstraint:NSLayoutAttributeTop equalToView:view withConstraint:NSLayoutAttributeBottom space:space];
        }
        return self;
    };
    return yhSpace;
}

- (YHLayoutSpaceBlock)bottomSpaceToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateBottom;
    YHLayoutSpaceBlock yhSpace = ^UIView *(UIView * view ,CGFloat space) {
        if ([view.subviews containsObject:self]) {
            [self yhInnerConstraint:NSLayoutAttributeBottom toView:view space:-space];
        }else {
            [self yhConstraint:NSLayoutAttributeBottom equalToView:view withConstraint:NSLayoutAttributeTop space:space];
        }
        return self;
    };
    return yhSpace;
}

- (YHLayoutSpaceBlock)rightSpaceToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateRight;
    YHLayoutSpaceBlock yhSpace = ^UIView *(UIView * view ,CGFloat space) {
        if ([view.subviews containsObject:self]) {
            [self yhInnerConstraint:NSLayoutAttributeTrailing toView:view space:-space];
        }else {
            [self yhConstraint:NSLayoutAttributeTrailing equalToView:view withConstraint:NSLayoutAttributeLeading space:space];
        }
        return self;
    };
    return yhSpace;
}

#pragma mark - EqualTo
- (YHLayoutEqualBlock)widthEqualTo {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateRight;
    YHLayoutEqualBlock yhEqual = ^UIView *(CGFloat width) {
        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
        [self addConstraint:constraint];
        self.currentConstraint = constraint;
        return self;
    };
    return yhEqual;
}

- (YHLayoutEqualBlock)heightEqualTo {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateRight;
    YHLayoutEqualBlock yhEqual = ^UIView *(CGFloat height) {
        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
        [self addConstraint:constraint];
        self.currentConstraint = constraint;
        return self;
    };
    return yhEqual;
}

#pragma mark - EqualToView
- (YHLayoutEqualViewBlock)leftEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateLeft;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeLeading];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)topEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateTop;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeTop];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)rightEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateRight;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeTrailing];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)bottomEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateBottom;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeBottom];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)widthEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateWidth;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeWidth];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)heightEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateHeight;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeHeight];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)centerXEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateCenterX;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeCenterX];
        return self;
    };
    return yhEqualToView;
}

- (YHLayoutEqualViewBlock)centerYEqualToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateCenterY;
    YHLayoutEqualViewBlock yhEqualToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeCenterY];
        return self;
    };
    return yhEqualToView;
}

#pragma mark - RatioTo
- (YHLayoutRatioBlock)widthRatioToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateWidth;
    YHLayoutRatioBlock yhRatioToView = ^UIView *(UIView * view,CGFloat ratio) {
        [self yhRatioToView:view withConstraint:NSLayoutAttributeWidth ratio:ratio];
        return self;
    };
    return yhRatioToView;
}

- (YHLayoutRatioBlock)heightRatioToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateHeight;
    YHLayoutRatioBlock yhRatioToView = ^UIView *(UIView * view,CGFloat ratio) {
        [self yhRatioToView:view withConstraint:NSLayoutAttributeHeight ratio:ratio];
        return self;
    };
    return yhRatioToView;
}

- (YHLayoutFullFillViewBlock)fullFillToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateFullFill;
    YHLayoutFullFillViewBlock yhFullFillToView = ^UIView *(UIView * view) {
        [self yhEqualToView:view withConstraint:NSLayoutAttributeLeading];
        [self yhEqualToView:view withConstraint:NSLayoutAttributeTop];
        [self yhEqualToView:view withConstraint:NSLayoutAttributeTrailing];
        [self yhEqualToView:view withConstraint:NSLayoutAttributeBottom];
        return self;
    };
    return yhFullFillToView;
}

#pragma mark - Adjust
- (YHLayoutAdjustBlock)offest {
    if (!self.currentConstraint) {
        return nil;
    }
    
    return ^UIView * (CGFloat offset) {
        self.currentConstraint.constant += offset;
        return self;
    };
}

//- (YHLayoutAdjustBlock)multy {
//    return ^UIView * (CGFloat multy) {
//        self.currentConstraint.multiplier = multy;
//        return self;
//    };
//}

#pragma mark - Private
- (void)yhInnerConstraint:(NSLayoutAttribute)attribute toView:(UIView *)view space:(CGFloat)space {
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1 constant:space];
    [view addConstraint:constraint];
    self.currentConstraint = constraint;
}

- (void)yhConstraint:(NSLayoutAttribute)attribute toView:(UIView *)view withConstraint:(NSLayoutAttribute)viewAttribute ratio:(CGFloat)ratio space:(CGFloat)space {
    UIView * superView = self.superview;
    while (superView) {
        if([superView.subviews containsObject:view]) {
            NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:viewAttribute multiplier:ratio constant:space];
            [superView addConstraint:constraint];
            self.currentConstraint = constraint;
            break;
        }
        superView = superView.superview;
    }
}

- (void)yhConstraint:(NSLayoutAttribute)attribute equalToView:(UIView *)view withConstraint:(NSLayoutAttribute)viewAttribute space:(CGFloat)space {
    [self yhConstraint:attribute toView:view withConstraint:viewAttribute ratio:1 space:space];
}

- (void)yhEqualToView:(UIView *)view withConstraint:(NSLayoutAttribute)attribute {
    [self yhConstraint:attribute equalToView:view withConstraint:attribute space:0];
}

- (void)yhRatioToView:(UIView *)view withConstraint:(NSLayoutAttribute)attribute ratio:(CGFloat)ratio {
    [self yhConstraint:attribute toView:view withConstraint:attribute ratio:ratio space:0];
}

@end
