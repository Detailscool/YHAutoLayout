//
//  ViewController.m
//  YHAutoLayout_OC
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YHAutoLayout.h"
#import "UIControl+YHControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    redView.leftSpaceToView(self.view,100).topSpaceToView(self.view,100).widthEqualTo(100).heightEqualTo(100);
    
    UIView * blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.leftEqualToView(redView).topSpaceToView(redView,100).widthEqualTo(100).heightEqualTo(100);
    
    UIView * greenView = [[UIView alloc]init];
    [self.view insertSubview:greenView atIndex:0];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.centerXEqualToView(blueView).centerYEqualToView(redView).widthEqualTo(200).heightRatioToView(redView,0.5);
    
    UIView * orangeView = [[UIView alloc]init];
    [blueView addSubview:orangeView];
    orangeView.backgroundColor = [UIColor orangeColor];
    orangeView.bottomSpaceToView(blueView,10).rightSpaceToView(blueView,10).widthRatioToView(redView,0.2).heightEqualTo(50);

    UIButton * button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:button];
    button.leftSpaceToView(blueView,20).topSpaceToView(blueView,30).widthEqualTo(80).heightRatioToView(blueView,0.9);
    button.action(UIControlEventTouchUpInside ,^(){
        NSLog(@"%s",__func__);
    });
}


- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
