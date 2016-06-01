//
//  BaseViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


/**
 *  修改状态颜色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)addRightBtnWithImgName:(NSString *)imgName andSelector:(SEL)sel
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[self removeRendering:imgName] style:UIBarButtonItemStylePlain target:self action:sel];
    
    //微调一下图片的位置
    [self.navigationItem.rightBarButtonItem setImageInsets:UIEdgeInsetsMake(0, WGiveWidth(-6), 0, WGiveWidth(6))];
}

- (void)addRightBtnWithStr:(NSString *)str andSelector:(SEL)sel
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:str style:UIBarButtonItemStylePlain target:self action:sel];
}

/**
 *  返回取消渲染的image
 */
- (UIImage *)removeRendering:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
