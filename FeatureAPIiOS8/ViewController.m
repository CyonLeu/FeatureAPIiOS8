//
//  ViewController.m
//  FeatureAPIiOS8
//
//  Created by Liuyong on 14-11-19.
//  Copyright (c) 2014年 Liuyong. All rights reserved.
//

#import "ViewController.h"

static NSString *const kMainStroyboard = @"Main";

static NSString *const kClass_UIAlertController = @"UIAlertController";
static NSString *const kClass_UIBlurEffect = @"UIBlurEffect";
static NSString *const kClass_PhotoKit = @"PhotoKit";


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSMutableDictionary *blocksDict;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.items = @[kClass_UIAlertController, kClass_UIBlurEffect, kClass_PhotoKit];
    self.blocksDict = [@{} mutableCopy];
    
    __weak typeof (self) weakSelf = self;
    void(^alertBlock)(void) = ^(void) {
        UIViewController *viewController = [[UIStoryboard storyboardWithName:kMainStroyboard bundle:nil] instantiateViewControllerWithIdentifier:kClass_UIAlertController];
        [weakSelf.navigationController pushViewController:viewController animated:YES];
    };
    [self.blocksDict setObject:alertBlock forKey:kClass_UIAlertController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelect Row:%ld", (long)indexPath.row);
    NSString *key = self.items[indexPath.row];
//    if (key) {
//        void(^Block)(void) = [self.blocksDict objectForKey:key];
//        Block();
//    }
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:kMainStroyboard bundle:nil] instantiateViewControllerWithIdentifier:key];
    viewController.title = key;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
