//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by 铁拳科技 on 16/8/30.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"


@interface RWTFlickrSearchViewModel ()



@property (nonatomic, weak) id<RWTViewModelServices> services;



@end

@implementation RWTFlickrSearchViewModel


- (instancetype)initWithServices:(id<RWTViewModelServices>)services
{
    self = [super init];
    
    if (self)
    {
        // 传进来的services给到自己
        _services = services;
        [self initialize];
    }
    
    return self;
}



- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


- (void)initialize {
    
    /*************** 利用RAC绑定View到ViewModel上 ******************/
    
    
    self.searchText = @"search text";
    self.title = @"Flickr Search";
    // createValidSignal
    // distinctUntilChanged 信号改变才发送
    RACSignal *validSearchSignal = [[RACObserve(self, searchText) map:^id(NSString *text) {
        return @(text.length > 3);
    }]distinctUntilChanged];
    
    // 信号被订阅
    [validSearchSignal subscribeNext:^(id x) {
        NSLog(@"search text is valid %@", x);
    }];
    
    // 绑定操作命令,当validSearchSignal执行时的操作
    self.executeSearch = [[RACCommand alloc] initWithEnabled:validSearchSignal signalBlock:^RACSignal *(id input) {
        return [self executeSearchSignal];
    }];
    
}



- (RACSignal *)executeSearchSignal {
    return [[[self.services getFlickrSearchService] flickrSearchSignal:self.searchText] logAll];
}





@end
