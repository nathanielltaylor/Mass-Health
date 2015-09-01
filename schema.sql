-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS town_health_record;

CREATE TABLE town_health_record (
  town_id SERIAL PRIMARY KEY,
  city varchar(100) UNIQUE,
  population varchar(100),
  minor_pop varchar(100),
  senior_pop varchar(100),
  income varchar(100),
  poor_pop varchar(100),
  percent_poor varchar(100),
  percent_insufficient_prenatal varchar(100),
  percent_c_section varchar(100),
  infant_deaths varchar(100),
  infant_death_rate varchar(100),
  percent_low_birthweight varchar(100),
  percent_multiple_births varchar(100),
  percent_public_fun_prenatal varchar(100),
  percent_teen_births varchar(100)
);
CREATE UNIQUE INDEX town_index
ON town_health_record (
  town_id,
  city,
  minor_pop,
  senior_pop,
  income,
  poor_pop,
  percent_poor,
  percent_insufficient_prenatal,
  percent_c_section,
  infant_deaths,
  infant_death_rate,
  percent_low_birthweight,
  percent_multiple_births,
  percent_public_fun_prenatal,
  percent_teen_births
);
