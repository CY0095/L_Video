//
//  VideoRequest.m
//  L_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "VideoRequest.h"

@implementation VideoRequest
static VideoRequest *request = nil;

+ (instancetype)shareVideoRequest {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoRequest alloc] init];
    });
    return request;
}

- (void)requestDotaSingleAuthorAllVideoWithAuthorID:(NSString *)ID Success:(SuccessResponce)success failure:(FailureResponce)failure {
    
    [self requestSingleAuthorAllVideoWithUrl:DotaSingleAuthorsRequester_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

- (void)requestSingleAuthorAllVideoWithUrl:(NSString *)url success:(SuccessResponce)success failure:(FailureResponce)failure {
    
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    [request requestWithUrl:url parameters:nil successResponce:^(NSDictionary *dic) {
        success(dic);
    } failureResponce:^(NSError *error) {
        failure(error);
    }];
    
}

- (void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponce)success failure:(FailureResponce)failure
{
    [self requestSingleAuthorAllVideoWithUrl:LOLSignleAuthorAllVideosRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}






@end
