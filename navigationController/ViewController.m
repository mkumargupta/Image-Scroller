//
//  ViewController.m
//  navigationController
//
//  Created by Manoj Kumar Gupta on 19/09/13.
//  Copyright (c) 2013 manojkumargupta030@gmail.com. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

{
    NSString *man;
    int i;
    int m;
   
    
    
}
@synthesize image;
@synthesize label;
@synthesize but;
@synthesize pageContol;





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}




- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (!pageControlBeingUsed) {
        
        CGFloat pageWidth = myScrollView.frame.size.width;
        int page = floor((myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        pageControl.currentPage = page;
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}













#pragma mark - View lifecycle

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    [self setupScrollView];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void) setupScrollView {
    //add the scrollview to the view
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height/1.5)];
    myScrollView.pagingEnabled = YES;
   // [myScrollView setAlwaysBounceVertical:NO];
   // [myScrollView setAlwaysBounceHorizontal:NO];
    
    //setup internal views
    m=70;
    NSInteger numberOfViews = 6;
    for ( i = 0; i < numberOfViews; i++) {
        
        CGFloat yOrigin = i * (self.view.frame.size.height/2);
        image1 = [[UIImageView alloc] initWithFrame:
                              CGRectMake(self.view.frame.size.width/6, yOrigin, 
                                         self.view.frame.size.width/1.5, 
                                         ((self.view.frame.size.height/2)-m))];
        image.contentMode=UIViewContentModeScaleAspectFill;
             switch (i) {
            case 0:
                 man=@"m2.jpg";
                break;
                case 1:
                man=@"5.jpg";
                break;
                case 2:
                 man=@"m4.jpg";
                break;
                case 3:
                man=@"m5.jpg";
                break;
                case 4:
                 man=@"m6.jpg";
                break;
                case 5:
                man=@"6.jpg";
                break;
            default:
                break;
        }
        

        UILabel *Label=[[UILabel alloc]initWithFrame:CGRectMake(0.0, (self.view.frame.size.height/2)-m, self.view.frame.size.width/1.5, m)];
        Label.font=[UIFont fontWithName:@"Helvetica"  size:10];
        Label.text=[NSString stringWithFormat:@"Image%i",i+1];
        [Label setTextColor:[UIColor blackColor]];
        [Label setHighlighted:YES];
        [Label setBackgroundColor:[UIColor clearColor]];
      
        [image1 addSubview:Label];
        
        
        UILabel *Label1=[[UILabel alloc]initWithFrame:CGRectMake(0.0, (self.view.frame.size.height/2)-(m+15), self.view.frame.size.width/1.5, m)];
        Label1.font=[UIFont fontWithName:@"Helvetica"  size:15];
        Label1.text=@"Demo";
        [Label1 setTextColor:[UIColor blackColor]];
        [Label1 setHighlighted:YES];
        [Label1 setBackgroundColor:[UIColor clearColor]];
        // [Label setAdjustsFontSizeToFitWidth:YES];
        //   [Label setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
        
        [image1 addSubview:Label1];
        
        
        
        
        
         
        
        image1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",man]];
        [myScrollView setShowsVerticalScrollIndicator:NO];
        [myScrollView addSubview:image1];
        
        UITapGestureRecognizer *PressRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlePress:)];
        [PressRecognizer1 setNumberOfTouchesRequired:1];
        [image1 addGestureRecognizer:PressRecognizer1];
        
    }
    pageControl.currentPage = 0;
    pageControl.numberOfPages = 4;

    //set the scroll view content size
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width , 
                                             (self.view.frame.size.height/2)*numberOfViews);
    //add the scrollview to this view
    [self.view addSubview:myScrollView];
    
}

-(void)handlePress:(UITapGestureRecognizer*)PressRecognizer {
    
    NSLog(@"working");
    
    //Add your code here for click on particular image
    
}





- (void)viewDidUnload
{
    
    
    [self setImage:nil];
    [self setLabel:nil];
    [self setBut:nil];
    [self setPageContol:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(IBAction)button1:(id)sender
{
    i=i++;
    [self setupScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    
    
    [image release];
    [label release];
    [but release];
    [pageContol release];
    [super dealloc];
}

- (IBAction)pageControl:(id)sender {
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = myScrollView.frame.size.height * pageControl.currentPage;
    frame.size = myScrollView.frame.size;
    [myScrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
}
@end
