//
//  AuthorModel.m
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "AuthorModel.h"

@implementation AuthorModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _authorId = value;
    }
    
}

+ (NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic {
    
    // 解析
    NSMutableArray *returnAuthors = [NSMutableArray array];
    NSArray *authors = [dic objectForKey:@"authors"];
    for (NSDictionary *tempDic in authors) {
        AuthorModel *model = [AuthorModel new];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnAuthors addObject:model];
    }
    return returnAuthors;
    
}




@end
