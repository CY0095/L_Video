//
//  AuthorRequest.m
//  L_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 LLL. All rights reserved.
//

#import "AuthorRequest.h"

static AuthorRequest *request = nil;

@implementation AuthorRequest

+ (instancetype)shareAuthorRequest {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[self alloc] init];
    });
    return request;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    
    @synchronized(request) {
        if (!request) {
            request = [super allocWithZone:zone];
        }
    }
    return request;
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return request;
}

- (void)requestDotaAllAuthorSuccess:(SuccessResponce)success
                            failure:(FailureResponce)failure {
    
    [self requestAllAuthorWithUrl:DotaAllAuthorsRequester_Url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

- (void)requestLOLAllAuthorSuccess:(SuccessResponce)success
                           failure:(FailureResponce)failure {
    
    [self requestAllAuthorWithUrl:LOLAllAuthorsRequester_Url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    
}

- (void)requestAllAuthorWithUrl:(NSString *)url
                        success:(SuccessResponce)success
                        failure:(FailureResponce)failure {
    
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    [request requestWithUrl:url parameters:nil successResponce:^(NSDictionary *dic) {
        success(dic);
    } failureResponce:^(NSError *error) {
        failure(error);
    }];
    
}


@end
