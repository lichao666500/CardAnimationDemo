//
//  MainViewController.m
//  CardAnimationDemo
//
//  Created by 李超 on 14-9-4.
//  Copyright (c) 2014年 bill. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _parentFirst=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    _parentFirst.tag=111;

    _parentSecond=[[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 100)];
    _parentSecond.backgroundColor=[UIColor purpleColor];
    _parentSecond.tag=222;
    
    _scroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 320, 100)];
    //创建一个父视图
    [_scroll addSubview:_parentFirst];
    //父视图添加两个子视图
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view1.tag=101;
    view1.backgroundColor=[UIColor blackColor];
    [_parentFirst addSubview:view1];
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view2.tag=102;
    view2.backgroundColor=[UIColor greenColor];
    [_parentFirst addSubview:view2];
    
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchView:)];
    [_parentFirst addGestureRecognizer:tap1];
    
    //创建一个父视图
    [_scroll addSubview:_parentSecond];
   //父视图添加两个子视图
    UIView *view3=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view3.tag=103;
    view3.backgroundColor=[UIColor blueColor];
    [_parentSecond addSubview:view3];
    
    UIView *view4=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view4.tag=104;
    view4.backgroundColor=[UIColor yellowColor];
    [_parentSecond addSubview:view4];
    
    UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchView:)];
    [_parentSecond addGestureRecognizer:tap2];

    _scroll.directionalLockEnabled = YES;//只能一个方向滑动
    _scroll.pagingEnabled=YES;
    _scroll.indicatorStyle = UIScrollViewIndicatorStyleDefault;//滚动指示的风格
    _scroll.showsVerticalScrollIndicator =NO; //垂直方向的滚动指示
    _scroll.showsHorizontalScrollIndicator = YES;//水平方向的滚动指示
    _scroll.contentSize=CGSizeMake(640, 100);
    _scroll.delegate = self;
    [self.view addSubview:_scroll];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchView:(UITapGestureRecognizer *)tap{
    NSLog(@"%d",tap.view.tag);
    if(tap.view.tag==111){
        [UIView transitionWithView:_parentFirst duration:0.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [_parentFirst exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        }completion:nil];
    }else if(tap.view.tag==222){
        [UIView transitionWithView:_parentSecond duration:0.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_parentSecond exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        }completion:nil];

    }
    

    
   // [UIView transitionWithView:<#(UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
 
}

- (IBAction)transitionAction:(id)sender {
   /* CATransition *animation=[CATransition animation];
    animation.duration=0.6;
    animation.delegate=self;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    //animation.type=kCATransitionFade;
    animation.type=kCATransitionMoveIn;
    animation.subtype=kCATransitionFromRight;
    
    [self.MyView.layer addAnimation:animation forKey:@"animationKey"];
    
    [self.MyView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];*/
    
    
    //第一种
    /*[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.MyView cache:YES];
    [self.MyView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];*/
    
    //第二种
    [UIView transitionWithView:self.MyView duration:0.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.MyView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    }completion:nil];
    
}


#pragma mark UIScrollView的代理方法

//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}
//将开始降速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}
//滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndScrollingAnimation");
}




@end
