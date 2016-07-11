//
//  DouBanTabBar.m
//  Lesson_Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideoTabBar.h"

@implementation VideoTabBar

- (id)initWithItems:(NSArray *)items frame:(CGRect )frame {
    
    if (self = [super init]) {
        
        self.frame = frame;
        
        for (int i = 0; i < items.count; i ++) {
            
            UIButton *btn = (UIButton *)items[i];
            
            CGFloat width = self.bounds.size.width / items.count;
            
            CGFloat height = self.bounds.size.height;
            
            btn.frame = CGRectMake(15 + i * width, 0, width, height);
            
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
            
            [self addSubview:btn];
            
        }
        
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.AllItems = items;
        
        
    }
    return self;
}
- (void)btnClicked:(UIButton *)btn {
    
    self.currentSelectedItem = btn;
    
    for (int i = 0; i < self.AllItems.count; i++) {
        
        UIButton *tempBtn = (UIButton *)self.AllItems[i];
        
        if (btn == tempBtn) {
            
            self.currentSelected = i;
            btn.selected = YES;
            
        }else {
            
            tempBtn.selected = NO;
            
        }
        
    }
    // 跳转
    if (_DouBanDelegate) {
        
        [_DouBanDelegate VideoItemDidClicked:self];
        
    }
    
}


@end
