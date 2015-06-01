select count(*) from lrt_activity_summary; --54110
a
next change
select count(*) from ( -- 53960
select distinct acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join lrt_activity_milestone_summary ams on ams.mis_acs_id = acts.acs_id
);

-- comment

-- 1
delete from lrt_best_practice_summary where bps_acs_id in (
select acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join product p on p.product_id = l.lau_product_id
join lrt_launch_2_country l2c on acts.acs_l2c_id = l2c.l2c_id
join country c on c.country_id = l2c.l2c_country_id
where acts.acs_id not in (
select distinct acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join lrt_activity_milestone_summary ams on ams.mis_acs_id = acts.acs_id
));

-- 2
delete from lrt_user_activity_summary where uas_acs_id in (
select acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join product p on p.product_id = l.lau_product_id
join lrt_launch_2_country l2c on acts.acs_l2c_id = l2c.l2c_id
join country c on c.country_id = l2c.l2c_country_id
where acts.acs_id not in (
select distinct acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join lrt_activity_milestone_summary ams on ams.mis_acs_id = acts.acs_id
));


-- 3
delete from lrt_activity_summary where acs_id in (
select acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join product p on p.product_id = l.lau_product_id
join lrt_launch_2_country l2c on acts.acs_l2c_id = l2c.l2c_id
join country c on c.country_id = l2c.l2c_country_id
where acts.acs_id not in (
select distinct acts.acs_id
from lrt_activity_summary acts
join lrt_activity act on act.act_id = acts.acs_act_id
join lrt_launch l on l.lau_id = act.act_lau_id
join lrt_activity_milestone_summary ams on ams.mis_acs_id = acts.acs_id
));

