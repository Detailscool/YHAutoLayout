//
//  ViewController.m
//  YHAutoLayout_OC
//
//  Created by Detailscool on 16/7/10.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YHAutoLayout.h"

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
    greenView.centerXEqualToView(blueView).centerYEqualToView(redView).widthEqualTo(200).heightEqualToView(redView);
    
    UIView * orangeView = [[UIView alloc]init];
    [blueView addSubview:orangeView];
    orangeView.backgroundColor = [UIColor orangeColor];
    orangeView.bottomSpaceToView(blueView,10).rightSpaceToView(blueView,10).widthRatioToView(redView,0.2).heightEqualTo(50);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
