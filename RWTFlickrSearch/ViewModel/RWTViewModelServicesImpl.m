//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by 铁拳科技 on 16/8/30.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickrSearchImpl.h"

@interface RWTViewModelServicesImpl ()

@property (strong, nonatomic) RWTFlickrSearchImpl *searchService;

@end

@implementation RWTViewModelServicesImpl

// 初始化带上impl的model
- (instancetype)init {
    if (self = [super init])
    {
        _searchService = [RWTFlickrSearchImpl new];
    }
    return self;
}

// 获取到具体实现的model,这里即是searchImpl
- (id<RWTFlickrSearch>) {
     return self.searchService;
}







@end
