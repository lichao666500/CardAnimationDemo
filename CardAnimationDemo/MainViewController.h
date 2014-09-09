//
//  MainViewController.h
//  CardAnimationDemo
//
//  Created by 李超 on 14-9-4.
//  Copyright (c) 2014年 bill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIScrollViewDelegate>

- (IBAction)transitionAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *MyView;

@property(nonatomic,retain)UIScrollView *scroll;

@property(nonatomic,retain)UIView *parentFirst;

@property(nonatomic,retain)UIView *parentSecond;

@end
