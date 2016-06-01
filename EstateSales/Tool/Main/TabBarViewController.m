//
//  TabBarViewController.m
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import "TabBarViewController.h"

#import "ContactsViewController.h"
#import "MoreViewController.h"
#import "TaskViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TaskViewController *taskVC = [[TaskViewController alloc]init];
    taskVC.tabBarItem.title = @"任务";
    taskVC.navigationItem.title = @"任务";
    
    ContactsViewController *contactsVC = [[ContactsViewController alloc]init];
    contactsVC.title = @"联系人";
    
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    moreVC.title = @"更多";
    
    self.viewControllers = @[
                             [self giveMeNavWithVC:taskVC andImgName:@"tabbar_chat_no" andSelectImgName:@"tabbar_chat_yes"],
                             
                             [self giveMeNavWithVC:contactsVC andImgName:@"tabbar_book_no" andSelectImgName:@"tabbar_book_yes"],
                             
                             [self giveMeNavWithVC:moreVC andImgName:@"tabbar_found_no"andSelectImgName:@"tabbar_found_yes"]
                             ];
    self.tabBar.tintColor = [UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1];

}


/**
 *  快速创建Nav
 */
- (UINavigationController *)giveMeNavWithVC:(UIViewController *)VC andImgName:(NSString *)imgName andSelectImgName:(NSString *)selectImgName
{
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];
    
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:VC.tabBarItem.title image:[self removeRendering:imgName] selectedImage:[self removeRendering:selectImgName]];
    
    return nav;
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
