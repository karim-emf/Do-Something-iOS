//
//  FISCampaign.h
//  FISDoSomething
//
//  Created by Levan Toturgul on 11/25/14.
//  Copyright (c) 2014 Flatiron iOS 003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCampaign : NSObject
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSNumber * nid;
@property (nonatomic) BOOL isStaffPick;



-(instancetype) initWithTitle:(NSString*)title nid:(NSNumber *)nid isStaffPick:(BOOL)isStaffPick;

+(FISCampaign*)createCampaignFromDictionary:(NSDictionary*)dictionary;
+(NSArray*)generateCampaignsFromResponseObject:(id)responseObject;




@end
