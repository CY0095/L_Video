//
//  RootViewController.m
//  Lesson_Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "RootViewController.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface RootViewController ()<VideoTabBarDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 setImage:[UIImage imageNamed:@"first_normal"] forState:(UIControlStateNormal)];
    [btn1 setImage:[UIImage imageNamed:@"first_selected"] forState:(UIControlStateSelected)];
    [btn1 setTitle:@"主播" forState:(UIControlStateNormal)];
    /**
     *  Button自带Image属性的偏移量
     *
     *  @param 0  距离上边缘的尺寸
     *  @param 0  左
     *  @param 15 下
     *  @param 0  右
     *
     *  @return 图片的偏移距离
     */
    
    [btn1 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn1 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    [btn1 setSelected:YES];
    
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn2 setImage:[UIImage imageNamed:@"second_normal"] forState:(UIControlStateNormal)];
    [btn2 setImage:[UIImage imageNamed:@"second_selected"] forState:(UIControlStateSelected)];
    [btn2 setTitle:@"我的" forState:(UIControlStateNormal)];
    [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    self.VideoTabBar = [[VideoTabBar alloc] initWithItems:@[btn1,btn2] frame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 40)];
    // 设置代理
    self.VideoTabBar.DouBanDelegate = self;
    
    [self.view addSubview:self.VideoTabBar];
    
}
// 实现代理方法
- (void)VideoItemDidClicked:(VideoTabBar *)tabBar {
    
    self.selectedIndex = tabBar.currentSelected;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
