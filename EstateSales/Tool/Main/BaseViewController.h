//
//  BaseViewController.h
//  EstateSales
//
//  Created by Jose Zhu on 16/6/1.
//  Copyright © 2016年 Jose Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//添加nav上右按钮，图片
- (void)addRightBtnWithImgName:(NSString *)imgName andSelector:(SEL)sel;
//右边按钮
- (void)addRightBtnWithStr:(NSString *)str andSelector:(SEL)sel;

@end
