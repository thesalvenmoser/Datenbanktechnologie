CREATE DATABASE population_dwh WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


CREATE TABLE public.dim_time (
    time_id integer NOT NULL,
    year integer,
    century integer,
    CONSTRAINT time_pkey PRIMARY KEY (time_id)
);

CREATE TABLE public.dim_country (
    country_id integer NOT NULL,
    country_code integer,
    country_name character varying(255),
    continent character varying(255),
    CONSTRAINT country_pkey PRIMARY KEY (country_id)
);

CREATE TABLE public.fact_population (
    population_id integer NOT NULL,
    population integer,
    time_id integer,
    country_id integer,
    CONSTRAINT population_pkey PRIMARY KEY (population_id),
    CONSTRAINT population_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.dim_time (time_id),
    CONSTRAINT population_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.dim_country (country_id)
);