//
//  RWTFlickrSearchResults.m
//  RWTFlickrSearch
//
//  Created by 铁拳科技 on 16/8/30.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchResults.h"

@implementation RWTFlickrSearchResults


- (NSString *)description {
    return [NSString stringWithFormat:@"searchString=%@, totalresults=%lU, photos=%@",
            self.searchString, self.totalResults, self.photos];
}

@end
