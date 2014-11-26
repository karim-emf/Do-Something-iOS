//
//  FISPlaceCard.m
//

#import "FISEventCard.h"

#define MINIMUM_GOOD_RATING 7.f
#define GOOD_RATING_BACKGROUND_COLOR [UIColor colorWithRed:.231f green:.612f blue:.706f alpha:1.f]

@interface FISEventCard ()
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation FISEventCard

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

#pragma mark Properties

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

- (void)setImageView:(UIImageView *)imageView
{
    _imageView = imageView;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
}

- (UIImage *)backgroundImage
{
    return _imageView.image;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _imageView.image = backgroundImage;
}


@end
