#import "DateTime.h"

@implementation NSDate (DateTime)
int DAY_IN_SECONDS = 60 * 60 * 24;

+(NSDateFormatter *) utcFormatterWithFormat:(NSString *) format {
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]autorelease];
	[dateFormatter setDateFormat:format];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	return dateFormatter;
}

+(id) yesterday {
	return [[NSDate date] dateByAddingDays:-1];
}

+(id) tomorrow {
	return [[NSDate date] dateByAddingDays:1];
}

+(id) dateWithYear:(int)year month:(int)month andDay:(int)day {
	NSDateFormatter *dateFormatter = [NSDate utcFormatterWithFormat:@"yyyy-MM-dd"];
	return [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d", year, month, day]];	
}

-(bool) isToday {
	return [[NSDate date] isSameDayThanDate:self];
}

-(id) dateByAddingDays:(int)numberOfDays {
	return [self dateByAddingTimeInterval:DAY_IN_SECONDS * numberOfDays];
}

-(float) daysFromDate:(NSDate *)date {
	return [self timeIntervalSinceDate:date] / DAY_IN_SECONDS;	
}

-(float) daysToDate:(NSDate *)date {
	return [date timeIntervalSinceDate:self] / DAY_IN_SECONDS;		
}

-(bool) isAfterDate:(NSDate *)date {
	return [self daysToDate:date] < 0;
}

-(bool) isAfterDateTime:(NSDate *)dateTime {
	return [self timeIntervalSinceDate:dateTime] > 0;
}

-(bool) isBeforeDate:(NSDate *)date {
	return ![self isSameDayThanDate:date] && ![self isAfterDate:date];
}

-(bool) isBeforeDateTime:(NSDate *)dateTime {
	return ![self isSameDateTimeThanDateTime:dateTime] && ![self isAfterDateTime:dateTime];
}

-(bool) isSameDayThanDate:(NSDate *)date {
	float days = [self daysFromDate:date];
	return days >= 0.0 && days < 1.0;
}

-(bool) isSameDateTimeThanDateTime:(NSDate *)dateTime {
	return [self timeIntervalSinceDate:dateTime] == 0;
}

-(int) day { return [[[NSDate utcFormatterWithFormat:@"dd"] stringFromDate:self] intValue]; }

-(int) month { return [[[NSDate utcFormatterWithFormat:@"MM"] stringFromDate:self] intValue]; }

-(int) year { return [[[NSDate utcFormatterWithFormat:@"yyyy"] stringFromDate:self] intValue]; }

@end
