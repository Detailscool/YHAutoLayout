//
//  UIView+YHAutoLayout.m
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "UIView+YHAutoLayout.h"
#import <objc/runtime.h>

@implementation UIView (YHAutoLayout)

- (void)setAutoLayoutState:(YHAutoLayoutState)autoLayoutState {
    objc_setAssociatedObject(self, @selector(setAutoLayoutState:), @(autoLayoutState), OBJC_ASSOCIATION_ASSIGN);
}

- (YHAutoLayoutState)autoLayoutState {
    return [objc_getAssociatedObject(self, @selector(setAutoLayoutState:)) integerValue];
}


#pragma mark - SpaceToView
- (YHLayoutSpaceBlock)leftSpaceToView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateLeft;
    YHLayoutSpaceBlock yhSpace = ^UIView *(UIView * view ,CGFloat space) {
        if ([view.subviews containsObject:self]) {
            [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:space]];
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
            [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:space]];
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
            [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:-space]];
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
            [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-space]];
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
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:width]];
        return self;
    };
    return yhEqual;
}

- (YHLayoutEqualBlock)heightEqualTo {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.autoLayoutState = YHAutoLayoutStateRight;
    YHLayoutEqualBlock yhEqual = ^UIView *(CGFloat height) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:height]];
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

#pragma mark - Offset
- (YHLayoutOffsetBlock)offest {
    switch (self.autoLayoutState) {
        case YHAutoLayoutStateLeft:
            return ^UIView * (CGFloat offset) {
//                self.fi
                return self;
            };
            break;
        case YHAutoLayoutStateRight:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        case YHAutoLayoutStateTop:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        case YHAutoLayoutStateBottom:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        case YHAutoLayoutStateCenterX:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        case YHAutoLayoutStateCenterY:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        default:
            return ^UIView * (CGFloat offset) {
                return self;
            };
            break;
        }
}

#pragma mark - Private
- (void)yhConstraint:(NSLayoutAttribute)attribute toView:(UIView *)view withConstraint:(NSLayoutAttribute)viewAttribute ratio:(CGFloat)ratio space:(CGFloat)space {
    UIView * superView = self.superview;
    while (superView) {
        if([superView.subviews containsObject:view]) {
            [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:viewAttribute multiplier:ratio constant:space]];
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
