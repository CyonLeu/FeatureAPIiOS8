//
//  FWBlurEffectViewController.m
//  FeatureAPIiOS8
//
//  Created by Liuyong on 14-11-19.
//  Copyright (c) 2014年 Liuyong. All rights reserved.
//

#import "FWBlurEffectViewController.h"

@interface FWBlurEffectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIVisualEffectView *effectView;

@end

@implementation FWBlurEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Blur" style:UIBarButtonItemStylePlain target:self action:@selector(onRightBarItem:)];
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

- (void)onRightBarItem:(id)sender
{
    if ([self.view viewWithTag:100]) {
        UIView *view = [self.view viewWithTag:100];
        [view removeFromSuperview];
        return;
    }
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.tag = 100;
    CGFloat effectHeight = 400;
    effectView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) + effectHeight, CGRectGetWidth(self.view.bounds), effectHeight);
    [self.view addSubview:effectView];

//    [UIView animateWithDuration:0.5 animations:^{
//        effectView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), effectHeight);
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:30 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        effectView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), effectHeight);
 
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)onBlurExtraLightButton:(id)sender
{
    [self addBlurEffectView:UIBlurEffectStyleExtraLight];
}

- (IBAction)onBlurLightButton:(id)sender
{
    [self addBlurEffectView:UIBlurEffectStyleLight];
}
- (IBAction)onBlurDarkButton:(id)sender
{
    [self addBlurEffectView:UIBlurEffectStyleDark];
}

- (void)addBlurEffectView:(UIBlurEffectStyle)effectStyle
{
    if (self.effectView && self.effectView.superview) {
        [self.effectView removeFromSuperview];
    }
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.imageView.frame;
    self.effectView = effectView;
    [self.view addSubview:self.effectView];

    //effect icon
    UIImage *iconImage = [UIImage imageNamed:@"nie_side_icon_coucher"];
    CGRect iconFrame = CGRectMake(0, 0, iconImage.size.width, iconImage.size.height);
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconImage.size.width, iconImage.size.height)];
    iconImageView.image = iconImage;
    
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *iconEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    iconEffectView.frame = CGRectMake(150, 200, iconImage.size.width * 4, iconImage.size.height * 2);

    iconImageView.frame = CGRectMake(0, 0, iconImage.size.width, iconImage.size.height);
    [iconEffectView.contentView addSubview:iconImageView];

    iconFrame.origin.y = iconImage.size.height;
    iconFrame.size.width = iconImage.size.width * 4;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:iconFrame];
    titleLabel.text = @"Blur title";
    [iconEffectView.contentView addSubview:titleLabel];
    
    [self.effectView.contentView addSubview:iconEffectView];
//    [self.imageView addSubview:self.effectView];
}
@end
