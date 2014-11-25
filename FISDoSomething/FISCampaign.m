//
//  FISCampaign.m
//  FISDoSomething
//
//  Created by Levan Toturgul on 11/25/14.
//  Copyright (c) 2014 Flatiron iOS 003. All rights reserved.
//

#import "FISCampaign.h"

@implementation FISCampaign

-(instancetype) init{
    return [self initWithTitle:@"" nid:@-1 isStaffPick:NO];
}

-(instancetype) initWithTitle:(NSString*)title nid:(NSNumber *)nid isStaffPick:(BOOL)isStaffPick{
    
    self = [super init];
    if (self) {
        _title = title;
        _nid = nid;
        _isStaffPick = isStaffPick;
    }
    return self;
}

+(FISCampaign*)createCampaignFromDictionary:(NSDictionary*)dictionary{
    return [[FISCampaign alloc] initWithTitle:dictionary[@"title"] nid:dictionary[@"nid"] isStaffPick:[dictionary[@"is_staff_pick"] integerValue] == 0 ? NO : YES];
}

+(NSArray*)generateCampaignsFromResponseObject:(id)responseObject{
    NSMutableArray *allCampaigns = [[NSMutableArray alloc] init];
    
    for (NSDictionary *tempDict in (NSArray*)responseObject) {
        FISCampaign *tempCampaign = [FISCampaign createCampaignFromDictionary:tempDict];
        
        // Remove copies
        BOOL alreadyExists = NO;
        for (FISCampaign *currentCampaign in allCampaigns) {
            if ([currentCampaign.nid integerValue] == [tempCampaign.nid integerValue]) {
                alreadyExists = YES;
                break;
            }
        }
        if (!alreadyExists) {
            [allCampaigns addObject:[FISCampaign createCampaignFromDictionary:tempDict]];
        }
    }
    
    return [NSArray arrayWithArray:allCampaigns];
}

- (NSString *)description
{
    NSString *isStaffPick;
    if (self.isStaffPick) {
        isStaffPick = @"YES";
    }
    else {
        isStaffPick = @"NO";
    }
    return [NSString stringWithFormat:@"%@, %@, %@", self.title, self.nid, isStaffPick];
}


@end
