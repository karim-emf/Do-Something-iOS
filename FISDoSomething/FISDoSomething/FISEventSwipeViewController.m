//
//  FISVenueSwipeViewController.m
//

#define NUMBER_OF_PLACES 10

#import "FISMultiCardView.h"
#import "FISEventCard.h"
#import "FISEventSwipeViewController.h"
#import "FISEventDetailView.h"

@interface FISEventSwipeViewController () <FISMultiCardViewDataSource, FISMultiCardViewDelegate>
@end

@implementation FISEventSwipeViewController
{
    NSMutableArray *_swipeableViews;
    FISMultiCardView *_multiCardView;
}

- (instancetype)init
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _swipeableViews = [NSMutableArray array];
        _multiCardView = [[FISMultiCardView alloc] init];
        [self fetchEvents];
    }
    return self;
}

#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    UIImage *image = [UIImage imageNamed:@"Do_Something_Logo"];
    navItem.titleView = [[UIImageView alloc] initWithImage:image];
    navigationBar.items = @[navItem];
    [self.view addSubview:navigationBar];

    self.view.backgroundColor = [UIColor colorWithRed:(248/255.0) green:(248/255.0) blue:(248/255.0) alpha:1];
    _multiCardView.frame = self.view.bounds;
    _multiCardView.delegate = self;
    _multiCardView.dataSource = self;
    [self.view addSubview:_multiCardView];
    [_multiCardView reloadCardViews];
}

#pragma mark FISEventSwipeViewControllerDataSource

- (NSUInteger)numberOfCardViewsForMultiCardView:(FISMultiCardView *)multiCardView
{
    return [_swipeableViews count];
}

- (UIView *)multiCardView:(FISMultiCardView *)multiCardView cardViewForIndex:(NSUInteger)index
{
    return [_swipeableViews objectAtIndex:index];
}

#pragma mark FISEventSwipeViewControllerDelegate

- (CGSize)preferredSizeForPrimaryCardView
{
    CGFloat width = CGRectGetWidth(self.view.bounds) * 0.9;
    CGFloat height = 4.0 / 3.0 * width;
    return CGSizeMake(width, height - 15);
}

- (void)multiCardView:(FISMultiCardView *)multiCardView didSwipeViewInDirection:(FISSwipeDirection)direction
{

    [_swipeableViews removeObjectAtIndex:0];

}

- (void)multiCardView:(FISMultiCardView *)multiCardView didTapCardView:(UIView *)cardView
{
    FISEventDetailView *detailView = [[[NSBundle mainBundle] loadNibNamed:@"FISEventDetailView" owner:self options:nil] firstObject];
    detailView.frame = CGRectMake(cardView.bounds.origin.x, cardView.bounds.origin.y, [self preferredSizeForPrimaryCardView].width, [self preferredSizeForPrimaryCardView].height);

    [cardView addSubview:detailView];


    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.0f;
    [blurEffectView setFrame:detailView.frame];
    [detailView addSubview:blurEffectView];

    [UIView animateWithDuration:1.0f animations:^{
        blurEffectView.alpha = 1.0f;
    }];



    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapDetailView:)];
    [detailView addGestureRecognizer:singleFingerTap];


//    QCTVenue *venue = ((QCTPlaceCard *)_multiCardView.frontmostCardView).venue;
//    QCTVenueDetailsViewController *venueDetailsViewController = [[QCTVenueDetailsViewController alloc] initWithVenue:venue];
//    venueDetailsViewController.delegate = self;
//    venueDetailsViewController.transitioningDelegate = self;
//    venueDetailsViewController.modalPresentationStyle = UIModalPresentationCustom;
//    [self presentViewController:venueDetailsViewController animated:YES completion:nil];
}

- (void)tapDetailView:(UITapGestureRecognizer *)recognizer
{
    recognizer.view.alpha = 1.0;
    [UIView animateWithDuration:0.6f animations:^{
        recognizer.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [recognizer.view removeFromSuperview];
    }];
}

#pragma mark Private

- (void)fetchEvents
{

    FISEventCard *placeCard2 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard2.imageView.image = [UIImage imageNamed:@"Ben"];
    placeCard2.name = @"Event 1";
    [_swipeableViews addObject:placeCard2];

    FISEventCard *placeCard13 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard13.imageView.image = [UIImage imageNamed:@"Last"];
    placeCard13.name = @"Event 2";
    [_swipeableViews addObject:placeCard13];

    FISEventCard *placeCard4 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard4.imageView.image = [UIImage imageNamed:@"Chris"];
    placeCard4.name = @"Event 3";
    [_swipeableViews addObject:placeCard4];

    FISEventCard *placeCard6 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard6.backgroundImage = [UIImage imageNamed:@"Greg"];
    placeCard6.name = @"Event 4";
    [_swipeableViews addObject:placeCard6];

    FISEventCard *placeCard3 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard3.imageView.image = [UIImage imageNamed:@"Bryan"];
    placeCard3.name = @"Event 5";
    [_swipeableViews addObject:placeCard3];

    FISEventCard *placeCard7 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard7.imageView.image = [UIImage imageNamed:@"Jerry"];
    placeCard7.name = @"Event 6";
    [_swipeableViews addObject:placeCard7];

    FISEventCard *placeCard1 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard1.imageView.image = [UIImage imageNamed:@"Aaron"];
    placeCard1.name = @"Event 7";
    [_swipeableViews addObject:placeCard1];

    FISEventCard *placeCard8 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard8.imageView.image = [UIImage imageNamed:@"John"];
    placeCard8.name = @"Event 8";
    [_swipeableViews addObject:placeCard8];

    FISEventCard *placeCard10 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard10.imageView.image = [UIImage imageNamed:@"Michael"];
    placeCard10.name = @"Event 9";
    [_swipeableViews addObject:placeCard10];

    FISEventCard *placeCard5 = [[[NSBundle mainBundle] loadNibNamed:@"FISEventCard" owner:self options:nil] firstObject];
    placeCard5.imageView.image = [UIImage imageNamed:@"Danny"];
    placeCard5.name = @"Event 10";
    [_swipeableViews addObject:placeCard5];

    [_multiCardView reloadCardViews];

}

@end
