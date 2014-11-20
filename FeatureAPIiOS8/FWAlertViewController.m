//
//  FWAlertViewController.m
//  FeatureAPIiOS8
//
//  Created by Liuyong on 14-11-19.
//  Copyright (c) 2014年 Liuyong. All rights reserved.
//

#import "FWAlertViewController.h"

@interface FWAlertViewController ()

@end

@implementation FWAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onActionSheetButton:(id)sender
{
    [self showAlertController:UIAlertControllerStyleActionSheet];
}

- (IBAction)onAlertButton:(id)sender
{
    [self showAlertController:UIAlertControllerStyleAlert];
}

- (void)showAlertController:(UIAlertControllerStyle)alertStyle
{
    //Here you set style is actionSheet or Alert
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"This is a message for showing" preferredStyle:alertStyle];// UIAlertControllerStyleActionSheet
    
    //Before iOS 8, we always do click event at delegate method, we hate to seperate event from the index =1,2,3...
    //Now we love the Block to do what we want to do.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //if you want to do something what you do
        NSLog(@"click done button");
    }];
    
    __weak typeof (self) weakSelf = self;
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"click done button");
        //I want to show another viewController
        UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EmptyVC"];
        [weakSelf.navigationController pushViewController:viewController animated:YES];
    }];
    
    UIAlertAction *destAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        //if you want to do something what you do
        NSLog(@"Delete button");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:doneAction];
    [alertController addAction:destAction];
    
    //You must user presentVC, if use pushVC,it will crash after clicking action button.
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
//    [self.navigationController pushViewController:alertController animated:YES];
}

@end
