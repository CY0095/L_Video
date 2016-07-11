//
//  VideoDetailRequest.m
//  L_Video
//
//  Created by lanou3g on 16/7/9.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideoDetailRequest.h"

@implementation VideoDetailRequest
static VideoDetailRequest *request = nil;

+ (instancetype)shareVideoDetailRequest {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoDetailRequest alloc] init];
    });
    return request;
}

- (void)requestSingleDotaVideoWithVideoID:(NSString *)ID success:(SuccessResponce)success failure:(FailureResponce)failure {
    [self requestSingleVideoWithVideoUrl:DotaSingleVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


// 请求单个视频（返回视频Url）
- (void)requestSingleVideoWithVideoUrl:(NSString *)url success:(SuccessResponce)success failure:(FailureResponce)failure {
    
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    [request requestWithUrl:url parameters:nil successResponce:^(NSDictionary *dic) {
        success(dic);
    } failureResponce:^(NSError *error) {
        failure(error);
    }];
    
}


@end
