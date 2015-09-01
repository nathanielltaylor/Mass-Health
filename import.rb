require 'csv'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
    rescue PG::UniqueViolation
  ensure
    connection.close
  end
end

towns = []

CSV.foreach('mass-chip-data.csv', headers: true, header_converters: :symbol) do |row|
  town = row.to_hash
	towns << town
end

towns.each do |town|
  db_connection do |conn|
  city = town[:geography]
  population = town[:total_pop_year_2005]
  minor_pop = town[:age_019_year_2005]
  senior_pop = town[:age_65_year_2005]
  income = town[:per_capita_income_year_2000]
  poor_pop = town[:persons_living_below_200_poverty_year_2000]
  percent_poor = town[:_all_persons_living_below_200_poverty_year_2000]
  percent_insufficient_prenatal = town[:_adequacy_prenatal_care_kotelchuck]
  percent_c_section = town[:_csection_deliveries_20052008]
  infant_deaths = town[:number_of_infant_deaths_20052008]
  infant_death_rate = town[:infant_mortality_rate_deaths_per_1000_live_births_20052008]
  percent_low_birthweight = town[:_low_birthweight20052008]
  percent_multiple_births = town[:_multiple_births_20052008]
  percent_public_fun_prenatal = town[:_publicly_financed_prenatal_care_20052008]
  percent_teen_births = town[:_teen_births_20052008]
  conn.exec("INSERT INTO town_health_record (city, population, minor_pop, senior_pop, income, poor_pop, percent_poor, percent_insufficient_prenatal, percent_c_section, infant_deaths, infant_death_rate, percent_low_birthweight, percent_multiple_births, percent_public_fun_prenatal, percent_teen_births)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)", [city, population, minor_pop, senior_pop, income, poor_pop, percent_poor, percent_insufficient_prenatal, percent_c_section, infant_deaths, infant_death_rate, percent_low_birthweight, percent_multiple_births, percent_public_fun_prenatal, percent_teen_births])
  end
end

#parse the data customer name and account number
# db_connection do |conn|
  #insert customer
  #get customer id

  #insert sales with customer id
