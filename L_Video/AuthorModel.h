//
//  AuthorModel.h
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorModel : BaseModel

@property (nonatomic, assign)BOOL watchable;
@property (nonatomic, copy)NSString  *name;
@property (nonatomic, copy)NSString  *youku_id;
@property (nonatomic, copy)NSString  *url;
@property (nonatomic, copy)NSString  *detail;
@property (nonatomic, copy)NSString  *authorId;
@property (nonatomic, copy)NSString  *pop;
@property (nonatomic, copy)NSString  *icon;

+ (NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic;










@end
