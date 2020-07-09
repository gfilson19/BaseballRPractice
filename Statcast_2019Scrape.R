library(baseballr)

date328403 = baseballr::scrape_statcast_savant(start_date = '2019-03-28',
                                               end_date = '2019-04-03', player_type = 'hitter')
date404410 = baseballr::scrape_statcast_savant(start_date = '2019-04-04',
                                               end_date = '2019-04-10', player_type = 'hitter')
date411417 = baseballr::scrape_statcast_savant(start_date = '2019-04-11',
                                               end_date = '2019-04-17', player_type = 'hitter')
date418424 = baseballr::scrape_statcast_savant(start_date = '2019-04-18',
                                               end_date = '2019-04-24', player_type = 'hitter')
date425501 = baseballr::scrape_statcast_savant(start_date = '2019-04-25',
                                               end_date = '2019-05-01', player_type = 'hitter')
date502508 = baseballr::scrape_statcast_savant(start_date = '2019-05-02',
                                               end_date = '2019-05-08', player_type = 'hitter')
date509515 = baseballr::scrape_statcast_savant(start_date = '2019-05-09',
                                               end_date = '2019-05-15', player_type = 'hitter')
date516522 = baseballr::scrape_statcast_savant(start_date = '2019-05-16',
                                               end_date = '2019-05-22', player_type = 'hitter')
date523529 = baseballr::scrape_statcast_savant(start_date = '2019-05-23',
                                               end_date = '2019-05-29', player_type = 'hitter')
date530605 = baseballr::scrape_statcast_savant(start_date = '2019-05-30',
                                               end_date = '2019-06-05', player_type = 'hitter')
date606612 = baseballr::scrape_statcast_savant(start_date = '2019-06-06',
                                               end_date = '2019-06-12', player_type = 'hitter')
date613619 = baseballr::scrape_statcast_savant(start_date = '2019-06-13',
                                               end_date = '2019-06-19', player_type = 'hitter')
date620626 = baseballr::scrape_statcast_savant(start_date = '2019-06-20',
                                               end_date = '2019-06-26', player_type = 'hitter')
date627703 = baseballr::scrape_statcast_savant(start_date = '2019-06-27',
                                               end_date = '2019-07-03', player_type = 'hitter')
date704710 = baseballr::scrape_statcast_savant(start_date = '2019-07-04',
                                               end_date = '2019-07-10', player_type = 'hitter')
date711717 = baseballr::scrape_statcast_savant(start_date = '2019-07-11',
                                               end_date = '2019-07-17', player_type = 'hitter')
date718724 = baseballr::scrape_statcast_savant(start_date = '2019-07-18',
                                               end_date = '2019-07-24', player_type = 'hitter')
date725731 = baseballr::scrape_statcast_savant(start_date = '2019-07-25',
                                               end_date = '2019-07-31', player_type = 'hitter')
date801807 = baseballr::scrape_statcast_savant(start_date = '2019-08-01',
                                               end_date = '2019-08-07', player_type = 'hitter')
date808814 = baseballr::scrape_statcast_savant(start_date = '2019-08-08',
                                               end_date = '2019-08-14', player_type = 'hitter')
date815821 = baseballr::scrape_statcast_savant(start_date = '2019-08-15',
                                               end_date = '2019-08-21', player_type = 'hitter')
date822828 = baseballr::scrape_statcast_savant(start_date = '2019-08-22',
                                               end_date = '2019-08-28', player_type = 'hitter')
date829904 = baseballr::scrape_statcast_savant(start_date = '2019-08-29',
                                               end_date = '2019-09-04', player_type = 'hitter')
date905911 = baseballr::scrape_statcast_savant(start_date = '2019-09-05',
                                               end_date = '2019-09-11', player_type = 'hitter')
date912918 = baseballr::scrape_statcast_savant(start_date = '2019-09-12',
                                               end_date = '2019-09-18', player_type = 'hitter')
date919925 = baseballr::scrape_statcast_savant(start_date = '2019-09-19',
                                               end_date = '2019-09-25', player_type = 'hitter')
date926929 = baseballr::scrape_statcast_savant(start_date = '2019-09-26',
                                               end_date = '2019-09-29', player_type = 'hitter')


SavantHitterData19 = rbind(date328403, date404410, date411417, date418424, 
                           date425501, date502508, date509515, date516522, 
                           date523529, date530605, date606612, date613619, 
                           date620626, date627703, date704710, date711717, 
                           date718724, date725731, date801807, date808814, 
                           date815821, date822828, date829904, date905911, 
                           date912918, date919925, date926929)
