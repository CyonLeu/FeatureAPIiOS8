
#Sharing Feature New API iOS 8 

* eg. UIAlertController, UIVisualEffectView 


# 1、UIAlertController

we always use UIAlertView and UIActionSheet before iOS 8. But it is not convenient
for deal with button event throught delegate method.

Now we can add button event to UIAlertAction, we can use Block by UIAlertAction.
then UIAlertController has two style: UIAlertControllerStyleActionSheet, UIAlertControllerStyleAlert.

#### How to use:(code)
	//Here you set style is actionSheet or Alert
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"This is a message for showing" preferredStyle:UIAlertControllerStyleActionSheet];
    
	 UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" 		style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //if you want to do something what you do
        NSLog(@"click done button");
    }];
    
    [alertController addAction:cancelAction];
	[self presentViewController:alertController animated:YES completion:^{
        //do sth
    }];
 
### Demo:
 alertStyle
 
![Alt alert](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_alert.png)

ActionSheetStyle 

 ![Alt actionsheet](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_actionsheet.png)


# 2、UIVisualEffectView

Apple supplies blurEffect in iOS 8,
BlurStyle: UIBlurEffectStyleExtraLight, UIBlurEffectStyleLight, UIBlurEffectStyleDark;

#### How to use UIVisualEffectView:
	UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.imageView.frame;
    self.effectView = effectView;
    [self.view addSubview:self.effectView];
    
 if want to use UIVibrancyEffect:
 Example Code:
 
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

### Demo:
UIBlurEffectStyleExtraLight:

 ![Alt UIBlurEffectStyleExtraLight](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_extralightBlur.png)
 
 UIBlurEffectStyleLight:
 
  ![Alt UIBlurEffectStyleLight](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_lightBlur.png)
  
  UIBlurEffectStyleDark:
 
  ![Alt UIBlurEffectStyleDark](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_dartBlur.png)
 
 Partical Effect:
 
  ![Alt Partical](https://raw.githubusercontent.com/CyonLeu/FeatureAPIiOS8/master/screenshot/shotscreen_ParticalBlur.png)
  
