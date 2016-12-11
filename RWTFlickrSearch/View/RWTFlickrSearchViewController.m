//
//  Created by Colin Eberhardt on 13/04/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWTFlickrSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchHistoryTable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) RWTFlickrSearchViewModel *viewModel;

@end

@implementation RWTFlickrSearchViewController

- (instancetype)initWithViewModel:(RWTFlickrSearchViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
  [self bindViewModel];
    
    
}


/**
 *  绑定ViewModel
 */
- (void)bindViewModel {
    
    self.title = self.viewModel.title;
    self.searchTextField.text = self.viewModel.searchText;
    
    // 将在文本域每次更新时的信号发送一个包含当前文本的next事到ViewModel
    RAC(self.viewModel,searchText) = self.searchTextField.rac_textSignal;
    
    // 为按钮绑定command，确保点击按钮执行给定的命令
    self.searchButton.rac_command = self.viewModel.executeSearch;
    // 属性栏菊花转动，根据executing
    RAC([UIApplication sharedApplication],networkActivityIndicatorVisible) = self.viewModel.executeSearch.executing;
    // loading菊花转动，根据executing
    RAC(self.loadingIndicator,hidden) = [self.viewModel.executeSearch.executing not];
    // executionSignals属性发送由命令每次执行时生成的信号
    [self.viewModel.executeSearch.executionSignals subscribeNext:^(id x) {
        [self.searchTextField resignFirstResponder];
    }];
    
    
    
    
}


@end
