//
//  ViewController.h
//  navigationController
//
//  Created by Manoj Kumar Gupta on 19/09/13.
//  Copyright (c) 2013 manojkumargupta030@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *myScrollView;
    UIImageView *image1;
    UIPageControl *pageControl;
    
    BOOL pageControlBeingUsed;

}	


-(void) setupScrollView;
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIButton *but;
- (IBAction)changePage:(id)sender;
@property (retain, nonatomic) IBOutlet UIPageControl *pageContol;
- (IBAction)pageControl:(id)sender;
@end
