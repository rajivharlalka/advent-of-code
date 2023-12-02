\set ON_ERROR_STOP on

/* Making the script idempotent */
drop schema if exists aoc_1 cascade;
create schema aoc_1;
set search_path to 'aoc_1';

/* Insert data into  table */
create table input (
	id integer generated always as identity primary key,
	data text not null
);

\copy input(data) from '2023/day_1/input.csv';

CREATE FUNCTION sum_aoc1(inp_text text)
RETURNS integer AS $$
DECLARE
  first_integer integer := 0;
  last_integer integer := 0;
  temp_char char;
  is_first_found boolean := false;
BEGIN
  FOR i IN 1..length(inp_text) LOOP
    temp_char := SUBSTRING(inp_text FROM i FOR 1);
    IF temp_char ~ '^\d$' THEN
      IF is_first_found = false THEN
        first_integer := temp_char::INTEGER;
        is_first_found := true;
      END IF;

      last_integer := temp_char::INTEGER;
    END IF;
  END LOOP;

  RETURN first_integer*10 + last_integer;
END;
$$ LANGUAGE plpgsql;

-- 1st Star
SELECT sum(sum_aoc1(data)) from input;

create table digits (
	digitValue text,
	textValue text,
	reverse text generated always as (reverse(textValue)) stored
);

insert into digits (digitValue, textValue) values
	('1','one'),
	('2','two'),
	('3','three'),
	('4','four'),
	('5','five'),
	('6','six'),
	('7','seven'),
	('8','eight'),
	('9','nine')
;


-- Star 2
with first_character(id,digit) as (
  select id, (regexp_matches(data,'1|2|3|4|5|6|7|8|9|0|one|two|three|four|five|six|seven|eight|nine'))[1] from input
),
last_character(id,digit) as (
  select id, reverse((regexp_matches(reverse(data),'1|2|3|4|5|6|7|8|9|0|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin'))[1]) from input
),
change_digit_1(id,digit) as (
  select id, coalesce(regexp_replace(digit, textValue, digitValue),digit) from first_character left join digits
			on (regexp_match(first_character.digit, 'one|two|three|four|five|six|seven|eight|nine'))[1] = textValue

),
change_digit_2(id,digit) as (
  select id, coalesce(regexp_replace(digit, textValue, digitValue),digit) from last_character left join digits
			on (regexp_match(digit, 'one|two|three|four|five|six|seven|eight|nine'))[1] = textValue

)
select sum(change_digit_1.digit::INT *10+ change_digit_2.digit::INT) from change_digit_1 join change_digit_2 on change_digit_1.id=change_digit_2.id;

