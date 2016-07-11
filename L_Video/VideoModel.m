//
//  VideoModel.m
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _videoId = value;
    }
    
}
+ (NSMutableArray *)parseVideoWithDic:(NSDictionary *)dic {
    
    // 解析
    NSMutableArray *returnVideos = [NSMutableArray array];
    NSArray *videos = [dic objectForKey:@"videos"];
    for (NSDictionary *tempDic in videos) {
        VideoModel *model = [VideoModel new];
        [model setValuesForKeysWithDictionary:tempDic];
        
        [returnVideos addObject:model];
    }
    return returnVideos;
}

@end
