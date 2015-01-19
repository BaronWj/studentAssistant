//
//  EScrollerView.m
//  icoiniPad
//
//  Created by Ethan on 12-11-24.
//
//

#import "EScrollerView.h"
#import "defineSetting.h"
@implementation EScrollerView
@synthesize delegate;

//- (void)dealloc {
//	[scrollView release];
//    [noteTitle release];
//	delegate=nil;
//    if (pageControl) {
//        [pageControl release];
//    }
//    if (imageArray) {
//        [imageArray release];
//        imageArray=nil;
//    }
//    if (titleArray) {
//        [titleArray release];
//        titleArray=nil;
//    }
//    [super dealloc];
//}
-(id)initWithFrameRect:(CGRect)rect ImageArray:(NSArray *)imgArr TitleArray:(NSArray *)titArr
{
    
	if ((self=[super initWithFrame:rect])) {
        self.userInteractionEnabled=YES;
        titleArray=titArr;
        NSMutableArray *tempArray=[NSMutableArray arrayWithArray:imgArr];
        [tempArray insertObject:[imgArr objectAtIndex:([imgArr count]-1)] atIndex:0];
        [tempArray addObject:[imgArr objectAtIndex:0]];
        imageArray=[NSArray arrayWithArray:tempArray];
		viewSize=rect;
        NSUInteger pageCount=[imageArray count];
       
        scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.size.width, viewSize.size.height)];
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.contentSize = CGSizeMake(viewSize.size.width * pageCount, viewSize.size.height);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.scrollsToTop = NO;
        scrollView.delegate = self;
        for (int i=0; i<pageCount; i++) {
            NSString *imgURL=[imageArray objectAtIndex:i];
            UIImageView *imgView=[[UIImageView alloc] init];
            if ([imgURL hasPrefix:@"http://"]) {
                //网络图片 请使用ego异步图片库
                [imgView setImageWithURL:[NSURL URLWithString:imgURL]placeholderImage:[UIImage imageNamed:@"defaultFocus"]];
                
            }
            else
            {
                
                UIImage *img=[UIImage imageNamed:[imageArray objectAtIndex:i]];
                [imgView setImage:img];
            }
            
            [imgView setFrame:CGRectMake(viewSize.size.width*i, 0,viewSize.size.width, viewSize.size.height-24)];
            imgView.tag=i;
            imgView.userInteractionEnabled=YES;
            UITapGestureRecognizer *Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)] ;
            [Tap setNumberOfTapsRequired:1];
            [Tap setNumberOfTouchesRequired:1];
            [imgView addGestureRecognizer:Tap];
            [scrollView addSubview:imgView];
        }
        [scrollView setContentOffset:CGPointMake(viewSize.size.width, 0)];
        [self addSubview:scrollView];

        //说明文字层
        UIView *noteView=[[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-24,self.bounds.size.width,24)];
//        [noteView setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5]];
//        [noteView setBackgroundColor:UIColorFromRGB()];
        [noteView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pagebackImage"]]];
        float pageControlWidth=(pageCount-2)*10.0f+40.f;
        float pagecontrolHeight=15.0f;
        pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake((self.frame.size.width-pageControlWidth),4 , pageControlWidth, pagecontrolHeight)];
        pageControl.currentPage=0;
        pageControl.numberOfPages=(pageCount-2);
        pageControl.currentPageIndicatorTintColor = UIColorFromRGB(0xfbd703);
        [noteView addSubview:pageControl];
    
        UIImageView * smallImage = [[UIImageView alloc]initWithFrame:CGRectMake(6, 4, 15, 15)];
        smallImage.image = [UIImage imageNamed:@"recommed"];
        [noteView addSubview:smallImage];
        
        noteTitle=[[UILabel alloc] initWithFrame:CGRectMake(34, 0, self.frame.size.width-pageControlWidth-15, 24)];
        [noteTitle setText:[titleArray objectAtIndex:0]];
        [noteTitle setTextColor:[UIColor whiteColor]];
        [noteTitle setBackgroundColor:[UIColor clearColor]];
        [noteTitle setFont:[UIFont systemFontOfSize:13]];
        [noteView addSubview:noteTitle];
        
        [self addSubview:noteView];
	}
	return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    currentPageIndex=page;
       
    pageControl.currentPage=(page-1);
    int titleIndex=page-1;
    if (titleIndex==[titleArray count]) {
        titleIndex=0;
    }
    if (titleIndex<0) {
        titleIndex=(int)[titleArray count]-1;
    }
    [noteTitle setText:[titleArray objectAtIndex:titleIndex]];

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    if (currentPageIndex==0) {
      
        [_scrollView setContentOffset:CGPointMake(([imageArray count]-2)*viewSize.size.width, 0)];
    }
    if (currentPageIndex==([imageArray count]-1)) {
       
        [_scrollView setContentOffset:CGPointMake(viewSize.size.width, 0)];
        
    }

}
- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    if ([delegate respondsToSelector:@selector(EScrollerViewDidClicked:)]) {
        [self.delegate EScrollerViewDidClicked:sender.view.tag];

    }
}

@end
