with atlethes as (select unnest(xpath('//atlethe/sex/..',xml)) as atlethes_with_sex from imported_documents)
                            select(xpath('//atlethe/@name',atlethes_with_sex))[1]::text as name,
							(xpath('//atlethe/sex/text()',atlethes_with_sex))[1]::text as sex,
                            (xpath('//atlethe/age/text()',atlethes_with_sex))[1]::text as age,
                            (xpath('//atlethe/height/text()',atlethes_with_sex))[1]::text as height,
                            (xpath('//atlethe/weight/text()',atlethes_with_sex))[1]::text as weight,
                            (xpath('//atlethe/country/team/text()',atlethes_with_sex))[1]::text as team,
                            (xpath('//atlethe/country/noc/text()',atlethes_with_sex))[1]::text as noc,
                            (xpath('//atlethe/competition/games/text()',atlethes_with_sex))[1]::text as games,
                            (xpath('//atlethe/competition/year/text()',atlethes_with_sex))[1]::text as year,
                            (xpath('//atlethe/competition/season/text()',atlethes_with_sex))[1]::text as season,
                            (xpath('//atlethe/competition/city/text()',atlethes_with_sex))[1]::text as city,
                            (xpath('//atlethe/competition/coordenates/lat/text()',atlethes_with_sex))[1]::text as lat,
                            (xpath('//atlethe/competition/coordenates/lon/text()',atlethes_with_sex))[1]::text as lon,
                            (xpath('//atlethe/competition/statsBySport/sport/text()',atlethes_with_sex))[1]::text as sport,
                            (xpath('//atlethe/competition/statsBySport/event/text()',atlethes_with_sex))[1]::text as event,
                            (xpath('//atlethe/competition/statsBySport/medal/text()',atlethes_with_sex))[1]::text as medal
                            FROM atlethes;
							
with atlethes as (select unnest(xpath('//atlethe',xml)) as atlethes from imported_documents)
select DISTINCT(xpath('//atlethe/competition/season/text()',atlethes))[1]::text as Season
FROM atlethes
GROUP BY Season