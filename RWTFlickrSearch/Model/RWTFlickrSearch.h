//
//  RWTFlickrSearch.h
//  RWTFlickrSearch
//
//  Created by 铁拳科技 on 16/8/30.
//  Copyright © 2016年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>


@protocol RWTFlickrSearch <NSObject>





- (RACSignal *)flickrSearchSignal:(NSString *)searchString;






@end
