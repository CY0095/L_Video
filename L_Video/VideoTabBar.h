//
//  DouBanTabBar.h
//  Lesson_Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 LLL. All rights reserved.
//

@class VideoTabBar;

@protocol VideoTabBarDelegate

- (void)VideoItemDidClicked:(VideoTabBar *)tabBar;

@end

#import <UIKit/UIKit.h>

@interface VideoTabBar : UITabBar

// 当前选中的TabBar的下标
@property (nonatomic, assign) int currentSelected;
// 当前选中的Item
@property (nonatomic, strong) UIButton *currentSelectedItem;
// TabBar上面所以的items
@property (nonatomic, strong) NSArray *AllItems;

@property (nonatomic, weak) id<VideoTabBarDelegate>DouBanDelegate;

// 初始化方法，根据items初始化items
- (id)initWithItems:(NSArray *)items frame:(CGRect )frame;

@end
